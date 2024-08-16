defmodule Helpdesk.Support.Ticket do
  use Ash.Resource,
    otp_app: :helpdesk,
    domain: Helpdesk.Support,
    data_layer: Ash.DataLayer.Ets,
    extensions: [AshJsonApi.Resource]

  json_api do
    type "ticket"
  end

  code_interface do
    define :read
    define :read_by_id, args: [:id]
    define :open, args: [:subject]
    define :close
    define :assign, args: [:representative_id]
  end

  actions do
    defaults [:read]

    read :read_by_id do
      argument :id, :uuid, allow_nil?: false
      filter expr(id == ^arg(:id))

      get? true
    end

    create :open do
      accept [:subject]
    end

    update :close do
      accept []

      validate attribute_does_not_equal(:status, :closed) do
        message "Ticket is already closed"
      end

      change set_attribute(:status, :closed)
    end

    update :assign do
      accept [:representative_id]
    end
  end

  attributes do
    uuid_primary_key :id

    attribute :subject, :string do
      allow_nil? false
      public? true
    end

    attribute :status, :ticket_status do
      default :open
      allow_nil? false
    end
  end

  relationships do
    belongs_to :representative, Helpdesk.Support.Representative do
      public? true
    end
  end
end
