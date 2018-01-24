defmodule LiveBoardWeb.Router do
  use LiveBoardWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", LiveBoardWeb do
    pipe_through :api
  end

  resources "/users", UserController, except: [:show, :edit]
  resources "/messages", MessageController, except: [:show, :edit]
end
