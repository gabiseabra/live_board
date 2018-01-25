defmodule LiveBoardWeb.Router do
  use LiveBoardWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  scope "/api", LiveBoardWeb do
    pipe_through :api

    resources "/users", UserController, except: [:show, :edit]
    resources "/messages", MessageController, except: [:show, :edit]
  end

  scope "/", LiveBoardWeb do
    pipe_through :browser

    get "/*path", HomeController, :index
  end
end
