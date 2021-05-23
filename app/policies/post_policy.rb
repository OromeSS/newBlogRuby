class PostPolicy < ApplicationPolicy

  def index?
    true
  end

  def show?
    true
  end

  def create?
    false
  end

  def update?
    author?
  end

  def destroy?
    author?
  end

  private

  def author?
    return false unless user

    record.user_id == user.id
  end

end
