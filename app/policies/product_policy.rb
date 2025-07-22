class ProductPolicy < ApplicationPolicy
  def index?
    true  # Everyone can view the list
  end

  def show?
    true  # Everyone can view a product
  end

  def create?
    user&.admin?
  end

  def new?
    create?
  end

  def update?
    user&.admin?
  end

  def edit?
    update?
  end

  def destroy?
    user&.admin?
  end

  class Scope < Scope
    def resolve
      if user&.admin?
        scope.all
      else
        scope.where(user_id: user.id)  # or scope.where(published: true) if needed
      end
    end
  end
end
