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

return function(p1)
	-- upvalues: react (ref), squadExternalContractContext (ref), useNavigation (ref), useDispatch (ref), useStore (ref), useLocalization (ref), useCurrentSquadSelector (ref), useLocalUserId (ref), useAppPolicy (ref), cryo (ref), notificationModalsManagerModule (ref), images (ref), squadInviteSourceEnumModule (ref), eventNamesModule (ref), promiseModule (ref), inviteToParentChannelModule (ref), inviteToSquadModule (ref), constantsModule (ref), squadPromptType (ref), squadInviteFriendsModule (ref)
	local var1
	local var2 = react.useContext(squadExternalContractContext)
	local var3 = useNavigation()
	local var4 = useDispatch()
	local var5 = useStore()
	local var6 = useLocalization({
		addText = "Feature.Squads.Action.Add",
		user = "Feature.Squads.Description.User",
		youAddedMoreThanTwoToChat = "Feature.Squads.Description.YouAddedMoreThanTwoToChat",
		youAddedToChat = "Feature.Squads.Description.YouAddedToChat",
		youAddedTwoToChat = "Feature.Squads.Description.YouAddedTwoToChat"
	})
	local var7 = react.useRef(false)
	local var8 = useCurrentSquadSelector()
	local var9 = if var8 and var8.parentChannelId then var8.parentChannelId else ""
	local var10 = var2.useGetConversationFromId(var9)
	local var11 = useLocalUserId()
	local var12 = useAppPolicy(react.useCallback(function(p2)
		return p2.getCanUsePlatformChat()
	end, {}))
	local var13 = react.useCallback(function(p2)
		-- upvalues: cryo (copy), var6 (ref), notificationModalsManagerModule (copy), images (copy)
		local var14 = cryo.Dictionary.keys(p2)
		local displayName = p2[var14[1]].displayName
		notificationModalsManagerModule.SetUIBloxToast({
			iconImage = images["icons/actions/friends/friendAdd"],
			toastTitle = if #var14 > 2 then var6.youAddedMoreThanTwoToChat:gsub("{(.-)}", {
				username = displayName,
				userCountMinusOne = tostring(#var14 - 1)
			}) elseif #var14 == 2 then var6.youAddedTwoToChat:gsub("{(.-)}", {
				username1 = displayName,
				username2 = p2[var14[2]].displayName
			}) else var6.youAddedToChat:gsub("{(.-)}", { username = displayName })
		})
	end, {
		var6.youAddedMoreThanTwoToChat,
		var6.youAddedToChat,
		var6.youAddedTwoToChat
	})
	local var14 = react.useCallback(function(p2)
		-- upvalues: cryo (copy), var9 (ref), squadInviteSourceEnumModule (copy), var2 (ref), eventNamesModule (copy)
		var2.fireSquadAnalytics(eventNamesModule.SquadInvite, cryo.Dictionary.union({
			parentChannelId = var9,
			source = squadInviteSourceEnumModule.SourceSquadInvitePage
		}, p2))
	end, { var9, var2.fireSquadAnalytics })
	local createElement = react.createElement
	local t = {
		participants = p1.participants,
		onMultiInvite = react.useCallback(function(p2)
			-- upvalues: var8 (ref), var10 (ref), cryo (copy), var11 (ref), var2 (ref), var4 (ref), promiseModule (copy), inviteToParentChannelModule (copy), var3 (ref), inviteToSquadModule (copy), var14 (ref), var13 (ref), constantsModule (copy), var5 (ref), squadPromptType (copy), var12 (ref)
			if not var8 or not var10 then return end
			local var15 = cryo.Dictionary.keys(p2)
			local var16 = cryo.List.toSet(var10.participants)
			local var17 = cryo.List.filter(var15, function(p3)
				-- upvalues: var16 (ref)
				return var16[p3] == nil
			end)
			
			local var18 = function()
				-- upvalues: cryo (copy), var10 (copy), var15 (ref), var11 (copy), var2 (copy), var4 (copy), promiseModule (copy), var17 (ref), inviteToParentChannelModule (copy), var3 (copy), inviteToSquadModule (copy), var8 (copy), var14 (copy), var13 (copy), p2 (ref)
				local var19 = cryo.List.filter(var10.participants, function(p3)
					-- upvalues: cryo (copy), var15 (copy), var11 (copy)
					return cryo.List.find(var15, tostring(p3)) == nil and p3 ~= var11
				end)
				local t = {}
				
				if #var19 > 0 then
					for i, v in ipairs(var19) do
						table.insert(t, var2.removeUserFromParentChannel(var4, var10.id, v))
					end
				end
				promiseModule.all(t):andThen(function()
					-- upvalues: var17 (copy), var4 (copy), inviteToParentChannelModule (copy), var19 (ref), var3 (copy), var10 (copy), inviteToSquadModule (copy), var8 (copy), var11 (copy), var14 (copy), var13 (copy), p2 (copy), var2 (copy)
					if #var17 > 0 then
						var4(inviteToParentChannelModule({
							dispatch = var4,
							onErrorCallback = function()
								-- upvalues: var19 (copy), var3 (copy)
								if #var19 > 0 then
									var3.pop()
								end
							end,
							onSuccessCallback = function(p3)
								-- upvalues: var10 (copy), var4 (copy), inviteToSquadModule (copy), var8 (copy), var11 (copy), var17 (copy), var14 (copy), var13 (copy), p2 (copy), var3 (copy)
								var4(inviteToSquadModule(var8.squadId, p3, var11, var17, var14, p3 ~= var10.id))
								var13(p2)
								var3.pop()
							end,
							parentChannel = var10,
							userIds = var17,
							squadExternalContext = var2
						}))
						
						return
					end
					var3.pop()
				end)
			end
			
			if var10.type == constantsModule.CONVERSATION_CHANNEL_ONE_TO_ONE_TYPE and var10.moderationType == constantsModule.TRUSTED_COMM_MODERATION_TYPE then
				var2.setSquadPrompt(var5, {
					hideCancelButton = true,
					promptType = squadPromptType.CannotExpandToGroupChatActiveParty,
					onConfirm = function()
						-- upvalues: var3 (copy)
						var3.pop()
					end
				})
				
				return
			elseif var10.type == constantsModule.CONVERSATION_CHANNEL_GROUP_TYPE and var12 and #var17 > 0 then
				var2.setSquadPrompt(var5, {
					hideCancelButton = false,
					promptType = squadPromptType.ConfirmInviteToSquad,
					onConfirm = function()
						-- upvalues: var18 (ref)
						var18()
					end
				})
				
				return
			end
			var18()
		end, {
			var8, var4, var3, var10, var14, var13, var2.setSquadPrompt,
			var2.inviteToParentChannel, var5, var12, var11, var2
		}),
		buttonText = var6.addText,
		analyticsInfo = { selectionPageType = "SquadInvite" },
		partyStartedRef = var7,
		onRemoveCallback = if var10 then function(p3, p4)
			-- upvalues: cryo (copy), var10 (ref), var2 (ref), var5 (ref), var6 (ref), squadPromptType (copy)
			if cryo.List.find(var10.participants, p3) then
				var2.setSquadPrompt(var5, {
					hideCancelButton = true,
					bodyTextLocalizationProps = { displayName = p4 or var6.user },
					promptType = squadPromptType.RemoveFromParty
				})
			end
		end else nil,
		preselectedUsers = var10 and (var10.participants and cryo.List.filter(var10.participants, function(p3)
			-- upvalues: var11 (ref)
			return p3 ~= var11
		end))
	}
	
	if var10 then
		var1 = true
		
		if var10.type ~= constantsModule.CONVERSATION_CHANNEL_ONE_TO_ONE_TYPE then
			local _ = var10.initiator ~= tostring(var11)
		end
	else
		var1 = nil
	end
	t.preselectedUsersUnremovable = var1
	t.onSelectedFriendsChanged = p1.onSelectedFriendsChanged
	t.shouldHideFooterButton = p1.shouldHideFooterButton
	
	return createElement(squadInviteFriendsModule, t)
end