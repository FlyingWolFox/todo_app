defmodule TodoApp.TarefasTest do
  use TodoApp.DataCase

  alias TodoApp.Tarefas

  describe "todos" do
    alias TodoApp.Tarefas.Todo

    import TodoApp.TarefasFixtures

    @invalid_attrs %{completed: nil, description: nil, name: nil}

    test "list_todos/0 returns all todos" do
      todo = todo_fixture()
      assert Tarefas.list_todos() == [todo]
    end

    test "get_todo!/1 returns the todo with given id" do
      todo = todo_fixture()
      assert Tarefas.get_todo!(todo.id) == todo
    end

    test "create_todo/1 with valid data creates a todo" do
      valid_attrs = %{completed: true, description: "some description", name: "some name"}

      assert {:ok, %Todo{} = todo} = Tarefas.create_todo(valid_attrs)
      assert todo.completed == true
      assert todo.description == "some description"
      assert todo.name == "some name"
    end

    test "create_todo/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Tarefas.create_todo(@invalid_attrs)
    end

    test "update_todo/2 with valid data updates the todo" do
      todo = todo_fixture()
      update_attrs = %{completed: false, description: "some updated description", name: "some updated name"}

      assert {:ok, %Todo{} = todo} = Tarefas.update_todo(todo, update_attrs)
      assert todo.completed == false
      assert todo.description == "some updated description"
      assert todo.name == "some updated name"
    end

    test "update_todo/2 with invalid data returns error changeset" do
      todo = todo_fixture()
      assert {:error, %Ecto.Changeset{}} = Tarefas.update_todo(todo, @invalid_attrs)
      assert todo == Tarefas.get_todo!(todo.id)
    end

    test "delete_todo/1 deletes the todo" do
      todo = todo_fixture()
      assert {:ok, %Todo{}} = Tarefas.delete_todo(todo)
      assert_raise Ecto.NoResultsError, fn -> Tarefas.get_todo!(todo.id) end
    end

    test "change_todo/1 returns a todo changeset" do
      todo = todo_fixture()
      assert %Ecto.Changeset{} = Tarefas.change_todo(todo)
    end
  end
end
