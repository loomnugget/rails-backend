module UserService
  class CreateUser
    attr_reader :params

    def initialize(params)
      @params = params
    end

    def call
      create_user
    end

    private

    def create_user
      user = User.new(params)
      user.save!
      user
    end

  end
end
