class FavoritePolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def my_favorite_items?
    user.present?
  end

  def show?
    user == record.favoritor
  end

  def update?
    user == record.favoritor
  end

  def destroy?
    user == record.favoritor
  end
end
