class Base < Grape::API
  def self.inherited(subclass)
    super
    subclass.instance_eval do
      helpers Auth

      before do
        authorize!
      end
    end
  end
end

