defmodule PhoenixTutorial.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias PhoenixTutorial.User


  schema "users" do
    field :email, :string
    field :name, :string
    field :password_hash, :string
    field :password, :string, virtual: true

    timestamps()
  end

  @required_fields ~w(name email password)
  @optional_fields ~w(password_hash)

  @doc false
  def changeset(%User{} = user, params) do
    user
    |> cast(params, @required_fields, @optional_fields)
    |> validate_required([:name, :email, :password])
    |> generate_encrypted_password
  end

  defp generate_encrypted_password(current_changeset) do
    case current_changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: password}} ->
        put_change(current_changeset, :password_hash, Comeonin.Bcrypt.hashpwsalt(password))
      _ ->
        current_changeset
    end
  end
end
