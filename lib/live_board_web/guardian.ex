defmodule LiveBoardWeb.Guardian do
  use Guardian, otp_app: :live_board

  alias LiveBoard.Repo
  alias LiveBoard.Accounts.User

  def subject_for_token(user = %User{}, _claims), do: {:ok, "User:#{user.id}" }
  def subject_for_token(_, _), do: {:error, "Invalid resource type"}

  def resource_from_claims(%{ "sub" => "User:" <> id }) do
    case Repo.get(User, id) do
      nil -> {:error, "Resource not found"}
      resource -> {:ok, resource}
    end
  end
  def resource_from_claims(_claims), do: {:error, :reason_for_error}
end
