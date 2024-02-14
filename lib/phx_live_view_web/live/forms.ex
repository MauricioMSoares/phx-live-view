defmodule PhxLiveViewWeb.Forms do
  use PhxLiveViewWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, assign(socket, name: nil, form: to_form(%{}))}
  end

  def handle_event("add_name", %{"name" => name}, socket) do
    if name |> String.trim(" ") == "" do
      {:noreply, assign(socket, name: nil)}
    else
      {:noreply, assign(socket, name: name)}
    end
  end

  def handle_event("navigate", _params, socket) do
    {:noreply, redirect(socket, to: "/")}
  end
end
