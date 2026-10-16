local Parent = script:FindFirstAncestor("FriendsChat").Parent
local RealtimeDeliveryModule = require(Parent.RealtimeDelivery)
local DataHydrationModule = require(Parent.DataHydration)
local GetLocalUserIdModule = require(script.Parent.Parent.Utils.getLocalUserId)
local FriendshipNotificationsModule = require(script.Parent.FriendshipNotifications)

return function() --[[ Line: 17 | Named "FriendsCountRefetchBridge" ]]
	-- upvalues: RealtimeDeliveryModule (copy), FriendshipNotificationsModule (copy), GetLocalUserIdModule (copy), DataHydrationModule (copy)
	RealtimeDeliveryModule.useRealtimeNamespace(FriendshipNotificationsModule.Namespace, function(p1) --[[ Line: 18 ]]
		-- upvalues: FriendshipNotificationsModule (upval), GetLocalUserIdModule (upval), DataHydrationModule (upval)
		if p1 == nil then return end
		if p1.Type ~= FriendshipNotificationsModule.EventType.Created and p1.Type ~= FriendshipNotificationsModule.EventType.Destroyed then return end
		local LocalUserIdModule = GetLocalUserIdModule()
		
		if LocalUserIdModule ~= nil then
			DataHydrationModule.Friends.FriendsStore.get().RefreshFriendsCountByUserId((tostring(LocalUserIdModule)))
			
			return
		end
	end, {})
	
	return nil
end