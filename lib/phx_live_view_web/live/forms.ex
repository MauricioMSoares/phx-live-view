defmodule PhxLiveViewWeb.Forms do
  use PhxLiveViewWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, assign(socket, name: nil, form: to_form(%{}))}
  end

  def render(assigns) do
    ~H"""
    <strong>What's your name?</strong>
    <.simple_form for={@form} phx-submit="add_name">
      <.input field={@form[:name]} />
      <.button>Submit</.button>
    </.simple_form>
    <%= if @name != nil do %>
      <p class="mt-4">Welcome, <%= @name %>!</p>
    <% end %>
    """
  end

  def handle_event("add_name", %{"name" => name}, socket) do
    if name |> String.trim(" ") == "" do
      {:noreply, assign(socket, name: nil)}
    else
      {:noreply, assign(socket, name: name)}
    end
  end
end
