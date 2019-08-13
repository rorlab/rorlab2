class RblogPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    user.has_role?(:user) or user.has_role?(:admin)
  end

  def edit?
    user == record.writer or user.has_role?(:admin)
  end

  def update?
    user == record.writer or user.has_role?(:admin)
  end

  def destroy?
    user == record.writer or user.has_role?(:admin)
  end
end
