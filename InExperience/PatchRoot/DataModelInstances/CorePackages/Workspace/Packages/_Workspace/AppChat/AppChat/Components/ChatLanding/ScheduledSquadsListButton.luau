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

return function(p0) --[[ line: 32 ]]
	-- upvalues: useCurrentSquadId (ref), reactModule (ref), squadExternalContractContext (ref), eventNamesModule (ref), scheduledSquadActionEnum (ref), iconButton (ref), foundationModule (ref), fFlagDebugAppChatEnableDomLocatorsModule (ref), domLocatorsModule (ref), scheduledSquadsListSheet (ref)
	local var7 = useCurrentSquadId()
	local var8 = reactModule.useContext(squadExternalContractContext)
	local var9, var10 = reactModule.useState(false)
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		ScheduledSquadsListButton = reactModule.createElement(iconButton, {
			icon = foundationModule.Enums.IconName.Calendar,
			LayoutOrder = p0.layoutOrder,
			onActivated = reactModule.useCallback(function() --[[ line: 38 ]]
				-- upvalues: var8 (ref), eventNamesModule (copy), scheduledSquadActionEnum (copy), p0 (ref), var7 (ref), var10 (ref)
				var8.fireSquadAnalytics(eventNamesModule.ScheduledSquadAction, {
					actionType = scheduledSquadActionEnum.ViewSubscribedScheduledSquadsList,
					source = p0.source,
					squadId = var7,
					squadLocation = var8.squadLocation
				})
				var10(true)
			end, { var7, var10, var8.fireSquadAnalytics, var8.squadLocation }),
			testId = if fFlagDebugAppChatEnableDomLocatorsModule then domLocatorsModule.chatLandingTopBarIconButton("scheduledSquads") else nil
		}),
		ScheduledSquadsListSheet = reactModule.createElement(scheduledSquadsListSheet, {
			isOpen = var9,
			onClose = reactModule.useCallback(function() --[[ line: 54 ]]
				-- upvalues: var10 (ref)
				var10(false)
			end, { var10 })
		})
	})
end