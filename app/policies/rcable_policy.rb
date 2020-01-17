class RcablePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    true
  end

  def new?
    true
  end

  def edit?
    user == record.user
  end

  def show?
    true
  end

  def create?
    true
  end

  def destroy?
    user == record.user
  end
end
