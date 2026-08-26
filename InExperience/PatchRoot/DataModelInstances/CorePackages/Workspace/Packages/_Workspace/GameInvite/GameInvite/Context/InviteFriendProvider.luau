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
local var1 = if fFlagUseSignalsForGameInvitesStatus then require(parent_1.NotificationsCommon).GetGameInvitesStatusStore else nil

return function(p1)
	-- upvalues: useDispatch (ref), reactModule (ref), fFlagUseSignalsForGameInvitesStatus (ref), useSignalState (ref), var1 (ref), useSelector (ref), getFFlagFriendsMenuDummyLoadingFriendsFix (ref), inviteStatus (ref), receivedUserInviteStatusModule (ref), gameInviteAnalyticsManagerModule (ref), postSendExperienceInviteModule (ref), networkImpl (ref), playersService (ref), throttle (ref), inviteFriendContext (ref)
	local var2 = useDispatch()
	local var3 = reactModule.useRef(0)
	local var4 = if fFlagUseSignalsForGameInvitesStatus then useSignalState(var1(false).getGameInvitesStatus) else useSelector(function(p2)
		return p2.GameInvitesStatus
	end)
	
	return reactModule.createElement(inviteFriendContext.Provider, {
		value = {
			inviteSingleFriend = throttle(function(p2, p3)
				-- upvalues: var3 (ref), getFFlagFriendsMenuDummyLoadingFriendsFix (copy), var4 (ref), inviteStatus (copy), p1 (ref), fFlagUseSignalsForGameInvitesStatus (copy), var1 (copy), var2 (ref), receivedUserInviteStatusModule (copy), gameInviteAnalyticsManagerModule (copy), postSendExperienceInviteModule (copy), networkImpl (copy), playersService (copy)
				var3.current = math.max(p3, var3.current)
				
				if getFFlagFriendsMenuDummyLoadingFriendsFix() and (not p2 or p2 == "" or (not tonumber(p2) or tonumber(p2) == 0)) then return end
				if var4[p2] and (var4[p2] ~= inviteStatus.Failed or var4[p2] == inviteStatus.Pending) then return end
				local _ = nil
				local var5 = if p1.isCoreScript then tostring(game.PlaceId) else p1.rootPlaceId or tostring(game.PlaceId)
				
				if var5 == "0" then
					warn("Game Invite failed to send. Cannot send invite to unpublished Place.")
					
					if fFlagUseSignalsForGameInvitesStatus then
						var1(false).receivedUserInviteStatus(p2, inviteStatus.Failed)
						
						return
					end
					var2(receivedUserInviteStatusModule(p2, inviteStatus.Failed))
					
					return
				else
					local var6 = p1.launchData ~= nil and p1.launchData ~= ""
					local var7 = p1.promptMessage ~= nil and p1.promptMessage ~= ""
					local var8 = p1.inviteMessageId ~= nil and p1.inviteMessageId ~= ""
					gameInviteAnalyticsManagerModule:sendGameInviteModalEvent(p1.trigger, {
						action_type = gameInviteAnalyticsManagerModule.ActionType.InviteTriggered,
						is_launch_data_provided = var6,
						is_prompt_customized = var7,
						is_invite_message_id_provided = var8,
						recipient_user_id = p2,
						recipient_row_number = p3
					})
					
					if fFlagUseSignalsForGameInvitesStatus then
						var1(false).receivedUserInviteStatus(p2, inviteStatus.Pending)
					else
						var2(receivedUserInviteStatusModule(p2, inviteStatus.Pending))
					end
					postSendExperienceInviteModule(networkImpl, p2, var5, p1.trigger, p1.inviteMessageId, p1.launchData):andThen(function(p4)
						-- upvalues: playersService (copy), p2 (ref), gameInviteAnalyticsManagerModule (copy), p1 (copy), fFlagUseSignalsForGameInvitesStatus (copy), var1 (copy), inviteStatus (copy), var2 (copy), receivedUserInviteStatusModule (copy)
						gameInviteAnalyticsManagerModule:onActivatedInviteSent(playersService.LocalPlayer.UserId, p4.conversationId, { p2 }, p1.rootPlaceId, p1.universeId)
						
						if fFlagUseSignalsForGameInvitesStatus then
							var1(false).receivedUserInviteStatus(p2, inviteStatus.Success)
							
							return
						end
						var2(receivedUserInviteStatusModule(p2, inviteStatus.Success))
					end, function()
						-- upvalues: gameInviteAnalyticsManagerModule (copy), p1 (copy), var6 (ref), var7 (ref), var8 (ref), p2 (ref), p3 (ref), fFlagUseSignalsForGameInvitesStatus (copy), var1 (copy), inviteStatus (copy), var2 (copy), receivedUserInviteStatusModule (copy)
						gameInviteAnalyticsManagerModule:sendGameInviteModalEvent(p1.trigger, {
							action_type = gameInviteAnalyticsManagerModule.ActionType.InviteFailure,
							is_launch_data_provided = var6,
							is_prompt_customized = var7,
							is_invite_message_id_provided = var8,
							recipient_user_id = p2,
							recipient_row_number = p3
						})
						
						if fFlagUseSignalsForGameInvitesStatus then
							var1(false).receivedUserInviteStatus(p2, inviteStatus.Failed)
							
							return
						end
						var2(receivedUserInviteStatusModule(p2, inviteStatus.Failed))
					end)
				end
			end),
			getMaxRecipientRowNum = function()
				-- upvalues: var3 (ref)
				return var3.current
			end
		}
	}, p1.children)
end