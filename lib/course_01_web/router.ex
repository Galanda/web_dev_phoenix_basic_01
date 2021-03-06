defmodule Course01Web.Router do
  use Course01Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Course01Web do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/html", HtmlController, :index
    get "/css", CssController, :index
    get "/javascript", JsController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", Course01Web do
  #   pipe_through :api
  # end
end
