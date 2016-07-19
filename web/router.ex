defmodule PeepBlogBackend.Router do
  use PeepBlogBackend.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PeepBlogBackend do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/posts", PostController
  end

  plug PlugCors, [origins: [System.get_env("FRONTEND_URL")]]
  # Other scopes may use custom stacks.
  # scope "/api", PeepBlogBackend do
  #   pipe_through :api
  # end
end
