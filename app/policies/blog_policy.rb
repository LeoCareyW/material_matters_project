class BlogPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new
    user.admin
  end

  def create?
    user_admin
  end

  def show
    true
  end

  def edit?
    user_admin
  end

  def update?
    user_admin
  end

  def destroy?
    user_admin
  end

  private

  def user_admin
    if user
      user.admin?
    end
  end
end
