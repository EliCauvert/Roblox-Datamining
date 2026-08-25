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

return function(p0, p1)
	-- upvalues: useNavigation (ref), useCurrentSquadId (ref), reactModule (ref), squadExternalContractContext (ref), eventNamesModule (ref), squadButtonSourceEnum (ref), squadButtonClickIntentionEnum (ref), enumScreensModule (ref)
	local var4 = useNavigation()
	local var5 = useCurrentSquadId()
	local var6 = reactModule.useContext(squadExternalContractContext)
	local fireSquadAnalytics = var6.fireSquadAnalytics
	local var7 = var6.useParentChannelHasGroupUp(p0)
	local squadLocation = var6.squadLocation
	local var8 = p1 and var5 == nil
	
	return {
		canStartParty = var8,
		startParty = reactModule.useCallback(function(p2)
			-- upvalues: var8 (ref), fireSquadAnalytics (ref), eventNamesModule (copy), squadButtonSourceEnum (copy), squadLocation (ref), var7 (ref), squadButtonClickIntentionEnum (copy), var4 (ref), enumScreensModule (copy)
			if var8 then
				fireSquadAnalytics(eventNamesModule.EnterSquadButtonPressed, {
					conversationId = p2,
					squadButtonSource = squadButtonSourceEnum.ChatConversationSmartSuggestion,
					squadLocation = squadLocation,
					userIntention = if var7 then squadButtonClickIntentionEnum.Join else squadButtonClickIntentionEnum.Create
				})
				var4.navigate(enumScreensModule.SquadLobby, { conversationId = p2 })
				
				return
			end
		end, {
			var8,
			fireSquadAnalytics,
			var7,
			var4,
			squadLocation
		})
	}
end