local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local FoundationModule = require(Parent.Foundation)
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local InputHandlersModule = require(Parent.InputHandlers)
local ReactModule = require(Parent.React)
local _ = require(Parent.ReactFocusNavigation)
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
local FFlagPartyDevAPIToRespectThirdPartySettingsEnabled = require(Parent.SharedFlags).FFlagPartyDevAPIToRespectThirdPartySettingsEnabled

return ReactModule.memo(function(p1) --[[ Line: 59 ]]
	-- upvalues: UseTelemetryModule (copy), ChatConversationTelemetryLayerModule (copy), UseDispatchFunction (copy), UseTokensFunction (copy), UseLocalizationFunction (copy), UseCurrentSquadIdFunction (copy), UseCurrentSquadParentChannelIdFunction (copy), ReactModule (copy), SquadExternalContractContext (copy), FFlagPartyDevAPIToRespectThirdPartySettingsEnabled (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy), UseAppFocusRootFunction (copy), FocusNavigableSurfaceIdentifierEnum (copy), EventNamesModule (copy), ScheduledSquadActionEnum (copy), ScheduledSquadActionSourceEnum (copy), LeaveSquadFunction (copy), SquadPromptType (copy), SquadButtonSourceEnum (copy), SquadButtonClickIntentionEnum (copy), ChatConversationTelemetryEventsModule (copy), ConversationActionTypeModule (copy), IconName (copy), FoundationModule (copy), ScheduledSquadSheetModule (copy), Menu (copy), PopoverSide (copy), PopoverAlign (copy)
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
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(p1.tooltipText and p1.tooltipText ~= "")
	local UseRefResult = ReactModule.useRef(nil)
	local UseAppFocusRootResult = UseAppFocusRootFunction({
		surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.ContextualMenu,
		isFocusable = UseStateResult1,
		customEventHandlers = ReactModule.useMemo(function() --[[ Line: 83 ]]
			-- upvalues: FocusNavigationEventNameEnum (upval), InputHandlersModule (upval), UseStateResult2_1 (copy)
			return {
				[FocusNavigationEventNameEnum.NavigateBack] = {
					handler = InputHandlersModule.onRelease(function(p2) --[[ Line: 86 ]]
						-- upvalues: UseStateResult2_1 (upval)
						p2.cancelled = true
						UseStateResult2_1(false)
					end)
				}
			}
		end, { UseStateResult2_1 })
	})
	local UseResult = ReactModule.useCallback(function(Current) --[[ Line: 101 ]]
		-- upvalues: UseRefResult (copy), UseAppFocusRootResult (copy)
		UseRefResult.current = Current
		
		if type(UseAppFocusRootResult) == "function" then
			UseAppFocusRootResult(Current)
		end
	end, { UseAppFocusRootResult })
	ReactModule.useEffect(function() --[[ Line: 108 ]]
		-- upvalues: UseRefResult (copy)
		if UseRefResult and UseRefResult.current then
			UseRefResult.current.SelectionBehaviorDown = Enum.SelectionBehavior.Stop
			UseRefResult.current.SelectionBehaviorLeft = Enum.SelectionBehavior.Stop
			UseRefResult.current.SelectionBehaviorRight = Enum.SelectionBehavior.Stop
			UseRefResult.current.SelectionBehaviorUp = Enum.SelectionBehavior.Stop
			UseRefResult.current.SelectionGroup = true
		end
	end, { UseStateResult1 })
	local UseResult1 = ReactModule.useCallback(function() --[[ Line: 124 ]]
		-- upvalues: UseStateResult2 (copy), UseContextResult (copy), EventNamesModule (upval), ScheduledSquadActionEnum (upval), p1 (copy), ScheduledSquadActionSourceEnum (upval), UseCurrentSquadIdResult (copy)
		UseStateResult2(true)
		UseContextResult.fireSquadAnalytics(EventNamesModule.ScheduledSquadAction, {
			actionType = ScheduledSquadActionEnum.ScheduleParty,
			conversationId = p1.conversationId,
			source = ScheduledSquadActionSourceEnum.ChatConversationMoreMenu,
			squadId = UseCurrentSquadIdResult,
			squadLocation = UseContextResult.squadLocation
		})
	end, {
		UseContextResult.setSquadPrompt,
		p1.conversationId,
		UseCurrentSquadIdResult,
		UseContextResult.squadLocation,
		UseContextResult.fireSquadAnalytics
	})
	local UseResult2 = ReactModule.useCallback(function() --[[ Line: 145 ]]
		-- upvalues: UseCurrentSquadIdResult (copy), p1 (copy), UseCurrentSquadParentChannelIdResult (copy), UseDispatchResult (copy), LeaveSquadFunction (upval), SquadPromptType (upval), UseContextResult (copy), NoFFlagPartyDevAPIToRespectThirdPartySettingsEnabled (copy), EventNamesModule (upval), SquadButtonSourceEnum (upval), SquadButtonClickIntentionEnum (upval)
		if UseCurrentSquadIdResult and p1.conversationId ~= UseCurrentSquadParentChannelIdResult then
			UseDispatchResult(LeaveSquadFunction(SquadPromptType.JoinAnotherSquad, UseContextResult.setSquadPrompt, function() --[[ Line: 148 ]]
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
			onActivated = ReactModule.useCallback(function() --[[ Line: 195 ]]
				-- upvalues: UseTelemetryModuleResult (copy), ChatConversationTelemetryEventsModule (upval), UseStateResult1 (copy), ConversationActionTypeModule (upval), UseStateResult2_1 (copy)
				UseTelemetryModuleResult.emit(ChatConversationTelemetryEventsModule.ConversationMoreMenuBtnClicked, {
					action = if UseStateResult1 then ConversationActionTypeModule.CloseMoreMenu else ConversationActionTypeModule.OpenMoreMenu
				})
				UseStateResult2_1(not UseStateResult1)
			end, { UseStateResult1, UseTelemetryModuleResult }),
			size = FoundationModule.Enums.InputSize.Medium,
			ref = UseRefResult1
		}),
		ScheduledSquadSheet = ReactModule.createElement(ScheduledSquadSheetModule, {
			conversationId = p1.conversationId,
			isOpen = UseStateResult,
			onClose = function() --[[ Line: 270 ]]
				-- upvalues: UseStateResult2 (copy)
				UseStateResult2(false)
			end
		}),
		Menu = ReactModule.createElement(Menu, {
			anchorRef = UseRefResult1,
			items = ReactModule.useMemo(function() --[[ Line: 208 ]]
				-- upvalues: p1 (copy), UseCurrentSquadParentChannelIdResult (copy), UseLocalizationResult (copy), IconName (upval)
				local List = {}
				table.insert(List, {
					icon = "icons/menu/groups",
					id = "createJoinViewParty",
					isDisabled = false,
					isChecked = false,
					text = if p1.conversation and p1.conversation.hasGroupUp and p1.conversationId == UseCurrentSquadParentChannelIdResult then UseLocalizationResult.viewParty elseif p1.conversation and p1.conversation.hasGroupUp then UseLocalizationResult.joinParty else UseLocalizationResult.startParty
				})
				table.insert(List, {
					id = "scheduleParty",
					isDisabled = false,
					isChecked = false,
					icon = IconName.Calendar,
					text = UseLocalizationResult.scheduleAParty
				})
				
				return List
			end, {
				p1.conversation and p1.conversation.hasGroupUp,
				p1.conversationId,
				UseCurrentSquadParentChannelIdResult
			}),
			isOpen = UseStateResult1,
			onActivated = ReactModule.useCallback(function(p2) --[[ Line: 180 ]]
				-- upvalues: UseResult2 (copy), UseResult1 (copy), UseStateResult2_1 (copy)
				if p2 == "createJoinViewParty" then
					UseResult2()
				elseif p2 == "scheduleParty" then
					UseResult1()
				end
				UseStateResult2_1(false)
			end, { UseResult2, UseResult1 }),
			onPressedOutside = ReactModule.useCallback(function() --[[ Line: 119 ]]
				-- upvalues: UseStateResult2_1 (copy)
				UseStateResult2_1(false)
			end, {}),
			ref = UseResult,
			side = PopoverSide.Top
		}),
		Tooltip = ReactModule.createElement(FoundationModule.Popover.Root, { isOpen = UseStateResult3 }, {
			Anchor = ReactModule.createElement(FoundationModule.Popover.Anchor, { anchorRef = UseRefResult1 }),
			Content = ReactModule.createElement(FoundationModule.Popover.Content, {
				hasArrow = true,
				align = { offset = 0, position = PopoverAlign.Start },
				backgroundStyle = UseTokensResult.Inverse.Surface.Surface_0,
				onPressedOutside = ReactModule.useCallback(function() --[[ Line: 203 ]]
					-- upvalues: UseStateResult2_2 (copy)
					UseStateResult2_2(false)
				end, {})
			}, {
				TooltipText = ReactModule.createElement(FoundationModule.Text, {
					tag = "auto-xy text-wrap padding-small content-inverse-emphasis text-body-small",
					Text = p1.tooltipText
				})
			})
		})
	})
end)