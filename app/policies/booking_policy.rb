class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.where(user: user)
    end
  end

  def show?
    true
  end

  def new?
    return create?
  end

  def create?
    true
  end

  def edit?
    return update?
  end

  def update?
    true
  end

  def destroy?
    true
  end

  def accept?
    record.user == user
  end

  def decline?
    record.user == user
  end

  def cancel?
    record.user == user
  end
end
