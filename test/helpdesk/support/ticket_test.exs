defmodule Helpdesk.Support.TicketTest do
  use Helpdesk.DataCase, async: true

  alias Helpdesk.Support.Ticket
  require Ash.Query

  describe "ticket actions" do
    test "opens a ticket" do
      {:ok, ticket} = Ticket.open("New Ticket")
      assert ticket.subject == "New Ticket"
      assert ticket.status == :open
    end
  end

  test "closes a ticket" do
    {:ok, ticket} = Ticket.open("New Ticket")
    assert ticket.status == :open

    {:ok, closed_ticket} = Ticket.close(ticket.id)
    assert closed_ticket.status == :closed
  end

  test "cannot close an already closed ticket" do
    {:ok, ticket} = Ticket.open("New Ticket")
    {:ok, closed_ticket} = Ticket.close(ticket.id)

    assert {:error, %Ash.Error.Invalid{errors: [%{message: "Ticket is already closed"}]}} =
             Ticket.close(closed_ticket.id)
  end

  test "assigns a representative to a ticket" do
    {:ok, ticket} = Ticket.open("New Ticket")
    representative_id = Ecto.UUID.generate()

    {:ok, assigned_ticket} = Ticket.assign(ticket.id, representative_id)
    assert assigned_ticket.representative_id == representative_id
  end

  test "reads a ticket by id using Ash query" do
    {:ok, created_ticket} = Ticket.open("New Ticket")

    {:ok, read_ticket} = Ticket.read_by_id(created_ticket.id)

    assert read_ticket.id == created_ticket.id
    assert read_ticket.subject == "New Ticket"
    assert read_ticket.status == :open
  end
end
