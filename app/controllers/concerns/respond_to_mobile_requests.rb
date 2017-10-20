require 'active_support/concern'

module RespondToMobileRequests
  extend ActiveSupport::Concern

  # Regexp From: https://gist.github.com/dalethedeveloper/1503252/931cc8b613aaa930ef92a4027916e6687d07feac
  MOBILE_REGEXP = /Mobile|iP(hone|od|ad)|Android|BlackBerry|IEMobile|Kindle|NetFront|Silk-Accelerated|(hpw|web)OS|Fennec|Minimo|Opera M(obi|ini)|Blazer|Dolfin|Dolphin|Skyfire|Zune/
  included do
    before_action :variant_mobile

    def variant_mobile
      # The solution from: https://stackoverflow.com/questions/39495834/mobile-view-in-rails-5
      request.variant = :mobile if is_mobile_request?
    end

    def is_mobile_request?
      @_is_mobile_request ||= MOBILE_REGEXP.match request.user_agent
    end
  end

end
