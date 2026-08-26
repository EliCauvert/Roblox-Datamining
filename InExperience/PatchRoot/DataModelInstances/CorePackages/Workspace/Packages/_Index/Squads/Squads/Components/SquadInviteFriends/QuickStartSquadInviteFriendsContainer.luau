local squads = script:FindFirstAncestor("Squads")
local parent = squads.Parent
local dependenciesModule = require(squads.dependencies)
local squadButtonSourceEnumModule = require(squads.Enums.SquadButtonSourceEnum)
local squadButtonClickIntentionEnumModule = require(squads.Enums.SquadButtonClickIntentionEnum)
local sharedFlagsModule = require(parent.SharedFlags)
local useLocalUserId = require(parent.RobloxAppHooks).useLocalUserId
local cryo = dependenciesModule.Cryo
local createConversation = require(parent.SquadsCore.Thunks).createConversation
local leaveSquad = require(parent.SquadsCore.Thunks).leaveSquad
local react = dependenciesModule.React
local squadExternalContractContext = require(parent.SquadsCore.SquadExternalContractProvider).SquadExternalContractContext
local squadPromptType = require(parent.SquadsCore.Enums).SquadPromptType
local useCurrentSquadParentChannelId = require(parent.SquadsCore.Hooks).useCurrentSquadParentChannelId
local useCurrentSquadSelector = dependenciesModule.Hooks.useCurrentSquadSelector
local useDispatch = dependenciesModule.Hooks.useDispatch
local useLocalization = dependenciesModule.Hooks.useLocalization
local useStore = dependenciesModule.Hooks.useStore
local squadInviteFriendsModule = require(script.Parent.SquadInviteFriends)
local fFlagPartyDevAPIToRespectThirdPartySettingsEnabled = sharedFlagsModule.FFlagPartyDevAPIToRespectThirdPartySettingsEnabled
local eventNamesModule = require(parent.SquadsCore.EventNames)

return function(p1)
	-- upvalues: react (ref), squadExternalContractContext (ref), useDispatch (ref), useStore (ref), useCurrentSquadSelector (ref), useCurrentSquadParentChannelId (ref), fFlagPartyDevAPIToRespectThirdPartySettingsEnabled (ref), useLocalUserId (ref), useLocalization (ref), eventNamesModule (ref), squadButtonSourceEnumModule (ref), squadButtonClickIntentionEnumModule (ref), createConversation (ref), cryo (ref), leaveSquad (ref), squadPromptType (ref), squadInviteFriendsModule (ref)
	local var1 = react.useContext(squadExternalContractContext)
	local var2 = useDispatch()
	local var3 = useStore()
	local var4 = useCurrentSquadSelector()
	local var5 = useCurrentSquadParentChannelId()
	local var6 = var1.useGetConversationFromId(var5)
	local var7 = if fFlagPartyDevAPIToRespectThirdPartySettingsEnabled then var1.useIsChatEnabled() else true
	local var8 = useLocalUserId()
	local var9 = useLocalization({ startPartyText = "Feature.Squads.Action.Start" })
	local var10 = react.useRef(false)
	local var11 = react.useCallback(function(p2)
		-- upvalues: var10 (ref), p1 (ref)
		var10.current = true
		p1.navigateIntoSquadLobby(p2)
	end, { p1.navigateIntoSquadLobby })
	local var12 = react.useCallback(function(p2)
		-- upvalues: var1 (ref), eventNamesModule (copy), p1 (ref), squadButtonSourceEnumModule (copy), squadButtonClickIntentionEnumModule (copy), var2 (ref), createConversation (copy), var11 (ref)
		local var13 = if #p2 == 1 then "one_to_one" else "group"
		var1.fireSquadAnalytics(eventNamesModule.EnterSquadButtonPressed, {
			partyAttemptId = p1.partyAttemptId,
			squadButtonSource = squadButtonSourceEnumModule.PartyQuickStartButton,
			squadLocation = var1.squadLocation,
			userIntention = squadButtonClickIntentionEnumModule.Create
		})
		var2(createConversation({
			source = "conversationCreatedFromPartyQuickStart",
			conversationType = var13,
			userIds = p2,
			onSuccessCallback = function(p3)
				-- upvalues: var11 (copy)
				var11(p3)
			end,
			squadContext = var1
		}))
	end, {
		var2, p1.partyAttemptId, p1.navigateIntoSquadLobby, var1.createConversation,
		var1.setSquadPrompt, var1.squadLocation, var1.fireSquadAnalytics, var3
	})
	
	return react.createElement(squadInviteFriendsModule, {
		onMultiInvite = react.useCallback(function(p2)
			-- upvalues: cryo (copy), var4 (ref), var6 (ref), var11 (ref), var5 (ref), var2 (ref), leaveSquad (copy), squadPromptType (copy), var1 (ref), var12 (ref), fFlagPartyDevAPIToRespectThirdPartySettingsEnabled (copy), var7 (ref)
			local var13 = cryo.Dictionary.keys(p2)
			
			if var4 and var6.type == "one_to_one" and #var13 == 1 then
				local var14 = var13[1]
				
				for i, v in ipairs(var6.participants) do
					if v == var14 then
						var11(var5)
						
						return
					end
				end
			end
			if var4 then
				var2(leaveSquad(squadPromptType.JoinAnotherSquad, var1.setSquadPrompt, function()
					-- upvalues: var12 (copy), var13 (ref)
					var12(var13)
				end, var1.squadLocation, if fFlagPartyDevAPIToRespectThirdPartySettingsEnabled then var7 else true))
				
				return
			end
			var12(var13)
		end, {
			var4, var2, var12, var6, var5, p1.navigateIntoSquadLobby,
			var1.setSquadPrompt, var1.squadLocation,
			if fFlagPartyDevAPIToRespectThirdPartySettingsEnabled then var7 else nil
		}),
		buttonText = var9.startPartyText,
		participants = if var8 and var8 ~= "" then { var8 } else nil,
		partyStartedRef = var10,
		analyticsInfo = react.useMemo(function()
			-- upvalues: p1 (ref)
			return {
				selectionPageType = "QuickStartInvite",
				partyAttemptId = p1.partyAttemptId
			}
		end, { p1.partyAttemptId }),
		onSelectedFriendsChanged = p1.onSelectedFriendsChanged,
		shouldHideFooterButton = p1.shouldHideFooterButton
	})
end