local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local ReactModule = require(Parent.React)
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local SquadExternalContractContext = require(Parent.SquadsCore.SquadExternalContractProvider).SquadExternalContractContext
local EventNamesModule = require(Parent.SquadsCore.EventNames)
local UseCurrentSquadIdFunction = require(Parent.SquadsCore.Hooks).useCurrentSquadId
local SquadButtonClickIntentionEnum = require(Parent.Squads.Enums).SquadButtonClickIntentionEnum
local SquadButtonSourceEnum = require(Parent.Squads.Enums).SquadButtonSourceEnum
local EnumScreensModule = require(AppChat.EnumScreens)

return function(p1, p2) --[[ Line: 21 | Named "useStartPartySuggestion" ]]
	-- upvalues: UseNavigationFunction (copy), UseCurrentSquadIdFunction (copy), ReactModule (copy), SquadExternalContractContext (copy), EventNamesModule (copy), SquadButtonSourceEnum (copy), SquadButtonClickIntentionEnum (copy), EnumScreensModule (copy)
	local UseNavigationResult = UseNavigationFunction()
	local UseCurrentSquadIdResult = UseCurrentSquadIdFunction()
	local UseContextResult = ReactModule.useContext(SquadExternalContractContext)
	local FireSquadAnalyticsFunction = UseContextResult.fireSquadAnalytics
	local UseParentChannelHasGroupUpResult = UseContextResult.useParentChannelHasGroupUp(p1)
	local SquadLocation = UseContextResult.squadLocation
	local NoUseCurrentSquadIdResult: boolean = p2 and UseCurrentSquadIdResult == nil
	
	return {
		canStartParty = NoUseCurrentSquadIdResult,
		startParty = ReactModule.useCallback(function(ConversationId) --[[ Line: 31 ]]
			-- upvalues: NoUseCurrentSquadIdResult (copy), FireSquadAnalyticsFunction (copy), EventNamesModule (upval), SquadButtonSourceEnum (upval), SquadLocation (copy), UseParentChannelHasGroupUpResult (copy), SquadButtonClickIntentionEnum (upval), UseNavigationResult (copy), EnumScreensModule (upval)
			if NoUseCurrentSquadIdResult then
				FireSquadAnalyticsFunction(EventNamesModule.EnterSquadButtonPressed, {
					conversationId = ConversationId,
					squadButtonSource = SquadButtonSourceEnum.ChatConversationSmartSuggestion,
					squadLocation = SquadLocation,
					userIntention = if UseParentChannelHasGroupUpResult then SquadButtonClickIntentionEnum.Join else SquadButtonClickIntentionEnum.Create
				})
				UseNavigationResult.navigate(EnumScreensModule.SquadLobby, { conversationId = ConversationId })
				
				return
			end
		end, {
			NoUseCurrentSquadIdResult,
			FireSquadAnalyticsFunction,
			UseParentChannelHasGroupUpResult,
			UseNavigationResult,
			SquadLocation
		})
	}
end