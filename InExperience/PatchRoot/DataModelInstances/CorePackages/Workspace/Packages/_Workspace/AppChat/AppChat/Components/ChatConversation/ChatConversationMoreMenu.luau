local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local foundationModule = require(parent.Foundation)
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local inputHandlersModule = require(parent.InputHandlers)
local reactModule = require(parent.React)
local reactFocusNavigationModule = require(parent.ReactFocusNavigation)
local sharedFlagsModule = require(parent.SharedFlags)
local squadExternalContractProviderModule = require(parent.SquadsCore.SquadExternalContractProvider)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local useLocalization = require(parent.Localization).Hooks.useLocalization
local chatConversationTelemetryLayerModule = require(appChat.Telemetry.Layers.ChatConversationTelemetryLayer)
local conversationActionTypeModule = require(appChat.Analytics.Enums.ConversationActionType)
local useTelemetryModule = require(appChat.Telemetry.useTelemetry)
local chatConversationTelemetryEventsModule = require(script.Parent.ChatConversationTelemetryEvents)
local leaveSquad = require(parent.SquadsCore.Thunks).leaveSquad
local squadPromptType = require(parent.SquadsCore.Enums).SquadPromptType
local useCurrentSquadId = require(parent.SquadsCore.Hooks).useCurrentSquadId
local useCurrentSquadParentChannelId = require(parent.SquadsCore.Hooks).useCurrentSquadParentChannelId
local squadExternalContractContext = squadExternalContractProviderModule.SquadExternalContractContext
local eventNamesModule = require(parent.SquadsCore.EventNames)
local scheduledSquadSheetModule = require(parent.Squads.ScheduledSquadSheet)
local scheduledSquadActionEnum = require(parent.Squads.Enums).ScheduledSquadActionEnum
local scheduledSquadActionSourceEnum = require(parent.Squads.Enums).ScheduledSquadActionSourceEnum
local squadButtonClickIntentionEnum = require(parent.Squads.Enums).SquadButtonClickIntentionEnum
local squadButtonSourceEnum = require(parent.Squads.Enums).SquadButtonSourceEnum
local iconName = foundationModule.Enums.IconName
local menu = foundationModule.Menu
local popoverAlign = foundationModule.Enums.PopoverAlign
local popoverSide = foundationModule.Enums.PopoverSide
local useTokens = foundationModule.Hooks.useTokens
local focusNavigableSurfaceIdentifierEnum = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local focusNavigationEventNameEnum = focusNavigationUtilsModule.FocusNavigationEventNameEnum
local useAppFocusRoot = focusNavigationUtilsModule.useAppFocusRoot
local useFocusNavigableSurfaceRegistryConnection = focusNavigationUtilsModule.useFocusNavigableSurfaceRegistryConnection
local fFlagPartyDevAPIToRespectThirdPartySettingsEnabled = sharedFlagsModule.FFlagPartyDevAPIToRespectThirdPartySettingsEnabled
local enableMoreMenuGamepadFix = game:DefineFastFlag("EnableMoreMenuGamepadFix", false)
local fFlagEnableScheduledSquads = sharedFlagsModule.FFlagEnableScheduledSquads
local t = {
	[Enum.KeyCode.ButtonB] = focusNavigationEventNameEnum.NavigateBack,
	[Enum.KeyCode.Escape] = focusNavigationEventNameEnum.NavigateBack
}

return reactModule.memo(function(p0) --[[ line: 67 ]]
	-- upvalues: useTelemetryModule (ref), chatConversationTelemetryLayerModule (ref), useDispatch (ref), useTokens (ref), useLocalization (ref), useCurrentSquadId (ref), useCurrentSquadParentChannelId (ref), reactModule (ref), squadExternalContractContext (ref), fFlagPartyDevAPIToRespectThirdPartySettingsEnabled (ref), fFlagEnableScheduledSquads (ref), focusNavigationEventNameEnum (ref), inputHandlersModule (ref), enableMoreMenuGamepadFix (ref), useAppFocusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref), useFocusNavigableSurfaceRegistryConnection (ref), reactFocusNavigationModule (ref), t (ref), eventNamesModule (ref), scheduledSquadActionEnum (ref), scheduledSquadActionSourceEnum (ref), leaveSquad (ref), squadPromptType (ref), squadButtonSourceEnum (ref), squadButtonClickIntentionEnum (ref), chatConversationTelemetryEventsModule (ref), conversationActionTypeModule (ref), iconName (ref), foundationModule (ref), scheduledSquadSheetModule (ref), menu (ref), popoverSide (ref), popoverAlign (ref)
	local var28
	local var16 = useTelemetryModule(chatConversationTelemetryLayerModule.Context)
	local var17 = useDispatch()
	local var18 = useTokens()
	local var19 = useLocalization({
		joinParty = "Feature.Squads.Label.JoinParty",
		moreText = "CommonUI.Features.Label.More",
		scheduleAParty = "Feature.Squads.Action.ScheduleAParty",
		startParty = "Feature.Squads.Label.StartParty",
		viewParty = "Feature.Squads.Label.ViewParty"
	})
	local var20 = useCurrentSquadId()
	local var21 = useCurrentSquadParentChannelId()
	local var22 = reactModule.useContext(squadExternalContractContext)
	local var23 = if fFlagPartyDevAPIToRespectThirdPartySettingsEnabled then var22.useIsChatEnabled() else true
	local var24, var25 = reactModule.useState(if fFlagEnableScheduledSquads then false else nil)
	local var26, var27 = reactModule.useState(false)
	local useState = reactModule.useState
	
	if fFlagEnableScheduledSquads then
		var28 = p0.tooltipText
		
		if var28 then
			var28 = p0.tooltipText ~= ""
			var28 = nil
		end
	else
		var28 = nil
	end
	useState, var28 = useState(var28)
	local var29 = reactModule.useRef(nil)
	local var30 = reactModule.useMemo(function() --[[ line: 93 ]]
		-- upvalues: focusNavigationEventNameEnum (copy), inputHandlersModule (copy), var27 (ref)
		return {
			[focusNavigationEventNameEnum.NavigateBack] = {
				handler = inputHandlersModule.onRelease(function(p1) --[[ line: 96 ]]
					-- upvalues: var27 (copy)
					p1.cancelled = true
					var27(false)
				end)
			}
		}
	end, { var27 })
	local var31 = nil
	local var32 = nil
	
	if enableMoreMenuGamepadFix then
		local var33 = useAppFocusRoot({
			surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.ContextualMenu,
			isFocusable = var26,
			customEventHandlers = var30
		})
		var31 = reactModule.useCallback(function(p2) --[[ line: 114 ]]
			-- upvalues: var29 (ref), var33 (ref)
			var29.current = p2
			
			if type(var33) == "function" then
				var33(p2)
			end
		end, { var33 })
	else
		useFocusNavigableSurfaceRegistryConnection(var29.current, focusNavigableSurfaceIdentifierEnum.ContextualMenu, var26)
		var32 = reactFocusNavigationModule.useEventHandlerMap(var30, reactFocusNavigationModule.useEventMap(t, var29))
	end
	reactModule.useEffect(function() --[[ line: 131 ]]
		-- upvalues: var29 (ref)
		if var29 and var29.current then
			var29.current.SelectionBehaviorDown = Enum.SelectionBehavior.Stop
			var29.current.SelectionBehaviorLeft = Enum.SelectionBehavior.Stop
			var29.current.SelectionBehaviorRight = Enum.SelectionBehavior.Stop
			var29.current.SelectionBehaviorUp = Enum.SelectionBehavior.Stop
			var29.current.SelectionGroup = true
		end
	end, { var26 })
	local var34 = reactModule.useCallback(function() --[[ line: 142 ]]
		-- upvalues: var27 (ref)
		var27(false)
	end, {})
	local var35 = reactModule.useCallback(function() --[[ line: 147 ]]
		-- upvalues: fFlagEnableScheduledSquads (copy), var25 (ref), var22 (ref), eventNamesModule (copy), scheduledSquadActionEnum (copy), p0 (ref), scheduledSquadActionSourceEnum (copy), var20 (ref)
		if fFlagEnableScheduledSquads then
			var25(true)
			var22.fireSquadAnalytics(eventNamesModule.ScheduledSquadAction, {
				actionType = scheduledSquadActionEnum.ScheduleParty,
				conversationId = p0.conversationId,
				source = scheduledSquadActionSourceEnum.ChatConversationMoreMenu,
				squadId = var20,
				squadLocation = var22.squadLocation
			})
		end
	end, if fFlagEnableScheduledSquads then {
		var22.setSquadPrompt,
		p0.conversationId,
		var20,
		var22.squadLocation,
		var22.fireSquadAnalytics
	} else nil)
	local var36 = reactModule.useCallback(function() --[[ line: 172 ]]
		-- upvalues: var20 (ref), p0 (ref), var21 (ref), var17 (ref), leaveSquad (copy), squadPromptType (copy), var22 (ref), var23 (ref), eventNamesModule (copy), squadButtonSourceEnum (copy), squadButtonClickIntentionEnum (copy)
		if var20 and p0.conversationId ~= var21 then
			var17(leaveSquad(squadPromptType.JoinAnotherSquad, var22.setSquadPrompt, function() --[[ line: 175 ]]
				-- upvalues: p0 (copy)
				p0.navigateToSquadLobby(p0.conversationId)
			end, var22.squadLocation, var23))
		else
			p0.navigateToSquadLobby(p0.conversationId)
		end
		var22.fireSquadAnalytics(eventNamesModule.EnterSquadButtonPressed, {
			conversationId = p0.conversationId,
			squadButtonSource = squadButtonSourceEnum.ChatConversationMoreMenu,
			squadId = var20,
			squadLocation = var22.squadLocation,
			userIntention = if p0.conversation and p0.conversation.hasGroupUp and p0.conversationId == var21 then squadButtonClickIntentionEnum.View elseif p0.conversation and p0.conversation.hasGroupUp then squadButtonClickIntentionEnum.Join else squadButtonClickIntentionEnum.Create
		})
	end, {
		p0.navigateToSquadLobby, p0.conversationId,
		p0.conversation and p0.conversation.hasGroupUp, var20, var21, var22, var23
	})
	local var37 = reactModule.useCallback(function(p3) --[[ line: 207 ]]
		-- upvalues: var36 (ref), fFlagEnableScheduledSquads (copy), var35 (ref), var27 (ref)
		if p3 == "createJoinViewParty" then
			var36()
		elseif fFlagEnableScheduledSquads and p3 == "scheduleParty" then
			var35()
		end
		var27(false)
	end, { var36, if fFlagEnableScheduledSquads then var35 else nil })
	local var38 = reactModule.useCallback(function() --[[ line: 222 ]]
		-- upvalues: var16 (ref), chatConversationTelemetryEventsModule (copy), var26 (ref), conversationActionTypeModule (copy), var27 (ref)
		var16.emit(chatConversationTelemetryEventsModule.ConversationMoreMenuBtnClicked, {
			action = if var26 then conversationActionTypeModule.CloseMoreMenu else conversationActionTypeModule.OpenMoreMenu
		})
		var27(not var26)
	end, { var26, var16 })
	local var39 = reactModule.useCallback(function() --[[ line: 230 ]]
		-- upvalues: var28 (ref)
		var28(false)
	end, {})
	local var40 = reactModule.useMemo(function() --[[ line: 235 ]]
		-- upvalues: p0 (ref), var21 (ref), var19 (ref), fFlagEnableScheduledSquads (copy), iconName (copy)
		local t = {}
		table.insert(t, {
			icon = "icons/menu/groups",
			id = "createJoinViewParty",
			isDisabled = false,
			isChecked = false,
			text = if p0.conversation and p0.conversation.hasGroupUp and p0.conversationId == var21 then var19.viewParty elseif p0.conversation and p0.conversation.hasGroupUp then var19.joinParty else var19.startParty
		})
		
		if fFlagEnableScheduledSquads then
			table.insert(t, {
				id = "scheduleParty",
				isDisabled = false,
				isChecked = false,
				icon = iconName.Calendar,
				text = var19.scheduleAParty
			})
		end
		return t
	end, {
		p0.conversation and p0.conversation.hasGroupUp,
		p0.conversationId,
		var21
	})
	
	if fFlagEnableScheduledSquads then
		local var41 = reactModule.useRef(nil)
		
		return reactModule.createElement(foundationModule.View, { tag = "auto-xy align-y-center" }, {
			MoreMenuButton = reactModule.createElement(foundationModule.IconButton, {
				isCircular = true,
				testId = "ChatConversationMoreMenuButton",
				icon = {
					name = foundationModule.Enums.IconName.PlusLarge,
					variant = if var26 then foundationModule.Enums.IconVariant.Filled else foundationModule.Enums.IconVariant.Regular
				},
				variant = if var26 then foundationModule.Enums.ButtonVariant.Standard else foundationModule.Enums.ButtonVariant.Utility,
				LayoutOrder = p0.layoutOrder,
				onActivated = var38,
				size = foundationModule.Enums.InputSize.Medium,
				ref = var41
			}),
			ScheduledSquadSheet = if fFlagEnableScheduledSquads then reactModule.createElement(scheduledSquadSheetModule, {
				conversationId = p0.conversationId,
				isOpen = var24,
				onClose = function() --[[ line: 301 ]]
					-- upvalues: var25 (ref)
					var25(false)
				end
			}) else nil,
			Menu = reactModule.createElement(menu, {
				anchorRef = var41,
				items = var40,
				isOpen = var26,
				onActivated = var37,
				onPressedOutside = var34,
				ref = if enableMoreMenuGamepadFix then var31 else nil,
				side = popoverSide.Top
			}),
			Tooltip = reactModule.createElement(foundationModule.Popover.Root, { isOpen = useState }, {
				Anchor = reactModule.createElement(foundationModule.Popover.Anchor, { anchorRef = var41 }),
				Content = reactModule.createElement(foundationModule.Popover.Content, {
					hasArrow = true,
					align = { offset = 0, position = popoverAlign.Start },
					backgroundStyle = var18.Inverse.Surface.Surface_0,
					onPressedOutside = var39
				}, {
					TooltipText = reactModule.createElement(foundationModule.Text, {
						tag = "auto-xy text-wrap padding-small content-inverse-emphasis text-body-small",
						Text = p0.tooltipText
					})
				})
			})
		})
	end
	return reactModule.createElement(menu, {
		items = var40,
		isOpen = var26,
		LayoutOrder = p0.layoutOrder,
		onActivated = var37,
		onPressedOutside = var34,
		ref = var32,
		side = popoverSide.Top
	}, {
		MoreMenuButton = reactModule.createElement(foundationModule.View, { tag = "auto-xy align-y-center" }, {
			reactModule.createElement(foundationModule.IconButton, {
				isCircular = true,
				testId = "ChatConversationMoreMenuButton",
				icon = {
					name = foundationModule.Enums.IconName.PlusLarge,
					variant = if var26 then foundationModule.Enums.IconVariant.Filled else foundationModule.Enums.IconVariant.Regular
				},
				variant = if var26 then foundationModule.Enums.ButtonVariant.Standard else foundationModule.Enums.ButtonVariant.Utility,
				LayoutOrder = p0.layoutOrder,
				onActivated = var38,
				size = foundationModule.Enums.InputSize.Medium
			})
		})
	})
end)