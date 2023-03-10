class ItemPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def owner?
    return record.user == user
  end

  def my_items?
    true
  end

  def show?
    true
  end

  def new?
    return create?
  end

  def create?
    return true
  end

  def edit?
    return update?
  end

  def update?
    # only the owner can edit
    return record.user == user
  end

  def destroy?
    return record.user == user
  end
end
