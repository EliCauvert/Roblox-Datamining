local Players = game:GetService("Players")
local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local FriendsMenuModule = require(Parent1.FriendsMenu)
local ReactModule = require(Parent1.React)
local RoactUtilsModule = require(Parent1.RoactUtils)
local InviteFriendContext = FriendsMenuModule.InviteFriendContext
local InviteStatus = FriendsMenuModule.InviteStatus
local GameInviteAnalyticsManagerModule = require(Parent.analytics.GameInviteAnalyticsManager)
local ThrottleFunction = require(Parent1.NotificationsCommon).Throttle
local ReceivedUserInviteStatusModule = require(Parent.State.Actions.ReceivedUserInviteStatus)
local NetworkImpl = require(Parent.GameInviteDependencies).networkImpl
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local PostSendExperienceInviteModule = require(Parent.Requests.PostSendExperienceInvite)
local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector
local GetFFlagFriendsMenuDummyLoadingFriendsFixFunction = require(Parent1.SharedFlags).GetFFlagFriendsMenuDummyLoadingFriendsFix

return function(p1)
	-- upvalues: UseDispatchFunction (copy), ReactModule (copy), UseSelectorFunction (copy), GetFFlagFriendsMenuDummyLoadingFriendsFixFunction (copy), InviteStatus (copy), ReceivedUserInviteStatusModule (copy), GameInviteAnalyticsManagerModule (copy), PostSendExperienceInviteModule (copy), NetworkImpl (copy), Players (copy), ThrottleFunction (copy), InviteFriendContext (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseRefResult = ReactModule.useRef(0)
	local UseSelectorResult = UseSelectorFunction(function(p2)
		return p2.GameInvitesStatus
	end)
	
	return ReactModule.createElement(InviteFriendContext.Provider, {
		value = {
			inviteSingleFriend = ThrottleFunction(function(Recipient_user_id, Recipient_row_number: number)
				-- upvalues: UseRefResult (copy), GetFFlagFriendsMenuDummyLoadingFriendsFixFunction (upval), UseSelectorResult (copy), InviteStatus (upval), p1 (copy), UseDispatchResult (copy), ReceivedUserInviteStatusModule (upval), GameInviteAnalyticsManagerModule (upval), PostSendExperienceInviteModule (upval), NetworkImpl (upval), Players (upval)
				UseRefResult.current = math.max(Recipient_row_number, UseRefResult.current)
				
				if GetFFlagFriendsMenuDummyLoadingFriendsFixFunction() and (not Recipient_user_id or Recipient_user_id == "" or not tonumber(Recipient_user_id) or tonumber(Recipient_user_id) == 0) then return end
				if UseSelectorResult[Recipient_user_id] and (UseSelectorResult[Recipient_user_id] ~= InviteStatus.Failed or UseSelectorResult[Recipient_user_id] == InviteStatus.Pending) then return end
				local Text = if p1.isCoreScript then tostring(game.PlaceId) else p1.rootPlaceId or tostring(game.PlaceId)
				
				if Text == "0" then
					warn("Game Invite failed to send. Cannot send invite to unpublished Place.")
					UseDispatchResult(ReceivedUserInviteStatusModule(Recipient_user_id, InviteStatus.Failed))
					
					return
				else
					local IsNotLaunchDataMatch: boolean = p1.launchData ~= nil and p1.launchData ~= ""
					local IsNotPromptMessageMatch: boolean = p1.promptMessage ~= nil and p1.promptMessage ~= ""
					local IsNotInviteMessageIdMatch: boolean = p1.inviteMessageId ~= nil and p1.inviteMessageId ~= ""
					GameInviteAnalyticsManagerModule:sendGameInviteModalEvent(p1.trigger, {
						action_type = GameInviteAnalyticsManagerModule.ActionType.InviteTriggered,
						is_launch_data_provided = IsNotLaunchDataMatch,
						is_prompt_customized = IsNotPromptMessageMatch,
						is_invite_message_id_provided = IsNotInviteMessageIdMatch,
						recipient_user_id = Recipient_user_id,
						recipient_row_number = Recipient_row_number
					})
					UseDispatchResult(ReceivedUserInviteStatusModule(Recipient_user_id, InviteStatus.Pending))
					PostSendExperienceInviteModule(NetworkImpl, Recipient_user_id, Text, p1.trigger, p1.inviteMessageId, p1.launchData):andThen(function(Result)
						-- upvalues: Players (upval), Recipient_user_id (copy), GameInviteAnalyticsManagerModule (upval), p1 (upval), UseDispatchResult (upval), ReceivedUserInviteStatusModule (upval), InviteStatus (upval)
						GameInviteAnalyticsManagerModule:onActivatedInviteSent(Players.LocalPlayer.UserId, Result.conversationId, { Recipient_user_id }, p1.rootPlaceId, p1.universeId)
						UseDispatchResult(ReceivedUserInviteStatusModule(Recipient_user_id, InviteStatus.Success))
					end, function()
						-- upvalues: GameInviteAnalyticsManagerModule (upval), p1 (upval), IsNotLaunchDataMatch (copy), IsNotPromptMessageMatch (copy), IsNotInviteMessageIdMatch (copy), Recipient_user_id (copy), Recipient_row_number (copy), UseDispatchResult (upval), ReceivedUserInviteStatusModule (upval), InviteStatus (upval)
						GameInviteAnalyticsManagerModule:sendGameInviteModalEvent(p1.trigger, {
							action_type = GameInviteAnalyticsManagerModule.ActionType.InviteFailure,
							is_launch_data_provided = IsNotLaunchDataMatch,
							is_prompt_customized = IsNotPromptMessageMatch,
							is_invite_message_id_provided = IsNotInviteMessageIdMatch,
							recipient_user_id = Recipient_user_id,
							recipient_row_number = Recipient_row_number
						})
						UseDispatchResult(ReceivedUserInviteStatusModule(Recipient_user_id, InviteStatus.Failed))
					end)
				end
			end),
			getMaxRecipientRowNum = function()
				-- upvalues: UseRefResult (copy)
				return UseRefResult.current
			end
		}
	}, p1.children)
end