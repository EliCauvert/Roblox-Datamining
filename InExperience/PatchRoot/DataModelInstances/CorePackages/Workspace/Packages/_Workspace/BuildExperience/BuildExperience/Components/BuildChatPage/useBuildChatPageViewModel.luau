local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local guiService = game:GetService("GuiService")
local messageBusService = game:GetService("MessageBusService")
local userInputService = game:GetService("UserInputService")
local creatorAgentChatModule = require(parent.DataHydration.CreatorAgentChat)
local universeConfigurationModule = require(parent.DataHydration.UniverseConfiguration)
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local _ = require(buildExperience.Chat.chatTypes)
local useChatPlaytestFooterModule = require(buildExperience.Chat.useChatPlaytestFooter)
local useChatSessionCoreModule = require(buildExperience.Chat.useChatSessionCore)
local sendBuildExperienceEventModule = require(buildExperience.Telemetry.sendBuildExperienceEvent)
local getBuildOverflowMenuStoreModule = require(buildExperience.Stores.GetBuildOverflowMenuStore)
local getCreatorAgentResumeStoreModule = require(buildExperience.Stores.GetCreatorAgentResumeStore)
local _ = require(script.Parent.BuildChatPageView)
local useCreatorCreditChatUpsellViewModelModule = require(script.Parent.useCreatorCreditChatUpsellViewModel)
local fFlagBuildEventsUpdate1Module = require(buildExperience.Flags.FFlagBuildEventsUpdate1)
local fFlagBuildExperienceDontAskAgainPushUpsellModule = require(buildExperience.Flags.FFlagBuildExperienceDontAskAgainPushUpsell)
local buildAppStorageKeyEngineFeature = game:GetEngineFeature("BuildAppStorageKey")
local var19 = if buildAppStorageKeyEngineFeature then require(buildExperience.Storage.BuildAppStorage) else nil
local default = require(parent.LinkingProtocol).LinkingProtocol.default
local permissionsProtocol = require(parent.PermissionsProtocol).PermissionsProtocol
local useTokens = foundationModule.Hooks.useTokens
local realtimeMessageId = messageBusService:GetMessageId("Realtime", "appResume")
local t = { allComplete = false, groups = {} }

local function _()
	-- upvalues: userInputService (ref), guiService (ref)
	return if userInputService.OnScreenKeyboardVisible then math.max(0, userInputService.OnScreenKeyboardPosition.Y - guiService:GetGuiInset().Y) else 0
end

local function useUniverseSummary(p0)
	-- upvalues: universeConfigurationModule (ref), reactModule (ref), signalsModule (ref), signalsReactModule (ref)
	local universeConfigurationStore = universeConfigurationModule.getUniverseConfigurationStore()
	
	return signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), p0 (ref), universeConfigurationStore (ref)
		return signalsModule.createComputed(function(p1)
			-- upvalues: p0 (copy), universeConfigurationStore (copy)
			return if p0 == nil or p0 == 0 then nil else universeConfigurationStore.getAndFetchSummary(p0).data(p1)
		end)
	end, { universeConfigurationStore, p0 }))
end

local _ = function(p2, p3)
	local var24 = if p3 ~= nil then nil else p3.name
	
	return if typeof(var24) == "string" and var24 ~= "" then var24 else p2
end

return function(p4)
	-- upvalues: useTokens (ref), useUniverseSummary (ref), getBuildOverflowMenuStoreModule (ref), getCreatorAgentResumeStoreModule (ref), reactModule (ref), fFlagBuildExperienceDontAskAgainPushUpsellModule (ref), buildAppStorageKeyEngineFeature (ref), var19 (ref), userInputService (ref), guiService (ref), permissionsProtocol (ref), messageBusService (ref), realtimeMessageId (ref), default (ref), creatorAgentChatModule (ref), useChatSessionCoreModule (ref), useChatPlaytestFooterModule (ref), universeConfigurationModule (ref), useCreatorCreditChatUpsellViewModelModule (ref), sendBuildExperienceEventModule (ref), fFlagBuildEventsUpdate1Module (ref), t (ref)
	local v
	local var25 = useTokens()
	local var26 = useUniverseSummary(p4.target.universeId)
	local var27 = getBuildOverflowMenuStoreModule()
	local var28 = getCreatorAgentResumeStoreModule()
	local var29, var30 = reactModule.useState(nil)
	local var31, var32 = reactModule.useState(false)
	local var33, var34 = reactModule.useState(nil)
	local var35, var36 = reactModule.useState(function()
		-- upvalues: fFlagBuildExperienceDontAskAgainPushUpsellModule (copy), buildAppStorageKeyEngineFeature (copy), var19 (copy)
		return fFlagBuildExperienceDontAskAgainPushUpsellModule and (buildAppStorageKeyEngineFeature and var19.isPushNotificationsUpsellDismissedPermanently())
	end)
	local var37, var38 = reactModule.useState(false)
	local var39, var40 = reactModule.useState(false)
	local var41, var42 = reactModule.useState(function()
		-- upvalues: buildAppStorageKeyEngineFeature (copy), var19 (copy)
		return buildAppStorageKeyEngineFeature and var19.wasPushNotificationsUpsellShownToday()
	end)
	local var43, var44 = reactModule.useState(false)
	local var45 = reactModule.useRef(false)
	local var46, var47 = reactModule.useState(if not userInputService.OnScreenKeyboardVisible then 0 else math.max(0, userInputService.OnScreenKeyboardPosition.Y - guiService:GetGuiInset().Y))
	local var48, var49 = reactModule.useState(0)
	local var50 = reactModule.useCallback(function()
		-- upvalues: permissionsProtocol (copy), var45 (ref), var34 (ref), var40 (ref)
		return permissionsProtocol.default:hasPermissions({ permissionsProtocol.Permissions.POST_NOTIFICATIONS }):andThen(function(p5)
			-- upvalues: var45 (copy), var34 (copy), permissionsProtocol (copy), var40 (copy)
			if var45.current then
				var34(p5.status)
				
				if p5.status == permissionsProtocol.Status.AUTHORIZED then
					var40(false)
				end
			end
		end, function() end)
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var45 (ref), var50 (ref), messageBusService (copy), realtimeMessageId (copy)
		var45.current = true
		var50()
		local var72 = messageBusService:Subscribe(realtimeMessageId, var50, false, true)
		
		return function()
			-- upvalues: var45 (copy), var72 (ref)
			var45.current = false
			var72:Disconnect()
		end
	end, { var50 })
	local var51 = reactModule.useCallback(function()
		-- upvalues: var37 (ref), var38 (ref), permissionsProtocol (copy), var45 (ref), var34 (ref), var40 (ref)
		if var37 then
			return
		end
		var38(true)
		permissionsProtocol.default:requestPermissions({ permissionsProtocol.Permissions.POST_NOTIFICATIONS }):andThen(function(p6)
			-- upvalues: var45 (copy), var34 (copy), permissionsProtocol (copy), var40 (copy), var38 (copy)
			if not var45.current then return end
			var34(p6.status)
			
			if p6.status == permissionsProtocol.Status.DENIED then
				var40(true)
			end
			var38(false)
		end, function()
			-- upvalues: var45 (copy), var38 (copy)
			if var45.current then
				var38(false)
			end
		end)
	end, { var37 })
	local var52 = reactModule.useCallback(function()
		-- upvalues: default (copy)
		default:switchToSettingsApp():catch(function() end)
	end, {})
	local var53 = reactModule.useCallback(function()
		-- upvalues: fFlagBuildExperienceDontAskAgainPushUpsellModule (copy), buildAppStorageKeyEngineFeature (copy), var19 (copy), var36 (ref)
		if fFlagBuildExperienceDontAskAgainPushUpsellModule and buildAppStorageKeyEngineFeature then
			var19.markPushNotificationsUpsellDismissedPermanently()
		end
		var36(true)
	end, {})
	local var54 = reactModule.useCallback(function()
		-- upvalues: var47 (ref), userInputService (copy), guiService (copy)
		var47(if not userInputService.OnScreenKeyboardVisible then 0 else math.max(0, userInputService.OnScreenKeyboardPosition.Y - guiService:GetGuiInset().Y))
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var54 (ref), userInputService (copy)
		var54()
		local var73 = userInputService:GetPropertyChangedSignal("OnScreenKeyboardVisible"):Connect(var54)
		local var74 = userInputService:GetPropertyChangedSignal("OnScreenKeyboardSize"):Connect(var54)
		local var75 = userInputService:GetPropertyChangedSignal("OnScreenKeyboardPosition"):Connect(var54)
		
		return function()
			-- upvalues: var73 (ref), var74 (ref), var75 (ref)
			var73:Disconnect()
			var74:Disconnect()
			var75:Disconnect()
		end
	end, { var54 })
	local var55 = reactModule.useCallback(function(p7)
		-- upvalues: var49 (ref)
		var49(p7.AbsolutePosition.Y + p7.AbsoluteSize.Y)
	end, {})
	local var56 = reactModule.useCallback(function(p8)
		-- upvalues: var32 (ref)
		local y = p8.AbsoluteWindowSize.Y
		var32(y > 0 and y < p8.AbsoluteCanvasSize.Y)
	end, {})
	local var57 = if var46 <= 0 or var48 <= 0 then 0 else math.max(0, var48 - var46)
	local var58 = p4.target.isNewGameTarget == true
	local var59 = reactModule.useMemo(function()
		-- upvalues: p4 (ref), var26 (ref)
		local t = {
			universeId = p4.target.universeId,
			placeId = p4.target.placeId,
			sessionId = p4.target.sessionId
		}
		local var77 = if var26 ~= nil then nil else var26.name
		t.experienceName = if typeof(var77) == "string" and var77 ~= "" then var77 else p4.target.experienceName
		t.isNewGameTarget = p4.target.isNewGameTarget
		t.creatorName = p4.target.creatorName
		t.gameIcon = p4.target.gameIcon
		
		return t
	end, {
		p4.target.universeId, p4.target.placeId, p4.target.sessionId,
		p4.target.experienceName, p4.target.isNewGameTarget, p4.target.creatorName,
		p4.target.gameIcon, var26
	})
	local var60 = reactModule.useCallback(function(p9)
		-- upvalues: p4 (ref), var59 (ref)
		if p4.onNavigateToResolvedTarget ~= nil then
			p4.onNavigateToResolvedTarget({
				universeId = p9.universeId,
				placeId = p9.placeId,
				sessionId = p9.sessionId,
				experienceName = var59.experienceName,
				isNewGameTarget = var59.isNewGameTarget,
				creatorName = var59.creatorName,
				gameIcon = var59.gameIcon
			})
		end
	end, {
		p4.onNavigateToResolvedTarget,
		var59.experienceName,
		var59.isNewGameTarget,
		var59.creatorName,
		var59.gameIcon
	})
	local var61, var62 = reactModule.useState({ count = 0, reason = nil })
	local var63 = useChatSessionCoreModule({
		autoFocusComposer = false,
		universeId = p4.target.universeId,
		placeId = p4.target.placeId,
		sessionId = p4.target.sessionId,
		createUniverseOnFirstPrompt = var58,
		onProjectResolved = var60,
		onPromptFailure = reactModule.useCallback(function(p10, p11)
			-- upvalues: creatorAgentChatModule (copy), var62 (ref)
			if p10 == creatorAgentChatModule.ErrorCodes.OutOfCredits then
				var62(function(p12)
					-- upvalues: p11 (ref)
					return { count = p12.count + 1, reason = p11 }
				end)
			end
		end, {})
	})
	local var64 = useChatPlaytestFooterModule(var63, "BuildChatPlaytestCta")
	local subagentTaskState = var63.subagentTaskState
	local var65 = subagentTaskState ~= nil and #subagentTaskState.groups > 0
	local var66 = #var63.messages == 0
	local var67 = false
	
	for i, v in var63.messages do
		if v.kind == "user_message" then
			var67 = true
			break
		end
	end
	local var68 = var33 == permissionsProtocol.Status.DENIED and (not var35 and (not var41 or var43))
	local var69 = reactModule.useRef(false)
	reactModule.useEffect(function()
		-- upvalues: buildAppStorageKeyEngineFeature (copy), var68 (ref), var67 (write), var63 (ref), var43 (ref), var44 (ref), var42 (ref), var19 (copy)
		if not buildAppStorageKeyEngineFeature then
			return function() end
		end
		local isAssistantResponding = var68 and (var67 and var63.isAssistantResponding)
		
		if isAssistantResponding and not var43 then
			var44(true)
			var42(true)
			var19.markPushNotificationsUpsellShown()
		elseif not isAssistantResponding and var43 then
			var44(false)
		end
		return function() end
	end, {
		var68,
		var67,
		var63.isAssistantResponding,
		var41,
		var43
	})
	reactModule.useEffect(function()
		-- upvalues: p4 (ref), var69 (ref), var63 (ref), universeConfigurationModule (copy)
		local universeId = p4.target.universeId
		local var79 = var69.current and not var63.isAssistantResponding
		var69.current = var63.isAssistantResponding
		
		if not var79 or universeId == nil or universeId == 0 then
			return function() end
		end
		local universeConfigurationStore = universeConfigurationModule.getUniverseConfigurationStore()
		
		if universeConfigurationStore.getSummary(universeId).data(false) ~= nil then
			universeConfigurationStore.fetchSummary(universeId)
		end
		return function() end
	end, { p4.target.universeId, var63.isAssistantResponding })
	reactModule.useEffect(function()
		-- upvalues: var28 (ref), p4 (ref)
		var28.setActiveTarget({
			universeId = p4.target.universeId,
			sessionId = p4.target.sessionId
		})
		
		return function()
			-- upvalues: var28 (copy)
			var28.setActiveTarget(nil)
		end
	end, { var28, p4.target.universeId, p4.target.sessionId })
	local var70 = reactModule.useCallback(function()
		-- upvalues: var63 (ref)
		if var63.textBoxRef.current then
			var63.textBoxRef.current.releaseFocus()
		end
	end, { var63.textBoxRef })
	v = if p4.onOpenCreatorCreditPage ~= nil then nil else reactModule.useCallback(function()
		-- upvalues: var70 (ref), p4 (ref)
		var70()
		
		if p4.onOpenCreatorCreditPage ~= nil then
			p4.onOpenCreatorCreditPage()
		end
	end, { var70, p4.onOpenCreatorCreditPage })
	local var71 = useCreatorCreditChatUpsellViewModelModule({
		onOpenCreatorCreditPage = v,
		outOfCreditsPromptFailureCount = var61.count,
		outOfCreditsPromptFailureReason = var61.reason,
		isAssistantResponding = var63.isAssistantResponding
	})
	
	return {
		target = var59,
		keyboardOverlap = var57,
		onPageMetricsChanged = var55,
		selectedChipGroupName = var29,
		onChipActivated = reactModule.useCallback(function(p13)
			-- upvalues: var70 (ref), var30 (ref)
			var70()
			var30(p13)
		end, { var70 }),
		onChipBottomSheetClose = function()
			-- upvalues: var30 (ref)
			var30(nil)
		end,
		onClose = reactModule.useCallback(function()
			-- upvalues: var70 (ref), p4 (ref)
			var70()
			p4.onClose()
		end, { var70, p4.onClose }),
		onOverflowMenuAction = reactModule.useCallback(function(p14)
			-- upvalues: var70 (ref), p4 (ref)
			if p14.type == "openPage" then
				var70()
				
				if p4.onOpenConfigurationPage then
					p4.onOpenConfigurationPage(p14.page)
					
					return
				end
			elseif p14.type == "openInvitePicker" then
				var70()
				
				if p4.onOpenInvitePicker then
					p4.onOpenInvitePicker()
				end
			end
		end, { var70, p4.onOpenConfigurationPage, p4.onOpenInvitePicker }),
		onPlayActivated = reactModule.useCallback(function()
			-- upvalues: sendBuildExperienceEventModule (copy), fFlagBuildEventsUpdate1Module (copy), p4 (ref), var63 (ref)
			sendBuildExperienceEventModule(if fFlagBuildEventsUpdate1Module then "PLAYTEST_CLICK" else "PLAY_CLICK", {
				universeId = p4.target.universeId,
				placeId = var63.playtestPlaceId
			}, if fFlagBuildEventsUpdate1Module then { context = "app_header" } else nil)
			
			if var63.launchPlaytest then
				var63.launchPlaytest("BuildChatPage")
			end
		end, {
			var63.launchPlaytest,
			var63.playtestPlaceId,
			p4.target.universeId
		}),
		onOpenAgentsPage = reactModule.useCallback(function()
			-- upvalues: var70 (ref), p4 (ref), subagentTaskState (ref), t (copy)
			var70()
			p4.onOpenAgentsPage(subagentTaskState or t)
		end, { var70, p4.onOpenAgentsPage, subagentTaskState }),
		onOpenCreatorCreditPage = v,
		buildOverflowMenuStore = var27,
		messages = var63.messages,
		localToolActions = var63.localToolActions,
		clockBinding = var63.clockBinding,
		onPlaytest = var64.onPlaytest,
		isPlaytestLoading = var64.isPlaytestLoading,
		showPushNotificationsUpsell = if buildAppStorageKeyEngineFeature then var43 and var68 else var68,
		isPushNotificationsRequestPending = var37,
		shouldOpenPushNotificationsSettings = var39,
		onNotifyMe = var51,
		onOpenPushNotificationsSettings = var52,
		onNotNow = var53,
		showBuyMoreRobuxCard = var71.showBuyMoreRobuxCard,
		buyMoreRobuxCardTitle = var71.buyMoreRobuxCardTitle,
		buyMoreRobuxCardDescription = var71.buyMoreRobuxCardDescription,
		buyMoreRobuxCardPrimaryActionText = var71.buyMoreRobuxCardPrimaryActionText,
		onBuyMoreRobuxCardPrimaryAction = var71.onBuyMoreRobuxCardPrimaryAction,
		buyMoreRobuxCardSecondaryActionText = var71.buyMoreRobuxCardSecondaryActionText,
		onBuyMoreRobuxCardSecondaryAction = var71.onBuyMoreRobuxCardSecondaryAction,
		isChatEmpty = var66,
		isHistoryLoading = var63.isHistoryLoading,
		isNewGameTarget = var58,
		hasPublishedTurn = var63.hasPublishedTurn,
		hasPublishedVersion = var26 ~= nil and var26.isActive,
		hasTaskGroups = var65,
		taskState = subagentTaskState,
		scrollingFrameRef = var63.setScrollingFrame,
		onChatViewportChanged = var56,
		isChatScrollable = var31,
		composerText = var63.composerText,
		composerErrorText = var63.composerErrorText,
		onComposerChanged = var63.setComposerText,
		textBoxRef = var63.textBoxRef,
		isAssistantResponding = var63.isAssistantResponding,
		canStopAssistantResponse = var63.canStopAssistantResponse,
		canSendWhileResponding = var63.canSendWhileResponding,
		onSend = var63.sendMessage,
		onStop = var63.stopAssistantResponse,
		statusChipGap = var25.Gap.Small,
		paddingBottom = var25.Padding.Small + var57
	}
end