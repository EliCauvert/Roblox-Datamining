local parent = script.Parent
local parent_1 = parent.Parent
local playersService = game:GetService("Players")
local httpService = game:GetService("HttpService")
local reactModule = require(parent_1.React)
local lifecycleEventsModule = require(script.Parent.utils.LifecycleEvents)
local notificationTypeEnum = require(parent.type).NotificationTypeEnum
local useProperty = require(parent_1.GuiObjectUtils).useProperty

return function()
	-- upvalues: useProperty (ref), playersService (ref), reactModule (ref), lifecycleEventsModule (ref), notificationTypeEnum (ref), httpService (ref)
	local var1 = useProperty(playersService, "LocalPlayer")
	reactModule.useEffect(function()
		-- upvalues: lifecycleEventsModule (copy), notificationTypeEnum (copy), httpService (copy), var1 (ref), playersService (copy)
		local userAction = lifecycleEventsModule:RegisterCallback(lifecycleEventsModule.ToastEvents.UserAction, notificationTypeEnum.FriendRequestReceived, function(p1)
			-- upvalues: httpService (copy), var1 (copy), playersService (copy)
			if p1 and p1.userActionType == "click" and (p1.notificationData and p1.visualItem) then
				local senderUserId = httpService:JSONDecode(p1.visualItem.actionEventParams).senderUserId
				
				if senderUserId and var1 then
					local var2 = playersService:GetPlayerByUserId(tonumber(senderUserId))
					
					if p1.visualItem.eventName == "AcceptFriend" then
						var1:RequestFriendship(var2)
						
						return
					elseif p1.visualItem.eventName == "IgnoreFriend" then
						var1:RevokeFriendship(var2)
					end
				end
			end
		end)
		
		return function()
			-- upvalues: userAction (ref)
			userAction()
		end
	end, { var1 })
end