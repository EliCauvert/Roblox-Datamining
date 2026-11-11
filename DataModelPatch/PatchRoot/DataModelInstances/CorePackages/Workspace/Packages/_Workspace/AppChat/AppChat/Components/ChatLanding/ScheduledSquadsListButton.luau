local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local DomLocatorsModule = require(AppChat.Utils.DomLocators)
local FFlagDebugAppChatEnableDomLocatorsModule = require(AppChat.Flags.FFlagDebugAppChatEnableDomLocators)
local ScheduledSquadActionEnum = require(Parent.Squads.Enums).ScheduledSquadActionEnum
local EventNamesModule = require(Parent.SquadsCore.EventNames)
local SquadExternalContractContext = require(Parent.SquadsCore.SquadExternalContractProvider).SquadExternalContractContext
local UseCurrentSquadIdFunction = require(Parent.SquadsCore.Hooks).useCurrentSquadId
local IconButton = FoundationModule.IconButton
local ScheduledSquadsListSheet = require(Parent.Squads.Components).ScheduledSquadsListSheet

return function(p1)
	-- upvalues: UseCurrentSquadIdFunction (copy), ReactModule (copy), SquadExternalContractContext (copy), EventNamesModule (copy), ScheduledSquadActionEnum (copy), IconButton (copy), FoundationModule (copy), FFlagDebugAppChatEnableDomLocatorsModule (copy), DomLocatorsModule (copy), ScheduledSquadsListSheet (copy)
	local UseCurrentSquadIdResult = UseCurrentSquadIdFunction()
	local UseContextResult = ReactModule.useContext(SquadExternalContractContext)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	
	return ReactModule.createElement(ReactModule.Fragment, nil, {
		ScheduledSquadsListButton = ReactModule.createElement(IconButton, {
			icon = FoundationModule.Enums.IconName.Calendar,
			LayoutOrder = p1.layoutOrder,
			onActivated = ReactModule.useCallback(function()
				-- upvalues: UseContextResult (copy), EventNamesModule (upval), ScheduledSquadActionEnum (upval), p1 (copy), UseCurrentSquadIdResult (copy), UseStateResult2 (copy)
				UseContextResult.fireSquadAnalytics(EventNamesModule.ScheduledSquadAction, {
					actionType = ScheduledSquadActionEnum.ViewSubscribedScheduledSquadsList,
					source = p1.source,
					squadId = UseCurrentSquadIdResult,
					squadLocation = UseContextResult.squadLocation
				})
				UseStateResult2(true)
			end, {
				UseCurrentSquadIdResult,
				UseStateResult2,
				UseContextResult.fireSquadAnalytics,
				UseContextResult.squadLocation
			}),
			testId = if FFlagDebugAppChatEnableDomLocatorsModule then DomLocatorsModule.chatLandingTopBarIconButton("scheduledSquads") else nil
		}),
		ScheduledSquadsListSheet = ReactModule.createElement(ScheduledSquadsListSheet, {
			isOpen = UseStateResult,
			onClose = ReactModule.useCallback(function()
				-- upvalues: UseStateResult2 (copy)
				UseStateResult2(false)
			end, { UseStateResult2 })
		})
	})
end