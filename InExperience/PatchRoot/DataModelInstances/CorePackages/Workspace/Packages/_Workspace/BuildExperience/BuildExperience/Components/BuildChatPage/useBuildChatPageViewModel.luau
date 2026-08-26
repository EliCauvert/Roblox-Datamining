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
local var1 = if buildAppStorageKeyEngineFeature then require(buildExperience.Storage.BuildAppStorage) else nil
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

local _ = function(p1, p2)
	local var2 = if p2 ~= nil then nil else p2.name
	
	return if typeof(var2) == "string" and var2 ~= "" then var2 else p1
end

return function(p1)
	-- upvalues: useTokens (ref), useUniverseSummary (ref), getBuildOverflowMenuStoreModule (ref), getCreatorAgentResumeStoreModule (ref), reactModule (ref), fFlagBuildExperienceDontAskAgainPushUpsellModule (ref), buildAppStorageKeyEngineFeature (ref), var1 (ref), userInputService (ref), guiService (ref), permissionsProtocol (ref), messageBusService (ref), realtimeMessageId (ref), default (ref), creatorAgentChatModule (ref), useChatSessionCoreModule (ref), fFlagBuildExperienceFocusNewGameComposerModule (ref), useChatPlaytestFooterModule (ref), universeConfigurationModule (ref), useCreatorCreditChatUpsellViewModelModule (ref), sendBuildExperienceEventModule (ref), fFlagBuildEventsUpdate1Module (ref), t (ref), fFlagBuildExperienceAssetLibraryModule (ref), iconName (ref)
	local v
	local var2 = useTokens()
	local var3 = useUniverseSummary(p1.target.universeId)
	local var4 = getBuildOverflowMenuStoreModule()
	local var5 = getCreatorAgentResumeStoreModule()
	local var6, var7 = reactModule.useState(nil)
	local var8, var9 = reactModule.useState(false)
	local var10, var11 = reactModule.useState(nil)
	local var12, var13 = reactModule.useState(function()
		-- upvalues: fFlagBuildExperienceDontAskAgainPushUpsellModule (copy), buildAppStorageKeyEngineFeature (copy), var1 (copy)
		return fFlagBuildExperienceDontAskAgainPushUpsellModule and (buildAppStorageKeyEngineFeature and var1.isPushNotificationsUpsellDismissedPermanently())
	end)
	local var14, var15 = reactModule.useState(false)
	local var16, var17 = reactModule.useState(false)
	local var18, var19 = reactModule.useState(function()
		-- upvalues: buildAppStorageKeyEngineFeature (copy), var1 (copy)
		return buildAppStorageKeyEngineFeature and var1.wasPushNotificationsUpsellShownToday()
	end)
	local var20, var21 = reactModule.useState(false)
	local var22 = reactModule.useRef(false)
	local var23, var24 = reactModule.useState(if not userInputService.OnScreenKeyboardVisible then 0 else math.max(0, userInputService.OnScreenKeyboardPosition.Y - guiService:GetGuiInset().Y))
	local var25, var26 = reactModule.useState(0)
	local var27 = reactModule.useCallback(function()
		-- upvalues: permissionsProtocol (copy), var22 (ref), var11 (ref), var17 (ref)
		return permissionsProtocol.default:hasPermissions({ permissionsProtocol.Permissions.POST_NOTIFICATIONS }):andThen(function(p2)
			-- upvalues: var22 (copy), var11 (copy), permissionsProtocol (copy), var17 (copy)
			if var22.current then
				var11(p2.status)
				
				if p2.status == permissionsProtocol.Status.AUTHORIZED then
					var17(false)
				end
			end
		end, function() end)
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var22 (ref), var27 (ref), messageBusService (copy), realtimeMessageId (copy)
		var22.current = true
		var27()
		local var28 = messageBusService:Subscribe(realtimeMessageId, var27, false, true)
		
		return function()
			-- upvalues: var22 (copy), var28 (ref)
			var22.current = false
			var28:Disconnect()
		end
	end, { var27 })
	local var28 = reactModule.useCallback(function()
		-- upvalues: var14 (ref), var15 (ref), permissionsProtocol (copy), var22 (ref), var11 (ref), var17 (ref)
		if var14 then
			return
		end
		var15(true)
		permissionsProtocol.default:requestPermissions({ permissionsProtocol.Permissions.POST_NOTIFICATIONS }):andThen(function(p2)
			-- upvalues: var22 (copy), var11 (copy), permissionsProtocol (copy), var17 (copy), var15 (copy)
			if not var22.current then return end
			var11(p2.status)
			
			if p2.status == permissionsProtocol.Status.DENIED then
				var17(true)
			end
			var15(false)
		end, function()
			-- upvalues: var22 (copy), var15 (copy)
			if var22.current then
				var15(false)
			end
		end)
	end, { var14 })
	local var29 = reactModule.useCallback(function()
		-- upvalues: default (copy)
		default:switchToSettingsApp():catch(function() end)
	end, {})
	local var30 = reactModule.useCallback(function()
		-- upvalues: fFlagBuildExperienceDontAskAgainPushUpsellModule (copy), buildAppStorageKeyEngineFeature (copy), var1 (copy), var13 (ref)
		if fFlagBuildExperienceDontAskAgainPushUpsellModule and buildAppStorageKeyEngineFeature then
			var1.markPushNotificationsUpsellDismissedPermanently()
		end
		var13(true)
	end, {})
	local var31 = reactModule.useCallback(function()
		-- upvalues: var24 (ref), userInputService (copy), guiService (copy)
		var24(if not userInputService.OnScreenKeyboardVisible then 0 else math.max(0, userInputService.OnScreenKeyboardPosition.Y - guiService:GetGuiInset().Y))
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var31 (ref), userInputService (copy)
		var31()
		local var32 = userInputService:GetPropertyChangedSignal("OnScreenKeyboardVisible"):Connect(var31)
		local var33 = userInputService:GetPropertyChangedSignal("OnScreenKeyboardSize"):Connect(var31)
		local var34 = userInputService:GetPropertyChangedSignal("OnScreenKeyboardPosition"):Connect(var31)
		
		return function()
			-- upvalues: var32 (ref), var33 (ref), var34 (ref)
			var32:Disconnect()
			var33:Disconnect()
			var34:Disconnect()
		end
	end, { var31 })
	local var32 = reactModule.useCallback(function(p2)
		-- upvalues: var26 (ref)
		var26(p2.AbsolutePosition.Y + p2.AbsoluteSize.Y)
	end, {})
	local var33 = reactModule.useCallback(function(p2)
		-- upvalues: var9 (ref)
		local y = p2.AbsoluteWindowSize.Y
		var9(y > 0 and y < p2.AbsoluteCanvasSize.Y)
	end, {})
	local var34 = if var23 <= 0 or var25 <= 0 then 0 else math.max(0, var25 - var23)
	local var35 = p1.target.isNewGameTarget == true
	local var36 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), var3 (ref)
		local t = {
			universeId = p1.target.universeId,
			placeId = p1.target.placeId,
			sessionId = p1.target.sessionId
		}
		local var37 = if var3 ~= nil then nil else var3.name
		t.experienceName = if typeof(var37) == "string" and var37 ~= "" then var37 else p1.target.experienceName
		t.isNewGameTarget = p1.target.isNewGameTarget
		t.creatorName = p1.target.creatorName
		t.gameIcon = p1.target.gameIcon
		
		return t
	end, {
		p1.target.universeId, p1.target.placeId, p1.target.sessionId,
		p1.target.experienceName, p1.target.isNewGameTarget, p1.target.creatorName,
		p1.target.gameIcon, var3
	})
	local var37 = reactModule.useCallback(function(p2)
		-- upvalues: p1 (ref), var36 (ref)
		if p1.onNavigateToResolvedTarget ~= nil then
			p1.onNavigateToResolvedTarget({
				universeId = p2.universeId,
				placeId = p2.placeId,
				sessionId = p2.sessionId,
				experienceName = var36.experienceName,
				isNewGameTarget = var36.isNewGameTarget,
				creatorName = var36.creatorName,
				gameIcon = var36.gameIcon
			})
		end
	end, {
		p1.onNavigateToResolvedTarget,
		var36.experienceName,
		var36.isNewGameTarget,
		var36.creatorName,
		var36.gameIcon
	})
	local var38, var39 = reactModule.useState({ count = 0, reason = nil })
	local var40 = useChatSessionCoreModule({
		universeId = p1.target.universeId,
		placeId = p1.target.placeId,
		sessionId = p1.target.sessionId,
		autoFocusComposer = fFlagBuildExperienceFocusNewGameComposerModule and var35,
		createUniverseOnFirstPrompt = var35,
		onProjectResolved = var37,
		onPromptFailure = reactModule.useCallback(function(p2, p3)
			-- upvalues: creatorAgentChatModule (copy), var39 (ref)
			if p2 == creatorAgentChatModule.ErrorCodes.OutOfCredits then
				var39(function(p4)
					-- upvalues: p3 (ref)
					return { count = p4.count + 1, reason = p3 }
				end)
			end
		end, {})
	})
	local var41 = useChatPlaytestFooterModule(var40, "BuildChatPlaytestCta")
	local subagentTaskState = var40.subagentTaskState
	local var42 = subagentTaskState ~= nil and #subagentTaskState.groups > 0
	local var43 = #var40.messages == 0
	local var44 = false
	
	for i, v in var40.messages do
		if v.kind == "user_message" then
			var44 = true
			break
		end
	end
	local var45 = var10 == permissionsProtocol.Status.DENIED and (not var12 and (not var18 or var20))
	local var46 = reactModule.useRef(false)
	reactModule.useEffect(function()
		-- upvalues: buildAppStorageKeyEngineFeature (copy), var45 (ref), var44 (write), var40 (ref), var20 (ref), var21 (ref), var19 (ref), var1 (copy)
		if not buildAppStorageKeyEngineFeature then
			return function() end
		end
		local isAssistantResponding = var45 and (var44 and var40.isAssistantResponding)
		
		if isAssistantResponding and not var20 then
			var21(true)
			var19(true)
			var1.markPushNotificationsUpsellShown()
		elseif not isAssistantResponding and var20 then
			var21(false)
		end
		return function() end
	end, {
		var45,
		var44,
		var40.isAssistantResponding,
		var18,
		var20
	})
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var46 (ref), var40 (ref), universeConfigurationModule (copy)
		local universeId = p1.target.universeId
		local var47 = var46.current and not var40.isAssistantResponding
		var46.current = var40.isAssistantResponding
		
		if not var47 or universeId == nil or universeId == 0 then
			return function() end
		end
		local universeConfigurationStore = universeConfigurationModule.getUniverseConfigurationStore()
		
		if universeConfigurationStore.getSummary(universeId).data(false) ~= nil then
			universeConfigurationStore.fetchSummary(universeId)
		end
		return function() end
	end, { p1.target.universeId, var40.isAssistantResponding })
	reactModule.useEffect(function()
		-- upvalues: var5 (ref), p1 (ref)
		var5.setActiveTarget({
			universeId = p1.target.universeId,
			sessionId = p1.target.sessionId
		})
		
		return function()
			-- upvalues: var5 (copy)
			var5.setActiveTarget(nil)
		end
	end, { var5, p1.target.universeId, p1.target.sessionId })
	local var47 = reactModule.useCallback(function()
		-- upvalues: var40 (ref)
		if var40.textBoxRef.current then
			var40.textBoxRef.current.releaseFocus()
		end
	end, { var40.textBoxRef })
	v = if p1.onOpenCreatorCreditPage ~= nil then nil else reactModule.useCallback(function()
		-- upvalues: var47 (ref), p1 (ref)
		var47()
		
		if p1.onOpenCreatorCreditPage ~= nil then
			p1.onOpenCreatorCreditPage()
		end
	end, { var47, p1.onOpenCreatorCreditPage })
	local var48 = useCreatorCreditChatUpsellViewModelModule({
		onOpenCreatorCreditPage = v,
		outOfCreditsPromptFailureCount = var38.count,
		outOfCreditsPromptFailureReason = var38.reason,
		isAssistantResponding = var40.isAssistantResponding
	})
	
	return {
		target = var36,
		keyboardOverlap = var34,
		onPageMetricsChanged = var32,
		selectedChipGroupName = var6,
		onChipActivated = reactModule.useCallback(function(p2)
			-- upvalues: var47 (ref), var7 (ref)
			var47()
			var7(p2)
		end, { var47 }),
		onChipBottomSheetClose = function()
			-- upvalues: var7 (ref)
			var7(nil)
		end,
		onClose = reactModule.useCallback(function()
			-- upvalues: var47 (ref), p1 (ref)
			var47()
			p1.onClose()
		end, { var47, p1.onClose }),
		onOverflowMenuAction = reactModule.useCallback(function(p2)
			-- upvalues: var47 (ref), p1 (ref)
			if p2.type == "openPage" then
				var47()
				
				if p1.onOpenConfigurationPage then
					p1.onOpenConfigurationPage(p2.page)
					
					return
				end
			elseif p2.type == "openInvitePicker" then
				var47()
				
				if p1.onOpenInvitePicker then
					p1.onOpenInvitePicker()
				end
			end
		end, { var47, p1.onOpenConfigurationPage, p1.onOpenInvitePicker }),
		onPlayActivated = reactModule.useCallback(function()
			-- upvalues: sendBuildExperienceEventModule (copy), fFlagBuildEventsUpdate1Module (copy), p1 (ref), var40 (ref)
			sendBuildExperienceEventModule(if fFlagBuildEventsUpdate1Module then "PLAYTEST_CLICK" else "PLAY_CLICK", {
				universeId = p1.target.universeId,
				placeId = var40.playtestPlaceId
			}, if fFlagBuildEventsUpdate1Module then { context = "app_header" } else nil)
			
			if var40.launchPlaytest then
				var40.launchPlaytest("BuildChatPage")
			end
		end, {
			var40.launchPlaytest,
			var40.playtestPlaceId,
			p1.target.universeId
		}),
		onOpenAgentsPage = if fFlagBuildExperienceAssetLibraryModule then if fFlagBuildExperienceAssetLibraryModule then reactModule.useCallback(function()
			-- upvalues: var47 (ref), p1 (ref)
			var47()
			
			if p1.onOpenAssetLibraryPage ~= nil then
				p1.onOpenAssetLibraryPage()
			end
		end, { var47, p1.onOpenAssetLibraryPage }) else nil else reactModule.useCallback(function()
			-- upvalues: var47 (ref), p1 (ref), subagentTaskState (ref), t (copy)
			var47()
			p1.onOpenAgentsPage(subagentTaskState or t)
		end, { var47, p1.onOpenAgentsPage, subagentTaskState }),
		agentDetailIcon = if fFlagBuildExperienceAssetLibraryModule then iconName.SquaresGridPlus else nil,
		isAgentDetailDisabled = fFlagBuildExperienceAssetLibraryModule and p1.target.universeId == nil,
		onOpenCreatorCreditPage = v,
		buildOverflowMenuStore = var4,
		messages = var40.messages,
		localToolActions = var40.localToolActions,
		clockBinding = var40.clockBinding,
		onPlaytest = var41.onPlaytest,
		isPlaytestLoading = var41.isPlaytestLoading,
		showPushNotificationsUpsell = if buildAppStorageKeyEngineFeature then var20 and var45 else var45,
		isPushNotificationsRequestPending = var14,
		shouldOpenPushNotificationsSettings = var16,
		onNotifyMe = var28,
		onOpenPushNotificationsSettings = var29,
		onNotNow = var30,
		showBuyMoreRobuxCard = var48.showBuyMoreRobuxCard,
		buyMoreRobuxCardTitle = var48.buyMoreRobuxCardTitle,
		buyMoreRobuxCardDescription = var48.buyMoreRobuxCardDescription,
		buyMoreRobuxCardPrimaryActionText = var48.buyMoreRobuxCardPrimaryActionText,
		onBuyMoreRobuxCardPrimaryAction = var48.onBuyMoreRobuxCardPrimaryAction,
		buyMoreRobuxCardSecondaryActionText = var48.buyMoreRobuxCardSecondaryActionText,
		onBuyMoreRobuxCardSecondaryAction = var48.onBuyMoreRobuxCardSecondaryAction,
		isChatEmpty = var43,
		isHistoryLoading = var40.isHistoryLoading,
		isNewGameTarget = var35,
		hasPublishedTurn = var40.hasPublishedTurn,
		hasPublishedVersion = var3 ~= nil and var3.isActive,
		hasTaskGroups = var42,
		taskState = subagentTaskState,
		scrollingFrameRef = var40.setScrollingFrame,
		onChatViewportChanged = var33,
		isChatScrollable = var8,
		composerText = var40.composerText,
		composerErrorText = var40.composerErrorText,
		onComposerChanged = var40.setComposerText,
		textBoxRef = var40.textBoxRef,
		isAssistantResponding = var40.isAssistantResponding,
		canStopAssistantResponse = var40.canStopAssistantResponse,
		canSendWhileResponding = var40.canSendWhileResponding,
		onSend = var40.sendMessage,
		onStop = var40.stopAssistantResponse,
		statusChipGap = var2.Gap.Small,
		paddingBottom = var2.Padding.Small + var34
	}
end