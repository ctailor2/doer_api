class Base < Grape::API
  def self.inherited(subclass)
    super
    subclass.instance_eval do
      version 'v1', using: :path
      format :json
      helpers Auth

      before do
        authorize!
      end

      rescue_from Grape::Exceptions::ValidationErrors do |e|
        error! e, 400
      end

      rescue_from ActiveRecord::RecordInvalid do |e|
        error!({ error: e.message }, 422)
      end

      rescue_from ActiveRecord::RecordNotFound do |e|
        error!({ error: e.message }, 404)
      end
    end
  end
end

