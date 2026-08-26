local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local reactModule = require(parent.React)
local useNavigation = require(parent.Navigation).useNavigation
local squadExternalContractContext = require(parent.SquadsCore.SquadExternalContractProvider).SquadExternalContractContext
local eventNamesModule = require(parent.SquadsCore.EventNames)
local useCurrentSquadId = require(parent.SquadsCore.Hooks).useCurrentSquadId
local squadButtonClickIntentionEnum = require(parent.Squads.Enums).SquadButtonClickIntentionEnum
local squadButtonSourceEnum = require(parent.Squads.Enums).SquadButtonSourceEnum
local enumScreensModule = require(appChat.EnumScreens)

return function(p1, p2)
	-- upvalues: useNavigation (ref), useCurrentSquadId (ref), reactModule (ref), squadExternalContractContext (ref), eventNamesModule (ref), squadButtonSourceEnum (ref), squadButtonClickIntentionEnum (ref), enumScreensModule (ref)
	local var1 = useNavigation()
	local var2 = useCurrentSquadId()
	local var3 = reactModule.useContext(squadExternalContractContext)
	local fireSquadAnalytics = var3.fireSquadAnalytics
	local var4 = var3.useParentChannelHasGroupUp(p1)
	local squadLocation = var3.squadLocation
	local var5 = p2 and var2 == nil
	
	return {
		canStartParty = var5,
		startParty = reactModule.useCallback(function(p3)
			-- upvalues: var5 (ref), fireSquadAnalytics (ref), eventNamesModule (copy), squadButtonSourceEnum (copy), squadLocation (ref), var4 (ref), squadButtonClickIntentionEnum (copy), var1 (ref), enumScreensModule (copy)
			if var5 then
				fireSquadAnalytics(eventNamesModule.EnterSquadButtonPressed, {
					conversationId = p3,
					squadButtonSource = squadButtonSourceEnum.ChatConversationSmartSuggestion,
					squadLocation = squadLocation,
					userIntention = if var4 then squadButtonClickIntentionEnum.Join else squadButtonClickIntentionEnum.Create
				})
				var1.navigate(enumScreensModule.SquadLobby, { conversationId = p3 })
				
				return
			end
		end, {
			var5,
			fireSquadAnalytics,
			var4,
			var1,
			squadLocation
		})
	}
end