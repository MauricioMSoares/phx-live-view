defmodule PhxLiveViewWeb.PageLive do
  use PhxLiveViewWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, assign(socket, number: 0, form: to_form(%{default_number: 0}))}
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

  def handle_event("add_number", %{"custom_number" => custom_number}, socket) do
    parsed_number = case Integer.parse(custom_number) do
      {number, _} -> number
      :error -> 0
    end

    {:noreply, assign(socket, number: socket.assigns.number + parsed_number, form: to_form(%{default_number: parsed_number}))}
  end

  def handle_event("navigate", _params, socket) do
    {:noreply, redirect(socket, to: "/forms")}
  end
end
