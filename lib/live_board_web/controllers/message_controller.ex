defmodule LiveBoardWeb.MessageController do
  use LiveBoardWeb, :controller

  alias LiveBoard.Boards
  alias LiveBoard.Boards.Message

  action_fallback LiveBoardWeb.FallbackController

  def index(conn, _params) do
    messages = Boards.list_messages()
    render(conn, "index.json", messages: messages)
  end

  def create(conn, %{"message" => message_params}) do
    with {:ok, %Message{} = message} <- Boards.create_message(message_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", message_path(conn, :show, message))
      |> render("show.json", message: message)
    end
  end

  def show(conn, %{"id" => id}) do
    message = Boards.get_message!(id)
    render(conn, "show.json", message: message)
  end

  def update(conn, %{"id" => id, "message" => message_params}) do
    message = Boards.get_message!(id)

    with {:ok, %Message{} = message} <- Boards.update_message(message, message_params) do
      render(conn, "show.json", message: message)
    end
  end

  def delete(conn, %{"id" => id}) do
    message = Boards.get_message!(id)
    with {:ok, %Message{}} <- Boards.delete_message(message) do
      send_resp(conn, :no_content, "")
    end
  end
end
