defmodule LiveExampleWeb.LiveTest do
  use Phoenix.LiveView

  def render(assigns) do
    ~L[
      <button phx-click="add">ADD</button>
      <button phx-click="clear">CLEAR</button>

      <div id="list">
      <%= for item <- @list do %>
      <div>
        <%=  item %>
      </div>
      <% end %>
      </div>
    ]
  end

  def mount(_, socket) do
    {:ok, setup_counter(socket), temporary_assigns: [list: []]}
  end

  def handle_event("add", _, socket) do
    {:noreply, update_counter(socket)}
  end

  def handle_event("clear", _, socket) do
    {:noreply, setup_counter(socket)}
  end

  defp setup_counter(socket) do
    socket
    |> assign(:counter, 1)
    |> assign(:list, [])
  end

  defp update_counter(%{assigns: %{counter: counter}} = socket) do
    socket
    |> assign(:list, Enum.to_list(1..counter))
    |> assign(:counter, counter + 1)
  end
end
