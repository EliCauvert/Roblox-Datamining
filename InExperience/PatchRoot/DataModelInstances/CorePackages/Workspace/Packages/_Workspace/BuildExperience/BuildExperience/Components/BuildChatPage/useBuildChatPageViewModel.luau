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
local buildAppStorageKeyEngineFeature = game:GetEngineFeature("BuildAppStorageKey")
local var17 = if buildAppStorageKeyEngineFeature then require(buildExperience.Storage.BuildAppStorage) else nil
local default = require(parent.LinkingProtocol).LinkingProtocol.default
local permissionsProtocol = require(parent.PermissionsProtocol).PermissionsProtocol
local useTokens = foundationModule.Hooks.useTokens
local realtimeMessageId = messageBusService:GetMessageId("Realtime", "appResume")
local t = { allComplete = false, groups = {} }

local function _() --[[ line: 69 | named "getKeyboardTop" ]]
	-- upvalues: userInputService (ref), guiService (ref)
	return if userInputService.OnScreenKeyboardVisible then math.max(0, userInputService.OnScreenKeyboardPosition.Y - guiService:GetGuiInset().Y) else 0
end

local function useUniverseSummary(p0) --[[ line: 77 ]]
	-- upvalues: universeConfigurationModule (ref), reactModule (ref), signalsModule (ref), signalsReactModule (ref)
	local universeConfigurationStore = universeConfigurationModule.getUniverseConfigurationStore()
	
	return signalsReactModule.useSignalState(reactModule.useMemo(function() --[[ line: 79 ]]
		-- upvalues: signalsModule (copy), p0 (ref), universeConfigurationStore (ref)
		return signalsModule.createComputed(function(p1) --[[ line: 80 ]]
			-- upvalues: p0 (copy), universeConfigurationStore (copy)
			return if p0 == nil or p0 == 0 then nil else universeConfigurationStore.getAndFetchSummary(p0).data(p1)
		end)
	end, { universeConfigurationStore, p0 }))
end

local _ = function(p2, p3) --[[ line: 91 | named "getHydratedExperienceName" ]]
	local var22 = if p3 ~= nil then nil else p3.name
	
	return if typeof(var22) == "string" and var22 ~= "" then var22 else p2
end

return function(p4) --[[ line: 99 | named "useBuildChatPageViewModel" ]]
	-- upvalues: useTokens (ref), useUniverseSummary (ref), getBuildOverflowMenuStoreModule (ref), getCreatorAgentResumeStoreModule (ref), reactModule (ref), buildAppStorageKeyEngineFeature (ref), var17 (ref), userInputService (ref), guiService (ref), permissionsProtocol (ref), messageBusService (ref), realtimeMessageId (ref), default (ref), creatorAgentChatModule (ref), useChatSessionCoreModule (ref), useChatPlaytestFooterModule (ref), universeConfigurationModule (ref), useCreatorCreditChatUpsellViewModelModule (ref), sendBuildExperienceEventModule (ref), t (ref)
	local v
	local var23 = useTokens()
	local var24 = useUniverseSummary(p4.target.universeId)
	local var25 = getBuildOverflowMenuStoreModule()
	local var26 = getCreatorAgentResumeStoreModule()
	local var27, var28 = reactModule.useState(nil)
	local var29, var30 = reactModule.useState(false)
	local var31, var32 = reactModule.useState(nil)
	local var33, var34 = reactModule.useState(false)
	local var35, var36 = reactModule.useState(false)
	local var37, var38 = reactModule.useState(false)
	local var39, var40 = reactModule.useState(function() --[[ line: 112 ]]
		-- upvalues: buildAppStorageKeyEngineFeature (copy), var17 (copy)
		return buildAppStorageKeyEngineFeature and var17.wasPushNotificationsUpsellShownToday()
	end)
	local var41, var42 = reactModule.useState(false)
	local var43 = reactModule.useRef(false)
	local var44, var45 = reactModule.useState(if not userInputService.OnScreenKeyboardVisible then 0 else math.max(0, userInputService.OnScreenKeyboardPosition.Y - guiService:GetGuiInset().Y))
	local var46, var47 = reactModule.useState(0)
	local var48 = reactModule.useCallback(function() --[[ line: 122 ]]
		-- upvalues: permissionsProtocol (copy), var43 (ref), var32 (ref), var38 (ref)
		return permissionsProtocol.default:hasPermissions({ permissionsProtocol.Permissions.POST_NOTIFICATIONS }):andThen(function(p5) --[[ line: 127 ]]
			-- upvalues: var43 (copy), var32 (copy), permissionsProtocol (copy), var38 (copy)
			if var43.current then
				var32(p5.status)
				
				if p5.status == permissionsProtocol.Status.AUTHORIZED then
					var38(false)
				end
			end
		end, function() --[[ line: 134 ]] end)
	end, {})
	reactModule.useEffect(function() --[[ line: 139 ]]
		-- upvalues: var43 (ref), var48 (ref), messageBusService (copy), realtimeMessageId (copy)
		var43.current = true
		var48()
		local var70 = messageBusService:Subscribe(realtimeMessageId, var48, false, true)
		
		return function() --[[ line: 144 ]]
			-- upvalues: var43 (copy), var70 (ref)
			var43.current = false
			var70:Disconnect()
		end
	end, { var48 })
	local var49 = reactModule.useCallback(function() --[[ line: 150 ]]
		-- upvalues: var35 (ref), var36 (ref), permissionsProtocol (copy), var43 (ref), var32 (ref), var38 (ref)
		if var35 then
			return
		end
		var36(true)
		permissionsProtocol.default:requestPermissions({ permissionsProtocol.Permissions.POST_NOTIFICATIONS }):andThen(function(p6) --[[ line: 160 ]]
			-- upvalues: var43 (copy), var32 (copy), permissionsProtocol (copy), var38 (copy), var36 (copy)
			if not var43.current then return end
			var32(p6.status)
			
			if p6.status == permissionsProtocol.Status.DENIED then
				var38(true)
			end
			var36(false)
		end, function() --[[ line: 169 ]]
			-- upvalues: var43 (copy), var36 (copy)
			if var43.current then
				var36(false)
			end
		end)
	end, { var35 })
	local var50 = reactModule.useCallback(function() --[[ line: 176 ]]
		-- upvalues: default (copy)
		default:switchToSettingsApp():catch(function() --[[ line: 177 ]] end)
	end, {})
	local var51 = reactModule.useCallback(function() --[[ line: 180 ]]
		-- upvalues: var34 (ref)
		var34(true)
	end, {})
	local var52 = reactModule.useCallback(function() --[[ line: 184 ]]
		-- upvalues: var45 (ref), userInputService (copy), guiService (copy)
		var45(if not userInputService.OnScreenKeyboardVisible then 0 else math.max(0, userInputService.OnScreenKeyboardPosition.Y - guiService:GetGuiInset().Y))
	end, {})
	reactModule.useEffect(function() --[[ line: 188 ]]
		-- upvalues: var52 (ref), userInputService (copy)
		var52()
		local var71 = userInputService:GetPropertyChangedSignal("OnScreenKeyboardVisible"):Connect(var52)
		local var72 = userInputService:GetPropertyChangedSignal("OnScreenKeyboardSize"):Connect(var52)
		local var73 = userInputService:GetPropertyChangedSignal("OnScreenKeyboardPosition"):Connect(var52)
		
		return function() --[[ line: 196 ]]
			-- upvalues: var71 (ref), var72 (ref), var73 (ref)
			var71:Disconnect()
			var72:Disconnect()
			var73:Disconnect()
		end
	end, { var52 })
	local var53 = reactModule.useCallback(function(p7) --[[ line: 203 ]]
		-- upvalues: var47 (ref)
		var47(p7.AbsolutePosition.Y + p7.AbsoluteSize.Y)
	end, {})
	local var54 = reactModule.useCallback(function(p8) --[[ line: 207 ]]
		-- upvalues: var30 (ref)
		local y = p8.AbsoluteWindowSize.Y
		var30(y > 0 and y < p8.AbsoluteCanvasSize.Y)
	end, {})
	local var55 = if var44 <= 0 or var46 <= 0 then 0 else math.max(0, var46 - var44)
	local var56 = p4.target.isNewGameTarget == true
	local var57 = reactModule.useMemo(function() --[[ line: 215 ]]
		-- upvalues: p4 (ref), var24 (ref)
		local t = {
			universeId = p4.target.universeId,
			placeId = p4.target.placeId,
			sessionId = p4.target.sessionId
		}
		local var75 = if var24 ~= nil then nil else var24.name
		t.experienceName = if typeof(var75) == "string" and var75 ~= "" then var75 else p4.target.experienceName
		t.isNewGameTarget = p4.target.isNewGameTarget
		t.creatorName = p4.target.creatorName
		t.gameIcon = p4.target.gameIcon
		
		return t
	end, {
		p4.target.universeId, p4.target.placeId, p4.target.sessionId,
		p4.target.experienceName, p4.target.isNewGameTarget, p4.target.creatorName,
		p4.target.gameIcon, var24
	})
	local var58 = reactModule.useCallback(function(p9) --[[ line: 238 ]]
		-- upvalues: p4 (ref), var57 (ref)
		if p4.onNavigateToResolvedTarget ~= nil then
			p4.onNavigateToResolvedTarget({
				universeId = p9.universeId,
				placeId = p9.placeId,
				sessionId = p9.sessionId,
				experienceName = var57.experienceName,
				isNewGameTarget = var57.isNewGameTarget,
				creatorName = var57.creatorName,
				gameIcon = var57.gameIcon
			})
		end
	end, {
		p4.onNavigateToResolvedTarget,
		var57.experienceName,
		var57.isNewGameTarget,
		var57.creatorName,
		var57.gameIcon
	})
	local var59, var60 = reactModule.useState({ count = 0, reason = nil })
	local var61 = useChatSessionCoreModule({
		autoFocusComposer = false,
		universeId = p4.target.universeId,
		placeId = p4.target.placeId,
		sessionId = p4.target.sessionId,
		createUniverseOnFirstPrompt = var56,
		onProjectResolved = var58,
		onPromptFailure = reactModule.useCallback(function(p10, p11) --[[ line: 264 ]]
			-- upvalues: creatorAgentChatModule (copy), var60 (ref)
			if p10 == creatorAgentChatModule.ErrorCodes.OutOfCredits then
				var60(function(p12) --[[ line: 266 ]]
					-- upvalues: p11 (ref)
					return { count = p12.count + 1, reason = p11 }
				end)
			end
		end, {})
	})
	local var62 = useChatPlaytestFooterModule(var61, "BuildChatPlaytestCta")
	local subagentTaskState = var61.subagentTaskState
	local var63 = subagentTaskState ~= nil and #subagentTaskState.groups > 0
	local var64 = #var61.messages == 0
	local var65 = false
	
	for i, v in var61.messages do
		if v.kind == "user_message" then
			var65 = true
			break
		end
	end
	local var66 = var31 == permissionsProtocol.Status.DENIED and (not var33 and (not var39 or var41))
	local var67 = reactModule.useRef(false)
	reactModule.useEffect(function() --[[ line: 302 ]]
		-- upvalues: buildAppStorageKeyEngineFeature (copy), var66 (ref), var65 (write), var61 (ref), var41 (ref), var42 (ref), var40 (ref), var17 (copy)
		if not buildAppStorageKeyEngineFeature then
			return function() --[[ line: 304 ]] end
		end
		local isAssistantResponding = var66 and (var65 and var61.isAssistantResponding)
		
		if isAssistantResponding and not var41 then
			var42(true)
			var40(true)
			var17.markPushNotificationsUpsellShown()
		elseif not isAssistantResponding and var41 then
			var42(false)
		end
		return function() --[[ line: 318 ]] end
	end, {
		var66,
		var65,
		var61.isAssistantResponding,
		var39,
		var41
	})
	reactModule.useEffect(function() --[[ line: 329 ]]
		-- upvalues: p4 (ref), var67 (ref), var61 (ref), universeConfigurationModule (copy)
		local universeId = p4.target.universeId
		local var77 = var67.current and not var61.isAssistantResponding
		var67.current = var61.isAssistantResponding
		
		if not var77 or universeId == nil or universeId == 0 then
			return function() --[[ line: 335 ]] end
		end
		local universeConfigurationStore = universeConfigurationModule.getUniverseConfigurationStore()
		
		if universeConfigurationStore.getSummary(universeId).data(false) ~= nil then
			universeConfigurationStore.fetchSummary(universeId)
		end
		return function() --[[ line: 342 ]] end
	end, { p4.target.universeId, var61.isAssistantResponding })
	reactModule.useEffect(function() --[[ line: 345 ]]
		-- upvalues: var26 (ref), p4 (ref)
		var26.setActiveTarget({
			universeId = p4.target.universeId,
			sessionId = p4.target.sessionId
		})
		
		return function() --[[ line: 350 ]]
			-- upvalues: var26 (copy)
			var26.setActiveTarget(nil)
		end
	end, { var26, p4.target.universeId, p4.target.sessionId })
	local var68 = reactModule.useCallback(function() --[[ line: 355 ]]
		-- upvalues: var61 (ref)
		if var61.textBoxRef.current then
			var61.textBoxRef.current.releaseFocus()
		end
	end, { var61.textBoxRef })
	v = if p4.onOpenCreatorCreditPage ~= nil then nil else reactModule.useCallback(function() --[[ line: 361 ]]
		-- upvalues: var68 (ref), p4 (ref)
		var68()
		
		if p4.onOpenCreatorCreditPage ~= nil then
			p4.onOpenCreatorCreditPage()
		end
	end, { var68, p4.onOpenCreatorCreditPage })
	local var69 = useCreatorCreditChatUpsellViewModelModule({
		onOpenCreatorCreditPage = v,
		outOfCreditsPromptFailureCount = var59.count,
		outOfCreditsPromptFailureReason = var59.reason,
		isAssistantResponding = var61.isAssistantResponding
	})
	
	return {
		target = var57,
		keyboardOverlap = var55,
		onPageMetricsChanged = var53,
		selectedChipGroupName = var27,
		onChipActivated = reactModule.useCallback(function(p13) --[[ line: 410 ]]
			-- upvalues: var68 (ref), var28 (ref)
			var68()
			var28(p13)
		end, { var68 }),
		onChipBottomSheetClose = function() --[[ line: 421 ]]
			-- upvalues: var28 (ref)
			var28(nil)
		end,
		onClose = reactModule.useCallback(function() --[[ line: 376 ]]
			-- upvalues: var68 (ref), p4 (ref)
			var68()
			p4.onClose()
		end, { var68, p4.onClose }),
		onOverflowMenuAction = reactModule.useCallback(function(p14) --[[ line: 381 ]]
			-- upvalues: var68 (ref), p4 (ref)
			if p14.type == "openPage" then
				var68()
				
				if p4.onOpenConfigurationPage then
					p4.onOpenConfigurationPage(p14.page)
					
					return
				end
			elseif p14.type == "openInvitePicker" then
				var68()
				
				if p4.onOpenInvitePicker then
					p4.onOpenInvitePicker()
				end
			end
		end, { var68, p4.onOpenConfigurationPage, p4.onOpenInvitePicker }),
		onPlayActivated = reactModule.useCallback(function() --[[ line: 395 ]]
			-- upvalues: sendBuildExperienceEventModule (copy), p4 (ref), var61 (ref)
			sendBuildExperienceEventModule("PLAY_CLICK", {
				universeId = p4.target.universeId,
				placeId = var61.playtestPlaceId
			})
			
			if var61.launchPlaytest then
				var61.launchPlaytest("BuildChatPage")
			end
		end, {
			var61.launchPlaytest,
			var61.playtestPlaceId,
			p4.target.universeId
		}),
		onOpenAgentsPage = reactModule.useCallback(function() --[[ line: 405 ]]
			-- upvalues: var68 (ref), p4 (ref), subagentTaskState (ref), t (copy)
			var68()
			p4.onOpenAgentsPage(subagentTaskState or t)
		end, { var68, p4.onOpenAgentsPage, subagentTaskState }),
		onOpenCreatorCreditPage = v,
		buildOverflowMenuStore = var25,
		messages = var61.messages,
		localToolActions = var61.localToolActions,
		clockBinding = var61.clockBinding,
		onPlaytest = var62.onPlaytest,
		isPlaytestLoading = var62.isPlaytestLoading,
		showPushNotificationsUpsell = if buildAppStorageKeyEngineFeature then var41 and var66 else var66,
		isPushNotificationsRequestPending = var35,
		shouldOpenPushNotificationsSettings = var37,
		onNotifyMe = var49,
		onOpenPushNotificationsSettings = var50,
		onNotNow = var51,
		showBuyMoreRobuxCard = var69.showBuyMoreRobuxCard,
		buyMoreRobuxCardTitle = var69.buyMoreRobuxCardTitle,
		buyMoreRobuxCardDescription = var69.buyMoreRobuxCardDescription,
		buyMoreRobuxCardPrimaryActionText = var69.buyMoreRobuxCardPrimaryActionText,
		onBuyMoreRobuxCardPrimaryAction = var69.onBuyMoreRobuxCardPrimaryAction,
		buyMoreRobuxCardSecondaryActionText = var69.buyMoreRobuxCardSecondaryActionText,
		onBuyMoreRobuxCardSecondaryAction = var69.onBuyMoreRobuxCardSecondaryAction,
		isChatEmpty = var64,
		isNewGameTarget = var56,
		hasPublishedTurn = var61.hasPublishedTurn,
		hasPublishedVersion = var24 ~= nil and var24.isActive,
		hasTaskGroups = var63,
		taskState = subagentTaskState,
		scrollingFrameRef = var61.setScrollingFrame,
		onChatViewportChanged = var54,
		isChatScrollable = var29,
		composerText = var61.composerText,
		composerErrorText = var61.composerErrorText,
		onComposerChanged = var61.setComposerText,
		textBoxRef = var61.textBoxRef,
		isAssistantResponding = var61.isAssistantResponding,
		canStopAssistantResponse = var61.canStopAssistantResponse,
		canSendWhileResponding = var61.canSendWhileResponding,
		onSend = var61.sendMessage,
		onStop = var61.stopAssistantResponse,
		statusChipGap = var23.Gap.Small,
		paddingBottom = var23.Padding.Small + var55
	}
end