local realtimeDeliveryModule = require(script:FindFirstAncestor("AppChat").Parent.RealtimeDelivery)
local _ = require(script.Parent.CommunicationChannelsTypes)

return function(p1, p2)
	-- upvalues: realtimeDeliveryModule (ref)
	realtimeDeliveryModule.useRealtimeNamespace("CommunicationChannels", function(p3)
		-- upvalues: p1 (ref)
		if p3.ChannelVertical == "PlatformChat" then
			p1(p3)
		end
	end, p2)
end