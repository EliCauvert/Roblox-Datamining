local RealtimeDeliveryModule = require(script:FindFirstAncestor("AvatarExperienceInitialization").Parent.RealtimeDelivery)

return function(Callback)
	-- upvalues: RealtimeDeliveryModule (copy)
	RealtimeDeliveryModule.useRealtimeNamespace("SignupAvatarInitializationProcessor", function(_)
		-- upvalues: Callback (copy)
		Callback()
	end, { Callback })
	RealtimeDeliveryModule.useRealtimeConnectionStateChanged("SignupAvatarInitializationProcessor", function(_, p1)
		-- upvalues: Callback (copy)
		if p1 then
			Callback()
		end
	end, { Callback })
end