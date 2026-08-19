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
local fFlagBuildExperienceDontAskAgainPushUpsellModule = require(buildExperience.Flags.FFlagBuildExperienceDontAskAgainPushUpsell)
local buildAppStorageKeyEngineFeature = game:GetEngineFeature("BuildAppStorageKey")
local var18 = if buildAppStorageKeyEngineFeature then require(buildExperience.Storage.BuildAppStorage) else nil
local default = require(parent.LinkingProtocol).LinkingProtocol.default
local permissionsProtocol = require(parent.PermissionsProtocol).PermissionsProtocol
local useTokens = foundationModule.Hooks.useTokens
local realtimeMessageId = messageBusService:GetMessageId("Realtime", "appResume")
local t = { allComplete = false, groups = {} }

local function _() --[[ line: 71 | named "getKeyboardTop" ]]
	-- upvalues: userInputService (ref), guiService (ref)
	return if userInputService.OnScreenKeyboardVisible then math.max(0, userInputService.OnScreenKeyboardPosition.Y - guiService:GetGuiInset().Y) else 0
end

local function useUniverseSummary(p0) --[[ line: 79 ]]
	-- upvalues: universeConfigurationModule (ref), reactModule (ref), signalsModule (ref), signalsReactModule (ref)
	local universeConfigurationStore = universeConfigurationModule.getUniverseConfigurationStore()
	
	return signalsReactModule.useSignalState(reactModule.useMemo(function() --[[ line: 81 ]]
		-- upvalues: signalsModule (copy), p0 (ref), universeConfigurationStore (ref)
		return signalsModule.createComputed(function(p1) --[[ line: 82 ]]
			-- upvalues: p0 (copy), universeConfigurationStore (copy)
			return if p0 == nil or p0 == 0 then nil else universeConfigurationStore.getAndFetchSummary(p0).data(p1)
		end)
	end, { universeConfigurationStore, p0 }))
end

local _ = function(p2, p3) --[[ line: 93 | named "getHydratedExperienceName" ]]
	local var23 = if p3 ~= nil then nil else p3.name
	
	return if typeof(var23) == "string" and var23 ~= "" then var23 else p2
end

return function(p4) --[[ line: 101 | named "useBuildChatPageViewModel" ]]
	-- upvalues: useTokens (ref), useUniverseSummary (ref), getBuildOverflowMenuStoreModule (ref), getCreatorAgentResumeStoreModule (ref), reactModule (ref), fFlagBuildExperienceDontAskAgainPushUpsellModule (ref), buildAppStorageKeyEngineFeature (ref), var18 (ref), userInputService (ref), guiService (ref), permissionsProtocol (ref), messageBusService (ref), realtimeMessageId (ref), default (ref), creatorAgentChatModule (ref), useChatSessionCoreModule (ref), useChatPlaytestFooterModule (ref), universeConfigurationModule (ref), useCreatorCreditChatUpsellViewModelModule (ref), sendBuildExperienceEventModule (ref), t (ref)
	local v
	local var24 = useTokens()
	local var25 = useUniverseSummary(p4.target.universeId)
	local var26 = getBuildOverflowMenuStoreModule()
	local var27 = getCreatorAgentResumeStoreModule()
	local var28, var29 = reactModule.useState(nil)
	local var30, var31 = reactModule.useState(false)
	local var32, var33 = reactModule.useState(nil)
	local var34, var35 = reactModule.useState(function() --[[ line: 110 ]]
		-- upvalues: fFlagBuildExperienceDontAskAgainPushUpsellModule (copy), buildAppStorageKeyEngineFeature (copy), var18 (copy)
		return fFlagBuildExperienceDontAskAgainPushUpsellModule and (buildAppStorageKeyEngineFeature and var18.isPushNotificationsUpsellDismissedPermanently())
	end)
	local var36, var37 = reactModule.useState(false)
	local var38, var39 = reactModule.useState(false)
	local var40, var41 = reactModule.useState(function() --[[ line: 118 ]]
		-- upvalues: buildAppStorageKeyEngineFeature (copy), var18 (copy)
		return buildAppStorageKeyEngineFeature and var18.wasPushNotificationsUpsellShownToday()
	end)
	local var42, var43 = reactModule.useState(false)
	local var44 = reactModule.useRef(false)
	local var45, var46 = reactModule.useState(if not userInputService.OnScreenKeyboardVisible then 0 else math.max(0, userInputService.OnScreenKeyboardPosition.Y - guiService:GetGuiInset().Y))
	local var47, var48 = reactModule.useState(0)
	local var49 = reactModule.useCallback(function() --[[ line: 128 ]]
		-- upvalues: permissionsProtocol (copy), var44 (ref), var33 (ref), var39 (ref)
		return permissionsProtocol.default:hasPermissions({ permissionsProtocol.Permissions.POST_NOTIFICATIONS }):andThen(function(p5) --[[ line: 133 ]]
			-- upvalues: var44 (copy), var33 (copy), permissionsProtocol (copy), var39 (copy)
			if var44.current then
				var33(p5.status)
				
				if p5.status == permissionsProtocol.Status.AUTHORIZED then
					var39(false)
				end
			end
		end, function() --[[ line: 140 ]] end)
	end, {})
	reactModule.useEffect(function() --[[ line: 145 ]]
		-- upvalues: var44 (ref), var49 (ref), messageBusService (copy), realtimeMessageId (copy)
		var44.current = true
		var49()
		local var71 = messageBusService:Subscribe(realtimeMessageId, var49, false, true)
		
		return function() --[[ line: 150 ]]
			-- upvalues: var44 (copy), var71 (ref)
			var44.current = false
			var71:Disconnect()
		end
	end, { var49 })
	local var50 = reactModule.useCallback(function() --[[ line: 156 ]]
		-- upvalues: var36 (ref), var37 (ref), permissionsProtocol (copy), var44 (ref), var33 (ref), var39 (ref)
		if var36 then
			return
		end
		var37(true)
		permissionsProtocol.default:requestPermissions({ permissionsProtocol.Permissions.POST_NOTIFICATIONS }):andThen(function(p6) --[[ line: 166 ]]
			-- upvalues: var44 (copy), var33 (copy), permissionsProtocol (copy), var39 (copy), var37 (copy)
			if not var44.current then return end
			var33(p6.status)
			
			if p6.status == permissionsProtocol.Status.DENIED then
				var39(true)
			end
			var37(false)
		end, function() --[[ line: 175 ]]
			-- upvalues: var44 (copy), var37 (copy)
			if var44.current then
				var37(false)
			end
		end)
	end, { var36 })
	local var51 = reactModule.useCallback(function() --[[ line: 182 ]]
		-- upvalues: default (copy)
		default:switchToSettingsApp():catch(function() --[[ line: 183 ]] end)
	end, {})
	local var52 = reactModule.useCallback(function() --[[ line: 186 ]]
		-- upvalues: fFlagBuildExperienceDontAskAgainPushUpsellModule (copy), buildAppStorageKeyEngineFeature (copy), var18 (copy), var35 (ref)
		if fFlagBuildExperienceDontAskAgainPushUpsellModule and buildAppStorageKeyEngineFeature then
			var18.markPushNotificationsUpsellDismissedPermanently()
		end
		var35(true)
	end, {})
	local var53 = reactModule.useCallback(function() --[[ line: 193 ]]
		-- upvalues: var46 (ref), userInputService (copy), guiService (copy)
		var46(if not userInputService.OnScreenKeyboardVisible then 0 else math.max(0, userInputService.OnScreenKeyboardPosition.Y - guiService:GetGuiInset().Y))
	end, {})
	reactModule.useEffect(function() --[[ line: 197 ]]
		-- upvalues: var53 (ref), userInputService (copy)
		var53()
		local var72 = userInputService:GetPropertyChangedSignal("OnScreenKeyboardVisible"):Connect(var53)
		local var73 = userInputService:GetPropertyChangedSignal("OnScreenKeyboardSize"):Connect(var53)
		local var74 = userInputService:GetPropertyChangedSignal("OnScreenKeyboardPosition"):Connect(var53)
		
		return function() --[[ line: 205 ]]
			-- upvalues: var72 (ref), var73 (ref), var74 (ref)
			var72:Disconnect()
			var73:Disconnect()
			var74:Disconnect()
		end
	end, { var53 })
	local var54 = reactModule.useCallback(function(p7) --[[ line: 212 ]]
		-- upvalues: var48 (ref)
		var48(p7.AbsolutePosition.Y + p7.AbsoluteSize.Y)
	end, {})
	local var55 = reactModule.useCallback(function(p8) --[[ line: 216 ]]
		-- upvalues: var31 (ref)
		local y = p8.AbsoluteWindowSize.Y
		var31(y > 0 and y < p8.AbsoluteCanvasSize.Y)
	end, {})
	local var56 = if var45 <= 0 or var47 <= 0 then 0 else math.max(0, var47 - var45)
	local var57 = p4.target.isNewGameTarget == true
	local var58 = reactModule.useMemo(function() --[[ line: 224 ]]
		-- upvalues: p4 (ref), var25 (ref)
		local t = {
			universeId = p4.target.universeId,
			placeId = p4.target.placeId,
			sessionId = p4.target.sessionId
		}
		local var76 = if var25 ~= nil then nil else var25.name
		t.experienceName = if typeof(var76) == "string" and var76 ~= "" then var76 else p4.target.experienceName
		t.isNewGameTarget = p4.target.isNewGameTarget
		t.creatorName = p4.target.creatorName
		t.gameIcon = p4.target.gameIcon
		
		return t
	end, {
		p4.target.universeId, p4.target.placeId, p4.target.sessionId,
		p4.target.experienceName, p4.target.isNewGameTarget, p4.target.creatorName,
		p4.target.gameIcon, var25
	})
	local var59 = reactModule.useCallback(function(p9) --[[ line: 247 ]]
		-- upvalues: p4 (ref), var58 (ref)
		if p4.onNavigateToResolvedTarget ~= nil then
			p4.onNavigateToResolvedTarget({
				universeId = p9.universeId,
				placeId = p9.placeId,
				sessionId = p9.sessionId,
				experienceName = var58.experienceName,
				isNewGameTarget = var58.isNewGameTarget,
				creatorName = var58.creatorName,
				gameIcon = var58.gameIcon
			})
		end
	end, {
		p4.onNavigateToResolvedTarget,
		var58.experienceName,
		var58.isNewGameTarget,
		var58.creatorName,
		var58.gameIcon
	})
	local var60, var61 = reactModule.useState({ count = 0, reason = nil })
	local var62 = useChatSessionCoreModule({
		autoFocusComposer = false,
		universeId = p4.target.universeId,
		placeId = p4.target.placeId,
		sessionId = p4.target.sessionId,
		createUniverseOnFirstPrompt = var57,
		onProjectResolved = var59,
		onPromptFailure = reactModule.useCallback(function(p10, p11) --[[ line: 273 ]]
			-- upvalues: creatorAgentChatModule (copy), var61 (ref)
			if p10 == creatorAgentChatModule.ErrorCodes.OutOfCredits then
				var61(function(p12) --[[ line: 275 ]]
					-- upvalues: p11 (ref)
					return { count = p12.count + 1, reason = p11 }
				end)
			end
		end, {})
	})
	local var63 = useChatPlaytestFooterModule(var62, "BuildChatPlaytestCta")
	local subagentTaskState = var62.subagentTaskState
	local var64 = subagentTaskState ~= nil and #subagentTaskState.groups > 0
	local var65 = #var62.messages == 0
	local var66 = false
	
	for i, v in var62.messages do
		if v.kind == "user_message" then
			var66 = true
			break
		end
	end
	local var67 = var32 == permissionsProtocol.Status.DENIED and (not var34 and (not var40 or var42))
	local var68 = reactModule.useRef(false)
	reactModule.useEffect(function() --[[ line: 311 ]]
		-- upvalues: buildAppStorageKeyEngineFeature (copy), var67 (ref), var66 (write), var62 (ref), var42 (ref), var43 (ref), var41 (ref), var18 (copy)
		if not buildAppStorageKeyEngineFeature then
			return function() --[[ line: 313 ]] end
		end
		local isAssistantResponding = var67 and (var66 and var62.isAssistantResponding)
		
		if isAssistantResponding and not var42 then
			var43(true)
			var41(true)
			var18.markPushNotificationsUpsellShown()
		elseif not isAssistantResponding and var42 then
			var43(false)
		end
		return function() --[[ line: 327 ]] end
	end, {
		var67,
		var66,
		var62.isAssistantResponding,
		var40,
		var42
	})
	reactModule.useEffect(function() --[[ line: 338 ]]
		-- upvalues: p4 (ref), var68 (ref), var62 (ref), universeConfigurationModule (copy)
		local universeId = p4.target.universeId
		local var78 = var68.current and not var62.isAssistantResponding
		var68.current = var62.isAssistantResponding
		
		if not var78 or universeId == nil or universeId == 0 then
			return function() --[[ line: 344 ]] end
		end
		local universeConfigurationStore = universeConfigurationModule.getUniverseConfigurationStore()
		
		if universeConfigurationStore.getSummary(universeId).data(false) ~= nil then
			universeConfigurationStore.fetchSummary(universeId)
		end
		return function() --[[ line: 351 ]] end
	end, { p4.target.universeId, var62.isAssistantResponding })
	reactModule.useEffect(function() --[[ line: 354 ]]
		-- upvalues: var27 (ref), p4 (ref)
		var27.setActiveTarget({
			universeId = p4.target.universeId,
			sessionId = p4.target.sessionId
		})
		
		return function() --[[ line: 359 ]]
			-- upvalues: var27 (copy)
			var27.setActiveTarget(nil)
		end
	end, { var27, p4.target.universeId, p4.target.sessionId })
	local var69 = reactModule.useCallback(function() --[[ line: 364 ]]
		-- upvalues: var62 (ref)
		if var62.textBoxRef.current then
			var62.textBoxRef.current.releaseFocus()
		end
	end, { var62.textBoxRef })
	v = if p4.onOpenCreatorCreditPage ~= nil then nil else reactModule.useCallback(function() --[[ line: 370 ]]
		-- upvalues: var69 (ref), p4 (ref)
		var69()
		
		if p4.onOpenCreatorCreditPage ~= nil then
			p4.onOpenCreatorCreditPage()
		end
	end, { var69, p4.onOpenCreatorCreditPage })
	local var70 = useCreatorCreditChatUpsellViewModelModule({
		onOpenCreatorCreditPage = v,
		outOfCreditsPromptFailureCount = var60.count,
		outOfCreditsPromptFailureReason = var60.reason,
		isAssistantResponding = var62.isAssistantResponding
	})
	
	return {
		target = var58,
		keyboardOverlap = var56,
		onPageMetricsChanged = var54,
		selectedChipGroupName = var28,
		onChipActivated = reactModule.useCallback(function(p13) --[[ line: 419 ]]
			-- upvalues: var69 (ref), var29 (ref)
			var69()
			var29(p13)
		end, { var69 }),
		onChipBottomSheetClose = function() --[[ line: 430 ]]
			-- upvalues: var29 (ref)
			var29(nil)
		end,
		onClose = reactModule.useCallback(function() --[[ line: 385 ]]
			-- upvalues: var69 (ref), p4 (ref)
			var69()
			p4.onClose()
		end, { var69, p4.onClose }),
		onOverflowMenuAction = reactModule.useCallback(function(p14) --[[ line: 390 ]]
			-- upvalues: var69 (ref), p4 (ref)
			if p14.type == "openPage" then
				var69()
				
				if p4.onOpenConfigurationPage then
					p4.onOpenConfigurationPage(p14.page)
					
					return
				end
			elseif p14.type == "openInvitePicker" then
				var69()
				
				if p4.onOpenInvitePicker then
					p4.onOpenInvitePicker()
				end
			end
		end, { var69, p4.onOpenConfigurationPage, p4.onOpenInvitePicker }),
		onPlayActivated = reactModule.useCallback(function() --[[ line: 404 ]]
			-- upvalues: sendBuildExperienceEventModule (copy), p4 (ref), var62 (ref)
			sendBuildExperienceEventModule("PLAY_CLICK", {
				universeId = p4.target.universeId,
				placeId = var62.playtestPlaceId
			})
			
			if var62.launchPlaytest then
				var62.launchPlaytest("BuildChatPage")
			end
		end, {
			var62.launchPlaytest,
			var62.playtestPlaceId,
			p4.target.universeId
		}),
		onOpenAgentsPage = reactModule.useCallback(function() --[[ line: 414 ]]
			-- upvalues: var69 (ref), p4 (ref), subagentTaskState (ref), t (copy)
			var69()
			p4.onOpenAgentsPage(subagentTaskState or t)
		end, { var69, p4.onOpenAgentsPage, subagentTaskState }),
		onOpenCreatorCreditPage = v,
		buildOverflowMenuStore = var26,
		messages = var62.messages,
		localToolActions = var62.localToolActions,
		clockBinding = var62.clockBinding,
		onPlaytest = var63.onPlaytest,
		isPlaytestLoading = var63.isPlaytestLoading,
		showPushNotificationsUpsell = if buildAppStorageKeyEngineFeature then var42 and var67 else var67,
		isPushNotificationsRequestPending = var36,
		shouldOpenPushNotificationsSettings = var38,
		onNotifyMe = var50,
		onOpenPushNotificationsSettings = var51,
		onNotNow = var52,
		showBuyMoreRobuxCard = var70.showBuyMoreRobuxCard,
		buyMoreRobuxCardTitle = var70.buyMoreRobuxCardTitle,
		buyMoreRobuxCardDescription = var70.buyMoreRobuxCardDescription,
		buyMoreRobuxCardPrimaryActionText = var70.buyMoreRobuxCardPrimaryActionText,
		onBuyMoreRobuxCardPrimaryAction = var70.onBuyMoreRobuxCardPrimaryAction,
		buyMoreRobuxCardSecondaryActionText = var70.buyMoreRobuxCardSecondaryActionText,
		onBuyMoreRobuxCardSecondaryAction = var70.onBuyMoreRobuxCardSecondaryAction,
		isChatEmpty = var65,
		isHistoryLoading = var62.isHistoryLoading,
		isNewGameTarget = var57,
		hasPublishedTurn = var62.hasPublishedTurn,
		hasPublishedVersion = var25 ~= nil and var25.isActive,
		hasTaskGroups = var64,
		taskState = subagentTaskState,
		scrollingFrameRef = var62.setScrollingFrame,
		onChatViewportChanged = var55,
		isChatScrollable = var30,
		composerText = var62.composerText,
		composerErrorText = var62.composerErrorText,
		onComposerChanged = var62.setComposerText,
		textBoxRef = var62.textBoxRef,
		isAssistantResponding = var62.isAssistantResponding,
		canStopAssistantResponse = var62.canStopAssistantResponse,
		canSendWhileResponding = var62.canSendWhileResponding,
		onSend = var62.sendMessage,
		onStop = var62.stopAssistantResponse,
		statusChipGap = var24.Gap.Small,
		paddingBottom = var24.Padding.Small + var56
	}
end