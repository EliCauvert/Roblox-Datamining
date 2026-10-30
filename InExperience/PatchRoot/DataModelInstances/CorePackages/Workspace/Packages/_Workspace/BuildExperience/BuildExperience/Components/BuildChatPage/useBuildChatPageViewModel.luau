local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local _ = require(BuildExperience.Components.ModelPicker.ModelPickerTypes)
local FFlagBuildExperienceModelPickerModule = require(BuildExperience.Flags.FFlagBuildExperienceModelPicker)
local UseBuildModelSelectionModule = require(BuildExperience.Chat.useBuildModelSelection)
local GetBuildModelSelectionStoreModule = require(BuildExperience.Stores.GetBuildModelSelectionStore)
local GuiService = game:GetService("GuiService")
local MessageBusService = game:GetService("MessageBusService")
local UserInputService = game:GetService("UserInputService")
local CreatorAgentChatModule = require(Parent.DataHydration.CreatorAgentChat)
local UniverseConfigurationModule = require(Parent.DataHydration.UniverseConfiguration)
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local _ = require(BuildExperience.Chat.chatTypes)
local UseChatPlaytestFooterModule = require(BuildExperience.Chat.useChatPlaytestFooter)
local FFlagBuildExperienceMonetizationNativeUIModule = require(BuildExperience.Flags.FFlagBuildExperienceMonetizationNativeUI)
local FFlagBuildExperienceDeveloperProductContextModule = require(BuildExperience.Flags.FFlagBuildExperienceDeveloperProductContext)
local FFlagBuildRequestPromptChipsOnEditModule = require(BuildExperience.Flags.FFlagBuildRequestPromptChipsOnEdit)
local UseBuildPromptChipRequestsModule = require(BuildExperience.Chat.useBuildPromptChipRequests)
local UseBuildPromptDraftModule = require(BuildExperience.Chat.useBuildPromptDraft)
local UseChatSessionCoreModule = require(BuildExperience.Chat.useChatSessionCore)
local SendBuildExperienceEventModule = require(BuildExperience.Telemetry.sendBuildExperienceEvent)
local GetBuildPromptChipsStoreModule = require(BuildExperience.Stores.GetBuildPromptChipsStore)
local GetBuildOverflowMenuStoreModule = require(BuildExperience.Stores.GetBuildOverflowMenuStore)
local GetCreatorAgentResumeStoreModule = require(BuildExperience.Stores.GetCreatorAgentResumeStore)
local PromptChipsStatusModule = require(BuildExperience.Stores.GetBuildPromptChipsStore.promptChipsStatus)
local _ = require(script.Parent.BuildChatPageView)
local FFlagBuildExperienceAnswerFormModule = require(BuildExperience.Flags.FFlagBuildExperienceAnswerForm)
local FFlagBuildEnableFTUXChipsModule = require(BuildExperience.Flags.FFlagBuildEnableFTUXChips)
local UseCreatorCreditChatUpsellViewModelModule = require(script.Parent.useCreatorCreditChatUpsellViewModel)
local FFlagBuildExperienceLibrary = require(Parent.SharedFlags).FFlagBuildExperienceLibrary
local FFlagBuildExperienceAnalytics = require(Parent.SharedFlags).FFlagBuildExperienceAnalytics
local FFlagBuildAdUpsellModule = require(BuildExperience.Flags.FFlagBuildAdUpsell)
local FFlagBuildAgentAdCampaignCardModule = require(BuildExperience.Flags.FFlagBuildAgentAdCampaignCard)
local UseAgentAdCampaignChatViewModelModule = if FFlagBuildAgentAdCampaignCardModule then require(script.Parent.useAgentAdCampaignChatViewModel) else nil
local FFlagEnableBuildAdPromotionModule = require(BuildExperience.Flags.FFlagEnableBuildAdPromotion)
local GetAdUpsellEventStoreModule = if FFlagBuildAdUpsellModule then require(BuildExperience.Stores.GetAdUpsellEventStore) else nil
local GameConfigurationLabelsModule = if FFlagBuildAdUpsellModule or FFlagEnableBuildAdPromotionModule then require(BuildExperience.utils.GameConfigurationLabels) else nil
local UseAdUpsellChatViewModelModule = if FFlagBuildAdUpsellModule then require(script.Parent.useAdUpsellChatViewModel) else nil
local FFlagBuildCheckGamePermissionsModule = require(BuildExperience.Flags.FFlagBuildCheckGamePermissions)
local UseGamePermissionsModule = require(BuildExperience.useGamePermissions)
local FFlagBuildEventsUpdate1Module = require(BuildExperience.Flags.FFlagBuildEventsUpdate1)
local FFlagBuildExperiencePlaytestCardPublishCtaModule = require(BuildExperience.Flags.FFlagBuildExperiencePlaytestCardPublishCta)
local FFlagBuildExperienceManageDevProductModule = require(BuildExperience.Flags.FFlagBuildExperienceManageDevProduct)
local BuildAppStorageKeyEngineFeature = game:GetEngineFeature("BuildAppStorageKey")
local BuildAppStorageModule = if BuildAppStorageKeyEngineFeature then require(BuildExperience.Storage.BuildAppStorage) else nil
local Default = require(Parent.LinkingProtocol).LinkingProtocol.default
local PermissionsProtocol = require(Parent.PermissionsProtocol).PermissionsProtocol
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens
local RealtimeMessageId = MessageBusService:GetMessageId("Realtime", "appResume")
local config = { allComplete = false, groups = {} }
local config1 = {
	adUpsellCongratsAnchorIndex = nil,
	adUpsellFreePromotionsRemaining = 0,
	isAdUpsellCreatePending = false,
	isAdCampaignSheetOpen = false,
	hasAdCampaignCreateError = false,
	adCampaignCreateErrorKind = nil,
	adCampaignDurationDays = nil,
	adCampaignEstimatedPriceRobux = nil,
	adCampaignOffers = nil,
	adCampaignRunStartTimeMs = nil,
	adCampaignRunEndTimeMs = nil,
	isAdCampaignCreatedToastVisible = false,
	adUpsellCards = {},
	onAdCampaignCreatedToastDismiss = function() end,
	onAdUpsellCreate = function() end,
	onAdUpsellDismiss = function() end,
	onAdUpsellImpression = function() end,
	onAdCampaignSheetClose = function() end,
	onAdCampaignSheetCreate = function() end
}
local config2 = {
	isSheetOpen = false,
	isCreatePending = false,
	hasCreateError = false,
	createErrorKind = nil,
	campaignOffers = nil,
	runStartTimeMs = nil,
	onOfferSelected = function() end,
	isCreateDisabled = function(): boolean
		return true
	end,
	getCardState = function()
		return nil
	end,
	onSheetClose = function() end,
	onSheetCreate = function() end
}

local function _(): number
	-- upvalues: UserInputService (copy), GuiService (copy)
	return if UserInputService.OnScreenKeyboardVisible then math.max(0, UserInputService.OnScreenKeyboardPosition.Y - GuiService:GetGuiInset().Y) else 0
end

local function useUniverseSummary(UniverseId)
	-- upvalues: UniverseConfigurationModule (copy), ReactModule (copy), SignalsModule (copy), SignalsReactModule (copy)
	local UniverseConfigurationStore = UniverseConfigurationModule.getUniverseConfigurationStore()
	
	return SignalsReactModule.useSignalState((ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval), UniverseId (copy), UniverseConfigurationStore (copy)
		return SignalsModule.createComputed(function(p1)
			-- upvalues: UniverseId (upval), UniverseConfigurationStore (upval)
			return if UniverseId == nil or UniverseId == 0 then nil else UniverseConfigurationStore.getAndFetchSummary(UniverseId).data(p1)
		end)
	end, { UniverseConfigurationStore, UniverseId })))
end

local _ = function(p1)
	-- upvalues: UniverseConfigurationModule (copy)
	local UniverseConfigurationStore = UniverseConfigurationModule.getUniverseConfigurationStore()
	
	if UniverseConfigurationStore.getSummary(p1).data(false) ~= nil then
		UniverseConfigurationStore.fetchSummary(p1)
	end
end

local function getResolvedSessionId(Messages, SessionId, UniverseId)
	if SessionId ~= nil and SessionId ~= "" then
		return SessionId
	end
	local Message = nil
	for i = #Messages, 1, -1 do
		Message = Messages[i]
		
		if Message.kind == "assistant_turn" and Message.sessionId ~= nil and (UniverseId == nil or Message.universeId == UniverseId) then
			return Message.sessionId
		end
	end
	return nil
end

local _ = function(p1, p2)
	local Name = if p2 == nil then nil else p2.name
	
	return if typeof(Name) == "string" and Name ~= "" then Name else p1
end

local function usePromptChipViewModel(p1, Target, NoCanEditOnBuild)
	-- upvalues: FFlagBuildEnableFTUXChipsModule (copy), FFlagBuildRequestPromptChipsOnEditModule (copy), GetBuildPromptChipsStoreModule (copy), ReactModule (copy), UseBuildPromptChipRequestsModule (copy), SignalsReactModule (copy), PromptChipsStatusModule (copy)
	local PromptChips = {}
	local IsPromptChipsLoading = false
	
	local function OnPromptChipActivated() end
	
	local SetComposerText = p1.setComposerText
	
	if not FFlagBuildEnableFTUXChipsModule and not FFlagBuildRequestPromptChipsOnEditModule then
		return {
			promptChips = PromptChips,
			isPromptChipsLoading = IsPromptChipsLoading,
			onPromptChipActivated = OnPromptChipActivated,
			onComposerChanged = SetComposerText
		}
	end
	local BuildPromptChipsStoreModule = GetBuildPromptChipsStoreModule()
	local IsActive: boolean = FFlagBuildEnableFTUXChipsModule and (not NoCanEditOnBuild and (p1.isHistoryHydrationComplete and (not p1.isHistoryLoading and #p1.messages == 0)))
	local UseBuildPromptChipRequestsModuleResult = UseBuildPromptChipRequestsModule(BuildPromptChipsStoreModule, {
		isActive = IsActive,
		sessionKey = `{Target.universeId or 0}:{Target.placeId or 0}:{Target.sessionId or "new"}`,
		shouldRequestInitialChips = IsActive,
		telemetryGranularity = ReactModule.useMemo(function()
			-- upvalues: Target (copy)
			return {
				universeId = Target.universeId,
				placeId = Target.placeId,
				conversationId = Target.sessionId
			}
		end, {
			Target.universeId or 0,
			Target.placeId or 0,
			Target.sessionId or ""
		})
	})
	local UseRefResult = ReactModule.useRef(nil)
	
	if FFlagBuildEnableFTUXChipsModule then
		local UseSignalStateResult = SignalsReactModule.useSignalState(BuildPromptChipsStoreModule.getChips)
		local UseSignalStateResult1 = SignalsReactModule.useSignalState(BuildPromptChipsStoreModule.getStatus)
		PromptChips = if IsActive then UseSignalStateResult else {}
		IsPromptChipsLoading = IsActive and UseSignalStateResult1 == PromptChipsStatusModule.PROMPT_CHIPS_STATUS.Loading
		OnPromptChipActivated = ReactModule.useCallback(function(p2)
			-- upvalues: p1 (copy), UseBuildPromptChipRequestsModuleResult (copy), UseRefResult (copy)
			local Value = p1.composerText:getValue()
			UseBuildPromptChipRequestsModuleResult.requestChipsForSelection(Value, p2, function(Current)
				-- upvalues: p1 (upval), Value (copy), UseRefResult (upval)
				if p1.composerText:getValue() == Value then
					UseRefResult.current = Current
					p1.setComposerText(Current)
				end
			end)
		end, {
			p1.composerText,
			p1.setComposerText,
			UseBuildPromptChipRequestsModuleResult,
			UseRefResult
		})
	end
	if FFlagBuildRequestPromptChipsOnEditModule then
		SetComposerText = ReactModule.useCallback(function(Current)
			-- upvalues: p1 (copy), UseRefResult (copy), UseBuildPromptChipRequestsModuleResult (copy)
			p1.setComposerText(Current)
			
			if UseRefResult.current == Current then
				UseRefResult.current = nil
				
				return
			else
				UseRefResult.current = nil
				UseBuildPromptChipRequestsModuleResult.requestChipsForEdit(Current)
			end
		end, {
			p1.setComposerText,
			UseBuildPromptChipRequestsModuleResult,
			UseRefResult
		})
	end
	return {
		promptChips = PromptChips,
		isPromptChipsLoading = IsPromptChipsLoading,
		onPromptChipActivated = OnPromptChipActivated,
		onComposerChanged = SetComposerText
	}
end

return function(p1)
	-- upvalues: UseTokensFunction (copy), useUniverseSummary (copy), GetBuildOverflowMenuStoreModule (copy), GetCreatorAgentResumeStoreModule (copy), ReactModule (copy), BuildAppStorageKeyEngineFeature (copy), BuildAppStorageModule (copy), UserInputService (copy), GuiService (copy), PermissionsProtocol (copy), MessageBusService (copy), RealtimeMessageId (copy), Default (copy), FFlagBuildCheckGamePermissionsModule (copy), UseGamePermissionsModule (copy), FFlagBuildExperienceModelPickerModule (copy), GetBuildModelSelectionStoreModule (copy), CreatorAgentChatModule (copy), FFlagBuildAdUpsellModule (copy), GetAdUpsellEventStoreModule (copy), UseChatSessionCoreModule (copy), usePromptChipViewModel (copy), UseBuildModelSelectionModule (copy), FFlagBuildExperienceAnalytics (copy), FFlagBuildExperienceMonetizationNativeUIModule (copy), UseBuildPromptDraftModule (copy), FFlagBuildExperienceDeveloperProductContextModule (copy), FFlagBuildExperienceManageDevProductModule (copy), UseChatPlaytestFooterModule (copy), UniverseConfigurationModule (copy), FFlagEnableBuildAdPromotionModule (copy), UseCreatorCreditChatUpsellViewModelModule (copy), GameConfigurationLabelsModule (copy), FFlagBuildExperienceLibrary (copy), getResolvedSessionId (copy), UseAdUpsellChatViewModelModule (copy), config1 (copy), FFlagBuildAgentAdCampaignCardModule (copy), UseAgentAdCampaignChatViewModelModule (copy), config2 (copy), FFlagBuildExperiencePlaytestCardPublishCtaModule (copy), SendBuildExperienceEventModule (copy), FFlagBuildEventsUpdate1Module (copy), config (copy), FFlagBuildExperienceAnswerFormModule (copy)
	local UseTokensResult = UseTokensFunction()
	local UseUniverseSummaryResult = useUniverseSummary(p1.target.universeId)
	local BuildOverflowMenuStoreModule = GetBuildOverflowMenuStoreModule()
	local CreatorAgentResumeStoreModule = GetCreatorAgentResumeStoreModule()
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(nil)
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState(function()
		-- upvalues: BuildAppStorageKeyEngineFeature (upval), BuildAppStorageModule (upval)
		return BuildAppStorageKeyEngineFeature and BuildAppStorageModule.isPushNotificationsUpsellDismissedPermanently()
	end)
	local UseStateResult5, UseStateResult2_4 = ReactModule.useState(false)
	local UseStateResult6, UseStateResult2_5 = ReactModule.useState(false)
	local UseStateResult7, UseStateResult2_6 = ReactModule.useState(function()
		-- upvalues: BuildAppStorageKeyEngineFeature (upval), BuildAppStorageModule (upval)
		return BuildAppStorageKeyEngineFeature and BuildAppStorageModule.wasPushNotificationsUpsellShownToday()
	end)
	local UseStateResult8, UseStateResult2_7 = ReactModule.useState(false)
	local UseRefResult = ReactModule.useRef(false)
	local UseStateResult9, UseStateResult2_8 = ReactModule.useState(if UserInputService.OnScreenKeyboardVisible then math.max(0, UserInputService.OnScreenKeyboardPosition.Y - GuiService:GetGuiInset().Y) else 0)
	local UseStateResult10, UseStateResult2_9 = ReactModule.useState(0)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: PermissionsProtocol (upval), UseRefResult (copy), UseStateResult2_2 (copy), UseStateResult2_5 (copy)
		return PermissionsProtocol.default:hasPermissions({ PermissionsProtocol.Permissions.POST_NOTIFICATIONS }):andThen(function(Result)
			-- upvalues: UseRefResult (upval), UseStateResult2_2 (upval), PermissionsProtocol (upval), UseStateResult2_5 (upval)
			if UseRefResult.current then
				UseStateResult2_2(Result.status)
				
				if Result.status == PermissionsProtocol.Status.AUTHORIZED then
					UseStateResult2_5(false)
				end
			end
		end, function() end)
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy), UseResult (copy), MessageBusService (upval), RealtimeMessageId (upval)
		UseRefResult.current = true
		UseResult()
		local SubscribeResult = MessageBusService:Subscribe(RealtimeMessageId, UseResult, false, true)
		
		return function()
			-- upvalues: UseRefResult (upval), SubscribeResult (copy)
			UseRefResult.current = false
			SubscribeResult:Disconnect()
		end
	end, { UseResult })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult5 (copy), UseStateResult2_4 (copy), PermissionsProtocol (upval), UseRefResult (copy), UseStateResult2_2 (copy), UseStateResult2_5 (copy)
		if not UseStateResult5 then
			UseStateResult2_4(true)
			PermissionsProtocol.default:requestPermissions({ PermissionsProtocol.Permissions.POST_NOTIFICATIONS }):andThen(function(Result)
				-- upvalues: UseRefResult (upval), UseStateResult2_2 (upval), PermissionsProtocol (upval), UseStateResult2_5 (upval), UseStateResult2_4 (upval)
				if not UseRefResult.current then return end
				UseStateResult2_2(Result.status)
				
				if Result.status == PermissionsProtocol.Status.DENIED then
					UseStateResult2_5(true)
				end
				UseStateResult2_4(false)
			end, function()
				-- upvalues: UseRefResult (upval), UseStateResult2_4 (upval)
				if UseRefResult.current then
					UseStateResult2_4(false)
				end
			end)
			
			return
		end
	end, { UseStateResult5 })
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: Default (upval)
		Default:switchToSettingsApp():catch(function() end)
	end, {})
	local UseResult3 = ReactModule.useCallback(function()
		-- upvalues: BuildAppStorageKeyEngineFeature (upval), BuildAppStorageModule (upval), UseStateResult2_3 (copy)
		if BuildAppStorageKeyEngineFeature then
			BuildAppStorageModule.markPushNotificationsUpsellDismissedPermanently()
		end
		UseStateResult2_3(true)
	end, {})
	local UseResult4 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2_8 (copy), UserInputService (upval), GuiService (upval)
		UseStateResult2_8(if UserInputService.OnScreenKeyboardVisible then math.max(0, UserInputService.OnScreenKeyboardPosition.Y - GuiService:GetGuiInset().Y) else 0)
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: UseResult4 (copy), UserInputService (upval)
		UseResult4()
		local Connection = UserInputService:GetPropertyChangedSignal("OnScreenKeyboardVisible"):Connect(UseResult4)
		local Connection1 = UserInputService:GetPropertyChangedSignal("OnScreenKeyboardSize"):Connect(UseResult4)
		local Connection2 = UserInputService:GetPropertyChangedSignal("OnScreenKeyboardPosition"):Connect(UseResult4)
		
		return function()
			-- upvalues: Connection (copy), Connection1 (copy), Connection2 (copy)
			Connection:Disconnect()
			Connection1:Disconnect()
			Connection2:Disconnect()
		end
	end, { UseResult4 })
	local UseResult5 = ReactModule.useCallback(function(Frame: Frame)
		-- upvalues: UseStateResult2_9 (copy)
		UseStateResult2_9(Frame.AbsolutePosition.Y + Frame.AbsoluteSize.Y)
	end, {})
	local UseResult6 = ReactModule.useCallback(function(ScrollFrame)
		-- upvalues: UseStateResult2_1 (copy)
		local Y: number = ScrollFrame.AbsoluteWindowSize.Y
		UseStateResult2_1(Y > 0 and Y < ScrollFrame.AbsoluteCanvasSize.Y)
	end, {})
	local Largest: number = if UseStateResult9 <= 0 or UseStateResult10 <= 0 then 0 else math.max(0, UseStateResult10 - UseStateResult9)
	local IsIsNewGameTarget = p1.target.isNewGameTarget == true
	local ChatPermissions = nil
	local NoCanEditOnBuild = false
	local v1 = false
	local NoCanEdit = false
	local NoCanEdit1 = false
	local NoCanAdvertise = false
	
	if FFlagBuildCheckGamePermissionsModule then
		local UseGamePermissionsModuleResult, UseGamePermissionsModuleResult2 = UseGamePermissionsModule({
			universeId = p1.target.universeId,
			isNewGame = IsIsNewGameTarget
		})
		ChatPermissions = UseGamePermissionsModuleResult
		NoCanEditOnBuild = not UseGamePermissionsModuleResult.canEditOnBuild
		v1 = UseGamePermissionsModuleResult2
		NoCanEdit = not UseGamePermissionsModuleResult.canEdit
		NoCanEdit1 = not UseGamePermissionsModuleResult.canEdit
		NoCanAdvertise = not UseGamePermissionsModuleResult.canAdvertise
	end
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: p1 (copy), UseUniverseSummaryResult (copy), FFlagBuildExperienceModelPickerModule (upval)
		local ExperienceName = p1.target.experienceName
		local Name = if UseUniverseSummaryResult == nil then nil else UseUniverseSummaryResult.name
		
		return {
			universeId = p1.target.universeId,
			placeId = p1.target.placeId,
			sessionId = p1.target.sessionId,
			experienceName = if typeof(Name) == "string" and Name ~= "" then Name else ExperienceName,
			isNewGameTarget = p1.target.isNewGameTarget,
			modelSelectionDraftId = if FFlagBuildExperienceModelPickerModule then p1.target.modelSelectionDraftId else nil,
			creatorName = p1.target.creatorName,
			gameIcon = p1.target.gameIcon
		}
	end, {
		p1.target.universeId, p1.target.placeId, p1.target.sessionId,
		p1.target.experienceName, p1.target.isNewGameTarget,
		p1.target.modelSelectionDraftId, p1.target.creatorName, p1.target.gameIcon,
		UseUniverseSummaryResult
	})
	local UseResult7 = ReactModule.useCallback(function(p2)
		-- upvalues: FFlagBuildExperienceModelPickerModule (upval), UseMemoResult (copy), GetBuildModelSelectionStoreModule (upval), p1 (copy)
		if FFlagBuildExperienceModelPickerModule and UseMemoResult.modelSelectionDraftId ~= nil then
			GetBuildModelSelectionStoreModule(false).promoteDraft(UseMemoResult.modelSelectionDraftId, p2.universeId)
		end
		if p1.onNavigateToResolvedTarget ~= nil then
			p1.onNavigateToResolvedTarget({
				universeId = p2.universeId,
				placeId = p2.placeId,
				sessionId = p2.sessionId,
				experienceName = UseMemoResult.experienceName,
				isNewGameTarget = UseMemoResult.isNewGameTarget,
				modelSelectionDraftId = if FFlagBuildExperienceModelPickerModule then UseMemoResult.modelSelectionDraftId else nil,
				creatorName = UseMemoResult.creatorName,
				gameIcon = UseMemoResult.gameIcon
			})
		end
	end, if FFlagBuildExperienceModelPickerModule then { p1.onNavigateToResolvedTarget, UseMemoResult } else {
		p1.onNavigateToResolvedTarget,
		UseMemoResult.experienceName,
		UseMemoResult.isNewGameTarget,
		UseMemoResult.creatorName,
		UseMemoResult.gameIcon
	})
	local UseStateResult11, UseStateResult2_10 = ReactModule.useState({ count = 0, reason = nil })
	local UseResult8 = ReactModule.useCallback(function(OutOfCredits, Reason)
		-- upvalues: CreatorAgentChatModule (upval), UseStateResult2_10 (copy)
		if OutOfCredits == CreatorAgentChatModule.ErrorCodes.OutOfCredits then
			UseStateResult2_10(function(p2)
				-- upvalues: Reason (copy)
				return { count = p2.count + 1, reason = Reason }
			end)
		end
	end, {})
	local AdUpsellEventStoreModule = if FFlagBuildAdUpsellModule then GetAdUpsellEventStoreModule(false) else nil
	local UseChatSessionCoreModuleResult = UseChatSessionCoreModule({
		universeId = p1.target.universeId,
		placeId = p1.target.placeId,
		sessionId = p1.target.sessionId,
		autoFocusComposer = IsIsNewGameTarget,
		createUniverseOnFirstPrompt = IsIsNewGameTarget,
		modelSelectionDraftId = if FFlagBuildExperienceModelPickerModule then UseMemoResult.modelSelectionDraftId else nil,
		onProjectResolved = UseResult7,
		onPromptFailure = if FFlagBuildExperienceModelPickerModule then nil else UseResult8,
		trackAdUpsellTurns = FFlagBuildAdUpsellModule,
		onAssistantTurnCompleted = if FFlagBuildAdUpsellModule then ReactModule.useCallback(function(p2)
			-- upvalues: AdUpsellEventStoreModule (copy)
			if AdUpsellEventStoreModule ~= nil then
				AdUpsellEventStoreModule.reportAssistantTurnCompleted(p2)
			end
		end, { AdUpsellEventStoreModule }) else nil,
		sendMessageWhen = not NoCanEditOnBuild
	})
	local IsChatEmpty = #UseChatSessionCoreModuleResult.messages == 0
	local UsePromptChipViewModelResult = usePromptChipViewModel(UseChatSessionCoreModuleResult, p1.target, NoCanEditOnBuild)
	local PromptChips = UsePromptChipViewModelResult.promptChips
	local IsPromptChipsLoading = UsePromptChipViewModelResult.isPromptChipsLoading
	local OnPromptChipActivated = UsePromptChipViewModelResult.onPromptChipActivated
	local OnComposerChanged = UsePromptChipViewModelResult.onComposerChanged
	local UseBuildModelSelectionModuleResult = if FFlagBuildExperienceModelPickerModule then UseBuildModelSelectionModule(p1.target.universeId, p1.target.modelSelectionDraftId, p1.modelPicker, UseChatSessionCoreModuleResult.modelSessionModels, UseChatSessionCoreModuleResult.hasPreparedModelSession, UseChatSessionCoreModuleResult.internalTesting) else nil
	
	if FFlagBuildExperienceAnalytics then
		local UseRefResult1 = ReactModule.useRef(false)
		ReactModule.useEffect(function()
			-- upvalues: p1 (copy), UseRefResult1 (copy), UseChatSessionCoreModuleResult (copy)
			local InitialPrompt = p1.initialPrompt
			
			if UseRefResult1.current or InitialPrompt == nil or InitialPrompt == "" then return end
			UseChatSessionCoreModuleResult.setComposerText(InitialPrompt)
			
			if UseChatSessionCoreModuleResult.sendMessage() then
				UseRefResult1.current = true
			end
		end, {
			p1.initialPrompt,
			UseChatSessionCoreModuleResult.sendMessage,
			UseChatSessionCoreModuleResult.setComposerText
		})
	end
	if FFlagBuildExperienceMonetizationNativeUIModule then
		UseBuildPromptDraftModule(p1.target.universeId, p1.target.sessionId, UseChatSessionCoreModuleResult.setPrefilledComposerText, UseChatSessionCoreModuleResult.sendMessage, p1.isFocused ~= false, if FFlagBuildExperienceDeveloperProductContextModule then UseChatSessionCoreModuleResult else nil)
	elseif FFlagBuildExperienceManageDevProductModule then
		UseBuildPromptDraftModule(p1.target.universeId, p1.target.sessionId, UseChatSessionCoreModuleResult.setPrefilledComposerText, UseChatSessionCoreModuleResult.sendMessage, nil, if FFlagBuildExperienceDeveloperProductContextModule then UseChatSessionCoreModuleResult else nil)
	end
	local BuildChatPlaytestCta = UseChatPlaytestFooterModule(UseChatSessionCoreModuleResult, "BuildChatPlaytestCta")
	local SubagentTaskState = UseChatSessionCoreModuleResult.subagentTaskState
	local HasTaskGroups: boolean = SubagentTaskState ~= nil and #SubagentTaskState.groups > 0
	local Flag = false
	
	for _, message in UseChatSessionCoreModuleResult.messages do
		if message.kind == "user_message" then
			Flag = true
			break
		end
	end
	local NoUseStateResult7 = UseStateResult3 == PermissionsProtocol.Status.DENIED and (not UseStateResult4 and (not UseStateResult7 or UseStateResult8))
	local UseRefResult2 = ReactModule.useRef(false)
	ReactModule.useEffect(function()
		-- upvalues: BuildAppStorageKeyEngineFeature (upval), NoUseStateResult7 (copy), Flag (ref), UseChatSessionCoreModuleResult (copy), UseStateResult8 (copy), UseStateResult2_7 (copy), UseStateResult2_6 (copy), BuildAppStorageModule (upval)
		if not BuildAppStorageKeyEngineFeature then
			return function() end
		end
		local IsAssistantResponding = NoUseStateResult7 and (Flag and UseChatSessionCoreModuleResult.isAssistantResponding)
		
		if IsAssistantResponding and not UseStateResult8 then
			UseStateResult2_7(true)
			UseStateResult2_6(true)
			BuildAppStorageModule.markPushNotificationsUpsellShown()
		elseif not IsAssistantResponding and UseStateResult8 then
			UseStateResult2_7(false)
		end
		return function() end
	end, {
		NoUseStateResult7,
		Flag,
		UseChatSessionCoreModuleResult.isAssistantResponding,
		UseStateResult7,
		UseStateResult8
	})
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), UseRefResult2 (copy), UseChatSessionCoreModuleResult (copy), FFlagBuildAdUpsellModule (upval), UseRefResult (copy), UniverseConfigurationModule (upval)
		local UniverseId = p1.target.universeId
		local NoIsAssistantResponding: boolean = UseRefResult2.current and not UseChatSessionCoreModuleResult.isAssistantResponding
		UseRefResult2.current = UseChatSessionCoreModuleResult.isAssistantResponding
		
		if not NoIsAssistantResponding or UniverseId == nil or UniverseId == 0 then
			return function() end
		end
		if FFlagBuildAdUpsellModule then
			task.defer(function()
				-- upvalues: UseRefResult (upval), UniverseId (copy), UniverseConfigurationModule (upval)
				if UseRefResult.current then
					local UniverseConfigurationStore = UniverseConfigurationModule.getUniverseConfigurationStore()
					
					if UniverseConfigurationStore.getSummary(UniverseId).data(false) ~= nil then
						UniverseConfigurationStore.fetchSummary(UniverseId)
					end
				end
			end)
		else
			local UniverseConfigurationStore = UniverseConfigurationModule.getUniverseConfigurationStore()
			
			if UniverseConfigurationStore.getSummary(UniverseId).data(false) ~= nil then
				UniverseConfigurationStore.fetchSummary(UniverseId)
			end
		end
		return function() end
	end, {
		p1.target.universeId,
		UseChatSessionCoreModuleResult.isAssistantResponding
	})
	ReactModule.useEffect(function()
		-- upvalues: FFlagBuildExperienceMonetizationNativeUIModule (upval), p1 (copy), CreatorAgentResumeStoreModule (copy)
		if FFlagBuildExperienceMonetizationNativeUIModule and p1.isFocused == false then return end
		CreatorAgentResumeStoreModule.setActiveTarget({
			universeId = p1.target.universeId,
			sessionId = p1.target.sessionId
		})
		
		return function()
			-- upvalues: CreatorAgentResumeStoreModule (upval)
			CreatorAgentResumeStoreModule.setActiveTarget(nil)
		end
	end, if FFlagBuildExperienceMonetizationNativeUIModule then {
		CreatorAgentResumeStoreModule,
		p1.target.universeId or false,
		p1.target.sessionId or false,
		p1.isFocused ~= false
	} else {
		CreatorAgentResumeStoreModule,
		p1.target.universeId,
		p1.target.sessionId
	})
	local UseResult9 = ReactModule.useCallback(function()
		-- upvalues: UseChatSessionCoreModuleResult (copy)
		if UseChatSessionCoreModuleResult.textBoxRef.current then
			UseChatSessionCoreModuleResult.textBoxRef.current.releaseFocus()
		end
	end, { UseChatSessionCoreModuleResult.textBoxRef })
	local UseResult10 = ReactModule.useCallback(function()
		-- upvalues: UseResult9 (copy), p1 (copy)
		UseResult9()
		
		if p1.onOpenCreatorCreditPage ~= nil then
			p1.onOpenCreatorCreditPage()
		end
	end, { UseResult9, p1.onOpenCreatorCreditPage })
	local UseResult11 = if p1.onOpenCreatorCreditPage == nil then nil else UseResult10
	local UseResult12 = if FFlagEnableBuildAdPromotionModule then ReactModule.useCallback(function()
		-- upvalues: UseResult9 (copy), p1 (copy)
		UseResult9()
		
		if p1.onOpenGetUsersPage ~= nil then
			p1.onOpenGetUsersPage()
		end
	end, { UseResult9, p1.onOpenGetUsersPage }) else nil
	local UseResult13 = if p1.onOpenGetUsersPage == nil then nil else UseResult12
	local UseCreatorCreditChatUpsellViewModelModuleResult = UseCreatorCreditChatUpsellViewModelModule({
		namedTier = if FFlagBuildExperienceModelPickerModule and (UseBuildModelSelectionModuleResult and UseBuildModelSelectionModuleResult.selectedId == "advanced" and (not UseBuildModelSelectionModuleResult.internalTesting or not UseBuildModelSelectionModuleResult.internalTesting.isSelected)) then "advanced" else nil,
		onOpenCreatorCreditPage = UseResult11,
		outOfCreditsPromptFailureCount = if FFlagBuildExperienceModelPickerModule then if UseChatSessionCoreModuleResult.fundingFailure then UseChatSessionCoreModuleResult.fundingFailure.count else nil else UseStateResult11.count,
		outOfCreditsPromptFailureReason = if FFlagBuildExperienceModelPickerModule then if UseChatSessionCoreModuleResult.fundingFailure then UseChatSessionCoreModuleResult.fundingFailure.reason else nil else UseStateResult11.reason,
		isAssistantResponding = UseChatSessionCoreModuleResult.isAssistantResponding
	})
	local IsAudienceMatch: boolean = if FFlagBuildAdUpsellModule then GameConfigurationLabelsModule.getAudience(UseUniverseSummaryResult) == UniverseConfigurationModule.PrivacyType.Public else FFlagEnableBuildAdPromotionModule and GameConfigurationLabelsModule.getAudience(UseUniverseSummaryResult) == UniverseConfigurationModule.PrivacyType.Public
	local ResolvedSessionId = if FFlagBuildAdUpsellModule or FFlagBuildExperienceLibrary then getResolvedSessionId(UseChatSessionCoreModuleResult.messages, p1.target.sessionId, p1.target.universeId) else nil
	local UseAdUpsellChatViewModelModuleResult = if FFlagBuildAdUpsellModule then UseAdUpsellChatViewModelModule({
		messages = UseChatSessionCoreModuleResult.messages,
		isHistoryExhausted = UseChatSessionCoreModuleResult.isHistoryExhausted,
		sessionId = ResolvedSessionId,
		isPublic = IsAudienceMatch,
		isPageVisible = p1.isFocused ~= false,
		universeId = p1.target.universeId
	}) else config1
	local UseAgentAdCampaignChatViewModelModuleResult = if FFlagBuildAgentAdCampaignCardModule then UseAgentAdCampaignChatViewModelModule({
		universeId = p1.target.universeId,
		sessionId = ResolvedSessionId,
		isPageVisible = p1.isFocused ~= false
	}) else config2
	local UseResult14 = ReactModule.useCallback(function(p2)
		-- upvalues: UseResult9 (copy), p1 (copy)
		if p2.type == "openPage" then
			UseResult9()
			
			if p1.onOpenConfigurationPage then
				p1.onOpenConfigurationPage(p2.page)
				
				return
			end
		elseif p2.type == "openInvitePicker" then
			UseResult9()
			
			if p1.onOpenInvitePicker then
				p1.onOpenInvitePicker()
				
				return
			end
		elseif p2.type == "openInviteManagement" then
			UseResult9()
			
			if p1.onOpenInviteManagement then
				p1.onOpenInviteManagement()
			end
		end
	end, {
		UseResult9,
		p1.onOpenConfigurationPage,
		p1.onOpenInvitePicker,
		p1.onOpenInviteManagement
	})
	local UseResult15 = if FFlagBuildExperiencePlaytestCardPublishCtaModule then ReactModule.useCallback(function()
		-- upvalues: UseResult14 (copy)
		UseResult14({ type = "openPage", page = "publish" })
	end, { UseResult14 }) else nil
	
	return {
		target = UseMemoResult,
		agentSpecVersion = UseChatSessionCoreModuleResult.agentSpecVersion,
		setAgentSpecVersion = UseChatSessionCoreModuleResult.setAgentSpecVersion,
		keyboardOverlap = Largest,
		onPageMetricsChanged = UseResult5,
		selectedChipGroupName = UseStateResult,
		onChipActivated = ReactModule.useCallback(function(p2)
			-- upvalues: UseResult9 (copy), UseStateResult2 (copy)
			UseResult9()
			UseStateResult2(p2)
		end, { UseResult9 }),
		onChipBottomSheetClose = function()
			-- upvalues: UseStateResult2 (copy)
			UseStateResult2(nil)
		end,
		onClose = ReactModule.useCallback(function()
			-- upvalues: UseResult9 (copy), p1 (copy)
			UseResult9()
			p1.onClose()
		end, { UseResult9, p1.onClose }),
		onOpenLibrary = ReactModule.useCallback(function()
			-- upvalues: UseResult9 (copy), p1 (copy), ResolvedSessionId (copy)
			UseResult9()
			
			if p1.onOpenLibrary ~= nil then
				p1.onOpenLibrary(ResolvedSessionId)
			end
		end, { UseResult9, p1.onOpenLibrary, ResolvedSessionId }),
		isLibraryDisabled = FFlagBuildExperienceLibrary and (p1.target.universeId == nil or NoCanEdit),
		onOverflowMenuAction = UseResult14,
		onPlayActivated = ReactModule.useCallback(function()
			-- upvalues: SendBuildExperienceEventModule (upval), FFlagBuildEventsUpdate1Module (upval), p1 (copy), UseChatSessionCoreModuleResult (copy)
			SendBuildExperienceEventModule(if FFlagBuildEventsUpdate1Module then "PLAYTEST_CLICK" else "PLAY_CLICK", {
				universeId = p1.target.universeId,
				placeId = UseChatSessionCoreModuleResult.playtestPlaceId
			}, if FFlagBuildEventsUpdate1Module then { context = "app_header" } else nil)
			
			if UseChatSessionCoreModuleResult.launchPlaytest then
				UseChatSessionCoreModuleResult.launchPlaytest("BuildChatPage")
			end
		end, {
			UseChatSessionCoreModuleResult.launchPlaytest,
			UseChatSessionCoreModuleResult.playtestPlaceId,
			p1.target.universeId
		}),
		onOpenAgentsPage = ReactModule.useCallback(function()
			-- upvalues: UseResult9 (copy), p1 (copy), SubagentTaskState (copy), config (upval)
			UseResult9()
			p1.onOpenAgentsPage(SubagentTaskState or config)
		end, { UseResult9, p1.onOpenAgentsPage, SubagentTaskState }),
		onOpenCreatorCreditPage = UseResult11,
		onOpenGetUsersPage = UseResult13,
		isUniversePublic = IsAudienceMatch,
		buildOverflowMenuStore = BuildOverflowMenuStoreModule,
		messages = UseChatSessionCoreModuleResult.messages,
		localToolActions = UseChatSessionCoreModuleResult.localToolActions,
		answerForm = if FFlagBuildExperienceAnswerFormModule then UseChatSessionCoreModuleResult.answerForm else nil,
		onSubmitAnswerText = if FFlagBuildExperienceAnswerFormModule then UseChatSessionCoreModuleResult.submitAnswerText else nil,
		clockBinding = UseChatSessionCoreModuleResult.clockBinding,
		onPlaytest = BuildChatPlaytestCta.onPlaytest,
		onPublish = if p1.onOpenConfigurationPage == nil then nil else UseResult15,
		isPlaytestLoading = BuildChatPlaytestCta.isPlaytestLoading,
		isPlaytestDisabled = NoCanEdit1,
		showPushNotificationsUpsell = if BuildAppStorageKeyEngineFeature then UseStateResult8 and NoUseStateResult7 else NoUseStateResult7,
		isPushNotificationsRequestPending = UseStateResult5,
		shouldOpenPushNotificationsSettings = UseStateResult6,
		onNotifyMe = UseResult1,
		onOpenPushNotificationsSettings = UseResult2,
		onNotNow = UseResult3,
		showBuyMoreRobuxCard = UseCreatorCreditChatUpsellViewModelModuleResult.showBuyMoreRobuxCard,
		buyMoreRobuxCardTitle = UseCreatorCreditChatUpsellViewModelModuleResult.buyMoreRobuxCardTitle,
		buyMoreRobuxCardDescription = UseCreatorCreditChatUpsellViewModelModuleResult.buyMoreRobuxCardDescription,
		buyMoreRobuxCardPrimaryActionText = UseCreatorCreditChatUpsellViewModelModuleResult.buyMoreRobuxCardPrimaryActionText,
		onBuyMoreRobuxCardPrimaryAction = UseCreatorCreditChatUpsellViewModelModuleResult.onBuyMoreRobuxCardPrimaryAction,
		buyMoreRobuxCardSecondaryActionText = UseCreatorCreditChatUpsellViewModelModuleResult.buyMoreRobuxCardSecondaryActionText,
		onBuyMoreRobuxCardSecondaryAction = UseCreatorCreditChatUpsellViewModelModuleResult.onBuyMoreRobuxCardSecondaryAction,
		adUpsellCards = UseAdUpsellChatViewModelModuleResult.adUpsellCards,
		adUpsellCongratsAnchorIndex = UseAdUpsellChatViewModelModuleResult.adUpsellCongratsAnchorIndex,
		adUpsellFreePromotionsRemaining = UseAdUpsellChatViewModelModuleResult.adUpsellFreePromotionsRemaining,
		isAdUpsellCreatePending = UseAdUpsellChatViewModelModuleResult.isAdUpsellCreatePending,
		isAdUpsellCreateDisabled = NoCanAdvertise,
		isAdCampaignSheetOpen = UseAdUpsellChatViewModelModuleResult.isAdCampaignSheetOpen,
		hasAdCampaignCreateError = UseAdUpsellChatViewModelModuleResult.hasAdCampaignCreateError,
		adCampaignCreateErrorKind = UseAdUpsellChatViewModelModuleResult.adCampaignCreateErrorKind,
		adCampaignDurationDays = UseAdUpsellChatViewModelModuleResult.adCampaignDurationDays,
		adCampaignEstimatedPriceRobux = UseAdUpsellChatViewModelModuleResult.adCampaignEstimatedPriceRobux,
		adCampaignOffers = UseAdUpsellChatViewModelModuleResult.adCampaignOffers,
		adCampaignRunStartTimeMs = UseAdUpsellChatViewModelModuleResult.adCampaignRunStartTimeMs,
		adCampaignRunEndTimeMs = UseAdUpsellChatViewModelModuleResult.adCampaignRunEndTimeMs,
		isAdCampaignCreatedToastVisible = UseAdUpsellChatViewModelModuleResult.isAdCampaignCreatedToastVisible,
		onAdCampaignCreatedToastDismiss = UseAdUpsellChatViewModelModuleResult.onAdCampaignCreatedToastDismiss,
		onAdUpsellCreate = UseAdUpsellChatViewModelModuleResult.onAdUpsellCreate,
		onAdUpsellDismiss = UseAdUpsellChatViewModelModuleResult.onAdUpsellDismiss,
		onAdUpsellImpression = UseAdUpsellChatViewModelModuleResult.onAdUpsellImpression,
		onAdCampaignSheetClose = UseAdUpsellChatViewModelModuleResult.onAdCampaignSheetClose,
		onAdCampaignSheetCreate = UseAdUpsellChatViewModelModuleResult.onAdCampaignSheetCreate,
		isAgentAdCampaignSheetOpen = UseAgentAdCampaignChatViewModelModuleResult.isSheetOpen,
		isAgentAdCampaignCreatePending = UseAgentAdCampaignChatViewModelModuleResult.isCreatePending,
		hasAgentAdCampaignCreateError = UseAgentAdCampaignChatViewModelModuleResult.hasCreateError,
		agentAdCampaignCreateErrorKind = UseAgentAdCampaignChatViewModelModuleResult.createErrorKind,
		agentAdCampaignOffers = UseAgentAdCampaignChatViewModelModuleResult.campaignOffers,
		agentAdCampaignRunStartTimeMs = UseAgentAdCampaignChatViewModelModuleResult.runStartTimeMs,
		onAgentAdCampaignOfferSelected = UseAgentAdCampaignChatViewModelModuleResult.onOfferSelected,
		getAgentAdCampaignCardState = UseAgentAdCampaignChatViewModelModuleResult.getCardState,
		isAgentAdCampaignCreateDisabled = if NoCanAdvertise then config2.isCreateDisabled else UseAgentAdCampaignChatViewModelModuleResult.isCreateDisabled,
		agentAdCampaignAttemptedOption = UseAgentAdCampaignChatViewModelModuleResult.attemptedOption,
		onAgentAdCampaignActive = if NoCanAdvertise then nil else UseResult13,
		onAgentAdCampaignSheetClose = UseAgentAdCampaignChatViewModelModuleResult.onSheetClose,
		onAgentAdCampaignSheetCreate = UseAgentAdCampaignChatViewModelModuleResult.onSheetCreate,
		isAdUpsellVisible = p1.isFocused ~= false,
		isChatEmpty = IsChatEmpty,
		isHistoryLoading = UseChatSessionCoreModuleResult.isHistoryLoading or v1,
		isNewGameTarget = IsIsNewGameTarget,
		hasPublishedTurn = UseChatSessionCoreModuleResult.hasPublishedTurn,
		hasPublishedVersion = UseUniverseSummaryResult ~= nil and UseUniverseSummaryResult.isActive,
		hasTaskGroups = HasTaskGroups,
		taskState = SubagentTaskState,
		scrollingFrameRef = UseChatSessionCoreModuleResult.setScrollingFrame,
		anchorScrollToInstance = UseChatSessionCoreModuleResult.anchorScrollToInstance,
		onChatViewportChanged = UseResult6,
		isChatScrollable = UseStateResult1,
		modelPicker = UseBuildModelSelectionModuleResult,
		composerText = UseChatSessionCoreModuleResult.composerText,
		composerErrorText = UseChatSessionCoreModuleResult.composerErrorText,
		onComposerChanged = OnComposerChanged,
		promptChips = PromptChips,
		isPromptChipsLoading = IsPromptChipsLoading,
		onPromptChipActivated = OnPromptChipActivated,
		composerImages = UseChatSessionCoreModuleResult.composerImages,
		onComposerImagesChanged = UseChatSessionCoreModuleResult.setComposerImages,
		onRetryComposerImage = UseChatSessionCoreModuleResult.retryComposerImage,
		composerResourceAttachments = UseChatSessionCoreModuleResult.composerResourceAttachments,
		onRemoveComposerResourceAttachment = UseChatSessionCoreModuleResult.removeComposerResourceAttachmentAtIndex,
		isComposerSendBlocked = UseChatSessionCoreModuleResult.isComposerSendBlocked,
		textBoxRef = UseChatSessionCoreModuleResult.textBoxRef,
		isAssistantResponding = UseChatSessionCoreModuleResult.isAssistantResponding,
		canStopAssistantResponse = UseChatSessionCoreModuleResult.canStopAssistantResponse,
		canSendWhileResponding = UseChatSessionCoreModuleResult.canSendWhileResponding,
		isChatReadOnly = NoCanEditOnBuild,
		chatPermissions = ChatPermissions,
		onSend = UseChatSessionCoreModuleResult.sendMessage,
		onStop = UseChatSessionCoreModuleResult.stopAssistantResponse,
		statusChipGap = UseTokensResult.Gap.Small,
		paddingBottom = UseTokensResult.Padding.Small + Largest
	}
end