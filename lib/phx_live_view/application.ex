defmodule PhxLiveView.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      PhxLiveViewWeb.Telemetry,
      {DNSCluster, query: Application.get_env(:phx_live_view, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: PhxLiveView.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: PhxLiveView.Finch},
      # Start a worker by calling: PhxLiveView.Worker.start_link(arg)
      # {PhxLiveView.Worker, arg},
      # Start to serve requests, typically the last entry
      PhxLiveViewWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PhxLiveView.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    PhxLiveViewWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
