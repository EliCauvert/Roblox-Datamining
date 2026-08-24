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
local fFlagBuildExperienceFocusNewGameComposerModule = require(buildExperience.Flags.FFlagBuildExperienceFocusNewGameComposer)
local fFlagBuildEventsUpdate1Module = require(buildExperience.Flags.FFlagBuildEventsUpdate1)
local fFlagBuildExperienceDontAskAgainPushUpsellModule = require(buildExperience.Flags.FFlagBuildExperienceDontAskAgainPushUpsell)
local buildAppStorageKeyEngineFeature = game:GetEngineFeature("BuildAppStorageKey")
local var21 = if buildAppStorageKeyEngineFeature then require(buildExperience.Storage.BuildAppStorage) else nil
local default = require(parent.LinkingProtocol).LinkingProtocol.default
local permissionsProtocol = require(parent.PermissionsProtocol).PermissionsProtocol
local iconName = foundationModule.Enums.IconName
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
	local var26 = if p3 ~= nil then nil else p3.name
	
	return if typeof(var26) == "string" and var26 ~= "" then var26 else p2
end

return function(p4)
	-- upvalues: useTokens (ref), useUniverseSummary (ref), getBuildOverflowMenuStoreModule (ref), getCreatorAgentResumeStoreModule (ref), reactModule (ref), fFlagBuildExperienceDontAskAgainPushUpsellModule (ref), buildAppStorageKeyEngineFeature (ref), var21 (ref), userInputService (ref), guiService (ref), permissionsProtocol (ref), messageBusService (ref), realtimeMessageId (ref), default (ref), creatorAgentChatModule (ref), useChatSessionCoreModule (ref), fFlagBuildExperienceFocusNewGameComposerModule (ref), useChatPlaytestFooterModule (ref), universeConfigurationModule (ref), useCreatorCreditChatUpsellViewModelModule (ref), sendBuildExperienceEventModule (ref), fFlagBuildEventsUpdate1Module (ref), t (ref), fFlagBuildExperienceAssetLibraryModule (ref), iconName (ref)
	local v
	local var27 = useTokens()
	local var28 = useUniverseSummary(p4.target.universeId)
	local var29 = getBuildOverflowMenuStoreModule()
	local var30 = getCreatorAgentResumeStoreModule()
	local var31, var32 = reactModule.useState(nil)
	local var33, var34 = reactModule.useState(false)
	local var35, var36 = reactModule.useState(nil)
	local var37, var38 = reactModule.useState(function()
		-- upvalues: fFlagBuildExperienceDontAskAgainPushUpsellModule (copy), buildAppStorageKeyEngineFeature (copy), var21 (copy)
		return fFlagBuildExperienceDontAskAgainPushUpsellModule and (buildAppStorageKeyEngineFeature and var21.isPushNotificationsUpsellDismissedPermanently())
	end)
	local var39, var40 = reactModule.useState(false)
	local var41, var42 = reactModule.useState(false)
	local var43, var44 = reactModule.useState(function()
		-- upvalues: buildAppStorageKeyEngineFeature (copy), var21 (copy)
		return buildAppStorageKeyEngineFeature and var21.wasPushNotificationsUpsellShownToday()
	end)
	local var45, var46 = reactModule.useState(false)
	local var47 = reactModule.useRef(false)
	local var48, var49 = reactModule.useState(if not userInputService.OnScreenKeyboardVisible then 0 else math.max(0, userInputService.OnScreenKeyboardPosition.Y - guiService:GetGuiInset().Y))
	local var50, var51 = reactModule.useState(0)
	local var52 = reactModule.useCallback(function()
		-- upvalues: permissionsProtocol (copy), var47 (ref), var36 (ref), var42 (ref)
		return permissionsProtocol.default:hasPermissions({ permissionsProtocol.Permissions.POST_NOTIFICATIONS }):andThen(function(p5)
			-- upvalues: var47 (copy), var36 (copy), permissionsProtocol (copy), var42 (copy)
			if var47.current then
				var36(p5.status)
				
				if p5.status == permissionsProtocol.Status.AUTHORIZED then
					var42(false)
				end
			end
		end, function() end)
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var47 (ref), var52 (ref), messageBusService (copy), realtimeMessageId (copy)
		var47.current = true
		var52()
		local var74 = messageBusService:Subscribe(realtimeMessageId, var52, false, true)
		
		return function()
			-- upvalues: var47 (copy), var74 (ref)
			var47.current = false
			var74:Disconnect()
		end
	end, { var52 })
	local var53 = reactModule.useCallback(function()
		-- upvalues: var39 (ref), var40 (ref), permissionsProtocol (copy), var47 (ref), var36 (ref), var42 (ref)
		if var39 then
			return
		end
		var40(true)
		permissionsProtocol.default:requestPermissions({ permissionsProtocol.Permissions.POST_NOTIFICATIONS }):andThen(function(p6)
			-- upvalues: var47 (copy), var36 (copy), permissionsProtocol (copy), var42 (copy), var40 (copy)
			if not var47.current then return end
			var36(p6.status)
			
			if p6.status == permissionsProtocol.Status.DENIED then
				var42(true)
			end
			var40(false)
		end, function()
			-- upvalues: var47 (copy), var40 (copy)
			if var47.current then
				var40(false)
			end
		end)
	end, { var39 })
	local var54 = reactModule.useCallback(function()
		-- upvalues: default (copy)
		default:switchToSettingsApp():catch(function() end)
	end, {})
	local var55 = reactModule.useCallback(function()
		-- upvalues: fFlagBuildExperienceDontAskAgainPushUpsellModule (copy), buildAppStorageKeyEngineFeature (copy), var21 (copy), var38 (ref)
		if fFlagBuildExperienceDontAskAgainPushUpsellModule and buildAppStorageKeyEngineFeature then
			var21.markPushNotificationsUpsellDismissedPermanently()
		end
		var38(true)
	end, {})
	local var56 = reactModule.useCallback(function()
		-- upvalues: var49 (ref), userInputService (copy), guiService (copy)
		var49(if not userInputService.OnScreenKeyboardVisible then 0 else math.max(0, userInputService.OnScreenKeyboardPosition.Y - guiService:GetGuiInset().Y))
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var56 (ref), userInputService (copy)
		var56()
		local var75 = userInputService:GetPropertyChangedSignal("OnScreenKeyboardVisible"):Connect(var56)
		local var76 = userInputService:GetPropertyChangedSignal("OnScreenKeyboardSize"):Connect(var56)
		local var77 = userInputService:GetPropertyChangedSignal("OnScreenKeyboardPosition"):Connect(var56)
		
		return function()
			-- upvalues: var75 (ref), var76 (ref), var77 (ref)
			var75:Disconnect()
			var76:Disconnect()
			var77:Disconnect()
		end
	end, { var56 })
	local var57 = reactModule.useCallback(function(p7)
		-- upvalues: var51 (ref)
		var51(p7.AbsolutePosition.Y + p7.AbsoluteSize.Y)
	end, {})
	local var58 = reactModule.useCallback(function(p8)
		-- upvalues: var34 (ref)
		local y = p8.AbsoluteWindowSize.Y
		var34(y > 0 and y < p8.AbsoluteCanvasSize.Y)
	end, {})
	local var59 = if var48 <= 0 or var50 <= 0 then 0 else math.max(0, var50 - var48)
	local var60 = p4.target.isNewGameTarget == true
	local var61 = reactModule.useMemo(function()
		-- upvalues: p4 (ref), var28 (ref)
		local t = {
			universeId = p4.target.universeId,
			placeId = p4.target.placeId,
			sessionId = p4.target.sessionId
		}
		local var79 = if var28 ~= nil then nil else var28.name
		t.experienceName = if typeof(var79) == "string" and var79 ~= "" then var79 else p4.target.experienceName
		t.isNewGameTarget = p4.target.isNewGameTarget
		t.creatorName = p4.target.creatorName
		t.gameIcon = p4.target.gameIcon
		
		return t
	end, {
		p4.target.universeId, p4.target.placeId, p4.target.sessionId,
		p4.target.experienceName, p4.target.isNewGameTarget, p4.target.creatorName,
		p4.target.gameIcon, var28
	})
	local var62 = reactModule.useCallback(function(p9)
		-- upvalues: p4 (ref), var61 (ref)
		if p4.onNavigateToResolvedTarget ~= nil then
			p4.onNavigateToResolvedTarget({
				universeId = p9.universeId,
				placeId = p9.placeId,
				sessionId = p9.sessionId,
				experienceName = var61.experienceName,
				isNewGameTarget = var61.isNewGameTarget,
				creatorName = var61.creatorName,
				gameIcon = var61.gameIcon
			})
		end
	end, {
		p4.onNavigateToResolvedTarget,
		var61.experienceName,
		var61.isNewGameTarget,
		var61.creatorName,
		var61.gameIcon
	})
	local var63, var64 = reactModule.useState({ count = 0, reason = nil })
	local var65 = useChatSessionCoreModule({
		universeId = p4.target.universeId,
		placeId = p4.target.placeId,
		sessionId = p4.target.sessionId,
		autoFocusComposer = fFlagBuildExperienceFocusNewGameComposerModule and var60,
		createUniverseOnFirstPrompt = var60,
		onProjectResolved = var62,
		onPromptFailure = reactModule.useCallback(function(p10, p11)
			-- upvalues: creatorAgentChatModule (copy), var64 (ref)
			if p10 == creatorAgentChatModule.ErrorCodes.OutOfCredits then
				var64(function(p12)
					-- upvalues: p11 (ref)
					return { count = p12.count + 1, reason = p11 }
				end)
			end
		end, {})
	})
	local var66 = useChatPlaytestFooterModule(var65, "BuildChatPlaytestCta")
	local subagentTaskState = var65.subagentTaskState
	local var67 = subagentTaskState ~= nil and #subagentTaskState.groups > 0
	local var68 = #var65.messages == 0
	local var69 = false
	
	for i, v in var65.messages do
		if v.kind == "user_message" then
			var69 = true
			break
		end
	end
	local var70 = var35 == permissionsProtocol.Status.DENIED and (not var37 and (not var43 or var45))
	local var71 = reactModule.useRef(false)
	reactModule.useEffect(function()
		-- upvalues: buildAppStorageKeyEngineFeature (copy), var70 (ref), var69 (write), var65 (ref), var45 (ref), var46 (ref), var44 (ref), var21 (copy)
		if not buildAppStorageKeyEngineFeature then
			return function() end
		end
		local isAssistantResponding = var70 and (var69 and var65.isAssistantResponding)
		
		if isAssistantResponding and not var45 then
			var46(true)
			var44(true)
			var21.markPushNotificationsUpsellShown()
		elseif not isAssistantResponding and var45 then
			var46(false)
		end
		return function() end
	end, {
		var70,
		var69,
		var65.isAssistantResponding,
		var43,
		var45
	})
	reactModule.useEffect(function()
		-- upvalues: p4 (ref), var71 (ref), var65 (ref), universeConfigurationModule (copy)
		local universeId = p4.target.universeId
		local var81 = var71.current and not var65.isAssistantResponding
		var71.current = var65.isAssistantResponding
		
		if not var81 or universeId == nil or universeId == 0 then
			return function() end
		end
		local universeConfigurationStore = universeConfigurationModule.getUniverseConfigurationStore()
		
		if universeConfigurationStore.getSummary(universeId).data(false) ~= nil then
			universeConfigurationStore.fetchSummary(universeId)
		end
		return function() end
	end, { p4.target.universeId, var65.isAssistantResponding })
	reactModule.useEffect(function()
		-- upvalues: var30 (ref), p4 (ref)
		var30.setActiveTarget({
			universeId = p4.target.universeId,
			sessionId = p4.target.sessionId
		})
		
		return function()
			-- upvalues: var30 (copy)
			var30.setActiveTarget(nil)
		end
	end, { var30, p4.target.universeId, p4.target.sessionId })
	local var72 = reactModule.useCallback(function()
		-- upvalues: var65 (ref)
		if var65.textBoxRef.current then
			var65.textBoxRef.current.releaseFocus()
		end
	end, { var65.textBoxRef })
	v = if p4.onOpenCreatorCreditPage ~= nil then nil else reactModule.useCallback(function()
		-- upvalues: var72 (ref), p4 (ref)
		var72()
		
		if p4.onOpenCreatorCreditPage ~= nil then
			p4.onOpenCreatorCreditPage()
		end
	end, { var72, p4.onOpenCreatorCreditPage })
	local var73 = useCreatorCreditChatUpsellViewModelModule({
		onOpenCreatorCreditPage = v,
		outOfCreditsPromptFailureCount = var63.count,
		outOfCreditsPromptFailureReason = var63.reason,
		isAssistantResponding = var65.isAssistantResponding
	})
	
	return {
		target = var61,
		keyboardOverlap = var59,
		onPageMetricsChanged = var57,
		selectedChipGroupName = var31,
		onChipActivated = reactModule.useCallback(function(p13)
			-- upvalues: var72 (ref), var32 (ref)
			var72()
			var32(p13)
		end, { var72 }),
		onChipBottomSheetClose = function()
			-- upvalues: var32 (ref)
			var32(nil)
		end,
		onClose = reactModule.useCallback(function()
			-- upvalues: var72 (ref), p4 (ref)
			var72()
			p4.onClose()
		end, { var72, p4.onClose }),
		onOverflowMenuAction = reactModule.useCallback(function(p14)
			-- upvalues: var72 (ref), p4 (ref)
			if p14.type == "openPage" then
				var72()
				
				if p4.onOpenConfigurationPage then
					p4.onOpenConfigurationPage(p14.page)
					
					return
				end
			elseif p14.type == "openInvitePicker" then
				var72()
				
				if p4.onOpenInvitePicker then
					p4.onOpenInvitePicker()
				end
			end
		end, { var72, p4.onOpenConfigurationPage, p4.onOpenInvitePicker }),
		onPlayActivated = reactModule.useCallback(function()
			-- upvalues: sendBuildExperienceEventModule (copy), fFlagBuildEventsUpdate1Module (copy), p4 (ref), var65 (ref)
			sendBuildExperienceEventModule(if fFlagBuildEventsUpdate1Module then "PLAYTEST_CLICK" else "PLAY_CLICK", {
				universeId = p4.target.universeId,
				placeId = var65.playtestPlaceId
			}, if fFlagBuildEventsUpdate1Module then { context = "app_header" } else nil)
			
			if var65.launchPlaytest then
				var65.launchPlaytest("BuildChatPage")
			end
		end, {
			var65.launchPlaytest,
			var65.playtestPlaceId,
			p4.target.universeId
		}),
		onOpenAgentsPage = if fFlagBuildExperienceAssetLibraryModule then if fFlagBuildExperienceAssetLibraryModule then reactModule.useCallback(function()
			-- upvalues: var72 (ref), p4 (ref)
			var72()
			
			if p4.onOpenAssetLibraryPage ~= nil then
				p4.onOpenAssetLibraryPage()
			end
		end, { var72, p4.onOpenAssetLibraryPage }) else nil else reactModule.useCallback(function()
			-- upvalues: var72 (ref), p4 (ref), subagentTaskState (ref), t (copy)
			var72()
			p4.onOpenAgentsPage(subagentTaskState or t)
		end, { var72, p4.onOpenAgentsPage, subagentTaskState }),
		agentDetailIcon = if fFlagBuildExperienceAssetLibraryModule then iconName.SquaresGridPlus else nil,
		isAgentDetailDisabled = fFlagBuildExperienceAssetLibraryModule and p4.target.universeId == nil,
		onOpenCreatorCreditPage = v,
		buildOverflowMenuStore = var29,
		messages = var65.messages,
		localToolActions = var65.localToolActions,
		clockBinding = var65.clockBinding,
		onPlaytest = var66.onPlaytest,
		isPlaytestLoading = var66.isPlaytestLoading,
		showPushNotificationsUpsell = if buildAppStorageKeyEngineFeature then var45 and var70 else var70,
		isPushNotificationsRequestPending = var39,
		shouldOpenPushNotificationsSettings = var41,
		onNotifyMe = var53,
		onOpenPushNotificationsSettings = var54,
		onNotNow = var55,
		showBuyMoreRobuxCard = var73.showBuyMoreRobuxCard,
		buyMoreRobuxCardTitle = var73.buyMoreRobuxCardTitle,
		buyMoreRobuxCardDescription = var73.buyMoreRobuxCardDescription,
		buyMoreRobuxCardPrimaryActionText = var73.buyMoreRobuxCardPrimaryActionText,
		onBuyMoreRobuxCardPrimaryAction = var73.onBuyMoreRobuxCardPrimaryAction,
		buyMoreRobuxCardSecondaryActionText = var73.buyMoreRobuxCardSecondaryActionText,
		onBuyMoreRobuxCardSecondaryAction = var73.onBuyMoreRobuxCardSecondaryAction,
		isChatEmpty = var68,
		isHistoryLoading = var65.isHistoryLoading,
		isNewGameTarget = var60,
		hasPublishedTurn = var65.hasPublishedTurn,
		hasPublishedVersion = var28 ~= nil and var28.isActive,
		hasTaskGroups = var67,
		taskState = subagentTaskState,
		scrollingFrameRef = var65.setScrollingFrame,
		onChatViewportChanged = var58,
		isChatScrollable = var33,
		composerText = var65.composerText,
		composerErrorText = var65.composerErrorText,
		onComposerChanged = var65.setComposerText,
		textBoxRef = var65.textBoxRef,
		isAssistantResponding = var65.isAssistantResponding,
		canStopAssistantResponse = var65.canStopAssistantResponse,
		canSendWhileResponding = var65.canSendWhileResponding,
		onSend = var65.sendMessage,
		onStop = var65.stopAssistantResponse,
		statusChipGap = var27.Gap.Small,
		paddingBottom = var27.Padding.Small + var59
	}
end