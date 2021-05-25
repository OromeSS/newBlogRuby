class PostPolicy < ApplicationPolicy

  def index?
    true
  end

  def show?
    true
  end

  def create?
    user_logged_in?
  end

  def update?
    author? || admin?
  end

  def destroy?
    author? || admin?
  end

  private

  def author?
    return false unless user

    record.user_id == user.id
  end

end
