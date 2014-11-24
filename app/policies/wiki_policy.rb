class WikiPolicy < ApplicationPolicy
attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def show?
    true
  end

  class Scope

    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      if user.role?(:admin)
        scope.all
      elsif user.role?(:premium)
        all = scope.all
        wikis = []
        all.each do |wiki|
          if wiki.public? || wiki.user == user || wiki.users.include?(user)
            wikis << wiki
          end
        end
        wikis
      else
        all = scope.all
        wikis = []
        all.each do |wiki|
          if wiki.public? || wiki.users.include?(user)
            wikis << wiki
          end
        end
        wikis
      end
    end
  end
end
