local playersService = game:GetService("Players")
local parent = script.Parent.Parent
local actions = parent.State.Actions
local parent_1 = parent.Parent
local friendsMenuModule = require(parent_1.FriendsMenu)
local reactModule = require(parent_1.React)
local roactUtilsModule = require(parent_1.RoactUtils)
local inviteFriendContext = friendsMenuModule.InviteFriendContext
local inviteStatus = friendsMenuModule.InviteStatus
local gameInviteDependenciesModule = require(parent.GameInviteDependencies)
local gameInviteAnalyticsManagerModule = require(parent.analytics.GameInviteAnalyticsManager)
local throttle = require(parent_1.NotificationsCommon).Throttle
local receivedUserInviteStatusModule = require(actions.ReceivedUserInviteStatus)
local networkImpl = gameInviteDependenciesModule.networkImpl
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local postSendExperienceInviteModule = require(parent.Requests.PostSendExperienceInvite)
local useSelector = roactUtilsModule.Hooks.RoactRodux.useSelector
local getFFlagFriendsMenuDummyLoadingFriendsFix = require(parent_1.SharedFlags).GetFFlagFriendsMenuDummyLoadingFriendsFix

return function(p0) --[[ line: 41 ]]
	-- upvalues: useDispatch (ref), reactModule (ref), useSelector (ref), getFFlagFriendsMenuDummyLoadingFriendsFix (ref), inviteStatus (ref), receivedUserInviteStatusModule (ref), gameInviteAnalyticsManagerModule (ref), postSendExperienceInviteModule (ref), networkImpl (ref), playersService (ref), throttle (ref), inviteFriendContext (ref)
	local var8 = useDispatch()
	local var9 = reactModule.useRef(0)
	local var10 = useSelector(function(p1) --[[ line: 46 ]]
		return p1.GameInvitesStatus
	end)
	
	return reactModule.createElement(inviteFriendContext.Provider, {
		value = {
			inviteSingleFriend = throttle(function(p2, p3) --[[ line: 54 ]]
				-- upvalues: var9 (ref), getFFlagFriendsMenuDummyLoadingFriendsFix (copy), var10 (ref), inviteStatus (copy), p0 (ref), var8 (ref), receivedUserInviteStatusModule (copy), gameInviteAnalyticsManagerModule (copy), postSendExperienceInviteModule (copy), networkImpl (copy), playersService (copy)
				var9.current = math.max(p3, var9.current)
				
				if getFFlagFriendsMenuDummyLoadingFriendsFix() and (not p2 or p2 == "" or (not tonumber(p2) or tonumber(p2) == 0)) then return end
				if var10[p2] and (var10[p2] ~= inviteStatus.Failed or var10[p2] == inviteStatus.Pending) then return end
				local _ = nil
				local var11 = if p0.isCoreScript then tostring(game.PlaceId) else p0.rootPlaceId or tostring(game.PlaceId)
				
				if var11 == "0" then
					warn("Game Invite failed to send. Cannot send invite to unpublished Place.")
					var8(receivedUserInviteStatusModule(p2, inviteStatus.Failed))
					
					return
				end
				local var12 = p0.launchData ~= nil and p0.launchData ~= ""
				local var13 = p0.promptMessage ~= nil and p0.promptMessage ~= ""
				local var14 = p0.inviteMessageId ~= nil and p0.inviteMessageId ~= ""
				gameInviteAnalyticsManagerModule:sendGameInviteModalEvent(p0.trigger, {
					action_type = gameInviteAnalyticsManagerModule.ActionType.InviteTriggered,
					is_launch_data_provided = var12,
					is_prompt_customized = var13,
					is_invite_message_id_provided = var14,
					recipient_user_id = p2,
					recipient_row_number = p3
				})
				var8(receivedUserInviteStatusModule(p2, inviteStatus.Pending))
				postSendExperienceInviteModule(networkImpl, p2, var11, p0.trigger, p0.inviteMessageId, p0.launchData):andThen(function(p4) --[[ line: 101 ]]
					-- upvalues: playersService (copy), p2 (ref), gameInviteAnalyticsManagerModule (copy), p0 (copy), var8 (copy), receivedUserInviteStatusModule (copy), inviteStatus (copy)
					gameInviteAnalyticsManagerModule:onActivatedInviteSent(playersService.LocalPlayer.UserId, p4.conversationId, { p2 }, p0.rootPlaceId, p0.universeId)
					var8(receivedUserInviteStatusModule(p2, inviteStatus.Success))
				end, function() --[[ line: 113 ]]
					-- upvalues: gameInviteAnalyticsManagerModule (copy), p0 (copy), var12 (ref), var13 (ref), var14 (ref), p2 (ref), p3 (ref), var8 (copy), receivedUserInviteStatusModule (copy), inviteStatus (copy)
					gameInviteAnalyticsManagerModule:sendGameInviteModalEvent(p0.trigger, {
						action_type = gameInviteAnalyticsManagerModule.ActionType.InviteFailure,
						is_launch_data_provided = var12,
						is_prompt_customized = var13,
						is_invite_message_id_provided = var14,
						recipient_user_id = p2,
						recipient_row_number = p3
					})
					var8(receivedUserInviteStatusModule(p2, inviteStatus.Failed))
				end)
			end),
			getMaxRecipientRowNum = function() --[[ line: 50 ]]
				-- upvalues: var9 (ref)
				return var9.current
			end
		}
	}, p0.children)
end