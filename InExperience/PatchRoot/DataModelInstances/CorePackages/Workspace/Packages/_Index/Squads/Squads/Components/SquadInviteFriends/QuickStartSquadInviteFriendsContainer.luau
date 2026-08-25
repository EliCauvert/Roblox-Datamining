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

return function(p0)
	-- upvalues: react (ref), squadExternalContractContext (ref), useDispatch (ref), useStore (ref), useCurrentSquadSelector (ref), useCurrentSquadParentChannelId (ref), fFlagPartyDevAPIToRespectThirdPartySettingsEnabled (ref), useLocalUserId (ref), useLocalization (ref), eventNamesModule (ref), squadButtonSourceEnumModule (ref), squadButtonClickIntentionEnumModule (ref), createConversation (ref), cryo (ref), leaveSquad (ref), squadPromptType (ref), squadInviteFriendsModule (ref)
	local var7 = react.useContext(squadExternalContractContext)
	local var8 = useDispatch()
	local var9 = useStore()
	local var10 = useCurrentSquadSelector()
	local var11 = useCurrentSquadParentChannelId()
	local var12 = var7.useGetConversationFromId(var11)
	local var13 = if fFlagPartyDevAPIToRespectThirdPartySettingsEnabled then var7.useIsChatEnabled() else true
	local var14 = useLocalUserId()
	local var15 = useLocalization({ startPartyText = "Feature.Squads.Action.Start" })
	local var16 = react.useRef(false)
	local var17 = react.useCallback(function(p1)
		-- upvalues: var16 (ref), p0 (ref)
		var16.current = true
		p0.navigateIntoSquadLobby(p1)
	end, { p0.navigateIntoSquadLobby })
	local var18 = react.useCallback(function(p2)
		-- upvalues: var7 (ref), eventNamesModule (copy), p0 (ref), squadButtonSourceEnumModule (copy), squadButtonClickIntentionEnumModule (copy), var8 (ref), createConversation (copy), var17 (ref)
		local var19 = if #p2 == 1 then "one_to_one" else "group"
		var7.fireSquadAnalytics(eventNamesModule.EnterSquadButtonPressed, {
			partyAttemptId = p0.partyAttemptId,
			squadButtonSource = squadButtonSourceEnumModule.PartyQuickStartButton,
			squadLocation = var7.squadLocation,
			userIntention = squadButtonClickIntentionEnumModule.Create
		})
		var8(createConversation({
			source = "conversationCreatedFromPartyQuickStart",
			conversationType = var19,
			userIds = p2,
			onSuccessCallback = function(p3)
				-- upvalues: var17 (copy)
				var17(p3)
			end,
			squadContext = var7
		}))
	end, {
		var8, p0.partyAttemptId, p0.navigateIntoSquadLobby, var7.createConversation,
		var7.setSquadPrompt, var7.squadLocation, var7.fireSquadAnalytics, var9
	})
	
	return react.createElement(squadInviteFriendsModule, {
		onMultiInvite = react.useCallback(function(p4)
			-- upvalues: cryo (copy), var10 (ref), var12 (ref), var17 (ref), var11 (ref), var8 (ref), leaveSquad (copy), squadPromptType (copy), var7 (ref), var18 (ref), fFlagPartyDevAPIToRespectThirdPartySettingsEnabled (copy), var13 (ref)
			local var20 = cryo.Dictionary.keys(p4)
			
			if var10 and var12.type == "one_to_one" and #var20 == 1 then
				local var21 = var20[1]
				
				for i, v in ipairs(var12.participants) do
					if v == var21 then
						var17(var11)
						
						return
					end
				end
			end
			if var10 then
				var8(leaveSquad(squadPromptType.JoinAnotherSquad, var7.setSquadPrompt, function()
					-- upvalues: var18 (copy), var20 (ref)
					var18(var20)
				end, var7.squadLocation, if fFlagPartyDevAPIToRespectThirdPartySettingsEnabled then var13 else true))
				
				return
			end
			var18(var20)
		end, {
			var10, var8, var18, var12, var11, p0.navigateIntoSquadLobby,
			var7.setSquadPrompt, var7.squadLocation,
			if fFlagPartyDevAPIToRespectThirdPartySettingsEnabled then var13 else nil
		}),
		buttonText = var15.startPartyText,
		participants = if var14 and var14 ~= "" then { var14 } else nil,
		partyStartedRef = var16,
		analyticsInfo = react.useMemo(function()
			-- upvalues: p0 (ref)
			return {
				selectionPageType = "QuickStartInvite",
				partyAttemptId = p0.partyAttemptId
			}
		end, { p0.partyAttemptId }),
		onSelectedFriendsChanged = p0.onSelectedFriendsChanged,
		shouldHideFooterButton = p0.shouldHideFooterButton
	})
end