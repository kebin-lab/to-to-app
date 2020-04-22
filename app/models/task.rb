class Task < ApplicationRecord
    validates :user_id ,{presence: true}
    validates :priority ,{presence: true}
    validates :task_summary ,{presence: true}
    validates :deadline , {presence: true}

    def user
        return User.find_by(id: self.user_id)
    end
end
