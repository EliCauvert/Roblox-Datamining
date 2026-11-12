local Parent = script.Parent
local Parent1 = Parent.Parent
local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local ReactModule = require(Parent1.React)
local LifecycleEventsModule = require(script.Parent.utils.LifecycleEvents)
local NotificationTypeEnum = require(Parent.type).NotificationTypeEnum
local UsePropertyFunction = require(Parent1.GuiObjectUtils).useProperty

return function()
	-- upvalues: UsePropertyFunction (copy), Players (copy), ReactModule (copy), LifecycleEventsModule (copy), NotificationTypeEnum (copy), HttpService (copy)
	local LocalPlayer = UsePropertyFunction(Players, "LocalPlayer")
	ReactModule.useEffect(function()
		-- upvalues: LifecycleEventsModule (upval), NotificationTypeEnum (upval), HttpService (upval), LocalPlayer (copy), Players (upval)
		local RegisterResult = LifecycleEventsModule:RegisterCallback(LifecycleEventsModule.ToastEvents.UserAction, NotificationTypeEnum.FriendRequestReceived, function(p1)
			-- upvalues: HttpService (upval), LocalPlayer (upval), Players (upval)
			if p1 and p1.userActionType == "click" and p1.notificationData and p1.visualItem then
				local SenderUserId = HttpService:JSONDecode(p1.visualItem.actionEventParams).senderUserId
				
				if SenderUserId and LocalPlayer then
					local Player = Players:GetPlayerByUserId((tonumber(SenderUserId)))
					
					if p1.visualItem.eventName == "AcceptFriend" then
						LocalPlayer:RequestFriendship(Player)
						
						return
					end
					if p1.visualItem.eventName == "IgnoreFriend" then
						LocalPlayer:RevokeFriendship(Player)
					end
				end
			end
		end)
		
		return function()
			-- upvalues: RegisterResult (copy)
			RegisterResult()
		end
	end, { LocalPlayer })
end