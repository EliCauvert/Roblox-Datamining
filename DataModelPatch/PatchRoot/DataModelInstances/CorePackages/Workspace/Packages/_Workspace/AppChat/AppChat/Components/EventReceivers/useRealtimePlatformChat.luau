local RealtimeDeliveryModule = require(script:FindFirstAncestor("AppChat").Parent.RealtimeDelivery)
local _ = require(script.Parent.CommunicationChannelsTypes)

return function(Callback, p1)
	-- upvalues: RealtimeDeliveryModule (copy)
	RealtimeDeliveryModule.useRealtimeNamespace("CommunicationChannels", function(p2)
		-- upvalues: Callback (copy)
		if p2.ChannelVertical == "PlatformChat" then
			Callback(p2)
		end
	end, p1)
end