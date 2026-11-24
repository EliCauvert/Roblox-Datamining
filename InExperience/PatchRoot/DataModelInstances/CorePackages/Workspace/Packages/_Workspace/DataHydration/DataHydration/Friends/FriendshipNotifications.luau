local RobloxEventReceiver = require(script:FindFirstAncestor("DataHydration").Parent.RealtimeDelivery).RobloxEventReceiver
local EventType = {
	Requested = "FriendshipRequested",
	Created = "FriendshipCreated",
	Destroyed = "FriendshipDestroyed",
	Declined = "FriendshipDeclined"
}
local NewResult = nil

local function _()
	-- upvalues: NewResult (ref), RobloxEventReceiver (copy)
	if NewResult == nil then
		NewResult = RobloxEventReceiver.new(game:GetService("NotificationService"))
	end
	return NewResult
end

return {
	EventType = EventType,
	observe = function(Callback, Callback1)
		-- upvalues: NewResult (ref), RobloxEventReceiver (copy), EventType (copy)
		if NewResult == nil then
			NewResult = RobloxEventReceiver.new(game:GetService("NotificationService"))
		end
		local FriendshipNotifications = NewResult:observeEvent("FriendshipNotifications", function(p1)
			-- upvalues: Callback (copy), Callback1 (copy), EventType (upval)
			if type(p1) ~= "table" or p1.Type == nil then return end
			local EventArgs = p1.EventArgs
			
			if EventArgs == nil or EventArgs.UserId1 == nil or EventArgs.UserId2 == nil then return end
			local CallbackResult = Callback()
			local Text = tostring(EventArgs.UserId1)
			local Text1 = tostring(EventArgs.UserId2)
			
			if CallbackResult ~= "" and (CallbackResult == Text or CallbackResult == Text1) then
				Callback1({
					eventType = p1.Type,
					otherUserId = if CallbackResult == Text then Text1 else Text,
					isLocalUserSender = p1.Type == EventType.Requested and CallbackResult == Text
				})
				
				return
			end
		end)
		
		return function()
			-- upvalues: FriendshipNotifications (copy)
			FriendshipNotifications:disconnect()
		end
	end
}