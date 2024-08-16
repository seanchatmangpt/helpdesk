defmodule Helpdesk.Support.Representative do
  use Ash.Resource,
    otp_app: :helpdesk,
    domain: Helpdesk.Support,
    data_layer: Ash.DataLayer.Ets,
    extensions: [AshJsonApi.Resource]

  json_api do
    type("representative")
  end

  actions do
    defaults([:read, create: [:name]])
  end

  attributes do
    uuid_primary_key(:id)

    attribute :name, :string do
      allow_nil?(false)
      public?(true)
    end
  end

  relationships do
    has_many :tickets, Helpdesk.Support.Ticket do
      public?(true)
    end
  end

  code_interface do
    define(:create, args: [:name])
  end
end
