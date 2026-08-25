local realtimeDeliveryModule = require(script:FindFirstAncestor("AppChat").Parent.RealtimeDelivery)
local _ = require(script.Parent.CommunicationChannelsTypes)

return function(p0, p1)
	-- upvalues: realtimeDeliveryModule (ref)
	realtimeDeliveryModule.useRealtimeNamespace("CommunicationChannels", function(p2)
		-- upvalues: p0 (ref)
		if p2.ChannelVertical == "PlatformChat" then
			p0(p2)
		end
	end, p1)
end