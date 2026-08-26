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
local fFlagBuildAdUpsellModule = require(buildExperience.Flags.FFlagBuildAdUpsell)
local var1 = if fFlagBuildAdUpsellModule then require(buildExperience.Stores.GetAdUpsellEventStore) else nil
local var2 = if fFlagBuildAdUpsellModule then require(buildExperience.utils.GameConfigurationLabels) else nil
local var3 = if fFlagBuildAdUpsellModule then require(script.Parent.useAdUpsellChatViewModel) else nil
local fFlagBuildExperienceAssetLibraryModule = require(buildExperience.Flags.FFlagBuildExperienceAssetLibrary)
local fFlagEnableBuildAdPromotionModule = require(buildExperience.Flags.FFlagEnableBuildAdPromotion)
local fFlagBuildExperienceFocusNewGameComposerModule = require(buildExperience.Flags.FFlagBuildExperienceFocusNewGameComposer)
local fFlagBuildEventsUpdate1Module = require(buildExperience.Flags.FFlagBuildEventsUpdate1)
local fFlagBuildExperienceDontAskAgainPushUpsellModule = require(buildExperience.Flags.FFlagBuildExperienceDontAskAgainPushUpsell)
local buildAppStorageKeyEngineFeature = game:GetEngineFeature("BuildAppStorageKey")
local var4 = if buildAppStorageKeyEngineFeature then require(buildExperience.Storage.BuildAppStorage) else nil
local default = require(parent.LinkingProtocol).LinkingProtocol.default
local permissionsProtocol = require(parent.PermissionsProtocol).PermissionsProtocol
local iconName = foundationModule.Enums.IconName
local useTokens = foundationModule.Hooks.useTokens
local realtimeMessageId = messageBusService:GetMessageId("Realtime", "appResume")
local t = { allComplete = false, groups = {} }
local t_1 = {
	adUpsellFreePromotionsRemaining = 0,
	isAdUpsellCreatePending = false,
	isAdCampaignSheetOpen = false,
	adUpsellCards = {},
	onAdUpsellCreate = function() end,
	onAdUpsellDismiss = function() end,
	onAdUpsellImpression = function() end,
	onAdCampaignSheetClose = function() end,
	onAdCampaignSheetCreate = function() end
}

local function _()
	-- upvalues: userInputService (ref), guiService (ref)
	return if userInputService.OnScreenKeyboardVisible then math.max(0, userInputService.OnScreenKeyboardPosition.Y - guiService:GetGuiInset().Y) else 0
end

local function useUniverseSummary(p1)
	-- upvalues: universeConfigurationModule (ref), reactModule (ref), signalsModule (ref), signalsReactModule (ref)
	local universeConfigurationStore = universeConfigurationModule.getUniverseConfigurationStore()
	
	return signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), p1 (ref), universeConfigurationStore (ref)
		return signalsModule.createComputed(function(p2)
			-- upvalues: p1 (copy), universeConfigurationStore (copy)
			return if p1 == nil or p1 == 0 then nil else universeConfigurationStore.getAndFetchSummary(p1).data(p2)
		end)
	end, { universeConfigurationStore, p1 }))
end

local _ = function(p1)
	-- upvalues: universeConfigurationModule (ref)
	local universeConfigurationStore = universeConfigurationModule.getUniverseConfigurationStore()
	
	if universeConfigurationStore.getSummary(p1).data(false) ~= nil then
		universeConfigurationStore.fetchSummary(p1)
	end
end

local function getResolvedSessionId(p1, p2, p3)
	if p2 ~= nil and p2 ~= "" then
		return p2
	end
	for i = #p1, 1, -1 do
		local var5 = p1[i]
		
		if var5.kind ~= "assistant_turn" or var5.sessionId == nil or p3 ~= nil and var5.universeId ~= p3 then
			continue
		end
		return var5.sessionId
	end
	return nil
end

local _ = function(p4, p5)
	local var6 = if p5 ~= nil then nil else p5.name
	
	return if typeof(var6) == "string" and var6 ~= "" then var6 else p4
end

return function(p4)
	-- upvalues: useTokens (ref), useUniverseSummary (ref), getBuildOverflowMenuStoreModule (ref), getCreatorAgentResumeStoreModule (ref), reactModule (ref), fFlagBuildExperienceDontAskAgainPushUpsellModule (ref), buildAppStorageKeyEngineFeature (ref), var4 (ref), userInputService (ref), guiService (ref), permissionsProtocol (ref), messageBusService (ref), realtimeMessageId (ref), default (ref), creatorAgentChatModule (ref), fFlagBuildAdUpsellModule (ref), var1 (ref), useChatSessionCoreModule (ref), fFlagBuildExperienceFocusNewGameComposerModule (ref), useChatPlaytestFooterModule (ref), universeConfigurationModule (ref), fFlagEnableBuildAdPromotionModule (ref), useCreatorCreditChatUpsellViewModelModule (ref), var2 (ref), getResolvedSessionId (ref), var3 (ref), t_1 (ref), sendBuildExperienceEventModule (ref), fFlagBuildEventsUpdate1Module (ref), t (ref), fFlagBuildExperienceAssetLibraryModule (ref), iconName (ref)
	local v
	local var6 = useTokens()
	local var7 = useUniverseSummary(p4.target.universeId)
	local var8 = getBuildOverflowMenuStoreModule()
	local var9 = getCreatorAgentResumeStoreModule()
	local var10, var11 = reactModule.useState(nil)
	local var12, var13 = reactModule.useState(false)
	local var14, var15 = reactModule.useState(nil)
	local var16, var17 = reactModule.useState(function()
		-- upvalues: fFlagBuildExperienceDontAskAgainPushUpsellModule (copy), buildAppStorageKeyEngineFeature (copy), var4 (copy)
		return fFlagBuildExperienceDontAskAgainPushUpsellModule and (buildAppStorageKeyEngineFeature and var4.isPushNotificationsUpsellDismissedPermanently())
	end)
	local var18, var19 = reactModule.useState(false)
	local var20, var21 = reactModule.useState(false)
	local var22, var23 = reactModule.useState(function()
		-- upvalues: buildAppStorageKeyEngineFeature (copy), var4 (copy)
		return buildAppStorageKeyEngineFeature and var4.wasPushNotificationsUpsellShownToday()
	end)
	local var24, var25 = reactModule.useState(false)
	local var26 = reactModule.useRef(false)
	local var27, var28 = reactModule.useState(if not userInputService.OnScreenKeyboardVisible then 0 else math.max(0, userInputService.OnScreenKeyboardPosition.Y - guiService:GetGuiInset().Y))
	local var29, var30 = reactModule.useState(0)
	local var31 = reactModule.useCallback(function()
		-- upvalues: permissionsProtocol (copy), var26 (ref), var15 (ref), var21 (ref)
		return permissionsProtocol.default:hasPermissions({ permissionsProtocol.Permissions.POST_NOTIFICATIONS }):andThen(function(p5)
			-- upvalues: var26 (copy), var15 (copy), permissionsProtocol (copy), var21 (copy)
			if var26.current then
				var15(p5.status)
				
				if p5.status == permissionsProtocol.Status.AUTHORIZED then
					var21(false)
				end
			end
		end, function() end)
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var26 (ref), var31 (ref), messageBusService (copy), realtimeMessageId (copy)
		var26.current = true
		var31()
		local var32 = messageBusService:Subscribe(realtimeMessageId, var31, false, true)
		
		return function()
			-- upvalues: var26 (copy), var32 (ref)
			var26.current = false
			var32:Disconnect()
		end
	end, { var31 })
	local var32 = reactModule.useCallback(function()
		-- upvalues: var18 (ref), var19 (ref), permissionsProtocol (copy), var26 (ref), var15 (ref), var21 (ref)
		if var18 then
			return
		end
		var19(true)
		permissionsProtocol.default:requestPermissions({ permissionsProtocol.Permissions.POST_NOTIFICATIONS }):andThen(function(p5)
			-- upvalues: var26 (copy), var15 (copy), permissionsProtocol (copy), var21 (copy), var19 (copy)
			if not var26.current then return end
			var15(p5.status)
			
			if p5.status == permissionsProtocol.Status.DENIED then
				var21(true)
			end
			var19(false)
		end, function()
			-- upvalues: var26 (copy), var19 (copy)
			if var26.current then
				var19(false)
			end
		end)
	end, { var18 })
	local var33 = reactModule.useCallback(function()
		-- upvalues: default (copy)
		default:switchToSettingsApp():catch(function() end)
	end, {})
	local var34 = reactModule.useCallback(function()
		-- upvalues: fFlagBuildExperienceDontAskAgainPushUpsellModule (copy), buildAppStorageKeyEngineFeature (copy), var4 (copy), var17 (ref)
		if fFlagBuildExperienceDontAskAgainPushUpsellModule and buildAppStorageKeyEngineFeature then
			var4.markPushNotificationsUpsellDismissedPermanently()
		end
		var17(true)
	end, {})
	local var35 = reactModule.useCallback(function()
		-- upvalues: var28 (ref), userInputService (copy), guiService (copy)
		var28(if not userInputService.OnScreenKeyboardVisible then 0 else math.max(0, userInputService.OnScreenKeyboardPosition.Y - guiService:GetGuiInset().Y))
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var35 (ref), userInputService (copy)
		var35()
		local var36 = userInputService:GetPropertyChangedSignal("OnScreenKeyboardVisible"):Connect(var35)
		local var37 = userInputService:GetPropertyChangedSignal("OnScreenKeyboardSize"):Connect(var35)
		local var38 = userInputService:GetPropertyChangedSignal("OnScreenKeyboardPosition"):Connect(var35)
		
		return function()
			-- upvalues: var36 (ref), var37 (ref), var38 (ref)
			var36:Disconnect()
			var37:Disconnect()
			var38:Disconnect()
		end
	end, { var35 })
	local var36 = reactModule.useCallback(function(p5)
		-- upvalues: var30 (ref)
		var30(p5.AbsolutePosition.Y + p5.AbsoluteSize.Y)
	end, {})
	local var37 = reactModule.useCallback(function(p5)
		-- upvalues: var13 (ref)
		local y = p5.AbsoluteWindowSize.Y
		var13(y > 0 and y < p5.AbsoluteCanvasSize.Y)
	end, {})
	local var38 = if var27 <= 0 or var29 <= 0 then 0 else math.max(0, var29 - var27)
	local var39 = p4.target.isNewGameTarget == true
	local var40 = reactModule.useMemo(function()
		-- upvalues: p4 (ref), var7 (ref)
		local t = {
			universeId = p4.target.universeId,
			placeId = p4.target.placeId,
			sessionId = p4.target.sessionId
		}
		local var41 = if var7 ~= nil then nil else var7.name
		t.experienceName = if typeof(var41) == "string" and var41 ~= "" then var41 else p4.target.experienceName
		t.isNewGameTarget = p4.target.isNewGameTarget
		t.creatorName = p4.target.creatorName
		t.gameIcon = p4.target.gameIcon
		
		return t
	end, {
		p4.target.universeId, p4.target.placeId, p4.target.sessionId,
		p4.target.experienceName, p4.target.isNewGameTarget, p4.target.creatorName,
		p4.target.gameIcon, var7
	})
	local var41 = reactModule.useCallback(function(p5)
		-- upvalues: p4 (ref), var40 (ref)
		if p4.onNavigateToResolvedTarget ~= nil then
			p4.onNavigateToResolvedTarget({
				universeId = p5.universeId,
				placeId = p5.placeId,
				sessionId = p5.sessionId,
				experienceName = var40.experienceName,
				isNewGameTarget = var40.isNewGameTarget,
				creatorName = var40.creatorName,
				gameIcon = var40.gameIcon
			})
		end
	end, {
		p4.onNavigateToResolvedTarget,
		var40.experienceName,
		var40.isNewGameTarget,
		var40.creatorName,
		var40.gameIcon
	})
	local var42, var43 = reactModule.useState({ count = 0, reason = nil })
	local var44 = if fFlagBuildAdUpsellModule then var1(false) else nil
	local var45 = useChatSessionCoreModule({
		universeId = p4.target.universeId,
		placeId = p4.target.placeId,
		sessionId = p4.target.sessionId,
		autoFocusComposer = fFlagBuildExperienceFocusNewGameComposerModule and var39,
		createUniverseOnFirstPrompt = var39,
		onProjectResolved = var41,
		onPromptFailure = reactModule.useCallback(function(p5, p6)
			-- upvalues: creatorAgentChatModule (copy), var43 (ref)
			if p5 == creatorAgentChatModule.ErrorCodes.OutOfCredits then
				var43(function(p7)
					-- upvalues: p6 (ref)
					return { count = p7.count + 1, reason = p6 }
				end)
			end
		end, {}),
		trackAdUpsellTurns = fFlagBuildAdUpsellModule,
		onAssistantTurnCompleted = if fFlagBuildAdUpsellModule then reactModule.useCallback(function(p5)
			-- upvalues: var44 (ref)
			if var44 ~= nil then
				var44.reportAssistantTurnCompleted(p5)
			end
		end, { var44 }) else nil
	})
	local var46 = useChatPlaytestFooterModule(var45, "BuildChatPlaytestCta")
	local subagentTaskState = var45.subagentTaskState
	local var47 = subagentTaskState ~= nil and #subagentTaskState.groups > 0
	local var48 = #var45.messages == 0
	local var49 = false
	
	for i, v in var45.messages do
		if v.kind == "user_message" then
			var49 = true
			break
		end
	end
	local var50 = var14 == permissionsProtocol.Status.DENIED and (not var16 and (not var22 or var24))
	local var51 = reactModule.useRef(false)
	reactModule.useEffect(function()
		-- upvalues: buildAppStorageKeyEngineFeature (copy), var50 (ref), var49 (write), var45 (ref), var24 (ref), var25 (ref), var23 (ref), var4 (copy)
		if not buildAppStorageKeyEngineFeature then
			return function() end
		end
		local isAssistantResponding = var50 and (var49 and var45.isAssistantResponding)
		
		if isAssistantResponding and not var24 then
			var25(true)
			var23(true)
			var4.markPushNotificationsUpsellShown()
		elseif not isAssistantResponding and var24 then
			var25(false)
		end
		return function() end
	end, {
		var50,
		var49,
		var45.isAssistantResponding,
		var22,
		var24
	})
	reactModule.useEffect(function()
		-- upvalues: p4 (ref), var51 (ref), var45 (ref), fFlagBuildAdUpsellModule (copy), var26 (ref), universeConfigurationModule (copy)
		local universeId = p4.target.universeId
		local var52 = var51.current and not var45.isAssistantResponding
		var51.current = var45.isAssistantResponding
		
		if not var52 or universeId == nil or universeId == 0 then
			return function() end
		elseif fFlagBuildAdUpsellModule then
			task.defer(function()
				-- upvalues: var26 (copy), universeId (ref), universeConfigurationModule (copy)
				if var26.current then
					local var53 = universeId
					local universeConfigurationStore = universeConfigurationModule.getUniverseConfigurationStore()
					
					if universeConfigurationStore.getSummary(var53).data(false) ~= nil then
						universeConfigurationStore.fetchSummary(var53)
					end
				end
			end)
		else
			local universeConfigurationStore = universeConfigurationModule.getUniverseConfigurationStore()
			
			if universeConfigurationStore.getSummary(universeId).data(false) ~= nil then
				universeConfigurationStore.fetchSummary(universeId)
			end
		end
		return function() end
	end, { p4.target.universeId, var45.isAssistantResponding })
	reactModule.useEffect(function()
		-- upvalues: var9 (ref), p4 (ref)
		var9.setActiveTarget({
			universeId = p4.target.universeId,
			sessionId = p4.target.sessionId
		})
		
		return function()
			-- upvalues: var9 (copy)
			var9.setActiveTarget(nil)
		end
	end, { var9, p4.target.universeId, p4.target.sessionId })
	local var52 = reactModule.useCallback(function()
		-- upvalues: var45 (ref)
		if var45.textBoxRef.current then
			var45.textBoxRef.current.releaseFocus()
		end
	end, { var45.textBoxRef })
	v = if p4.onOpenCreatorCreditPage ~= nil then nil else reactModule.useCallback(function()
		-- upvalues: var52 (ref), p4 (ref)
		var52()
		
		if p4.onOpenCreatorCreditPage ~= nil then
			p4.onOpenCreatorCreditPage()
		end
	end, { var52, p4.onOpenCreatorCreditPage })
	local var53 = if p4.onOpenGetUsersPage ~= nil then nil elseif fFlagEnableBuildAdPromotionModule then reactModule.useCallback(function()
		-- upvalues: var52 (ref), p4 (ref)
		var52()
		
		if p4.onOpenGetUsersPage ~= nil then
			p4.onOpenGetUsersPage()
		end
	end, { var52, p4.onOpenGetUsersPage }) else nil
	local var54 = useCreatorCreditChatUpsellViewModelModule({
		onOpenCreatorCreditPage = v,
		outOfCreditsPromptFailureCount = var42.count,
		outOfCreditsPromptFailureReason = var42.reason,
		isAssistantResponding = var45.isAssistantResponding
	})
	local var55 = if fFlagBuildAdUpsellModule then var3({
		messages = var45.messages,
		isHistoryExhausted = var45.isHistoryExhausted,
		sessionId = if fFlagBuildAdUpsellModule then getResolvedSessionId(var45.messages, p4.target.sessionId, p4.target.universeId) else nil,
		isPublic = fFlagBuildAdUpsellModule and var2.getAudience(var7) == universeConfigurationModule.PrivacyType.Public,
		isPageVisible = p4.isFocused ~= false,
		universeId = p4.target.universeId
	}) else t_1
	
	return {
		target = var40,
		keyboardOverlap = var38,
		onPageMetricsChanged = var36,
		selectedChipGroupName = var10,
		onChipActivated = reactModule.useCallback(function(p5)
			-- upvalues: var52 (ref), var11 (ref)
			var52()
			var11(p5)
		end, { var52 }),
		onChipBottomSheetClose = function()
			-- upvalues: var11 (ref)
			var11(nil)
		end,
		onClose = reactModule.useCallback(function()
			-- upvalues: var52 (ref), p4 (ref)
			var52()
			p4.onClose()
		end, { var52, p4.onClose }),
		onOverflowMenuAction = reactModule.useCallback(function(p5)
			-- upvalues: var52 (ref), p4 (ref)
			if p5.type == "openPage" then
				var52()
				
				if p4.onOpenConfigurationPage then
					p4.onOpenConfigurationPage(p5.page)
					
					return
				end
			elseif p5.type == "openInvitePicker" then
				var52()
				
				if p4.onOpenInvitePicker then
					p4.onOpenInvitePicker()
				end
			end
		end, { var52, p4.onOpenConfigurationPage, p4.onOpenInvitePicker }),
		onPlayActivated = reactModule.useCallback(function()
			-- upvalues: sendBuildExperienceEventModule (copy), fFlagBuildEventsUpdate1Module (copy), p4 (ref), var45 (ref)
			sendBuildExperienceEventModule(if fFlagBuildEventsUpdate1Module then "PLAYTEST_CLICK" else "PLAY_CLICK", {
				universeId = p4.target.universeId,
				placeId = var45.playtestPlaceId
			}, if fFlagBuildEventsUpdate1Module then { context = "app_header" } else nil)
			
			if var45.launchPlaytest then
				var45.launchPlaytest("BuildChatPage")
			end
		end, {
			var45.launchPlaytest,
			var45.playtestPlaceId,
			p4.target.universeId
		}),
		onOpenAgentsPage = if fFlagBuildExperienceAssetLibraryModule then if fFlagBuildExperienceAssetLibraryModule then reactModule.useCallback(function()
			-- upvalues: var52 (ref), p4 (ref)
			var52()
			
			if p4.onOpenAssetLibraryPage ~= nil then
				p4.onOpenAssetLibraryPage()
			end
		end, { var52, p4.onOpenAssetLibraryPage }) else nil else reactModule.useCallback(function()
			-- upvalues: var52 (ref), p4 (ref), subagentTaskState (ref), t (copy)
			var52()
			p4.onOpenAgentsPage(subagentTaskState or t)
		end, { var52, p4.onOpenAgentsPage, subagentTaskState }),
		agentDetailIcon = if fFlagBuildExperienceAssetLibraryModule then iconName.SquaresGridPlus else nil,
		isAgentDetailDisabled = fFlagBuildExperienceAssetLibraryModule and p4.target.universeId == nil,
		onOpenCreatorCreditPage = v,
		onOpenGetUsersPage = var53,
		buildOverflowMenuStore = var8,
		messages = var45.messages,
		localToolActions = var45.localToolActions,
		clockBinding = var45.clockBinding,
		onPlaytest = var46.onPlaytest,
		isPlaytestLoading = var46.isPlaytestLoading,
		showPushNotificationsUpsell = if buildAppStorageKeyEngineFeature then var24 and var50 else var50,
		isPushNotificationsRequestPending = var18,
		shouldOpenPushNotificationsSettings = var20,
		onNotifyMe = var32,
		onOpenPushNotificationsSettings = var33,
		onNotNow = var34,
		showBuyMoreRobuxCard = var54.showBuyMoreRobuxCard,
		buyMoreRobuxCardTitle = var54.buyMoreRobuxCardTitle,
		buyMoreRobuxCardDescription = var54.buyMoreRobuxCardDescription,
		buyMoreRobuxCardPrimaryActionText = var54.buyMoreRobuxCardPrimaryActionText,
		onBuyMoreRobuxCardPrimaryAction = var54.onBuyMoreRobuxCardPrimaryAction,
		buyMoreRobuxCardSecondaryActionText = var54.buyMoreRobuxCardSecondaryActionText,
		onBuyMoreRobuxCardSecondaryAction = var54.onBuyMoreRobuxCardSecondaryAction,
		adUpsellCards = var55.adUpsellCards,
		adUpsellFreePromotionsRemaining = var55.adUpsellFreePromotionsRemaining,
		isAdUpsellCreatePending = var55.isAdUpsellCreatePending,
		isAdCampaignSheetOpen = var55.isAdCampaignSheetOpen,
		onAdUpsellCreate = var55.onAdUpsellCreate,
		onAdUpsellDismiss = var55.onAdUpsellDismiss,
		onAdUpsellImpression = var55.onAdUpsellImpression,
		onAdCampaignSheetClose = var55.onAdCampaignSheetClose,
		onAdCampaignSheetCreate = var55.onAdCampaignSheetCreate,
		isAdUpsellVisible = p4.isFocused ~= false,
		isChatEmpty = var48,
		isHistoryLoading = var45.isHistoryLoading,
		isNewGameTarget = var39,
		hasPublishedTurn = var45.hasPublishedTurn,
		hasPublishedVersion = var7 ~= nil and var7.isActive,
		hasTaskGroups = var47,
		taskState = subagentTaskState,
		scrollingFrameRef = var45.setScrollingFrame,
		onChatViewportChanged = var37,
		isChatScrollable = var12,
		composerText = var45.composerText,
		composerErrorText = var45.composerErrorText,
		onComposerChanged = var45.setComposerText,
		composerImages = var45.composerImages,
		onComposerImagesChanged = var45.setComposerImages,
		onRetryComposerImage = var45.retryComposerImage,
		isComposerSendBlocked = var45.isComposerSendBlocked,
		textBoxRef = var45.textBoxRef,
		isAssistantResponding = var45.isAssistantResponding,
		canStopAssistantResponse = var45.canStopAssistantResponse,
		canSendWhileResponding = var45.canSendWhileResponding,
		onSend = var45.sendMessage,
		onStop = var45.stopAssistantResponse,
		statusChipGap = var6.Gap.Small,
		paddingBottom = var6.Padding.Small + var38
	}
end