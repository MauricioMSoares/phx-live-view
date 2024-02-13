defmodule PhxLiveViewWeb.PageLive do
  use PhxLiveViewWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, assign(socket, number: 0)}
  end

  def render(assigns) do
    ~H"""
    <strong>Counter: </strong>
    <%= @number %>
    <br />
    <.button phx-click="add">Add</.button>
    <.button phx-click="subtract">Subtract</.button>

    <br />
    <.example_paragraph />
    """
  end

  def example_paragraph(assigns) do
    ~H"""
    Click the buttons to change the number
    """
  end

  def handle_event("add", _params, socket) do
    {:noreply, assign(socket, number: socket.assigns.number + 1)}
  end

  def handle_event("subtract", _params, socket) do
    {:noreply, assign(socket, number: socket.assigns.number - 1)}
  end
end
