local Parent = script.Parent
local Parent1 = Parent.Parent
local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local MessageBusService = game:GetService("MessageBusService")
local ReactModule = require(Parent1.React)
local LifecycleEventsModule = require(script.Parent.utils.LifecycleEvents)
local NotificationTypeEnum = require(Parent.type).NotificationTypeEnum
local LoggerModule = require(Parent.Logger)
local FFlagEnablePresenceOnlineInviteReceiverModule = require(Parent.Flags.FFlagEnablePresenceOnlineInviteReceiver)
local UsePropertyFunction = require(Parent1.GuiObjectUtils).useProperty
local ToastNotificationsMessageId = MessageBusService:GetMessageId("ToastNotifications", "PresenceOnlineToast")

return function()
	-- upvalues: UsePropertyFunction (copy), Players (copy), FFlagEnablePresenceOnlineInviteReceiverModule (copy), ReactModule (copy), LifecycleEventsModule (copy), NotificationTypeEnum (copy), HttpService (copy), Parent1 (copy), MessageBusService (copy), ToastNotificationsMessageId (copy), LoggerModule (copy)
	local LocalPlayer = UsePropertyFunction(Players, "LocalPlayer")
	local PlaceId = if FFlagEnablePresenceOnlineInviteReceiverModule then UsePropertyFunction(game, "PlaceId") else nil
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
	
	if FFlagEnablePresenceOnlineInviteReceiverModule then
		local LocalizedStrings = require(Parent1.NotificationsCommon).LocalizationHelper.getLocalizedStrings({
			inviteSuccess = "Feature.SocialContextToast.Message.InvitationConfirmation",
			inviteFailure = "Feature.SocialContextToast.Message.InvitationFailure"
		})
		local InviteSuccess = LocalizedStrings.inviteSuccess
		local InviteFailure = LocalizedStrings.inviteFailure
		ReactModule.useEffect(function()
			-- upvalues: MessageBusService (upval), ToastNotificationsMessageId (upval), LocalPlayer (copy), PlaceId (copy), Parent1 (upval), LoggerModule (upval), InviteSuccess (copy), InviteFailure (copy)
			local Flag = true
			local SubscribeResult = MessageBusService:Subscribe(ToastNotificationsMessageId, function(p1)
				-- upvalues: LocalPlayer (upval), PlaceId (upval), Parent1 (upval), LoggerModule (upval), Flag (ref), InviteSuccess (upval), InviteFailure (upval)
				if type(p1) ~= "table" then return end
				local SenderUserId = p1.senderUserId
				
				if SenderUserId and LocalPlayer and PlaceId and PlaceId > 0 then
					local GuiService = require(Parent1.MockableProxyServices).GuiService
					local HttpRequestModule = require(Parent1.HttpRequest)
					require(Parent1.GameInvite).PostSendExperienceInvite(HttpRequestModule.config({
						maxRetryCount = 0,
						requestFunction = HttpRequestModule.requestFunctions.HttpRbxApi
					}), tostring(SenderUserId), tostring(PlaceId), "OnlineFriendPresence"):andThen(function()
						-- upvalues: LoggerModule (upval), Flag (upval), GuiService (copy), InviteSuccess (upval)
						LoggerModule:info("PresenceOnlineToast experience invite sent")
						
						if Flag then
							GuiService:SendNotification({ Title = InviteSuccess })
						end
					end, function()
						-- upvalues: LoggerModule (upval), Flag (upval), GuiService (copy), InviteFailure (upval)
						LoggerModule:warning("PresenceOnlineToast experience invite failed")
						
						if Flag then
							GuiService:SendNotification({ Title = InviteFailure })
						end
					end)
					
					return
				end
			end, false, false)
			
			return function()
				-- upvalues: Flag (ref), SubscribeResult (copy)
				Flag = false
				SubscribeResult:Disconnect()
			end
		end, { LocalPlayer, PlaceId, InviteSuccess, InviteFailure })
	end
end