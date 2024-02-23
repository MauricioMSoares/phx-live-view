defmodule PhxLiveViewWeb.TestPage do
  use PhxLiveViewWeb, :live_view

  def mount(_, _, socket) do
    {:ok,
     assign(
       socket,
       label: "Name",
       placeholder: "Enter your name",
       text: "Submit"
     )}
  end

  def handle_event("button-click", _params, socket) do
    IO.puts("Button clicked")
    {:noreply, assign(socket, text: "Submitted")}
  end
end
