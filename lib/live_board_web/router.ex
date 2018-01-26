defmodule LiveBoardWeb.Router do
  use LiveBoardWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :api_auth do
    plug Guardian.Plug.VerifyHeader, realm: "Bearer"
    plug Guardian.Plug.LoadResource, allow_blank: true
  end

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :browser_auth do
    plug Guardian.Plug.VerifySession
    plug Guardian.Plug.LoadResource, allow_blank: true
  end

  scope "/api", LiveBoardWeb do
    pipe_through [:api, :api_auth]

    resources "/users", UserController, except: [:edit]
    resources "/messages", MessageController, except: [:edit]
  end

  scope "/", LiveBoardWeb do
    pipe_through [:browser, :browser_auth]

    get "/*path", HomeController, :index
  end
end
