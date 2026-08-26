local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local squadExternalContractProviderModule = require(parent.SquadsCore.SquadExternalContractProvider)
local domLocatorsModule = require(appChat.Utils.DomLocators)
local fFlagDebugAppChatEnableDomLocatorsModule = require(appChat.Flags.FFlagDebugAppChatEnableDomLocators)
local scheduledSquadActionEnum = require(parent.Squads.Enums).ScheduledSquadActionEnum
local eventNamesModule = require(parent.SquadsCore.EventNames)
local squadExternalContractContext = squadExternalContractProviderModule.SquadExternalContractContext
local useCurrentSquadId = require(parent.SquadsCore.Hooks).useCurrentSquadId
local iconButton = foundationModule.IconButton
local scheduledSquadsListSheet = require(parent.Squads.Components).ScheduledSquadsListSheet

return function(p1)
	-- upvalues: useCurrentSquadId (ref), reactModule (ref), squadExternalContractContext (ref), eventNamesModule (ref), scheduledSquadActionEnum (ref), iconButton (ref), foundationModule (ref), fFlagDebugAppChatEnableDomLocatorsModule (ref), domLocatorsModule (ref), scheduledSquadsListSheet (ref)
	local var1 = useCurrentSquadId()
	local var2 = reactModule.useContext(squadExternalContractContext)
	local var3, var4 = reactModule.useState(false)
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		ScheduledSquadsListButton = reactModule.createElement(iconButton, {
			icon = foundationModule.Enums.IconName.Calendar,
			LayoutOrder = p1.layoutOrder,
			onActivated = reactModule.useCallback(function()
				-- upvalues: var2 (ref), eventNamesModule (copy), scheduledSquadActionEnum (copy), p1 (ref), var1 (ref), var4 (ref)
				var2.fireSquadAnalytics(eventNamesModule.ScheduledSquadAction, {
					actionType = scheduledSquadActionEnum.ViewSubscribedScheduledSquadsList,
					source = p1.source,
					squadId = var1,
					squadLocation = var2.squadLocation
				})
				var4(true)
			end, { var1, var4, var2.fireSquadAnalytics, var2.squadLocation }),
			testId = if fFlagDebugAppChatEnableDomLocatorsModule then domLocatorsModule.chatLandingTopBarIconButton("scheduledSquads") else nil
		}),
		ScheduledSquadsListSheet = reactModule.createElement(scheduledSquadsListSheet, {
			isOpen = var3,
			onClose = reactModule.useCallback(function()
				-- upvalues: var4 (ref)
				var4(false)
			end, { var4 })
		})
	})
end