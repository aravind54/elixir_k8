defmodule ElixirK8Web.PageController do
  use ElixirK8Web, :controller
  require DogStatsd

  def index(conn, _params) do
    render conn, "index.html"
  end

  def hello(conn,_params) do
    
    {:ok,statsd} = DogStatsd.new(System.get_env("DD_KUBERNETES_KUBELET_HOST"), 8080)
    DogStatsd.increment(statsd, "fucking.asshole")
    text conn, "fucker"
  end
end