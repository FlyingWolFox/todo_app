defmodule TodoApp.TarefasFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `TodoApp.Tarefas` context.
  """

  @doc """
  Generate a todo.
  """
  def todo_fixture(attrs \\ %{}) do
    {:ok, todo} =
      attrs
      |> Enum.into(%{
        completed: true,
        description: "some description",
        name: "some name"
      })
      |> TodoApp.Tarefas.create_todo()

    todo
  end
end
