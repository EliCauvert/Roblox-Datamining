local parent = script.Parent
local parent_1 = parent.Parent
local playersService = game:GetService("Players")
local httpService = game:GetService("HttpService")
local reactModule = require(parent_1.React)
local lifecycleEventsModule = require(script.Parent.utils.LifecycleEvents)
local notificationTypeEnum = require(parent.type).NotificationTypeEnum
local useProperty = require(parent_1.GuiObjectUtils).useProperty

return function() --[[ line: 18 | named "InGameToastNotificationActionEventReceiver" ]]
	-- upvalues: useProperty (ref), playersService (ref), reactModule (ref), lifecycleEventsModule (ref), notificationTypeEnum (ref), httpService (ref)
	local var4 = useProperty(playersService, "LocalPlayer")
	reactModule.useEffect(function() --[[ line: 21 ]]
		-- upvalues: lifecycleEventsModule (copy), notificationTypeEnum (copy), httpService (copy), var4 (ref), playersService (copy)
		local userAction = lifecycleEventsModule:RegisterCallback(lifecycleEventsModule.ToastEvents.UserAction, notificationTypeEnum.FriendRequestReceived, function(p0) --[[ line: 25 ]]
			-- upvalues: httpService (copy), var4 (copy), playersService (copy)
			if p0 and p0.userActionType == "click" and (p0.notificationData and p0.visualItem) then
				local senderUserId = httpService:JSONDecode(p0.visualItem.actionEventParams).senderUserId
				
				if senderUserId and var4 then
					local var6 = playersService:GetPlayerByUserId(tonumber(senderUserId))
					
					if p0.visualItem.eventName == "AcceptFriend" then
						var4:RequestFriendship(var6)
						
						return
					elseif p0.visualItem.eventName == "IgnoreFriend" then
						var4:RevokeFriendship(var6)
					end
				end
			end
		end)
		
		return function() --[[ line: 45 ]]
			-- upvalues: userAction (ref)
			userAction()
		end
	end, { var4 })
end