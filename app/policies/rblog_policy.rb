class RblogPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    # return false if user.blank?

    true
  end

  def new?
    create?
  end

  def create?
    user.present?
  end

  def show?
    user.present? && (user.has_role?(:user) or user.has_role?(:admin))
  end

  def edit?
    user.present? && (user == record.writer or user.has_role?(:admin))
  end

  def update?
    user.present? && (user == record.writer or user.has_role?(:admin))
  end

  def destroy?
    user.present? && (user == record.writer or user.has_role?(:admin))
  end
end
