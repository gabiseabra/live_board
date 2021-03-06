defmodule LiveBoard.Accounts.User.Avatar do
  use Arc.Definition

  @api_url  to_charlist Application.get_env(:live_board, :avatar_api_url)

  # Include ecto support (requires package arc_ecto installed):
  # use Arc.Ecto.Definition

  @versions [:original]

  # To add a thumbnail version:
  # @versions [:original, :thumb]

  # Whitelist file extensions:
  def validate({file, _}) do
    ~w(.jpg .jpeg .gif .png) |> Enum.member?(Path.extname(file.file_name))
  end

  # Define a thumbnail transformation:
  # def transform(:thumb, _) do
  #   {:convert, "-strip -thumbnail 250x250^ -gravity center -extent 250x250 -format png", :png}
  # end

  # Override the persisted filenames:
  # def filename(version, _) do
  #   version
  # end

  # Override the storage directory:
  def storage_dir(_version, _) do
    "#{Application.get_env(:arc, :storage_dir)}/user"
  end

  # Provide a default URL if there hasn't been a file uploaded
  # def default_url(version, scope) do
  #   "/images/avatars/default_#{version}.png"
  # end

  # Specify custom headers for s3 objects
  # Available options are [:cache_control, :content_disposition,
  #    :content_encoding, :content_length, :content_type,
  #    :expect, :expires, :storage_class, :website_redirect_location]
  #
  # def s3_object_headers(version, {file, scope}) do
  #   [content_type: Plug.MIME.path(file.file_name)]
  # end

  def fetch(scope \\ nil) do
    with {:ok, response} <- :httpc.request(:get, {@api_url, []}, [], [body_format: :binary]),
         {{_, 200, 'OK'}, _headers, body} <- response do
      store({%{binary: body, filename: random_filename()}, scope})
    else
      err -> err
    end
  end

  defp random_filename(len \\ 16) do
    :crypto.strong_rand_bytes(len)
    |> Base.url_encode64
    |> binary_part(0, len)
    |> Kernel.<>(".jpg")
  end
end
