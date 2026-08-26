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

return reactModule.memo(function(p1)
	-- upvalues: useTelemetryModule (ref), chatConversationTelemetryLayerModule (ref), useDispatch (ref), useTokens (ref), useLocalization (ref), useCurrentSquadId (ref), useCurrentSquadParentChannelId (ref), reactModule (ref), squadExternalContractContext (ref), fFlagPartyDevAPIToRespectThirdPartySettingsEnabled (ref), focusNavigationEventNameEnum (ref), inputHandlersModule (ref), useAppFocusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref), eventNamesModule (ref), scheduledSquadActionEnum (ref), scheduledSquadActionSourceEnum (ref), leaveSquad (ref), squadPromptType (ref), squadButtonSourceEnum (ref), squadButtonClickIntentionEnum (ref), chatConversationTelemetryEventsModule (ref), conversationActionTypeModule (ref), iconName (ref), foundationModule (ref), scheduledSquadSheetModule (ref), menu (ref), popoverSide (ref), popoverAlign (ref)
	local var1 = useTelemetryModule(chatConversationTelemetryLayerModule.Context)
	local var2 = useDispatch()
	local var3 = useTokens()
	local var4 = useLocalization({
		joinParty = "Feature.Squads.Label.JoinParty",
		moreText = "CommonUI.Features.Label.More",
		scheduleAParty = "Feature.Squads.Action.ScheduleAParty",
		startParty = "Feature.Squads.Label.StartParty",
		viewParty = "Feature.Squads.Label.ViewParty"
	})
	local var5 = useCurrentSquadId()
	local var6 = useCurrentSquadParentChannelId()
	local var7 = reactModule.useContext(squadExternalContractContext)
	local var8 = if fFlagPartyDevAPIToRespectThirdPartySettingsEnabled then var7.useIsChatEnabled() else true
	local var9, var10 = reactModule.useState(false)
	local var11, var12 = reactModule.useState(false)
	local var13, var14 = reactModule.useState(p1.tooltipText and p1.tooltipText ~= "")
	local var15 = reactModule.useRef(nil)
	local _ = nil
	local var16 = useAppFocusRoot({
		surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.ContextualMenu,
		isFocusable = var11,
		customEventHandlers = reactModule.useMemo(function()
			-- upvalues: focusNavigationEventNameEnum (copy), inputHandlersModule (copy), var12 (ref)
			return {
				[focusNavigationEventNameEnum.NavigateBack] = {
					handler = inputHandlersModule.onRelease(function(p2)
						-- upvalues: var12 (copy)
						p2.cancelled = true
						var12(false)
					end)
				}
			}
		end, { var12 })
	})
	local var17 = reactModule.useCallback(function(p2)
		-- upvalues: var15 (ref), var16 (ref)
		var15.current = p2
		
		if type(var16) == "function" then
			var16(p2)
		end
	end, { var16 })
	reactModule.useEffect(function()
		-- upvalues: var15 (ref)
		if var15 and var15.current then
			var15.current.SelectionBehaviorDown = Enum.SelectionBehavior.Stop
			var15.current.SelectionBehaviorLeft = Enum.SelectionBehavior.Stop
			var15.current.SelectionBehaviorRight = Enum.SelectionBehavior.Stop
			var15.current.SelectionBehaviorUp = Enum.SelectionBehavior.Stop
			var15.current.SelectionGroup = true
		end
	end, { var11 })
	local var18 = reactModule.useCallback(function()
		-- upvalues: var12 (ref)
		var12(false)
	end, {})
	local var19 = reactModule.useCallback(function()
		-- upvalues: var10 (ref), var7 (ref), eventNamesModule (copy), scheduledSquadActionEnum (copy), p1 (ref), scheduledSquadActionSourceEnum (copy), var5 (ref)
		var10(true)
		var7.fireSquadAnalytics(eventNamesModule.ScheduledSquadAction, {
			actionType = scheduledSquadActionEnum.ScheduleParty,
			conversationId = p1.conversationId,
			source = scheduledSquadActionSourceEnum.ChatConversationMoreMenu,
			squadId = var5,
			squadLocation = var7.squadLocation
		})
	end, {
		var7.setSquadPrompt,
		p1.conversationId,
		var5,
		var7.squadLocation,
		var7.fireSquadAnalytics
	})
	local var20 = reactModule.useCallback(function()
		-- upvalues: var5 (ref), p1 (ref), var6 (ref), var2 (ref), leaveSquad (copy), squadPromptType (copy), var7 (ref), var8 (ref), eventNamesModule (copy), squadButtonSourceEnum (copy), squadButtonClickIntentionEnum (copy)
		if var5 and p1.conversationId ~= var6 then
			var2(leaveSquad(squadPromptType.JoinAnotherSquad, var7.setSquadPrompt, function()
				-- upvalues: p1 (copy)
				p1.navigateToSquadLobby(p1.conversationId)
			end, var7.squadLocation, var8))
		else
			p1.navigateToSquadLobby(p1.conversationId)
		end
		var7.fireSquadAnalytics(eventNamesModule.EnterSquadButtonPressed, {
			conversationId = p1.conversationId,
			squadButtonSource = squadButtonSourceEnum.ChatConversationMoreMenu,
			squadId = var5,
			squadLocation = var7.squadLocation,
			userIntention = if p1.conversation and p1.conversation.hasGroupUp and p1.conversationId == var6 then squadButtonClickIntentionEnum.View elseif p1.conversation and p1.conversation.hasGroupUp then squadButtonClickIntentionEnum.Join else squadButtonClickIntentionEnum.Create
		})
	end, {
		p1.navigateToSquadLobby, p1.conversationId,
		p1.conversation and p1.conversation.hasGroupUp, var5, var6, var7, var8
	})
	local var21 = reactModule.useRef(nil)
	
	return reactModule.createElement(foundationModule.View, { tag = "auto-xy align-y-center" }, {
		MoreMenuButton = reactModule.createElement(foundationModule.IconButton, {
			isCircular = true,
			testId = "ChatConversationMoreMenuButton",
			icon = {
				name = foundationModule.Enums.IconName.PlusLarge,
				variant = if var11 then foundationModule.Enums.IconVariant.Filled else foundationModule.Enums.IconVariant.Regular
			},
			variant = if var11 then foundationModule.Enums.ButtonVariant.Standard else foundationModule.Enums.ButtonVariant.Utility,
			LayoutOrder = p1.layoutOrder,
			onActivated = reactModule.useCallback(function()
				-- upvalues: var1 (ref), chatConversationTelemetryEventsModule (copy), var11 (ref), conversationActionTypeModule (copy), var12 (ref)
				var1.emit(chatConversationTelemetryEventsModule.ConversationMoreMenuBtnClicked, {
					action = if var11 then conversationActionTypeModule.CloseMoreMenu else conversationActionTypeModule.OpenMoreMenu
				})
				var12(not var11)
			end, { var11, var1 }),
			size = foundationModule.Enums.InputSize.Medium,
			ref = var21
		}),
		ScheduledSquadSheet = reactModule.createElement(scheduledSquadSheetModule, {
			conversationId = p1.conversationId,
			isOpen = var9,
			onClose = function()
				-- upvalues: var10 (ref)
				var10(false)
			end
		}),
		Menu = reactModule.createElement(menu, {
			anchorRef = var21,
			items = reactModule.useMemo(function()
				-- upvalues: p1 (ref), var6 (ref), var4 (ref), iconName (copy)
				local t = {}
				table.insert(t, {
					icon = "icons/menu/groups",
					id = "createJoinViewParty",
					isDisabled = false,
					isChecked = false,
					text = if p1.conversation and p1.conversation.hasGroupUp and p1.conversationId == var6 then var4.viewParty elseif p1.conversation and p1.conversation.hasGroupUp then var4.joinParty else var4.startParty
				})
				table.insert(t, {
					id = "scheduleParty",
					isDisabled = false,
					isChecked = false,
					icon = iconName.Calendar,
					text = var4.scheduleAParty
				})
				
				return t
			end, {
				p1.conversation and p1.conversation.hasGroupUp,
				p1.conversationId,
				var6
			}),
			isOpen = var11,
			onActivated = reactModule.useCallback(function(p2)
				-- upvalues: var20 (ref), var19 (ref), var12 (ref)
				if p2 == "createJoinViewParty" then
					var20()
				elseif p2 == "scheduleParty" then
					var19()
				end
				var12(false)
			end, { var20, var19 }),
			onPressedOutside = var18,
			ref = var17,
			side = popoverSide.Top
		}),
		Tooltip = reactModule.createElement(foundationModule.Popover.Root, { isOpen = var13 }, {
			Anchor = reactModule.createElement(foundationModule.Popover.Anchor, { anchorRef = var21 }),
			Content = reactModule.createElement(foundationModule.Popover.Content, {
				hasArrow = true,
				align = { offset = 0, position = popoverAlign.Start },
				backgroundStyle = var3.Inverse.Surface.Surface_0,
				onPressedOutside = reactModule.useCallback(function()
					-- upvalues: var14 (ref)
					var14(false)
				end, {})
			}, {
				TooltipText = reactModule.createElement(foundationModule.Text, {
					tag = "auto-xy text-wrap padding-small content-inverse-emphasis text-body-small",
					Text = p1.tooltipText
				})
			})
		})
	})
end)