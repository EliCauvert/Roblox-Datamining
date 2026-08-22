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
local fFlagBuildExperienceAssetLibraryModule = require(buildExperience.Flags.FFlagBuildExperienceAssetLibrary)
local fFlagBuildEventsUpdate1Module = require(buildExperience.Flags.FFlagBuildEventsUpdate1)
local fFlagBuildExperienceDontAskAgainPushUpsellModule = require(buildExperience.Flags.FFlagBuildExperienceDontAskAgainPushUpsell)
local buildAppStorageKeyEngineFeature = game:GetEngineFeature("BuildAppStorageKey")
local var20 = if buildAppStorageKeyEngineFeature then require(buildExperience.Storage.BuildAppStorage) else nil
local default = require(parent.LinkingProtocol).LinkingProtocol.default
local permissionsProtocol = require(parent.PermissionsProtocol).PermissionsProtocol
local iconName = foundationModule.Enums.IconName
local useTokens = foundationModule.Hooks.useTokens
local realtimeMessageId = messageBusService:GetMessageId("Realtime", "appResume")
local t = { allComplete = false, groups = {} }

local function _() --[[ line: 75 | named "getKeyboardTop" ]]
	-- upvalues: userInputService (ref), guiService (ref)
	return if userInputService.OnScreenKeyboardVisible then math.max(0, userInputService.OnScreenKeyboardPosition.Y - guiService:GetGuiInset().Y) else 0
end

local function useUniverseSummary(p0) --[[ line: 83 ]]
	-- upvalues: universeConfigurationModule (ref), reactModule (ref), signalsModule (ref), signalsReactModule (ref)
	local universeConfigurationStore = universeConfigurationModule.getUniverseConfigurationStore()
	
	return signalsReactModule.useSignalState(reactModule.useMemo(function() --[[ line: 85 ]]
		-- upvalues: signalsModule (copy), p0 (ref), universeConfigurationStore (ref)
		return signalsModule.createComputed(function(p1) --[[ line: 86 ]]
			-- upvalues: p0 (copy), universeConfigurationStore (copy)
			return if p0 == nil or p0 == 0 then nil else universeConfigurationStore.getAndFetchSummary(p0).data(p1)
		end)
	end, { universeConfigurationStore, p0 }))
end

local _ = function(p2, p3) --[[ line: 97 | named "getHydratedExperienceName" ]]
	local var25 = if p3 ~= nil then nil else p3.name
	
	return if typeof(var25) == "string" and var25 ~= "" then var25 else p2
end

return function(p4) --[[ line: 105 | named "useBuildChatPageViewModel" ]]
	-- upvalues: useTokens (ref), useUniverseSummary (ref), getBuildOverflowMenuStoreModule (ref), getCreatorAgentResumeStoreModule (ref), reactModule (ref), fFlagBuildExperienceDontAskAgainPushUpsellModule (ref), buildAppStorageKeyEngineFeature (ref), var20 (ref), userInputService (ref), guiService (ref), permissionsProtocol (ref), messageBusService (ref), realtimeMessageId (ref), default (ref), creatorAgentChatModule (ref), useChatSessionCoreModule (ref), useChatPlaytestFooterModule (ref), universeConfigurationModule (ref), useCreatorCreditChatUpsellViewModelModule (ref), sendBuildExperienceEventModule (ref), fFlagBuildEventsUpdate1Module (ref), t (ref), fFlagBuildExperienceAssetLibraryModule (ref), iconName (ref)
	local v
	local var26 = useTokens()
	local var27 = useUniverseSummary(p4.target.universeId)
	local var28 = getBuildOverflowMenuStoreModule()
	local var29 = getCreatorAgentResumeStoreModule()
	local var30, var31 = reactModule.useState(nil)
	local var32, var33 = reactModule.useState(false)
	local var34, var35 = reactModule.useState(nil)
	local var36, var37 = reactModule.useState(function() --[[ line: 114 ]]
		-- upvalues: fFlagBuildExperienceDontAskAgainPushUpsellModule (copy), buildAppStorageKeyEngineFeature (copy), var20 (copy)
		return fFlagBuildExperienceDontAskAgainPushUpsellModule and (buildAppStorageKeyEngineFeature and var20.isPushNotificationsUpsellDismissedPermanently())
	end)
	local var38, var39 = reactModule.useState(false)
	local var40, var41 = reactModule.useState(false)
	local var42, var43 = reactModule.useState(function() --[[ line: 122 ]]
		-- upvalues: buildAppStorageKeyEngineFeature (copy), var20 (copy)
		return buildAppStorageKeyEngineFeature and var20.wasPushNotificationsUpsellShownToday()
	end)
	local var44, var45 = reactModule.useState(false)
	local var46 = reactModule.useRef(false)
	local var47, var48 = reactModule.useState(if not userInputService.OnScreenKeyboardVisible then 0 else math.max(0, userInputService.OnScreenKeyboardPosition.Y - guiService:GetGuiInset().Y))
	local var49, var50 = reactModule.useState(0)
	local var51 = reactModule.useCallback(function() --[[ line: 132 ]]
		-- upvalues: permissionsProtocol (copy), var46 (ref), var35 (ref), var41 (ref)
		return permissionsProtocol.default:hasPermissions({ permissionsProtocol.Permissions.POST_NOTIFICATIONS }):andThen(function(p5) --[[ line: 137 ]]
			-- upvalues: var46 (copy), var35 (copy), permissionsProtocol (copy), var41 (copy)
			if var46.current then
				var35(p5.status)
				
				if p5.status == permissionsProtocol.Status.AUTHORIZED then
					var41(false)
				end
			end
		end, function() --[[ line: 144 ]] end)
	end, {})
	reactModule.useEffect(function() --[[ line: 149 ]]
		-- upvalues: var46 (ref), var51 (ref), messageBusService (copy), realtimeMessageId (copy)
		var46.current = true
		var51()
		local var73 = messageBusService:Subscribe(realtimeMessageId, var51, false, true)
		
		return function() --[[ line: 154 ]]
			-- upvalues: var46 (copy), var73 (ref)
			var46.current = false
			var73:Disconnect()
		end
	end, { var51 })
	local var52 = reactModule.useCallback(function() --[[ line: 160 ]]
		-- upvalues: var38 (ref), var39 (ref), permissionsProtocol (copy), var46 (ref), var35 (ref), var41 (ref)
		if var38 then
			return
		end
		var39(true)
		permissionsProtocol.default:requestPermissions({ permissionsProtocol.Permissions.POST_NOTIFICATIONS }):andThen(function(p6) --[[ line: 170 ]]
			-- upvalues: var46 (copy), var35 (copy), permissionsProtocol (copy), var41 (copy), var39 (copy)
			if not var46.current then return end
			var35(p6.status)
			
			if p6.status == permissionsProtocol.Status.DENIED then
				var41(true)
			end
			var39(false)
		end, function() --[[ line: 179 ]]
			-- upvalues: var46 (copy), var39 (copy)
			if var46.current then
				var39(false)
			end
		end)
	end, { var38 })
	local var53 = reactModule.useCallback(function() --[[ line: 186 ]]
		-- upvalues: default (copy)
		default:switchToSettingsApp():catch(function() --[[ line: 187 ]] end)
	end, {})
	local var54 = reactModule.useCallback(function() --[[ line: 190 ]]
		-- upvalues: fFlagBuildExperienceDontAskAgainPushUpsellModule (copy), buildAppStorageKeyEngineFeature (copy), var20 (copy), var37 (ref)
		if fFlagBuildExperienceDontAskAgainPushUpsellModule and buildAppStorageKeyEngineFeature then
			var20.markPushNotificationsUpsellDismissedPermanently()
		end
		var37(true)
	end, {})
	local var55 = reactModule.useCallback(function() --[[ line: 197 ]]
		-- upvalues: var48 (ref), userInputService (copy), guiService (copy)
		var48(if not userInputService.OnScreenKeyboardVisible then 0 else math.max(0, userInputService.OnScreenKeyboardPosition.Y - guiService:GetGuiInset().Y))
	end, {})
	reactModule.useEffect(function() --[[ line: 201 ]]
		-- upvalues: var55 (ref), userInputService (copy)
		var55()
		local var74 = userInputService:GetPropertyChangedSignal("OnScreenKeyboardVisible"):Connect(var55)
		local var75 = userInputService:GetPropertyChangedSignal("OnScreenKeyboardSize"):Connect(var55)
		local var76 = userInputService:GetPropertyChangedSignal("OnScreenKeyboardPosition"):Connect(var55)
		
		return function() --[[ line: 209 ]]
			-- upvalues: var74 (ref), var75 (ref), var76 (ref)
			var74:Disconnect()
			var75:Disconnect()
			var76:Disconnect()
		end
	end, { var55 })
	local var56 = reactModule.useCallback(function(p7) --[[ line: 216 ]]
		-- upvalues: var50 (ref)
		var50(p7.AbsolutePosition.Y + p7.AbsoluteSize.Y)
	end, {})
	local var57 = reactModule.useCallback(function(p8) --[[ line: 220 ]]
		-- upvalues: var33 (ref)
		local y = p8.AbsoluteWindowSize.Y
		var33(y > 0 and y < p8.AbsoluteCanvasSize.Y)
	end, {})
	local var58 = if var47 <= 0 or var49 <= 0 then 0 else math.max(0, var49 - var47)
	local var59 = p4.target.isNewGameTarget == true
	local var60 = reactModule.useMemo(function() --[[ line: 228 ]]
		-- upvalues: p4 (ref), var27 (ref)
		local t = {
			universeId = p4.target.universeId,
			placeId = p4.target.placeId,
			sessionId = p4.target.sessionId
		}
		local var78 = if var27 ~= nil then nil else var27.name
		t.experienceName = if typeof(var78) == "string" and var78 ~= "" then var78 else p4.target.experienceName
		t.isNewGameTarget = p4.target.isNewGameTarget
		t.creatorName = p4.target.creatorName
		t.gameIcon = p4.target.gameIcon
		
		return t
	end, {
		p4.target.universeId, p4.target.placeId, p4.target.sessionId,
		p4.target.experienceName, p4.target.isNewGameTarget, p4.target.creatorName,
		p4.target.gameIcon, var27
	})
	local var61 = reactModule.useCallback(function(p9) --[[ line: 251 ]]
		-- upvalues: p4 (ref), var60 (ref)
		if p4.onNavigateToResolvedTarget ~= nil then
			p4.onNavigateToResolvedTarget({
				universeId = p9.universeId,
				placeId = p9.placeId,
				sessionId = p9.sessionId,
				experienceName = var60.experienceName,
				isNewGameTarget = var60.isNewGameTarget,
				creatorName = var60.creatorName,
				gameIcon = var60.gameIcon
			})
		end
	end, {
		p4.onNavigateToResolvedTarget,
		var60.experienceName,
		var60.isNewGameTarget,
		var60.creatorName,
		var60.gameIcon
	})
	local var62, var63 = reactModule.useState({ count = 0, reason = nil })
	local var64 = useChatSessionCoreModule({
		autoFocusComposer = false,
		universeId = p4.target.universeId,
		placeId = p4.target.placeId,
		sessionId = p4.target.sessionId,
		createUniverseOnFirstPrompt = var59,
		onProjectResolved = var61,
		onPromptFailure = reactModule.useCallback(function(p10, p11) --[[ line: 277 ]]
			-- upvalues: creatorAgentChatModule (copy), var63 (ref)
			if p10 == creatorAgentChatModule.ErrorCodes.OutOfCredits then
				var63(function(p12) --[[ line: 279 ]]
					-- upvalues: p11 (ref)
					return { count = p12.count + 1, reason = p11 }
				end)
			end
		end, {})
	})
	local var65 = useChatPlaytestFooterModule(var64, "BuildChatPlaytestCta")
	local subagentTaskState = var64.subagentTaskState
	local var66 = subagentTaskState ~= nil and #subagentTaskState.groups > 0
	local var67 = #var64.messages == 0
	local var68 = false
	
	for i, v in var64.messages do
		if v.kind == "user_message" then
			var68 = true
			break
		end
	end
	local var69 = var34 == permissionsProtocol.Status.DENIED and (not var36 and (not var42 or var44))
	local var70 = reactModule.useRef(false)
	reactModule.useEffect(function() --[[ line: 315 ]]
		-- upvalues: buildAppStorageKeyEngineFeature (copy), var69 (ref), var68 (write), var64 (ref), var44 (ref), var45 (ref), var43 (ref), var20 (copy)
		if not buildAppStorageKeyEngineFeature then
			return function() --[[ line: 317 ]] end
		end
		local isAssistantResponding = var69 and (var68 and var64.isAssistantResponding)
		
		if isAssistantResponding and not var44 then
			var45(true)
			var43(true)
			var20.markPushNotificationsUpsellShown()
		elseif not isAssistantResponding and var44 then
			var45(false)
		end
		return function() --[[ line: 331 ]] end
	end, {
		var69,
		var68,
		var64.isAssistantResponding,
		var42,
		var44
	})
	reactModule.useEffect(function() --[[ line: 342 ]]
		-- upvalues: p4 (ref), var70 (ref), var64 (ref), universeConfigurationModule (copy)
		local universeId = p4.target.universeId
		local var80 = var70.current and not var64.isAssistantResponding
		var70.current = var64.isAssistantResponding
		
		if not var80 or universeId == nil or universeId == 0 then
			return function() --[[ line: 348 ]] end
		end
		local universeConfigurationStore = universeConfigurationModule.getUniverseConfigurationStore()
		
		if universeConfigurationStore.getSummary(universeId).data(false) ~= nil then
			universeConfigurationStore.fetchSummary(universeId)
		end
		return function() --[[ line: 355 ]] end
	end, { p4.target.universeId, var64.isAssistantResponding })
	reactModule.useEffect(function() --[[ line: 358 ]]
		-- upvalues: var29 (ref), p4 (ref)
		var29.setActiveTarget({
			universeId = p4.target.universeId,
			sessionId = p4.target.sessionId
		})
		
		return function() --[[ line: 363 ]]
			-- upvalues: var29 (copy)
			var29.setActiveTarget(nil)
		end
	end, { var29, p4.target.universeId, p4.target.sessionId })
	local var71 = reactModule.useCallback(function() --[[ line: 368 ]]
		-- upvalues: var64 (ref)
		if var64.textBoxRef.current then
			var64.textBoxRef.current.releaseFocus()
		end
	end, { var64.textBoxRef })
	v = if p4.onOpenCreatorCreditPage ~= nil then nil else reactModule.useCallback(function() --[[ line: 374 ]]
		-- upvalues: var71 (ref), p4 (ref)
		var71()
		
		if p4.onOpenCreatorCreditPage ~= nil then
			p4.onOpenCreatorCreditPage()
		end
	end, { var71, p4.onOpenCreatorCreditPage })
	local var72 = useCreatorCreditChatUpsellViewModelModule({
		onOpenCreatorCreditPage = v,
		outOfCreditsPromptFailureCount = var62.count,
		outOfCreditsPromptFailureReason = var62.reason,
		isAssistantResponding = var64.isAssistantResponding
	})
	
	return {
		target = var60,
		keyboardOverlap = var58,
		onPageMetricsChanged = var56,
		selectedChipGroupName = var30,
		onChipActivated = reactModule.useCallback(function(p13) --[[ line: 434 ]]
			-- upvalues: var71 (ref), var31 (ref)
			var71()
			var31(p13)
		end, { var71 }),
		onChipBottomSheetClose = function() --[[ line: 445 ]]
			-- upvalues: var31 (ref)
			var31(nil)
		end,
		onClose = reactModule.useCallback(function() --[[ line: 389 ]]
			-- upvalues: var71 (ref), p4 (ref)
			var71()
			p4.onClose()
		end, { var71, p4.onClose }),
		onOverflowMenuAction = reactModule.useCallback(function(p14) --[[ line: 394 ]]
			-- upvalues: var71 (ref), p4 (ref)
			if p14.type == "openPage" then
				var71()
				
				if p4.onOpenConfigurationPage then
					p4.onOpenConfigurationPage(p14.page)
					
					return
				end
			elseif p14.type == "openInvitePicker" then
				var71()
				
				if p4.onOpenInvitePicker then
					p4.onOpenInvitePicker()
				end
			end
		end, { var71, p4.onOpenConfigurationPage, p4.onOpenInvitePicker }),
		onPlayActivated = reactModule.useCallback(function() --[[ line: 408 ]]
			-- upvalues: sendBuildExperienceEventModule (copy), fFlagBuildEventsUpdate1Module (copy), p4 (ref), var64 (ref)
			sendBuildExperienceEventModule(if fFlagBuildEventsUpdate1Module then "PLAYTEST_CLICK" else "PLAY_CLICK", {
				universeId = p4.target.universeId,
				placeId = var64.playtestPlaceId
			}, if fFlagBuildEventsUpdate1Module then { context = "app_header" } else nil)
			
			if var64.launchPlaytest then
				var64.launchPlaytest("BuildChatPage")
			end
		end, {
			var64.launchPlaytest,
			var64.playtestPlaceId,
			p4.target.universeId
		}),
		onOpenAgentsPage = if fFlagBuildExperienceAssetLibraryModule then if fFlagBuildExperienceAssetLibraryModule then reactModule.useCallback(function() --[[ line: 426 ]]
			-- upvalues: var71 (ref), p4 (ref)
			var71()
			
			if p4.onOpenAssetLibraryPage ~= nil then
				p4.onOpenAssetLibraryPage()
			end
		end, { var71, p4.onOpenAssetLibraryPage }) else nil else reactModule.useCallback(function() --[[ line: 418 ]]
			-- upvalues: var71 (ref), p4 (ref), subagentTaskState (ref), t (copy)
			var71()
			p4.onOpenAgentsPage(subagentTaskState or t)
		end, { var71, p4.onOpenAgentsPage, subagentTaskState }),
		agentDetailIcon = if fFlagBuildExperienceAssetLibraryModule then iconName.SquaresGridPlus else nil,
		isAgentDetailDisabled = fFlagBuildExperienceAssetLibraryModule and p4.target.universeId == nil,
		onOpenCreatorCreditPage = v,
		buildOverflowMenuStore = var28,
		messages = var64.messages,
		localToolActions = var64.localToolActions,
		clockBinding = var64.clockBinding,
		onPlaytest = var65.onPlaytest,
		isPlaytestLoading = var65.isPlaytestLoading,
		showPushNotificationsUpsell = if buildAppStorageKeyEngineFeature then var44 and var69 else var69,
		isPushNotificationsRequestPending = var38,
		shouldOpenPushNotificationsSettings = var40,
		onNotifyMe = var52,
		onOpenPushNotificationsSettings = var53,
		onNotNow = var54,
		showBuyMoreRobuxCard = var72.showBuyMoreRobuxCard,
		buyMoreRobuxCardTitle = var72.buyMoreRobuxCardTitle,
		buyMoreRobuxCardDescription = var72.buyMoreRobuxCardDescription,
		buyMoreRobuxCardPrimaryActionText = var72.buyMoreRobuxCardPrimaryActionText,
		onBuyMoreRobuxCardPrimaryAction = var72.onBuyMoreRobuxCardPrimaryAction,
		buyMoreRobuxCardSecondaryActionText = var72.buyMoreRobuxCardSecondaryActionText,
		onBuyMoreRobuxCardSecondaryAction = var72.onBuyMoreRobuxCardSecondaryAction,
		isChatEmpty = var67,
		isHistoryLoading = var64.isHistoryLoading,
		isNewGameTarget = var59,
		hasPublishedTurn = var64.hasPublishedTurn,
		hasPublishedVersion = var27 ~= nil and var27.isActive,
		hasTaskGroups = var66,
		taskState = subagentTaskState,
		scrollingFrameRef = var64.setScrollingFrame,
		onChatViewportChanged = var57,
		isChatScrollable = var32,
		composerText = var64.composerText,
		composerErrorText = var64.composerErrorText,
		onComposerChanged = var64.setComposerText,
		textBoxRef = var64.textBoxRef,
		isAssistantResponding = var64.isAssistantResponding,
		canStopAssistantResponse = var64.canStopAssistantResponse,
		canSendWhileResponding = var64.canSendWhileResponding,
		onSend = var64.sendMessage,
		onStop = var64.stopAssistantResponse,
		statusChipGap = var26.Gap.Small,
		paddingBottom = var26.Padding.Small + var58
	}
end