class PigeonPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    return true
  end

  def update?
    record.user == user
  end

  def destroy?
    update?
  end

end
