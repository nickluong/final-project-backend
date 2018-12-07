class User < ApplicationRecord
    has_many :friendships, dependent: :destroy
    has_many :inverse_friendships, class_name: 'Friendship', foreign_key: 'friend_id'
    has_many :user_sessions, dependent: :destroy 
    has_many :sessions, through: :user_sessions
    validates :username, uniqueness: {case_sensitive: false}
    has_secure_password

    def friends
        friends_array = friendships.map{|friendship| friendship.friend if friendship.confirmed}
        friends_array += inverse_friendships.map{|friendship| friendship.user if friendship.confirmed}
        friends_array.compact
    end
    
#Session Controller:

    # def show(params)
    #     session = Session.find(params[:id])
    #     Session.after_update do | session |
    #         if(session.id == params[:id])
    #             yield session
    #         end
    #     end
    #     yield session
    # end

      def add_friend(friend)
        Friendship.create(user:self, friend:friend)
      end 

      def startCall 
        UserSession.create(user:self, session: Session.first)
      end 

      def ready
        self.user_sessions.first.update(ready: !User.first.user_sessions.first.ready)
      end 

      def endCall
        self.user_sessions.destroy_all
      end 

      # Users who have yet to confirm friend requests
      def pending_friends
        friendships.map{|friendship| friendship.friend if !friendship.confirmed}.compact
      end
    
      # Users who have requested to be friends
      def friend_requests
        inverse_friendships.map{|friendship| friendship.user if !friendship.confirmed}.compact
      end
    
      def confirm_friend(user)
        friendship = inverse_friendships.find{|friendship| friendship.user == user}
        friendship.confirmed = true
        friendship.save
      end
    
      def friend?(user)
        friends.include?(user)
      end
end
