local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local FoundationModule = require(Parent.Foundation)
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local InputHandlersModule = require(Parent.InputHandlers)
local ReactModule = require(Parent.React)
local ReactFocusNavigationModule = require(Parent.ReactFocusNavigation)
local SharedFlagsModule = require(Parent.SharedFlags)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local ChatConversationTelemetryLayerModule = require(AppChat.Telemetry.Layers.ChatConversationTelemetryLayer)
local ConversationActionTypeModule = require(AppChat.Analytics.Enums.ConversationActionType)
local UseTelemetryModule = require(AppChat.Telemetry.useTelemetry)
local ChatConversationTelemetryEventsModule = require(script.Parent.ChatConversationTelemetryEvents)
local LeaveSquadFunction = require(Parent.SquadsCore.Thunks).leaveSquad
local SquadPromptType = require(Parent.SquadsCore.Enums).SquadPromptType
local UseCurrentSquadIdFunction = require(Parent.SquadsCore.Hooks).useCurrentSquadId
local UseCurrentSquadParentChannelIdFunction = require(Parent.SquadsCore.Hooks).useCurrentSquadParentChannelId
local SquadExternalContractContext = require(Parent.SquadsCore.SquadExternalContractProvider).SquadExternalContractContext
local EventNamesModule = require(Parent.SquadsCore.EventNames)
local ScheduledSquadSheetModule = require(Parent.Squads.ScheduledSquadSheet)
local ScheduledSquadActionEnum = require(Parent.Squads.Enums).ScheduledSquadActionEnum
local ScheduledSquadActionSourceEnum = require(Parent.Squads.Enums).ScheduledSquadActionSourceEnum
local SquadButtonClickIntentionEnum = require(Parent.Squads.Enums).SquadButtonClickIntentionEnum
local SquadButtonSourceEnum = require(Parent.Squads.Enums).SquadButtonSourceEnum
local IconName = FoundationModule.Enums.IconName
local Menu = FoundationModule.Menu
local PopoverAlign = FoundationModule.Enums.PopoverAlign
local PopoverSide = FoundationModule.Enums.PopoverSide
local UseTokensFunction = FoundationModule.Hooks.useTokens
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local FocusNavigationEventNameEnum = FocusNavigationUtilsModule.FocusNavigationEventNameEnum
local UseAppFocusRootFunction = FocusNavigationUtilsModule.useAppFocusRoot
local UseFocusNavigableSurfaceRegistryConnectionFunction = FocusNavigationUtilsModule.useFocusNavigableSurfaceRegistryConnection
local FFlagPartyDevAPIToRespectThirdPartySettingsEnabled = SharedFlagsModule.FFlagPartyDevAPIToRespectThirdPartySettingsEnabled
local EnableMoreMenuGamepadFix = game:DefineFastFlag("EnableMoreMenuGamepadFix", false)
local FFlagEnableScheduledSquads = SharedFlagsModule.FFlagEnableScheduledSquads
local config = {
	[Enum.KeyCode.ButtonB] = FocusNavigationEventNameEnum.NavigateBack,
	[Enum.KeyCode.Escape] = FocusNavigationEventNameEnum.NavigateBack
}

return ReactModule.memo(function(p1)
	-- upvalues: UseTelemetryModule (copy), ChatConversationTelemetryLayerModule (copy), UseDispatchFunction (copy), UseTokensFunction (copy), UseLocalizationFunction (copy), UseCurrentSquadIdFunction (copy), UseCurrentSquadParentChannelIdFunction (copy), ReactModule (copy), SquadExternalContractContext (copy), FFlagPartyDevAPIToRespectThirdPartySettingsEnabled (copy), FFlagEnableScheduledSquads (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy), EnableMoreMenuGamepadFix (copy), UseAppFocusRootFunction (copy), FocusNavigableSurfaceIdentifierEnum (copy), UseFocusNavigableSurfaceRegistryConnectionFunction (copy), ReactFocusNavigationModule (copy), config (copy), EventNamesModule (copy), ScheduledSquadActionEnum (copy), ScheduledSquadActionSourceEnum (copy), LeaveSquadFunction (copy), SquadPromptType (copy), SquadButtonSourceEnum (copy), SquadButtonClickIntentionEnum (copy), ChatConversationTelemetryEventsModule (copy), ConversationActionTypeModule (copy), IconName (copy), FoundationModule (copy), ScheduledSquadSheetModule (copy), Menu (copy), PopoverSide (copy), PopoverAlign (copy)
	local UseTelemetryModuleResult = UseTelemetryModule(ChatConversationTelemetryLayerModule.Context)
	local UseDispatchResult = UseDispatchFunction()
	local UseTokensResult = UseTokensFunction()
	local UseLocalizationResult = UseLocalizationFunction({
		joinParty = "Feature.Squads.Label.JoinParty",
		moreText = "CommonUI.Features.Label.More",
		scheduleAParty = "Feature.Squads.Action.ScheduleAParty",
		startParty = "Feature.Squads.Label.StartParty",
		viewParty = "Feature.Squads.Label.ViewParty"
	})
	local UseCurrentSquadIdResult = UseCurrentSquadIdFunction()
	local UseCurrentSquadParentChannelIdResult = UseCurrentSquadParentChannelIdFunction()
	local UseContextResult = ReactModule.useContext(SquadExternalContractContext)
	local NoFFlagPartyDevAPIToRespectThirdPartySettingsEnabled = not FFlagPartyDevAPIToRespectThirdPartySettingsEnabled or UseContextResult.useIsChatEnabled()
	local UseStateResult, UseStateResult2 = ReactModule.useState(not FFlagEnableScheduledSquads and nil)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(if FFlagEnableScheduledSquads then p1.tooltipText and p1.tooltipText ~= "" else nil)
	local UseRefResult = ReactModule.useRef(nil)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: FocusNavigationEventNameEnum (upval), InputHandlersModule (upval), UseStateResult2_1 (copy)
		return {
			[FocusNavigationEventNameEnum.NavigateBack] = {
				handler = InputHandlersModule.onRelease(function(p2)
					-- upvalues: UseStateResult2_1 (upval)
					p2.cancelled = true
					UseStateResult2_1(false)
				end)
			}
		}
	end, { UseStateResult2_1 })
	local UseResult = nil
	local UseEventHandlerMapResult = nil
	
	if EnableMoreMenuGamepadFix then
		local UseAppFocusRootResult = UseAppFocusRootFunction({
			surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.ContextualMenu,
			isFocusable = UseStateResult1,
			customEventHandlers = UseMemoResult
		})
		UseResult = ReactModule.useCallback(function(Current)
			-- upvalues: UseRefResult (copy), UseAppFocusRootResult (copy)
			UseRefResult.current = Current
			
			if type(UseAppFocusRootResult) == "function" then
				UseAppFocusRootResult(Current)
			end
		end, { UseAppFocusRootResult })
	else
		UseFocusNavigableSurfaceRegistryConnectionFunction(UseRefResult.current, FocusNavigableSurfaceIdentifierEnum.ContextualMenu, UseStateResult1)
		UseEventHandlerMapResult = ReactFocusNavigationModule.useEventHandlerMap(UseMemoResult, (ReactFocusNavigationModule.useEventMap(config, UseRefResult)))
	end
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy)
		if UseRefResult and UseRefResult.current then
			UseRefResult.current.SelectionBehaviorDown = Enum.SelectionBehavior.Stop
			UseRefResult.current.SelectionBehaviorLeft = Enum.SelectionBehavior.Stop
			UseRefResult.current.SelectionBehaviorRight = Enum.SelectionBehavior.Stop
			UseRefResult.current.SelectionBehaviorUp = Enum.SelectionBehavior.Stop
			UseRefResult.current.SelectionGroup = true
		end
	end, { UseStateResult1 })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2_1 (copy)
		UseStateResult2_1(false)
	end, {})
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: FFlagEnableScheduledSquads (upval), UseStateResult2 (copy), UseContextResult (copy), EventNamesModule (upval), ScheduledSquadActionEnum (upval), p1 (copy), ScheduledSquadActionSourceEnum (upval), UseCurrentSquadIdResult (copy)
		if FFlagEnableScheduledSquads then
			UseStateResult2(true)
			UseContextResult.fireSquadAnalytics(EventNamesModule.ScheduledSquadAction, {
				actionType = ScheduledSquadActionEnum.ScheduleParty,
				conversationId = p1.conversationId,
				source = ScheduledSquadActionSourceEnum.ChatConversationMoreMenu,
				squadId = UseCurrentSquadIdResult,
				squadLocation = UseContextResult.squadLocation
			})
		end
	end, if FFlagEnableScheduledSquads then {
		UseContextResult.setSquadPrompt,
		p1.conversationId,
		UseCurrentSquadIdResult,
		UseContextResult.squadLocation,
		UseContextResult.fireSquadAnalytics
	} else nil)
	local UseResult3 = ReactModule.useCallback(function()
		-- upvalues: UseCurrentSquadIdResult (copy), p1 (copy), UseCurrentSquadParentChannelIdResult (copy), UseDispatchResult (copy), LeaveSquadFunction (upval), SquadPromptType (upval), UseContextResult (copy), NoFFlagPartyDevAPIToRespectThirdPartySettingsEnabled (copy), EventNamesModule (upval), SquadButtonSourceEnum (upval), SquadButtonClickIntentionEnum (upval)
		if UseCurrentSquadIdResult and p1.conversationId ~= UseCurrentSquadParentChannelIdResult then
			UseDispatchResult(LeaveSquadFunction(SquadPromptType.JoinAnotherSquad, UseContextResult.setSquadPrompt, function()
				-- upvalues: p1 (upval)
				p1.navigateToSquadLobby(p1.conversationId)
			end, UseContextResult.squadLocation, NoFFlagPartyDevAPIToRespectThirdPartySettingsEnabled))
		else
			p1.navigateToSquadLobby(p1.conversationId)
		end
		UseContextResult.fireSquadAnalytics(EventNamesModule.EnterSquadButtonPressed, {
			conversationId = p1.conversationId,
			squadButtonSource = SquadButtonSourceEnum.ChatConversationMoreMenu,
			squadId = UseCurrentSquadIdResult,
			squadLocation = UseContextResult.squadLocation,
			userIntention = if p1.conversation and p1.conversation.hasGroupUp and p1.conversationId == UseCurrentSquadParentChannelIdResult then SquadButtonClickIntentionEnum.View elseif p1.conversation and p1.conversation.hasGroupUp then SquadButtonClickIntentionEnum.Join else SquadButtonClickIntentionEnum.Create
		})
	end, {
		p1.navigateToSquadLobby, p1.conversationId,
		p1.conversation and p1.conversation.hasGroupUp, UseCurrentSquadIdResult,
		UseCurrentSquadParentChannelIdResult, UseContextResult,
		NoFFlagPartyDevAPIToRespectThirdPartySettingsEnabled
	})
	local UseResult4 = ReactModule.useCallback(function(p2)
		-- upvalues: UseResult3 (copy), FFlagEnableScheduledSquads (upval), UseResult2 (copy), UseStateResult2_1 (copy)
		if p2 == "createJoinViewParty" then
			UseResult3()
		elseif FFlagEnableScheduledSquads and p2 == "scheduleParty" then
			UseResult2()
		end
		UseStateResult2_1(false)
	end, {
		UseResult3,
		if FFlagEnableScheduledSquads then UseResult2 else nil
	})
	local UseResult5 = ReactModule.useCallback(function()
		-- upvalues: UseTelemetryModuleResult (copy), ChatConversationTelemetryEventsModule (upval), UseStateResult1 (copy), ConversationActionTypeModule (upval), UseStateResult2_1 (copy)
		UseTelemetryModuleResult.emit(ChatConversationTelemetryEventsModule.ConversationMoreMenuBtnClicked, {
			action = if UseStateResult1 then ConversationActionTypeModule.CloseMoreMenu else ConversationActionTypeModule.OpenMoreMenu
		})
		UseStateResult2_1(not UseStateResult1)
	end, { UseStateResult1, UseTelemetryModuleResult })
	local UseResult6 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2_2 (copy)
		UseStateResult2_2(false)
	end, {})
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: p1 (copy), UseCurrentSquadParentChannelIdResult (copy), UseLocalizationResult (copy), FFlagEnableScheduledSquads (upval), IconName (upval)
		local List = {}
		table.insert(List, {
			icon = "icons/menu/groups",
			id = "createJoinViewParty",
			isDisabled = false,
			isChecked = false,
			text = if p1.conversation and p1.conversation.hasGroupUp and p1.conversationId == UseCurrentSquadParentChannelIdResult then UseLocalizationResult.viewParty elseif p1.conversation and p1.conversation.hasGroupUp then UseLocalizationResult.joinParty else UseLocalizationResult.startParty
		})
		
		if FFlagEnableScheduledSquads then
			table.insert(List, {
				id = "scheduleParty",
				isDisabled = false,
				isChecked = false,
				icon = IconName.Calendar,
				text = UseLocalizationResult.scheduleAParty
			})
		end
		return List
	end, {
		p1.conversation and p1.conversation.hasGroupUp,
		p1.conversationId,
		UseCurrentSquadParentChannelIdResult
	})
	
	if FFlagEnableScheduledSquads then
		local UseRefResult1 = ReactModule.useRef(nil)
		
		return ReactModule.createElement(FoundationModule.View, { tag = "auto-xy align-y-center" }, {
			MoreMenuButton = ReactModule.createElement(FoundationModule.IconButton, {
				isCircular = true,
				testId = "ChatConversationMoreMenuButton",
				icon = {
					name = FoundationModule.Enums.IconName.PlusLarge,
					variant = if UseStateResult1 then FoundationModule.Enums.IconVariant.Filled else FoundationModule.Enums.IconVariant.Regular
				},
				variant = if UseStateResult1 then FoundationModule.Enums.ButtonVariant.Standard else FoundationModule.Enums.ButtonVariant.Utility,
				LayoutOrder = p1.layoutOrder,
				onActivated = UseResult5,
				size = FoundationModule.Enums.InputSize.Medium,
				ref = UseRefResult1
			}),
			ScheduledSquadSheet = if FFlagEnableScheduledSquads then ReactModule.createElement(ScheduledSquadSheetModule, {
				conversationId = p1.conversationId,
				isOpen = UseStateResult,
				onClose = function()
					-- upvalues: UseStateResult2 (copy)
					UseStateResult2(false)
				end
			}) else nil,
			Menu = ReactModule.createElement(Menu, {
				anchorRef = UseRefResult1,
				items = UseMemoResult1,
				isOpen = UseStateResult1,
				onActivated = UseResult4,
				onPressedOutside = UseResult1,
				ref = if EnableMoreMenuGamepadFix then UseResult else nil,
				side = PopoverSide.Top
			}),
			Tooltip = ReactModule.createElement(FoundationModule.Popover.Root, { isOpen = UseStateResult3 }, {
				Anchor = ReactModule.createElement(FoundationModule.Popover.Anchor, { anchorRef = UseRefResult1 }),
				Content = ReactModule.createElement(FoundationModule.Popover.Content, {
					hasArrow = true,
					align = { offset = 0, position = PopoverAlign.Start },
					backgroundStyle = UseTokensResult.Inverse.Surface.Surface_0,
					onPressedOutside = UseResult6
				}, {
					TooltipText = ReactModule.createElement(FoundationModule.Text, {
						tag = "auto-xy text-wrap padding-small content-inverse-emphasis text-body-small",
						Text = p1.tooltipText
					})
				})
			})
		})
	else
		return (ReactModule.createElement(Menu, {
			items = UseMemoResult1,
			isOpen = UseStateResult1,
			LayoutOrder = p1.layoutOrder,
			onActivated = UseResult4,
			onPressedOutside = UseResult1,
			ref = UseEventHandlerMapResult,
			side = PopoverSide.Top
		}, {
			MoreMenuButton = ReactModule.createElement(FoundationModule.View, { tag = "auto-xy align-y-center" }, {
				ReactModule.createElement(FoundationModule.IconButton, {
					isCircular = true,
					testId = "ChatConversationMoreMenuButton",
					icon = {
						name = FoundationModule.Enums.IconName.PlusLarge,
						variant = if UseStateResult1 then FoundationModule.Enums.IconVariant.Filled else FoundationModule.Enums.IconVariant.Regular
					},
					variant = if UseStateResult1 then FoundationModule.Enums.ButtonVariant.Standard else FoundationModule.Enums.ButtonVariant.Utility,
					LayoutOrder = p1.layoutOrder,
					onActivated = UseResult5,
					size = FoundationModule.Enums.InputSize.Medium
				})
			})
		}))
	end
end)