local parent = script:FindFirstAncestor("FriendsChat").Parent
local realtimeDeliveryModule = require(parent.RealtimeDelivery)
local dataHydrationModule = require(parent.DataHydration)
local getLocalUserIdModule = require(script.Parent.Parent.Utils.getLocalUserId)
local friendshipNotificationsModule = require(script.Parent.FriendshipNotifications)

return function()
	-- upvalues: realtimeDeliveryModule (ref), friendshipNotificationsModule (ref), getLocalUserIdModule (ref), dataHydrationModule (ref)
	realtimeDeliveryModule.useRealtimeNamespace(friendshipNotificationsModule.Namespace, function(p1)
		-- upvalues: friendshipNotificationsModule (copy), getLocalUserIdModule (copy), dataHydrationModule (copy)
		if p1 == nil then return end
		if p1.Type ~= friendshipNotificationsModule.EventType.Created and p1.Type ~= friendshipNotificationsModule.EventType.Destroyed then return end
		local var1 = getLocalUserIdModule()
		
		if var1 == nil then
			return
		end
		dataHydrationModule.Friends.FriendsStore.get().RefreshFriendsCountByUserId(tostring(var1))
	end, {})
	
	return nil
end