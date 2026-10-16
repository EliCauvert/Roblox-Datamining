local Squads = script:FindFirstAncestor("Squads")
local Parent = Squads.Parent
local DependenciesModule = require(Squads.dependencies)
local SquadButtonSourceEnumModule = require(Squads.Enums.SquadButtonSourceEnum)
local SquadButtonClickIntentionEnumModule = require(Squads.Enums.SquadButtonClickIntentionEnum)
local UseLocalUserIdFunction = require(Parent.RobloxAppHooks).useLocalUserId
local Cryo = DependenciesModule.Cryo
local CreateConversationFunction = require(Parent.SquadsCore.Thunks).createConversation
local LeaveSquadFunction = require(Parent.SquadsCore.Thunks).leaveSquad
local React = DependenciesModule.React
local SquadExternalContractContext = require(Parent.SquadsCore.SquadExternalContractProvider).SquadExternalContractContext
local SquadPromptType = require(Parent.SquadsCore.Enums).SquadPromptType
local UseCurrentSquadParentChannelIdFunction = require(Parent.SquadsCore.Hooks).useCurrentSquadParentChannelId
local UseCurrentSquadSelectorFunction = DependenciesModule.Hooks.useCurrentSquadSelector
local UseDispatchFunction = DependenciesModule.Hooks.useDispatch
local UseLocalizationFunction = DependenciesModule.Hooks.useLocalization
local UseStoreFunction = DependenciesModule.Hooks.useStore
local SquadInviteFriendsModule = require(script.Parent.SquadInviteFriends)
local FFlagPartyDevAPIToRespectThirdPartySettingsEnabled = require(Parent.SharedFlags).FFlagPartyDevAPIToRespectThirdPartySettingsEnabled
local EventNamesModule = require(Parent.SquadsCore.EventNames)

return function(p1) --[[ Line: 38 | Named "QuickStartSquadInviteFriendsContainer" ]]
	-- upvalues: React (copy), SquadExternalContractContext (copy), UseDispatchFunction (copy), UseStoreFunction (copy), UseCurrentSquadSelectorFunction (copy), UseCurrentSquadParentChannelIdFunction (copy), FFlagPartyDevAPIToRespectThirdPartySettingsEnabled (copy), UseLocalUserIdFunction (copy), UseLocalizationFunction (copy), EventNamesModule (copy), SquadButtonSourceEnumModule (copy), SquadButtonClickIntentionEnumModule (copy), CreateConversationFunction (copy), Cryo (copy), LeaveSquadFunction (copy), SquadPromptType (copy), SquadInviteFriendsModule (copy)
	local UseContextResult = React.useContext(SquadExternalContractContext)
	local UseDispatchResult = UseDispatchFunction()
	local UseStoreResult = UseStoreFunction()
	local UseCurrentSquadSelectorResult = UseCurrentSquadSelectorFunction()
	local UseCurrentSquadParentChannelIdResult = UseCurrentSquadParentChannelIdFunction()
	local UseGetConversationFromIdResult = UseContextResult.useGetConversationFromId(UseCurrentSquadParentChannelIdResult)
	local NoFFlagPartyDevAPIToRespectThirdPartySettingsEnabled = not FFlagPartyDevAPIToRespectThirdPartySettingsEnabled or UseContextResult.useIsChatEnabled()
	local UseLocalUserIdResult = UseLocalUserIdFunction()
	local UseRefResult = React.useRef(false)
	local UseResult = React.useCallback(function(p2) --[[ Line: 59 ]]
		-- upvalues: UseRefResult (copy), p1 (copy)
		UseRefResult.current = true
		p1.navigateIntoSquadLobby(p2)
	end, { p1.navigateIntoSquadLobby })
	local UseResult1 = React.useCallback(function(UserIds) --[[ Line: 64 ]]
		-- upvalues: UseContextResult (copy), EventNamesModule (upval), p1 (copy), SquadButtonSourceEnumModule (upval), SquadButtonClickIntentionEnumModule (upval), UseDispatchResult (copy), CreateConversationFunction (upval), UseResult (copy)
		local OneToOne: string = if #UserIds == 1 then "one_to_one" else "group"
		UseContextResult.fireSquadAnalytics(EventNamesModule.EnterSquadButtonPressed, {
			partyAttemptId = p1.partyAttemptId,
			squadButtonSource = SquadButtonSourceEnumModule.PartyQuickStartButton,
			squadLocation = UseContextResult.squadLocation,
			userIntention = SquadButtonClickIntentionEnumModule.Create
		})
		UseDispatchResult(CreateConversationFunction({
			source = "conversationCreatedFromPartyQuickStart",
			conversationType = OneToOne,
			userIds = UserIds,
			onSuccessCallback = function(p2) --[[ Line: 78 ]]
				-- upvalues: UseResult (upval)
				UseResult(p2)
			end,
			squadContext = UseContextResult
		}))
	end, {
		UseDispatchResult, p1.partyAttemptId, p1.navigateIntoSquadLobby,
		UseContextResult.createConversation, UseContextResult.setSquadPrompt,
		UseContextResult.squadLocation, UseContextResult.fireSquadAnalytics,
		UseStoreResult
	})
	
	return React.createElement(SquadInviteFriendsModule, {
		onMultiInvite = React.useCallback(function(p2) --[[ Line: 94 ]]
			-- upvalues: Cryo (upval), UseCurrentSquadSelectorResult (copy), UseGetConversationFromIdResult (copy), UseResult (copy), UseCurrentSquadParentChannelIdResult (copy), UseDispatchResult (copy), LeaveSquadFunction (upval), SquadPromptType (upval), UseContextResult (copy), UseResult1 (copy), FFlagPartyDevAPIToRespectThirdPartySettingsEnabled (upval), NoFFlagPartyDevAPIToRespectThirdPartySettingsEnabled (copy)
			local KeysResult = Cryo.Dictionary.keys(p2)
			
			if UseCurrentSquadSelectorResult and UseGetConversationFromIdResult.type == "one_to_one" and #KeysResult == 1 then
				local KeysResultEntry = KeysResult[1]
				
				for _, participant in ipairs(UseGetConversationFromIdResult.participants) do
					if participant == KeysResultEntry then
						UseResult(UseCurrentSquadParentChannelIdResult)
						
						return
					end
				end
			end
			if UseCurrentSquadSelectorResult then
				UseDispatchResult(LeaveSquadFunction(SquadPromptType.JoinAnotherSquad, UseContextResult.setSquadPrompt, function() --[[ Line: 115 ]]
					-- upvalues: UseResult1 (upval), KeysResult (copy)
					UseResult1(KeysResult)
				end, UseContextResult.squadLocation, not FFlagPartyDevAPIToRespectThirdPartySettingsEnabled or NoFFlagPartyDevAPIToRespectThirdPartySettingsEnabled))
				
				return
			else
				UseResult1(KeysResult)
			end
		end, {
			UseCurrentSquadSelectorResult, UseDispatchResult, UseResult1,
			UseGetConversationFromIdResult, UseCurrentSquadParentChannelIdResult,
			p1.navigateIntoSquadLobby, UseContextResult.setSquadPrompt,
			UseContextResult.squadLocation,
			if FFlagPartyDevAPIToRespectThirdPartySettingsEnabled then NoFFlagPartyDevAPIToRespectThirdPartySettingsEnabled else nil
		}),
		buttonText = UseLocalizationFunction({ startPartyText = "Feature.Squads.Action.Start" }).startPartyText,
		participants = if UseLocalUserIdResult and UseLocalUserIdResult ~= "" then { UseLocalUserIdResult } else nil,
		partyStartedRef = UseRefResult,
		analyticsInfo = React.useMemo(function() --[[ Line: 142 ]]
			-- upvalues: p1 (copy)
			return {
				selectionPageType = "QuickStartInvite",
				partyAttemptId = p1.partyAttemptId
			}
		end, { p1.partyAttemptId }),
		onSelectedFriendsChanged = p1.onSelectedFriendsChanged,
		shouldHideFooterButton = p1.shouldHideFooterButton
	})
end