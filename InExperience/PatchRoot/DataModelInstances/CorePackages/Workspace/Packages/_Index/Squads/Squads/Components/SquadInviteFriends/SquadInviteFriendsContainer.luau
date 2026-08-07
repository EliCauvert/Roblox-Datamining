local squads = script:FindFirstAncestor("Squads")
local parent = squads.Parent
local dependenciesModule = require(squads.dependencies)
local squadInviteSourceEnumModule = require(squads.Enums.SquadInviteSourceEnum)
local inviteToSquadModule = require(squads.Thunks.inviteToSquad)
local inviteToParentChannelModule = require(squads.Thunks.InviteToParentChannel)
local notificationModalsManagerModule = require(parent.NotificationModalsManager)
local promiseModule = require(parent.Promise)
local UIBloxModule = require(parent.UIBlox)
local useAppPolicy = require(parent.UniversalAppPolicy).useAppPolicy
local useLocalUserId = require(parent.RobloxAppHooks).useLocalUserId
local cryo = dependenciesModule.Cryo
local react = dependenciesModule.React
local useCurrentSquadSelector = dependenciesModule.Hooks.useCurrentSquadSelector
local useDispatch = dependenciesModule.Hooks.useDispatch
local useLocalization = dependenciesModule.Hooks.useLocalization
local constantsModule = require(parent.SquadsCore.Constants)
local squadExternalContractContext = require(parent.SquadsCore.SquadExternalContractProvider).SquadExternalContractContext
local eventNamesModule = require(parent.SquadsCore.EventNames)
local squadPromptType = require(parent.SquadsCore.Enums).SquadPromptType
local useNavigation = dependenciesModule.useNavigation
local useStore = dependenciesModule.Hooks.useStore
local images = UIBloxModule.App.ImageSet.Images
local squadInviteFriendsModule = require(script.Parent.SquadInviteFriends)

return function(p0) --[[ line: 33 | named "SquadInviteFriendsContainer" ]]
	-- upvalues: react (ref), squadExternalContractContext (ref), useNavigation (ref), useDispatch (ref), useStore (ref), useLocalization (ref), useCurrentSquadSelector (ref), useLocalUserId (ref), useAppPolicy (ref), cryo (ref), notificationModalsManagerModule (ref), images (ref), squadInviteSourceEnumModule (ref), eventNamesModule (ref), promiseModule (ref), inviteToParentChannelModule (ref), inviteToSquadModule (ref), constantsModule (ref), squadPromptType (ref), squadInviteFriendsModule (ref)
	local var25
	local var11 = react.useContext(squadExternalContractContext)
	local var12 = useNavigation()
	local var13 = useDispatch()
	local var14 = useStore()
	local var15 = useLocalization({
		addText = "Feature.Squads.Action.Add",
		user = "Feature.Squads.Description.User",
		youAddedMoreThanTwoToChat = "Feature.Squads.Description.YouAddedMoreThanTwoToChat",
		youAddedToChat = "Feature.Squads.Description.YouAddedToChat",
		youAddedTwoToChat = "Feature.Squads.Description.YouAddedTwoToChat"
	})
	local var16 = react.useRef(false)
	local var17 = useCurrentSquadSelector()
	local var18 = if var17 and var17.parentChannelId then var17.parentChannelId else ""
	local var19 = var11.useGetConversationFromId(var18)
	local var20 = useLocalUserId()
	local var21 = useAppPolicy(react.useCallback(function(p1) --[[ line: 57 ]]
		return p1.getCanUsePlatformChat()
	end, {}))
	local var22 = react.useCallback(function(p2) --[[ line: 65 ]]
		-- upvalues: cryo (copy), var15 (ref), notificationModalsManagerModule (copy), images (copy)
		local var26 = cryo.Dictionary.keys(p2)
		local displayName = p2[var26[1]].displayName
		notificationModalsManagerModule.SetUIBloxToast({
			iconImage = images["icons/actions/friends/friendAdd"],
			toastTitle = if #var26 > 2 then var15.youAddedMoreThanTwoToChat:gsub("{(.-)}", {
				username = displayName,
				userCountMinusOne = tostring(#var26 - 1)
			}) elseif #var26 == 2 then var15.youAddedTwoToChat:gsub("{(.-)}", {
				username1 = displayName,
				username2 = p2[var26[2]].displayName
			}) else var15.youAddedToChat:gsub("{(.-)}", { username = displayName })
		})
	end, {
		var15.youAddedMoreThanTwoToChat,
		var15.youAddedToChat,
		var15.youAddedTwoToChat
	})
	local var23 = react.useCallback(function(p3) --[[ line: 92 ]]
		-- upvalues: cryo (copy), var18 (ref), squadInviteSourceEnumModule (copy), var11 (ref), eventNamesModule (copy)
		var11.fireSquadAnalytics(eventNamesModule.SquadInvite, cryo.Dictionary.union({
			parentChannelId = var18,
			source = squadInviteSourceEnumModule.SourceSquadInvitePage
		}, p3))
	end, { var18, var11.fireSquadAnalytics })
	local createElement = react.createElement
	local t = {
		participants = p0.participants,
		onMultiInvite = react.useCallback(function(p4) --[[ line: 101 ]]
			-- upvalues: var17 (ref), var19 (ref), cryo (copy), var20 (ref), var11 (ref), var13 (ref), promiseModule (copy), inviteToParentChannelModule (copy), var12 (ref), inviteToSquadModule (copy), var23 (ref), var22 (ref), constantsModule (copy), var14 (ref), squadPromptType (copy), var21 (ref)
			if not var17 or not var19 then return end
			local var27 = cryo.Dictionary.keys(p4)
			local var28 = cryo.List.toSet(var19.participants)
			local var29 = cryo.List.filter(var27, function(p5) --[[ line: 112 ]]
				-- upvalues: var28 (ref)
				return var28[p5] == nil
			end)
			
			local var30 = function() --[[ line: 116 ]]
				-- upvalues: cryo (copy), var19 (copy), var27 (ref), var20 (copy), var11 (copy), var13 (copy), promiseModule (copy), var29 (ref), inviteToParentChannelModule (copy), var12 (copy), inviteToSquadModule (copy), var17 (copy), var23 (copy), var22 (copy), p4 (ref)
				local var31 = cryo.List.filter(var19.participants, function(p6) --[[ line: 119 ]]
					-- upvalues: cryo (copy), var27 (copy), var20 (copy)
					return cryo.List.find(var27, tostring(p6)) == nil and p6 ~= var20
				end)
				local t = {}
				
				if #var31 > 0 then
					for i, v in ipairs(var31) do
						table.insert(t, var11.removeUserFromParentChannel(var13, var19.id, v))
					end
				end
				promiseModule.all(t):andThen(function() --[[ line: 136 ]]
					-- upvalues: var29 (copy), var13 (copy), inviteToParentChannelModule (copy), var31 (ref), var12 (copy), var19 (copy), inviteToSquadModule (copy), var17 (copy), var20 (copy), var23 (copy), var22 (copy), p4 (copy), var11 (copy)
					if #var29 > 0 then
						var13(inviteToParentChannelModule({
							dispatch = var13,
							onErrorCallback = function() --[[ line: 140 ]]
								-- upvalues: var31 (copy), var12 (copy)
								if #var31 > 0 then
									var12.pop()
								end
							end,
							onSuccessCallback = function(p7) --[[ line: 145 ]]
								-- upvalues: var19 (copy), var13 (copy), inviteToSquadModule (copy), var17 (copy), var20 (copy), var29 (copy), var23 (copy), var22 (copy), p4 (copy), var12 (copy)
								var13(inviteToSquadModule(var17.squadId, p7, var20, var29, var23, p7 ~= var19.id))
								var22(p4)
								var12.pop()
							end,
							parentChannel = var19,
							userIds = var29,
							squadExternalContext = var11
						}))
						
						return
					end
					var12.pop()
				end)
			end
			
			if var19.type == constantsModule.CONVERSATION_CHANNEL_ONE_TO_ONE_TYPE and var19.moderationType == constantsModule.TRUSTED_COMM_MODERATION_TYPE then
				var11.setSquadPrompt(var14, {
					hideCancelButton = true,
					promptType = squadPromptType.CannotExpandToGroupChatActiveParty,
					onConfirm = function() --[[ line: 177 ]]
						-- upvalues: var12 (copy)
						var12.pop()
					end
				})
				
				return
			elseif var19.type == constantsModule.CONVERSATION_CHANNEL_GROUP_TYPE and var21 and #var29 > 0 then
				var11.setSquadPrompt(var14, {
					hideCancelButton = false,
					promptType = squadPromptType.ConfirmInviteToSquad,
					onConfirm = function() --[[ line: 189 ]]
						-- upvalues: var30 (ref)
						var30()
					end
				})
				
				return
			end
			var30()
		end, {
			var17, var13, var12, var19, var23, var22, var11.setSquadPrompt,
			var11.inviteToParentChannel, var14, var21, var20, var11
		}),
		buttonText = var15.addText,
		analyticsInfo = { selectionPageType = "SquadInvite" },
		partyStartedRef = var16,
		onRemoveCallback = if var19 then function(p8, p9) --[[ line: 220 ]]
			-- upvalues: cryo (copy), var19 (ref), var11 (ref), var14 (ref), var15 (ref), squadPromptType (copy)
			if cryo.List.find(var19.participants, p8) then
				var11.setSquadPrompt(var14, {
					hideCancelButton = true,
					bodyTextLocalizationProps = { displayName = p9 or var15.user },
					promptType = squadPromptType.RemoveFromParty
				})
			end
		end else nil,
		preselectedUsers = var19 and (var19.participants and cryo.List.filter(var19.participants, function(p10) --[[ line: 235 ]]
			-- upvalues: var20 (ref)
			return p10 ~= var20
		end))
	}
	
	if var19 then
		var25 = true
		
		if var19.type ~= constantsModule.CONVERSATION_CHANNEL_ONE_TO_ONE_TYPE then
			local _ = var19.initiator ~= tostring(var20)
		end
	else
		var25 = nil
	end
	t.preselectedUsersUnremovable = var25
	t.onSelectedFriendsChanged = p0.onSelectedFriendsChanged
	t.shouldHideFooterButton = p0.shouldHideFooterButton
	
	return createElement(squadInviteFriendsModule, t)
end