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
local useSignalState = require(parent_1.SignalsReact).useSignalState
local sharedFlagsModule = require(parent_1.SharedFlags)
local getFFlagFriendsMenuDummyLoadingFriendsFix = sharedFlagsModule.GetFFlagFriendsMenuDummyLoadingFriendsFix
local fFlagUseSignalsForGameInvitesStatus = sharedFlagsModule.FFlagUseSignalsForGameInvitesStatus
local var9 = if fFlagUseSignalsForGameInvitesStatus then require(parent_1.NotificationsCommon).GetGameInvitesStatusStore else nil

return function(p0)
	-- upvalues: useDispatch (ref), reactModule (ref), fFlagUseSignalsForGameInvitesStatus (ref), useSignalState (ref), var9 (ref), useSelector (ref), getFFlagFriendsMenuDummyLoadingFriendsFix (ref), inviteStatus (ref), receivedUserInviteStatusModule (ref), gameInviteAnalyticsManagerModule (ref), postSendExperienceInviteModule (ref), networkImpl (ref), playersService (ref), throttle (ref), inviteFriendContext (ref)
	local var10 = useDispatch()
	local var11 = reactModule.useRef(0)
	local var12 = if fFlagUseSignalsForGameInvitesStatus then useSignalState(var9(false).getGameInvitesStatus) else useSelector(function(p1)
		return p1.GameInvitesStatus
	end)
	
	return reactModule.createElement(inviteFriendContext.Provider, {
		value = {
			inviteSingleFriend = throttle(function(p2, p3)
				-- upvalues: var11 (ref), getFFlagFriendsMenuDummyLoadingFriendsFix (copy), var12 (ref), inviteStatus (copy), p0 (ref), fFlagUseSignalsForGameInvitesStatus (copy), var9 (copy), var10 (ref), receivedUserInviteStatusModule (copy), gameInviteAnalyticsManagerModule (copy), postSendExperienceInviteModule (copy), networkImpl (copy), playersService (copy)
				var11.current = math.max(p3, var11.current)
				
				if getFFlagFriendsMenuDummyLoadingFriendsFix() and (not p2 or p2 == "" or (not tonumber(p2) or tonumber(p2) == 0)) then return end
				if var12[p2] and (var12[p2] ~= inviteStatus.Failed or var12[p2] == inviteStatus.Pending) then return end
				local _ = nil
				local var13 = if p0.isCoreScript then tostring(game.PlaceId) else p0.rootPlaceId or tostring(game.PlaceId)
				
				if var13 == "0" then
					warn("Game Invite failed to send. Cannot send invite to unpublished Place.")
					
					if fFlagUseSignalsForGameInvitesStatus then
						var9(false).receivedUserInviteStatus(p2, inviteStatus.Failed)
						
						return
					end
					var10(receivedUserInviteStatusModule(p2, inviteStatus.Failed))
					
					return
				else
					local var14 = p0.launchData ~= nil and p0.launchData ~= ""
					local var15 = p0.promptMessage ~= nil and p0.promptMessage ~= ""
					local var16 = p0.inviteMessageId ~= nil and p0.inviteMessageId ~= ""
					gameInviteAnalyticsManagerModule:sendGameInviteModalEvent(p0.trigger, {
						action_type = gameInviteAnalyticsManagerModule.ActionType.InviteTriggered,
						is_launch_data_provided = var14,
						is_prompt_customized = var15,
						is_invite_message_id_provided = var16,
						recipient_user_id = p2,
						recipient_row_number = p3
					})
					
					if fFlagUseSignalsForGameInvitesStatus then
						var9(false).receivedUserInviteStatus(p2, inviteStatus.Pending)
					else
						var10(receivedUserInviteStatusModule(p2, inviteStatus.Pending))
					end
					postSendExperienceInviteModule(networkImpl, p2, var13, p0.trigger, p0.inviteMessageId, p0.launchData):andThen(function(p4)
						-- upvalues: playersService (copy), p2 (ref), gameInviteAnalyticsManagerModule (copy), p0 (copy), fFlagUseSignalsForGameInvitesStatus (copy), var9 (copy), inviteStatus (copy), var10 (copy), receivedUserInviteStatusModule (copy)
						gameInviteAnalyticsManagerModule:onActivatedInviteSent(playersService.LocalPlayer.UserId, p4.conversationId, { p2 }, p0.rootPlaceId, p0.universeId)
						
						if fFlagUseSignalsForGameInvitesStatus then
							var9(false).receivedUserInviteStatus(p2, inviteStatus.Success)
							
							return
						end
						var10(receivedUserInviteStatusModule(p2, inviteStatus.Success))
					end, function()
						-- upvalues: gameInviteAnalyticsManagerModule (copy), p0 (copy), var14 (ref), var15 (ref), var16 (ref), p2 (ref), p3 (ref), fFlagUseSignalsForGameInvitesStatus (copy), var9 (copy), inviteStatus (copy), var10 (copy), receivedUserInviteStatusModule (copy)
						gameInviteAnalyticsManagerModule:sendGameInviteModalEvent(p0.trigger, {
							action_type = gameInviteAnalyticsManagerModule.ActionType.InviteFailure,
							is_launch_data_provided = var14,
							is_prompt_customized = var15,
							is_invite_message_id_provided = var16,
							recipient_user_id = p2,
							recipient_row_number = p3
						})
						
						if fFlagUseSignalsForGameInvitesStatus then
							var9(false).receivedUserInviteStatus(p2, inviteStatus.Failed)
							
							return
						end
						var10(receivedUserInviteStatusModule(p2, inviteStatus.Failed))
					end)
				end
			end),
			getMaxRecipientRowNum = function()
				-- upvalues: var11 (ref)
				return var11.current
			end
		}
	}, p0.children)
end