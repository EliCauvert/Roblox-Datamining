local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local foundationModule = require(parent.Foundation)
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local inputHandlersModule = require(parent.InputHandlers)
local reactModule = require(parent.React)
local _ = require(parent.ReactFocusNavigation)
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
local fFlagPartyDevAPIToRespectThirdPartySettingsEnabled = sharedFlagsModule.FFlagPartyDevAPIToRespectThirdPartySettingsEnabled

return reactModule.memo(function(p0)
	-- upvalues: useTelemetryModule (ref), chatConversationTelemetryLayerModule (ref), useDispatch (ref), useTokens (ref), useLocalization (ref), useCurrentSquadId (ref), useCurrentSquadParentChannelId (ref), reactModule (ref), squadExternalContractContext (ref), fFlagPartyDevAPIToRespectThirdPartySettingsEnabled (ref), focusNavigationEventNameEnum (ref), inputHandlersModule (ref), useAppFocusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref), eventNamesModule (ref), scheduledSquadActionEnum (ref), scheduledSquadActionSourceEnum (ref), leaveSquad (ref), squadPromptType (ref), squadButtonSourceEnum (ref), squadButtonClickIntentionEnum (ref), chatConversationTelemetryEventsModule (ref), conversationActionTypeModule (ref), iconName (ref), foundationModule (ref), scheduledSquadSheetModule (ref), menu (ref), popoverSide (ref), popoverAlign (ref)
	local var13 = useTelemetryModule(chatConversationTelemetryLayerModule.Context)
	local var14 = useDispatch()
	local var15 = useTokens()
	local var16 = useLocalization({
		joinParty = "Feature.Squads.Label.JoinParty",
		moreText = "CommonUI.Features.Label.More",
		scheduleAParty = "Feature.Squads.Action.ScheduleAParty",
		startParty = "Feature.Squads.Label.StartParty",
		viewParty = "Feature.Squads.Label.ViewParty"
	})
	local var17 = useCurrentSquadId()
	local var18 = useCurrentSquadParentChannelId()
	local var19 = reactModule.useContext(squadExternalContractContext)
	local var20 = if fFlagPartyDevAPIToRespectThirdPartySettingsEnabled then var19.useIsChatEnabled() else true
	local var21, var22 = reactModule.useState(false)
	local var23, var24 = reactModule.useState(false)
	local var25, var26 = reactModule.useState(p0.tooltipText and p0.tooltipText ~= "")
	local var27 = reactModule.useRef(nil)
	local _ = nil
	local var28 = useAppFocusRoot({
		surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.ContextualMenu,
		isFocusable = var23,
		customEventHandlers = reactModule.useMemo(function()
			-- upvalues: focusNavigationEventNameEnum (copy), inputHandlersModule (copy), var24 (ref)
			return {
				[focusNavigationEventNameEnum.NavigateBack] = {
					handler = inputHandlersModule.onRelease(function(p1)
						-- upvalues: var24 (copy)
						p1.cancelled = true
						var24(false)
					end)
				}
			}
		end, { var24 })
	})
	local var29 = reactModule.useCallback(function(p2)
		-- upvalues: var27 (ref), var28 (ref)
		var27.current = p2
		
		if type(var28) == "function" then
			var28(p2)
		end
	end, { var28 })
	reactModule.useEffect(function()
		-- upvalues: var27 (ref)
		if var27 and var27.current then
			var27.current.SelectionBehaviorDown = Enum.SelectionBehavior.Stop
			var27.current.SelectionBehaviorLeft = Enum.SelectionBehavior.Stop
			var27.current.SelectionBehaviorRight = Enum.SelectionBehavior.Stop
			var27.current.SelectionBehaviorUp = Enum.SelectionBehavior.Stop
			var27.current.SelectionGroup = true
		end
	end, { var23 })
	local var30 = reactModule.useCallback(function()
		-- upvalues: var24 (ref)
		var24(false)
	end, {})
	local var31 = reactModule.useCallback(function()
		-- upvalues: var22 (ref), var19 (ref), eventNamesModule (copy), scheduledSquadActionEnum (copy), p0 (ref), scheduledSquadActionSourceEnum (copy), var17 (ref)
		var22(true)
		var19.fireSquadAnalytics(eventNamesModule.ScheduledSquadAction, {
			actionType = scheduledSquadActionEnum.ScheduleParty,
			conversationId = p0.conversationId,
			source = scheduledSquadActionSourceEnum.ChatConversationMoreMenu,
			squadId = var17,
			squadLocation = var19.squadLocation
		})
	end, {
		var19.setSquadPrompt,
		p0.conversationId,
		var17,
		var19.squadLocation,
		var19.fireSquadAnalytics
	})
	local var32 = reactModule.useCallback(function()
		-- upvalues: var17 (ref), p0 (ref), var18 (ref), var14 (ref), leaveSquad (copy), squadPromptType (copy), var19 (ref), var20 (ref), eventNamesModule (copy), squadButtonSourceEnum (copy), squadButtonClickIntentionEnum (copy)
		if var17 and p0.conversationId ~= var18 then
			var14(leaveSquad(squadPromptType.JoinAnotherSquad, var19.setSquadPrompt, function()
				-- upvalues: p0 (copy)
				p0.navigateToSquadLobby(p0.conversationId)
			end, var19.squadLocation, var20))
		else
			p0.navigateToSquadLobby(p0.conversationId)
		end
		var19.fireSquadAnalytics(eventNamesModule.EnterSquadButtonPressed, {
			conversationId = p0.conversationId,
			squadButtonSource = squadButtonSourceEnum.ChatConversationMoreMenu,
			squadId = var17,
			squadLocation = var19.squadLocation,
			userIntention = if p0.conversation and p0.conversation.hasGroupUp and p0.conversationId == var18 then squadButtonClickIntentionEnum.View elseif p0.conversation and p0.conversation.hasGroupUp then squadButtonClickIntentionEnum.Join else squadButtonClickIntentionEnum.Create
		})
	end, {
		p0.navigateToSquadLobby, p0.conversationId,
		p0.conversation and p0.conversation.hasGroupUp, var17, var18, var19, var20
	})
	local var33 = reactModule.useRef(nil)
	
	return reactModule.createElement(foundationModule.View, { tag = "auto-xy align-y-center" }, {
		MoreMenuButton = reactModule.createElement(foundationModule.IconButton, {
			isCircular = true,
			testId = "ChatConversationMoreMenuButton",
			icon = {
				name = foundationModule.Enums.IconName.PlusLarge,
				variant = if var23 then foundationModule.Enums.IconVariant.Filled else foundationModule.Enums.IconVariant.Regular
			},
			variant = if var23 then foundationModule.Enums.ButtonVariant.Standard else foundationModule.Enums.ButtonVariant.Utility,
			LayoutOrder = p0.layoutOrder,
			onActivated = reactModule.useCallback(function()
				-- upvalues: var13 (ref), chatConversationTelemetryEventsModule (copy), var23 (ref), conversationActionTypeModule (copy), var24 (ref)
				var13.emit(chatConversationTelemetryEventsModule.ConversationMoreMenuBtnClicked, {
					action = if var23 then conversationActionTypeModule.CloseMoreMenu else conversationActionTypeModule.OpenMoreMenu
				})
				var24(not var23)
			end, { var23, var13 }),
			size = foundationModule.Enums.InputSize.Medium,
			ref = var33
		}),
		ScheduledSquadSheet = reactModule.createElement(scheduledSquadSheetModule, {
			conversationId = p0.conversationId,
			isOpen = var21,
			onClose = function()
				-- upvalues: var22 (ref)
				var22(false)
			end
		}),
		Menu = reactModule.createElement(menu, {
			anchorRef = var33,
			items = reactModule.useMemo(function()
				-- upvalues: p0 (ref), var18 (ref), var16 (ref), iconName (copy)
				local t = {}
				table.insert(t, {
					icon = "icons/menu/groups",
					id = "createJoinViewParty",
					isDisabled = false,
					isChecked = false,
					text = if p0.conversation and p0.conversation.hasGroupUp and p0.conversationId == var18 then var16.viewParty elseif p0.conversation and p0.conversation.hasGroupUp then var16.joinParty else var16.startParty
				})
				table.insert(t, {
					id = "scheduleParty",
					isDisabled = false,
					isChecked = false,
					icon = iconName.Calendar,
					text = var16.scheduleAParty
				})
				
				return t
			end, {
				p0.conversation and p0.conversation.hasGroupUp,
				p0.conversationId,
				var18
			}),
			isOpen = var23,
			onActivated = reactModule.useCallback(function(p3)
				-- upvalues: var32 (ref), var31 (ref), var24 (ref)
				if p3 == "createJoinViewParty" then
					var32()
				elseif p3 == "scheduleParty" then
					var31()
				end
				var24(false)
			end, { var32, var31 }),
			onPressedOutside = var30,
			ref = var29,
			side = popoverSide.Top
		}),
		Tooltip = reactModule.createElement(foundationModule.Popover.Root, { isOpen = var25 }, {
			Anchor = reactModule.createElement(foundationModule.Popover.Anchor, { anchorRef = var33 }),
			Content = reactModule.createElement(foundationModule.Popover.Content, {
				hasArrow = true,
				align = { offset = 0, position = popoverAlign.Start },
				backgroundStyle = var15.Inverse.Surface.Surface_0,
				onPressedOutside = reactModule.useCallback(function()
					-- upvalues: var26 (ref)
					var26(false)
				end, {})
			}, {
				TooltipText = reactModule.createElement(foundationModule.Text, {
					tag = "auto-xy text-wrap padding-small content-inverse-emphasis text-body-small",
					Text = p0.tooltipText
				})
			})
		})
	})
end)