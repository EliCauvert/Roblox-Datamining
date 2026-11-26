local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local FFlagBuildExperienceModelPickerModule = require(BuildExperience.Flags.FFlagBuildExperienceModelPicker)
local FFlagBuildChatPasteAsAttachmentModule = require(BuildExperience.Flags.FFlagBuildChatPasteAsAttachment)
local FFlagBuildExperienceChatOpenIdModule = require(BuildExperience.Flags.FFlagBuildExperienceChatOpenId)
local FFlagBuildExperiencePaywallBlockTelemetryModule = require(BuildExperience.Flags.FFlagBuildExperiencePaywallBlockTelemetry)
local FFlagBuildExperiencePromptIsInExperienceTelemetryModule = require(BuildExperience.Flags.FFlagBuildExperiencePromptIsInExperienceTelemetry)
local BuildAppStorageKeyEngineFeature = game:GetEngineFeature("BuildAppStorageKey")
local FFlagBuildExperiencePrefillSkipsDraftPersistModule = require(BuildExperience.Flags.FFlagBuildExperiencePrefillSkipsDraftPersist)
local MessageBusService = game:GetService("MessageBusService")
local AppLifecycleObserverService = game:GetService("AppLifecycleObserverService")
local CreatorAgentChatModule = require(Parent.DataHydration.CreatorAgentChat)
local UniverseConfigurationModule = require(Parent.DataHydration.UniverseConfiguration)
local UniverseCreateModule = require(Parent.DataHydration.UniverseCreate)
local ReactModule = require(Parent.React)
local ReactUtilsModule = require(Parent.ReactUtils)
local SharedFlagsModule = require(Parent.SharedFlags)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local LocalizationRoactContext = require(Parent.Localization).LocalizationRoactContext
local LocalizationStringsModule = require(BuildExperience.LocalizationStrings)
local FFlagBuildExperienceChatAccordionScrollAnchorModule = require(BuildExperience.Flags.FFlagBuildExperienceChatAccordionScrollAnchor)
local FFlagBuildExperienceManageDevProductModule = require(BuildExperience.Flags.FFlagBuildExperienceManageDevProduct)
local FFlagBuildAdUpsellModule = require(BuildExperience.Flags.FFlagBuildAdUpsell)
local FFlagBuildExperienceLibrary = SharedFlagsModule.FFlagBuildExperienceLibrary
local FFlagBuildExperiencePromptFailureTelemetry = SharedFlagsModule.FFlagBuildExperiencePromptFailureTelemetry
local FFlagBuildExperienceNewGameChatDraftModule = require(BuildExperience.Flags.FFlagBuildExperienceNewGameChatDraft)
local FFlagBuildExperienceRestoreStoppedPromptModule = require(BuildExperience.Flags.FFlagBuildExperienceRestoreStoppedPrompt)
local ChatConstantsModule = require(script.Parent.chatConstants)
local ChatTypesModule = require(script.Parent.chatTypes)
local PastedTextAttachmentModule = require(script.Parent.pastedTextAttachment)
local CreatorAgentChatModule1 = require(script.Parent.creatorAgentChat)
local GetNewGameChatDraftKeyModule = require(script.Parent.getNewGameChatDraftKey)
local ParseSessionStreamModule = require(script.Parent.parseSessionStream)
local FFlagBuildExperienceAnswerFormModule = require(BuildExperience.Flags.FFlagBuildExperienceAnswerForm)
local FFlagBuildExperienceInGameShellComposer = SharedFlagsModule.FFlagBuildExperienceInGameShellComposer
local GetActiveAnswerFormModule = if FFlagBuildExperienceAnswerFormModule then require(script.Parent.getActiveAnswerForm) else nil
local SessionPromptMessageFilterModule = require(script.Parent.sessionPromptMessageFilter)
local UseAgentRollbackRequestModule = require(script.Parent.useAgentRollbackRequest)
local UseChatScrollModule = require(script.Parent.useChatScroll)
local BuildAgentRollbackPromptModule = require(BuildExperience.utils.buildAgentRollbackPrompt)
local BeginBuildModelSendModule = require(script.Parent.beginBuildModelSend)
local UseBuildModelSessionModule = require(script.Parent.useBuildModelSession)
local _ = require(BuildExperience.Components.ModelPicker.ModelPickerTypes)
local GetBuildCreatorCreditRefreshStoreModule = require(BuildExperience.Stores.GetBuildCreatorCreditRefreshStore)
local LocalUserIdStore = require(Parent.LocalUserIdStore).LocalUserIdStore
local CreatorCreditModule = require(Parent.DataHydration.CreatorCredit)
local GetBuildModelSelectionStoreModule = require(BuildExperience.Stores.GetBuildModelSelectionStore)
local GetAgentRollbackRequestStoreModule = require(BuildExperience.Stores.GetAgentRollbackRequestStore)
local GetPlaytestLoadingStoreModule = require(Parent.BuildExperiencePlaytestLaunch.GetPlaytestLoadingStore)
local _ = require(Parent.BuildExperiencePlaytestLaunch.createPlaytestLoadingStore)
local GetDefaultTemplatePlaceIdModule = require(BuildExperience.utils.getDefaultTemplatePlaceId)
local LaunchPlaytestWithLoadingStateModule = require(Parent.BuildExperiencePlaytestLaunch.launchPlaytestWithLoadingState)
local IsEnabled = CreatorAgentChatModule.experimentOverride.isEnabled()
local UseBuildInternalTestingModule = if FFlagBuildExperienceModelPickerModule and IsEnabled then require(script.Parent.useBuildInternalTesting) else nil
local BuildAppStorageModule = if BuildAppStorageKeyEngineFeature then require(BuildExperience.Storage.BuildAppStorage) else nil
local UploadCaptureAsyncModule = require(BuildExperience.utils.uploadCaptureAsync)
local Debug = CreatorAgentChatModule.debug
local RequestFailureKind = CreatorAgentChatModule.RequestFailureKind
local SendBuildExperienceEventModule = require(BuildExperience.Telemetry.sendBuildExperienceEvent)
local Signal = SignalsModule.createSignal(false)

local function noopSetAgentSpecVersion(_) end

local GameMessageId = MessageBusService:GetMessageId("Game", "onGameLeave")
local Signal1 = SignalsModule.createSignal({
	submittedToolCallIds = {},
	askUserByToolCallId = {},
	planByToolCallId = {},
	devProductByToolCallId = {}
})
local Signal2 = SignalsModule.createSignal({
	onAnswerSelectedByToolCallId = {},
	onAnswerConfirmedByToolCallId = {},
	onPlanAcceptedByToolCallId = {},
	onDevProductApprovedByToolCallId = {},
	onDevProductRejectedByToolCallId = {}
})
local Signal3 = SignalsModule.createSignal(nil)
local Signal4 = SignalsModule.createSignal({ session = nil, sessionId = nil, events = {} })

local function _(p1, Session, CasSessionId): boolean
	return p1 ~= nil and p1.session == Session and (CasSessionId == nil or CasSessionId == "" or (p1.sessionId == CasSessionId or p1.sessionId == nil and p1.session.getCasSessionId() == CasSessionId))
end

local _ = function(p1, UniverseId, SessionId): boolean
	local NoSessionId: boolean = p1.sessionId == nil or (SessionId == nil or p1.sessionId == SessionId)
	
	return (p1.universeId == nil or (UniverseId == nil or p1.universeId == UniverseId)) and NoSessionId
end

local _ = function(p1)
	return if p1.kind == "assistant_turn" and p1.isDone and p1.isOptimisticallyCancelled ~= true and p1.turnState ~= nil then p1.endSequenceId or p1.startSequenceId else nil
end

local _ = function(p1)
	local TurnFeedbackIds = p1.turnFeedbackIds
	
	return if TurnFeedbackIds == nil or typeof(TurnFeedbackIds) == "function" then nil else TurnFeedbackIds.turnId
end

local function noteLiveAdUpsellTurns(Current, Messages)
	for _, message in Messages do
		if message.kind == "assistant_turn" and message.startSequenceId ~= nil then
			local TurnFeedbackIds = message.turnFeedbackIds
			local TurnId = if TurnFeedbackIds == nil or typeof(TurnFeedbackIds) == "function" then nil else TurnFeedbackIds.turnId
			local IsLiveTurnId: boolean = TurnId ~= nil and Current.liveTurnIds[TurnId] == true
			local HistoryWatermarkSequenceId = Current.historyWatermarkSequenceId
			local IsHistoryWatermarkSequenceIdBelow: boolean = not message.isDone and (HistoryWatermarkSequenceId ~= nil and HistoryWatermarkSequenceId < message.startSequenceId)
			
			if IsLiveTurnId or IsHistoryWatermarkSequenceIdBelow then
				Current.liveTurnStartSequenceIds[message.startSequenceId] = true
			end
		end
	end
end

local function hasPendingLocalToolResponse(UseSignalStateResult): boolean
	-- upvalues: FFlagBuildExperienceManageDevProductModule (copy)
	for i in UseSignalStateResult.askUserByToolCallId do
		if not UseSignalStateResult.submittedToolCallIds[i] then
			return true
		end
	end
	for i1 in UseSignalStateResult.planByToolCallId do
		if not UseSignalStateResult.submittedToolCallIds[i1] then
			return true
		end
	end
	if FFlagBuildExperienceManageDevProductModule then
		for i2 in UseSignalStateResult.devProductByToolCallId do
			if not UseSignalStateResult.submittedToolCallIds[i2] then
				return true
			end
		end
	end
	return false
end

local _ = function(Text: string): string
	return string.gsub(Text, "^%s*(.-)%s*$", "%1")
end

local _ = function(p1, p2)
	local v1 = 8
	
	local function tryFocus()
		-- upvalues: p2 (copy), p1 (copy), v1 (ref), tryFocus (copy)
		if p2() then return end
		local Current = p1.current
		
		if Current then
			Current.focus()
			
			return
		end
		v1 -= 1
		
		if v1 > 0 then
			task.delay(0, tryFocus)
		end
	end
	
	task.defer(tryFocus)
end

local _ = function(Current)
	local CasSessionId = Current.getCasSessionId()
	
	if typeof(CasSessionId) == "string" and CasSessionId ~= "" then
		return CasSessionId
	else
		local UniverseId = Current.universeId
		local PlaceId = Current.placeId
		
		return if UniverseId == nil or PlaceId == nil then nil else `{UniverseId}:{PlaceId}`
	end
end

local _ = function(p1, Enabled, p2, p3, SetupErrorText)
	local v1: boolean = Enabled == true and p2 == nil and p3 ~= nil
	
	return if p1 == nil and not v1 then nil else { setupErrorText = SetupErrorText }
end

return function(p1)
	-- upvalues: FFlagBuildExperienceModelPickerModule (copy), ReactModule (copy), GetBuildCreatorCreditRefreshStoreModule (copy), LocalizationRoactContext (copy), LocalizationStringsModule (copy), SignalsReactModule (copy), LocalUserIdStore (copy), FFlagBuildExperienceLibrary (copy), FFlagBuildAdUpsellModule (copy), CreatorAgentChatModule (copy), GetAgentRollbackRequestStoreModule (copy), UseBuildModelSessionModule (copy), Signal4 (copy), SignalsModule (copy), noopSetAgentSpecVersion (copy), IsEnabled (copy), UseBuildInternalTestingModule (copy), Signal1 (copy), Signal2 (copy), Signal3 (copy), ParseSessionStreamModule (copy), SessionPromptMessageFilterModule (copy), Signal (copy), hasPendingLocalToolResponse (copy), noteLiveAdUpsellTurns (copy), FFlagBuildExperienceInGameShellComposer (copy), FFlagBuildExperiencePrefillSkipsDraftPersistModule (copy), BuildAppStorageKeyEngineFeature (copy), FFlagBuildExperienceNewGameChatDraftModule (copy), FFlagBuildExperienceRestoreStoppedPromptModule (copy), ReactUtilsModule (copy), UseChatScrollModule (copy), GetPlaytestLoadingStoreModule (copy), MessageBusService (copy), GameMessageId (copy), BuildAppStorageModule (copy), AppLifecycleObserverService (copy), GetNewGameChatDraftKeyModule (copy), ChatTypesModule (copy), FFlagBuildChatPasteAsAttachmentModule (copy), UploadCaptureAsyncModule (copy), FFlagBuildExperienceAnswerFormModule (copy), CreatorAgentChatModule1 (copy), BeginBuildModelSendModule (copy), CreatorCreditModule (copy), FFlagBuildExperiencePaywallBlockTelemetryModule (copy), FFlagBuildExperienceChatOpenIdModule (copy), SendBuildExperienceEventModule (copy), FFlagBuildExperiencePromptIsInExperienceTelemetryModule (copy), BuildAgentRollbackPromptModule (copy), UseAgentRollbackRequestModule (copy), GetBuildModelSelectionStoreModule (copy), UniverseCreateModule (copy), GetDefaultTemplatePlaceIdModule (copy), Debug (copy), FFlagBuildExperiencePromptFailureTelemetry (copy), UniverseConfigurationModule (copy), ChatConstantsModule (copy), RequestFailureKind (copy), PastedTextAttachmentModule (copy), LaunchPlaytestWithLoadingStateModule (copy), GetActiveAnswerFormModule (copy), FFlagBuildExperienceChatAccordionScrollAnchorModule (copy)
	if FFlagBuildExperienceModelPickerModule then
		ReactModule.useEffect(function()
			-- upvalues: GetBuildCreatorCreditRefreshStoreModule (upval)
			return GetBuildCreatorCreditRefreshStoreModule(false).acquire()
		end, {})
	end
	local UseContextResult = ReactModule.useContext(LocalizationRoactContext)
	local FormatResult = UseContextResult:Format(LocalizationStringsModule.CHAT_CREATE_UNIVERSE_ERROR)
	local FormatResult1 = UseContextResult:Format(LocalizationStringsModule.CHAT_CAPTURE_UPLOAD_ERROR)
	local UseSignalStateResult = if FFlagBuildExperienceModelPickerModule then SignalsReactModule.useSignalState(LocalUserIdStore.getCurrentUserId) else nil
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(nil)
	local UseStateResult3 = if FFlagBuildExperienceModelPickerModule and UseStateResult ~= nil and UseStateResult.accountId ~= UseSignalStateResult then nil else UseStateResult
	local UseStateResult4 = if FFlagBuildExperienceModelPickerModule and UseStateResult1 ~= nil and UseStateResult1.accountId ~= UseSignalStateResult then nil else UseStateResult1
	local UseRefResult = ReactModule.useRef(true)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseRefResult (copy)
		return UseRefResult.current
	end, { UseRefResult })
	local PlaceId = p1.placeId
	local UniverseId = p1.universeId
	local SessionId = p1.sessionId
	
	if UseStateResult3 ~= nil then
		PlaceId = UseStateResult3.placeId
		UniverseId = UseStateResult3.universeId
		SessionId = UseStateResult3.sessionId
	end
	if (SessionId == nil or SessionId == "") and (UseStateResult4 ~= nil and UseStateResult4.universeId == UniverseId and UseStateResult4.placeId == PlaceId) then
		SessionId = UseStateResult4.sessionId
	end
	local NoHydrateHistoryWhen = p1.hydrateHistoryWhen == nil or p1.hydrateHistoryWhen
	local NoSendMessageWhen = p1.sendMessageWhen == nil or p1.sendMessageWhen
	local IsIsLibraryChat: boolean = FFlagBuildExperienceLibrary and p1.isLibraryChat == true
	local Current = if FFlagBuildAdUpsellModule then ReactModule.useRef(p1.trackAdUpsellTurns == true).current else false
	local CreatorAgentChatStore = CreatorAgentChatModule.getCreatorAgentChatStore()
	local AgentRollbackRequestStoreModule = GetAgentRollbackRequestStoreModule()
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UniverseId (ref), CreatorAgentChatStore (copy), PlaceId (ref), SessionId (ref)
		return if UniverseId == nil then nil else CreatorAgentChatStore.getSessionForProject(UniverseId, PlaceId, SessionId)
	end, {
		UniverseId,
		PlaceId,
		SessionId,
		CreatorAgentChatStore,
		UseSignalStateResult
	})
	ReactModule.useLayoutEffect(function()
		-- upvalues: UseMemoResult (copy), SessionId (ref)
		if UseMemoResult ~= nil and SessionId ~= nil and SessionId ~= "" then
			UseMemoResult.setCasSessionId(SessionId)
			
			return
		end
	end, { UseMemoResult, SessionId })
	local UseMemoResult1 = nil
	local v1 = nil
	local v2 = false
	local v3 = nil
	
	if FFlagBuildExperienceModelPickerModule then
		local UseRefResult1 = ReactModule.useRef(true)
		v1 = UseRefResult1
		ReactModule.useLayoutEffect(function()
			-- upvalues: UseRefResult1 (copy)
			UseRefResult1.current = true
			
			return function()
				-- upvalues: UseRefResult1 (upval)
				UseRefResult1.current = false
			end
		end, { UseRefResult1 })
		UseMemoResult1 = ReactModule.useMemo(function()
			return { pending = false, mounted = true }
		end, {
			UseSignalStateResult,
			p1.modelSelectionDraftId,
			p1.universeId,
			p1.placeId,
			p1.sessionId
		})
		v2, v116 = ReactModule.useState(false)
		local UseMemoResult2 = UseMemoResult1
		local Callback = v3
		ReactModule.useLayoutEffect(function()
			-- upvalues: UseMemoResult2 (copy), Callback (copy)
			UseMemoResult2.mounted = true
			Callback(false)
			
			return function()
				-- upvalues: UseMemoResult2 (upval)
				UseMemoResult2.mounted = false
			end
		end, { UseMemoResult2, Callback })
	end
	local UseBuildModelSessionModuleResult = if FFlagBuildExperienceModelPickerModule then UseBuildModelSessionModule(UniverseId, p1.modelSelectionDraftId, UseMemoResult) else nil
	local UseSignalStateResult1 = SignalsReactModule.useSignalState((ReactModule.useMemo(function()
		-- upvalues: UseMemoResult (copy), Signal4 (upval), SignalsModule (upval)
		return if UseMemoResult == nil then Signal4 else SignalsModule.createComputed(function(p2)
			-- upvalues: UseMemoResult (upval)
			return {
				session = UseMemoResult,
				sessionId = UseMemoResult.getCasSessionId(),
				events = UseMemoResult.getMergedHistory(p2)
			}
		end)
	end, { UseMemoResult })))
	local CasSessionId = if UseMemoResult == nil then nil else UseMemoResult.getCasSessionId()
	local PreviewHash = nil
	local UseResult1: (any) -> () = noopSetAgentSpecVersion
	local v4 = nil
	local v5 = nil
	local InternalTesting = nil
	
	if FFlagBuildExperienceModelPickerModule and IsEnabled then
		InternalTesting, v124 = UseBuildInternalTestingModule(if UseBuildModelSessionModuleResult == nil then nil else UseBuildModelSessionModuleResult.entry, UseMemoResult, p1.sessionId)
		PreviewHash = if InternalTesting == nil then nil else InternalTesting.previewHash
		
		UseResult1 = function(p2)
			-- upvalues: InternalTesting (ref)
			if InternalTesting ~= nil then
				InternalTesting.onSelect()
				InternalTesting.onSaveSpec(p2, InternalTesting.previewSpecName)
			end
		end
	elseif IsEnabled then
		local UseRefResult6 = ReactModule.useRef(nil)
		
		if UseRefResult6.current == nil then
			UseRefResult6.current = CreatorAgentChatModule.experimentOverride.createPendingKey()
		end
		local Current1 = UseRefResult6.current
		v4 = Current1
		local UseRefResult7 = ReactModule.useRef(false)
		v5 = UseRefResult7
		local Key = CreatorAgentChatModule.experimentOverride.getKey(CasSessionId) or Current1
		PreviewHash = SignalsReactModule.useSignalState((ReactModule.useMemo(function()
			-- upvalues: CreatorAgentChatModule (upval), Key (copy)
			return CreatorAgentChatModule.experimentOverride.getStateSignal(Key)
		end, { Key }))).specVersion
		UseResult1 = ReactModule.useCallback(function(p2)
			-- upvalues: UseMemoResult (copy), CreatorAgentChatModule (upval), Current1 (copy), UseRefResult7 (copy)
			local Key = CreatorAgentChatModule.experimentOverride.getKey(if UseMemoResult == nil then nil else UseMemoResult.getCasSessionId())
			
			if Key == nil then
				Key = Current1
				UseRefResult7.current = true
				
				if UseMemoResult ~= nil then
					UseMemoResult.setPendingExperimentKey(Current1)
				end
			end
			CreatorAgentChatModule.experimentOverride.set(Key, p2)
		end, { UseMemoResult, Current1 })
		ReactModule.useEffect(function()
			-- upvalues: UseMemoResult (copy), UseRefResult7 (copy), Current1 (copy)
			if UseMemoResult ~= nil and UseRefResult7.current then
				UseMemoResult.setPendingExperimentKey(Current1)
				
				return
			end
		end, { UseMemoResult, Current1 })
		ReactModule.useEffect(function()
			-- upvalues: CreatorAgentChatModule (upval), Current1 (copy)
			return function()
				-- upvalues: CreatorAgentChatModule (upval), Current1 (upval)
				CreatorAgentChatModule.experimentOverride.clear(Current1)
			end
		end, { Current1 })
	end
	local Events = if UseSignalStateResult1.session == UseMemoResult and UseSignalStateResult1.sessionId == CasSessionId then UseSignalStateResult1.events else {}
	local IsNotSessionIdMatch: boolean = SessionId ~= nil and SessionId ~= "" or UniverseId ~= nil and UniverseId ~= 0
	local Inverted: boolean = NoHydrateHistoryWhen and (UseMemoResult ~= nil and (IsNotSessionIdMatch and not (UseMemoResult.hasLoadedHistory() and #Events > 0)))
	local UseStateResult2_2 = nil
	local UseStateResult5
	UseStateResult5, UseStateResult2_2 = ReactModule.useState(function()
		-- upvalues: UseMemoResult (copy), SessionId (ref), UniverseId (ref), NoHydrateHistoryWhen (copy), Inverted (copy)
		return {
			session = UseMemoResult,
			sessionId = SessionId,
			universeId = UniverseId,
			hydrateHistoryWhen = NoHydrateHistoryWhen,
			isLoading = Inverted
		}
	end)
	local IsHydrateHistoryWhenMatch: boolean = UseStateResult5 ~= nil and (UseStateResult5.session == UseMemoResult and (UseStateResult5.sessionId == SessionId and UseStateResult5.universeId == UniverseId) and UseStateResult5.hydrateHistoryWhen == NoHydrateHistoryWhen)
	local NoIsLoading: boolean = if IsHydrateHistoryWhenMatch then not UseStateResult5.isLoading else not Inverted
	local NoNoIsLoading: boolean = not NoIsLoading or UseMemoResult ~= nil and UseMemoResult.getNextHistoryPageToken() ~= nil
	local UseStateResult6, UseStateResult2_3 = ReactModule.useState(nil)
	local UseStateResult7, UseStateResult2_4 = ReactModule.useState(nil)
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult2_4 (copy)
		UseStateResult2_4(nil)
	end, { UseMemoResult, SessionId })
	local SessionId1 = SessionId
	local NoSessionId: boolean = UseStateResult7 ~= nil and UseStateResult7.session == UseMemoResult and (SessionId1 == nil or SessionId1 == "" or (UseStateResult7.sessionId == SessionId1 or UseStateResult7.sessionId == nil and UseStateResult7.session.getCasSessionId() == SessionId1))
	local UseStateResult8 = if NoSessionId then UseStateResult7 else nil
	local UseStateResult9, UseStateResult2_5 = ReactModule.useState(nil)
	local UseRefResult2 = ReactModule.useRef(nil)
	local UseRefResult3 = ReactModule.useRef(nil)
	local UseRefResult4 = ReactModule.useRef(0)
	local UseRefResult5 = nil
	local v6 = false
	local Callback2 = nil
	
	if FFlagBuildExperienceModelPickerModule then
		UseRefResult5 = ReactModule.useRef(nil)
		v6, Callback2 = ReactModule.useState(false)
		local UseRefResult8 = UseRefResult5
		local Callback1 = Callback2
		ReactModule.useLayoutEffect(function()
			-- upvalues: IsEnabled (upval), UseRefResult8 (copy), UseRefResult3 (copy), p1 (copy), Callback1 (copy), UseStateResult2_3 (copy)
			if IsEnabled and UseRefResult8.current ~= nil and not UseRefResult8.current.started and UseRefResult3.current ~= nil and p1.sessionId ~= nil and p1.sessionId ~= "" and UseRefResult3.current.sessionId ~= p1.sessionId then
				UseRefResult8.current.attempt.release()
				UseRefResult8.current = nil
			end
			if UseRefResult8.current == nil then
				Callback1(false)
				UseStateResult2_3(nil)
			end
			return function()
				-- upvalues: UseRefResult8 (upval)
				local Current = UseRefResult8.current
				
				if Current ~= nil and (not Current.started or not Current.attempt.isCurrent()) then
					Current.attempt.release()
					UseRefResult8.current = nil
					
					if Current.onTerminal ~= nil then
						Current.onTerminal()
					end
				end
			end
		end, {
			if UseBuildModelSessionModuleResult == nil then nil else UseBuildModelSessionModuleResult.entry,
			p1.sessionId,
			Callback1,
			UseStateResult2_3
		})
	end
	local UseRefResult9 = ReactModule.useRef(nil)
	local UseResult3 = ReactModule.useCallback(function(Current, Session)
		-- upvalues: UseRefResult2 (copy), UseRefResult3 (copy), UseStateResult2_5 (copy)
		assert(Current == nil or Session ~= nil, "Active turns require an owning session")
		UseRefResult2.current = Current
		UseRefResult3.current = if Current == nil then nil else { session = Session, sessionId = Session.getCasSessionId() }
		UseStateResult2_5(Current)
	end, { UseStateResult2_5 })
	local Current2 = UseRefResult3.current
	local SessionId2 = SessionId
	local NoSessionId1: boolean = Current2 ~= nil and Current2.session == UseMemoResult and (SessionId2 == nil or SessionId2 == "" or (Current2.sessionId == SessionId2 or Current2.sessionId == nil and Current2.session.getCasSessionId() == SessionId2))
	local UseStateResult10 = if NoSessionId1 then UseStateResult9 else nil
	local UseSignalStateResult2 = SignalsReactModule.useSignalState(if UseStateResult10 == nil then Signal1 else UseStateResult10.getOptimisticLocalTools)
	local UseSignalStateResult3 = SignalsReactModule.useSignalState(if UseStateResult10 == nil then Signal2 else UseStateResult10.getLocalToolActions)
	local UseSignalStateResult4 = SignalsReactModule.useSignalState(if UseStateResult10 == nil then Signal3 else UseStateResult10.getSetupErrorText)
	local UseSignalStateResult5 = nil
	UseSignalStateResult5 = if UseSignalStateResult4 == nil then UseSignalStateResult4 else UseContextResult:Format(UseSignalStateResult4)
	local UseMemoResult3 = ReactModule.useMemo(function()
		-- upvalues: UseStateResult10 (copy), p1 (copy), UseMemoResult (copy), UseStateResult6 (copy), UseSignalStateResult5 (ref)
		local SetupErrorText = UseSignalStateResult5
		local HasUseStateResult: boolean = p1.createUniverseOnFirstPrompt == true and UseMemoResult == nil and UseStateResult6 ~= nil
		
		return if UseStateResult10 == nil and not HasUseStateResult then nil else { setupErrorText = SetupErrorText }
	end, {
		UseStateResult10,
		p1.createUniverseOnFirstPrompt,
		UseStateResult6,
		UseMemoResult,
		UseSignalStateResult5
	})
	local UseMemoResult4 = ReactModule.useMemo(function()
		-- upvalues: ParseSessionStreamModule (upval), Events (copy), UseMemoResult (copy), SessionId (ref), UniverseId (ref), PlaceId (ref), UseSignalStateResult2 (copy), UseStateResult6 (copy), SessionPromptMessageFilterModule (upval), UseMemoResult3 (copy), UseStateResult8 (copy)
		return ParseSessionStreamModule(Events, {
			sessionId = if UseMemoResult == nil then SessionId else UseMemoResult.getCasSessionId() or SessionId,
			universeId = if UseMemoResult == nil then UniverseId else UseMemoResult.universeId,
			placeId = if UseMemoResult == nil then PlaceId else UseMemoResult.placeId,
			optimisticLocalTools = UseSignalStateResult2,
			pendingUserMessage = if UseStateResult6 == nil or not SessionPromptMessageFilterModule.shouldOptimisticallyDisplay(UseStateResult6.text) then nil else UseStateResult6.text,
			pendingUserImages = if UseStateResult6 == nil or not SessionPromptMessageFilterModule.shouldOptimisticallyDisplay(UseStateResult6.text) then nil else UseStateResult6.images,
			pendingUserResourceAttachments = if UseStateResult6 == nil or not SessionPromptMessageFilterModule.shouldOptimisticallyDisplay(UseStateResult6.text) then nil else UseStateResult6.resourceAttachments,
			pendingUserMessageAfterSequenceId = if UseStateResult6 == nil then nil else UseStateResult6.afterSequenceId,
			liveAssistantMessage = UseMemoResult3,
			optimisticCancelledStartSequenceId = if UseStateResult8 == nil then nil else UseStateResult8.startSequenceId
		})
	end, {
		Events, UseMemoResult, SessionId, UniverseId, PlaceId, UseSignalStateResult2,
		UseStateResult6, UseMemoResult3, UseStateResult8
	})
	local UseRefResult10 = if Current then ReactModule.useRef({
		isInitialized = false,
		lastProcessedSequenceId = nil,
		universeId = UniverseId,
		sessionId = if UseMemoResult == nil then SessionId else UseMemoResult.getCasSessionId() or SessionId,
		historyWatermarkSequenceId = UseMemoResult4.latestSequenceId,
		liveTurnIds = {},
		liveTurnStartSequenceIds = {}
	}) else nil
	local UseResult4 = if UseRefResult10 == nil then nil else ReactModule.useCallback(function(p2)
		-- upvalues: UseRefResult10 (ref)
		if p2 ~= nil then
			UseRefResult10.current.liveTurnIds[p2] = true
		end
	end, { UseRefResult10 })
	local Messages = UseMemoResult4.messages
	local HasNextHistoryPageToken: boolean = UseMemoResult ~= nil and UseMemoResult.getNextHistoryPageToken() ~= nil
	local NoUseMemoResult = UseMemoResult == nil or (not IsNotSessionIdMatch or UseMemoResult.hasLoadedHistory())
	local NoUseMemoResult1: boolean = NoIsLoading and (NoUseMemoResult and (UseMemoResult == nil or (#Messages > 0 or not HasNextHistoryPageToken)))
	local NoHasNextHistoryPageToken: boolean = NoUseMemoResult1 and not HasNextHistoryPageToken
	local SubagentTaskState = UseMemoResult4.subagentTaskState
	local IncludesPublishTool = UseMemoResult4.includesPublishTool
	local Message = Messages[#Messages]
	local UseSignalStateResult6 = SignalsReactModule.useSignalState((ReactModule.useMemo(function()
		-- upvalues: PlaceId (ref), AgentRollbackRequestStoreModule (copy), Signal (upval)
		return if PlaceId == nil then Signal else AgentRollbackRequestStoreModule.getIsPendingForPlaceId(PlaceId)
	end, { PlaceId, AgentRollbackRequestStoreModule })))
	local HasUseStateResult = UseStateResult10 ~= nil or (if Message == nil or Message.kind ~= "assistant_turn" then UseSignalStateResult6 else not Message.isDone or UseSignalStateResult6)
	local HasPendingLocalToolResponse = HasUseStateResult and (not UseSignalStateResult6 and hasPendingLocalToolResponse(UseSignalStateResult2))
	local ActiveTurnState = UseMemoResult4.activeTurnState
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult10 (copy), ActiveTurnState (copy)
		if UseStateResult10 ~= nil and ActiveTurnState ~= nil then
			UseStateResult10.syncFromTurnState(ActiveTurnState)
			
			return
		end
	end, { UseStateResult10, ActiveTurnState })
	
	if Current then
		ReactModule.useEffect(function()
			-- upvalues: p1 (copy), UseRefResult10 (ref), UseMemoResult (copy), UniverseId (ref), SessionId (ref), UseMemoResult4 (copy), NoUseMemoResult1 (copy), noteLiveAdUpsellTurns (upval), Messages (copy)
			local OnAssistantTurnCompletedFunction: (any) -> () = p1.onAssistantTurnCompleted
			local UseRefResult = UseRefResult10
			local UniverseId1 = if UseMemoResult == nil then UniverseId else UseMemoResult.universeId or UniverseId
			local SessionId1 = if UseMemoResult == nil then SessionId else UseMemoResult.getCasSessionId() or SessionId
			local Current = UseRefResult.current
			local NoSessionId: boolean = Current.sessionId == nil or (SessionId1 == nil or Current.sessionId == SessionId1)
			
			if (Current.universeId == nil or (UniverseId1 == nil or Current.universeId == UniverseId1)) and NoSessionId then
				Current.universeId = UniverseId1 or Current.universeId
				Current.sessionId = SessionId1 or Current.sessionId
			else
				Current = {
					isInitialized = false,
					lastProcessedSequenceId = nil,
					universeId = UniverseId1,
					sessionId = SessionId1,
					historyWatermarkSequenceId = UseMemoResult4.latestSequenceId,
					liveTurnIds = {},
					liveTurnStartSequenceIds = {}
				}
				UseRefResult.current = Current
			end
			if not NoUseMemoResult1 then
				Current.historyWatermarkSequenceId = Current.historyWatermarkSequenceId or UseMemoResult4.latestSequenceId
				noteLiveAdUpsellTurns(Current, Messages)
				
				return
			end
			if not Current.isInitialized then
				Current.isInitialized = true
				noteLiveAdUpsellTurns(Current, Messages)
				local v7: number? = nil
				
				for liveTurnStartSequenceId in Current.liveTurnStartSequenceIds do
					if v7 == nil or liveTurnStartSequenceId < v7 then
						v7 = liveTurnStartSequenceId
					end
				end
				if v7 == nil then
					Current.lastProcessedSequenceId = Current.historyWatermarkSequenceId or UseMemoResult4.latestSequenceId
				else
					Current.lastProcessedSequenceId = v7 - 1
				end
				Current.liveTurnIds = {}
				Current.liveTurnStartSequenceIds = {}
			end
			if UniverseId1 == nil or UniverseId1 == 0 then return end
			local LastProcessedSequenceId = Current.lastProcessedSequenceId or -1
			
			for _, message in Messages do
				local EndSequenceId = if message.kind == "assistant_turn" and message.isDone and message.isOptimisticallyCancelled ~= true and message.turnState ~= nil then message.endSequenceId or message.startSequenceId else nil
				
				if EndSequenceId ~= nil and EndSequenceId > LastProcessedSequenceId then
					if OnAssistantTurnCompletedFunction ~= nil then
						OnAssistantTurnCompletedFunction({
							universeId = UniverseId1,
							sessionId = message.sessionId or SessionId1,
							turnState = message.turnState,
							latestSequenceId = EndSequenceId
						})
					end
					Current.lastProcessedSequenceId = EndSequenceId
					LastProcessedSequenceId = EndSequenceId
				end
			end
		end, {
			p1.onAssistantTurnCompleted, UseMemoResult, UniverseId, SessionId,
			NoUseMemoResult1, Messages, UseMemoResult4.latestSequenceId
		})
	end
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding("")
	local UseStateResult13, UseStateResult2_8 = ReactModule.useState(nil)
	local UseStateResult14, UseStateResult2_9 = ReactModule.useState(false)
	local UseResult18 = ReactModule.useCallback(function(p2)
		-- upvalues: UseStateResult2_8 (copy), UseStateResult2_9 (copy)
		UseStateResult2_8(p2)
		UseStateResult2_9(false)
	end, {})
	local UseResult19 = ReactModule.useCallback(function(p2)
		-- upvalues: UseStateResult2_8 (copy), UseStateResult2_9 (copy)
		UseStateResult2_8(p2)
		UseStateResult2_9(true)
	end, {})
	local UseRefResult29 = ReactModule.useRef("")
	local UseRefResult14 = nil
	
	if FFlagBuildExperienceInGameShellComposer then
		local UseRefResult13 = ReactModule.useRef(p1.onComposerTextChanged)
		UseRefResult13.current = p1.onComposerTextChanged
		UseRefResult14 = UseRefResult13
	end
	local UseRefResult15 = ReactModule.useRef("")
	local UseRefResult16 = if FFlagBuildExperiencePrefillSkipsDraftPersistModule and BuildAppStorageKeyEngineFeature then ReactModule.useRef(nil) else nil
	local UseRefResult17 = ReactModule.useRef(nil)
	local UseRefResult18 = ReactModule.useRef(CasSessionId)
	local UseRefResult19 = ReactModule.useRef(nil)
	UseRefResult18.current = CasSessionId
	local NoUniverseId: boolean = p1.createUniverseOnFirstPrompt == true and UniverseId == nil
	local IsCreateUniverseOnFirstPrompt = p1.createUniverseOnFirstPrompt == true
	local UseRefResult20 = if FFlagBuildExperienceNewGameChatDraftModule then ReactModule.useRef(IsCreateUniverseOnFirstPrompt) else { current = IsCreateUniverseOnFirstPrompt }
	UseRefResult20.current = IsCreateUniverseOnFirstPrompt
	local UseRefResult21 = if FFlagBuildExperienceRestoreStoppedPromptModule then ReactModule.useRef(nil) else nil
	local UseRefResult22 = ReactModule.useRef({})
	local UseRefResult23 = ReactModule.useRef(0)
	local UseStateResult11, UseStateResult2_6 = ReactModule.useState({})
	local UseRefResult24 = ReactModule.useRef({})
	local UseStateResult12, UseStateResult2_7 = ReactModule.useState({})
	local UseRefResult25 = ReactModule.useRef({})
	local UseRefResult26 = ReactModule.useRef({ universeId = p1.universeId, placeId = p1.placeId })
	local UseRefResult27 = ReactModule.useRef(nil)
	local UseClockResult = ReactUtilsModule.useClock()
	local UseChatScrollModuleResult = UseChatScrollModule(IsIsLibraryChat)
	local UseResult6 = ReactModule.useCallback(function(p2, p3)
		-- upvalues: GetPlaytestLoadingStoreModule (upval)
		GetPlaytestLoadingStoreModule().setAgentStatusForPlaceId(p2, p3)
	end, {})
	local UseResult7 = ReactModule.useCallback(function(Callback)
		-- upvalues: UseChatScrollModuleResult (copy), UseMemoResult (copy)
		local function v271()
			-- upvalues: Callback (copy)
			return Callback ~= nil and Callback()
		end
		
		UseChatScrollModuleResult.captureDistanceFromBottom()
		
		if UseMemoResult ~= nil then
			UseMemoResult.requestOlderHistoryWhile(v271, function()
				-- upvalues: UseChatScrollModuleResult (upval)
				return UseChatScrollModuleResult.isNearTopRef.current
			end)
			
			return
		end
	end, { UseMemoResult, UseChatScrollModuleResult })
	local UseResult8 = ReactModule.useCallback(function(Callback)
		-- upvalues: UseMemoResult (copy), UseChatScrollModuleResult (copy), UseResult7 (copy)
		task.delay(0.1, function()
			-- upvalues: Callback (copy), UseMemoResult (upval), UseChatScrollModuleResult (upval), UseResult7 (upval)
			if Callback() then return end
			if UseMemoResult == nil then return end
			if UseMemoResult.getNextHistoryPageToken() == nil then return end
			if UseChatScrollModuleResult.isNearTopRef.current then
				UseResult7(Callback)
				
				return
			end
		end)
	end, { UseResult7, UseChatScrollModuleResult, UseMemoResult })
	local UseResult9 = ReactModule.useCallback(function(p2)
		-- upvalues: UseMemoResult (copy), UseResult8 (copy)
		if UseMemoResult == nil then return end
		if UseMemoResult.getNextHistoryPageToken() ~= nil then
			UseResult8(p2)
			
			return
		end
	end, { UseResult8, UseMemoResult })
	local UseRefResult28 = ReactModule.useRef(UseResult9)
	UseRefResult28.current = UseResult9
	ReactModule.useEffect(function()
		-- upvalues: UseChatScrollModuleResult (copy), UseResult7 (copy)
		UseChatScrollModuleResult.setOnScrolledToTop(function()
			-- upvalues: UseResult7 (upval)
			UseResult7(nil)
		end)
		
		return function()
			-- upvalues: UseChatScrollModuleResult (upval)
			UseChatScrollModuleResult.setOnScrolledToTop(nil)
		end
	end, { UseChatScrollModuleResult.setOnScrolledToTop, UseResult7 })
	ReactModule.useEffect(function()
		-- upvalues: NoHydrateHistoryWhen (copy), UseMemoResult (copy), UseStateResult2_2 (ref), SessionId (ref), UniverseId (ref), UseRefResult28 (copy), IsIsLibraryChat (copy), UseRefResult2 (copy), FFlagBuildExperienceModelPickerModule (upval), CreatorAgentChatStore (copy), UseStateResult2_1 (copy), PlaceId (ref), UseSignalStateResult (ref)
		if NoHydrateHistoryWhen and UseMemoResult ~= nil then
			local Flag = false
			
			local function _(IsLoading)
				-- upvalues: UseStateResult2_2 (upval), Flag (ref), UseMemoResult (upval), SessionId (upval), UniverseId (upval), NoHydrateHistoryWhen (upval)
				if UseStateResult2_2 ~= nil and not Flag then
					UseStateResult2_2({
						session = UseMemoResult,
						sessionId = SessionId,
						universeId = UniverseId,
						hydrateHistoryWhen = NoHydrateHistoryWhen,
						isLoading = IsLoading
					})
					
					return
				end
			end
			
			local Inverted = not (UseMemoResult.hasLoadedHistory() and #UseMemoResult.getMergedHistory(false) > 0)
			
			if UseStateResult2_2 ~= nil and not Flag then
				UseStateResult2_2({
					session = UseMemoResult,
					sessionId = SessionId,
					universeId = UniverseId,
					hydrateHistoryWhen = NoHydrateHistoryWhen,
					isLoading = Inverted
				})
			end
			local CasSessionId = SessionId
			
			local function isHydrateCancelled(): boolean
				-- upvalues: Flag (ref), CasSessionId (copy), UseMemoResult (upval)
				return if Flag then true else CasSessionId ~= nil and CasSessionId ~= "" and UseMemoResult.getCasSessionId() ~= CasSessionId
			end
			
			local _ = function()
				-- upvalues: Flag (ref), CasSessionId (copy), UseMemoResult (upval), UseRefResult28 (upval), isHydrateCancelled (copy)
				if not (if Flag then true else CasSessionId ~= nil and CasSessionId ~= "" and UseMemoResult.getCasSessionId() ~= CasSessionId) then
					UseRefResult28.current(isHydrateCancelled)
					
					return
				end
			end
			
			local function hydrateKnownSession(CasSessionId1)
				-- upvalues: UseMemoResult (upval), IsIsLibraryChat (upval), UseRefResult2 (upval), UseStateResult2_2 (upval), Flag (ref), SessionId (upval), UniverseId (upval), NoHydrateHistoryWhen (upval), FFlagBuildExperienceModelPickerModule (upval), CasSessionId (copy), UseRefResult28 (upval), isHydrateCancelled (copy)
				UseMemoResult.setCasSessionId(CasSessionId1)
				
				if not IsIsLibraryChat or UseRefResult2.current == nil then
					if IsIsLibraryChat or not UseMemoResult.hasLoadedHistory() or #UseMemoResult.getMergedHistory(false) <= 0 or FFlagBuildExperienceModelPickerModule and not UseMemoResult.hasObservedModels(false) then
						if UseMemoResult.refreshSession(isHydrateCancelled, true) and not (if Flag then true else CasSessionId ~= nil and CasSessionId ~= "" and UseMemoResult.getCasSessionId() ~= CasSessionId) and not (if Flag then true else CasSessionId ~= nil and CasSessionId ~= "" and UseMemoResult.getCasSessionId() ~= CasSessionId) then
							UseRefResult28.current(isHydrateCancelled)
						end
						if UseStateResult2_2 ~= nil then
							if Flag then return end
							UseStateResult2_2({
								isLoading = false,
								session = UseMemoResult,
								sessionId = SessionId,
								universeId = UniverseId,
								hydrateHistoryWhen = NoHydrateHistoryWhen
							})
						end
						return
					else
						if not (if Flag then true else CasSessionId ~= nil and CasSessionId ~= "" and UseMemoResult.getCasSessionId() ~= CasSessionId) then
							UseRefResult28.current(isHydrateCancelled)
						end
						if UseStateResult2_2 ~= nil then
							if Flag then return end
							UseStateResult2_2({
								isLoading = false,
								session = UseMemoResult,
								sessionId = SessionId,
								universeId = UniverseId,
								hydrateHistoryWhen = NoHydrateHistoryWhen
							})
						end
						return
					end
				elseif UseStateResult2_2 ~= nil then
					if Flag then return end
					UseStateResult2_2({
						isLoading = false,
						session = UseMemoResult,
						sessionId = SessionId,
						universeId = UniverseId,
						hydrateHistoryWhen = NoHydrateHistoryWhen
					})
				end
			end
			
			task.spawn(function()
				-- upvalues: SessionId (upval), IsIsLibraryChat (upval), UseMemoResult (upval), hydrateKnownSession (copy), FFlagBuildExperienceModelPickerModule (upval), UniverseId (upval), UseStateResult2_2 (upval), Flag (ref), NoHydrateHistoryWhen (upval), CreatorAgentChatStore (upval), CasSessionId (copy), UseStateResult2_1 (upval), PlaceId (upval), UseSignalStateResult (upval)
				local CasSessionId1 = SessionId
				
				if IsIsLibraryChat and (CasSessionId1 == nil or CasSessionId1 == "") then
					CasSessionId1 = UseMemoResult.getCasSessionId()
				end
				if CasSessionId1 ~= nil and CasSessionId1 ~= "" then
					hydrateKnownSession(CasSessionId1)
					
					return
				end
				if FFlagBuildExperienceModelPickerModule then
					local CasSessionId2 = UseMemoResult.getCasSessionId()
					
					if CasSessionId2 ~= nil and UseMemoResult.hasLoadedHistory() and #UseMemoResult.getMergedHistory(false) > 0 and not UseMemoResult.hasObservedModels(false) then
						hydrateKnownSession(CasSessionId2)
						
						return
					end
				end
				if UniverseId ~= nil and UniverseId ~= 0 and (not UseMemoResult.hasLoadedHistory() or #UseMemoResult.getMergedHistory(false) <= 0) then
					local SessionFindByUniverseResult = CreatorAgentChatStore.sessionFindByUniverse({
						sort = "desc",
						application = "build",
						filterByPinForBuild = true,
						universeId = UniverseId
					})
					while SessionFindByUniverseResult.state(false).status == "pending" and not (if Flag then true else CasSessionId ~= nil and CasSessionId ~= "" and UseMemoResult.getCasSessionId() ~= CasSessionId) do
						task.wait()
					end
					if IsIsLibraryChat then
						if if Flag then true else CasSessionId ~= nil and CasSessionId ~= "" and UseMemoResult.getCasSessionId() ~= CasSessionId then return end
						local CasSessionId3 = UseMemoResult.getCasSessionId()
						
						if CasSessionId3 ~= nil and CasSessionId3 ~= "" then
							hydrateKnownSession(CasSessionId3)
							
							return
						end
					end
					if not (if Flag then true else CasSessionId ~= nil and CasSessionId ~= "" and UseMemoResult.getCasSessionId() ~= CasSessionId) and SessionFindByUniverseResult.state(false).status == "succeeded" then
						local Result = SessionFindByUniverseResult.state(false).result
						local Sessions = if Result == nil then nil else Result.sessions
						local Session = if typeof(Sessions) == "table" then Sessions[1] else nil
						local SessionId1 = if typeof(Session) == "table" then Session.sessionId else nil
						
						if typeof(SessionId1) == "string" and SessionId1 ~= "" then
							UseStateResult2_1({
								universeId = UniverseId,
								placeId = PlaceId,
								sessionId = SessionId1,
								accountId = if FFlagBuildExperienceModelPickerModule then UseSignalStateResult else nil
							})
							
							return
						end
						UseMemoResult.markHistoryLoaded()
						
						if UseStateResult2_2 ~= nil then
							if Flag then return end
							UseStateResult2_2({
								isLoading = false,
								session = UseMemoResult,
								sessionId = SessionId,
								universeId = UniverseId,
								hydrateHistoryWhen = NoHydrateHistoryWhen
							})
						end
						return
					elseif UseStateResult2_2 ~= nil then
						if Flag then return end
						UseStateResult2_2({
							isLoading = false,
							session = UseMemoResult,
							sessionId = SessionId,
							universeId = UniverseId,
							hydrateHistoryWhen = NoHydrateHistoryWhen
						})
					end
					return
				elseif UseStateResult2_2 ~= nil then
					if Flag then return end
					UseStateResult2_2({
						isLoading = false,
						session = UseMemoResult,
						sessionId = SessionId,
						universeId = UniverseId,
						hydrateHistoryWhen = NoHydrateHistoryWhen
					})
				end
			end)
			
			return function()
				-- upvalues: Flag (ref)
				Flag = true
			end
		elseif UseStateResult2_2 ~= nil then
			UseStateResult2_2({
				isLoading = false,
				session = UseMemoResult,
				sessionId = SessionId,
				universeId = UniverseId,
				hydrateHistoryWhen = NoHydrateHistoryWhen
			})
		end
	end, {
		UseMemoResult, SessionId, UniverseId, PlaceId, CreatorAgentChatStore,
		NoHydrateHistoryWhen, IsIsLibraryChat, UseSignalStateResult
	})
	ReactModule.useEffect(function()
		-- upvalues: UseMemoResult (copy), SessionId (ref), UseRefResult28 (copy), MessageBusService (upval), GameMessageId (upval), UseRefResult (copy), BuildAppStorageKeyEngineFeature (upval), FFlagBuildExperiencePrefillSkipsDraftPersistModule (upval), UseRefResult29 (copy), UseRefResult16 (copy), BuildAppStorageModule (upval), UseRefResult15 (copy), UseBindingResult2 (copy), FFlagBuildExperienceInGameShellComposer (upval), UseRefResult14 (ref), UseResult18 (copy), AppLifecycleObserverService (upval)
		if UseMemoResult == nil then return end
		local Flag = false
		
		local function refreshKnownSession()
			-- upvalues: UseMemoResult (upval), SessionId (upval), Flag (ref), UseRefResult28 (upval)
			local CasSessionId = UseMemoResult.getCasSessionId()
			
			if (CasSessionId == nil or CasSessionId == "") and (SessionId ~= nil and SessionId ~= "") then
				CasSessionId = SessionId
			end
			if CasSessionId ~= nil and CasSessionId ~= "" then
				task.spawn(function()
					-- upvalues: Flag (upval), UseMemoResult (upval), UseRefResult28 (upval)
					if UseMemoResult.refreshSession(function()
						-- upvalues: Flag (upval)
						return Flag
					end, true) and not Flag then
						UseRefResult28.current(function()
							-- upvalues: Flag (upval)
							return Flag
						end)
					end
				end)
				
				return
			end
		end
		
		local SubscribeResult = MessageBusService:Subscribe(GameMessageId, function(_)
			-- upvalues: UseRefResult (upval), BuildAppStorageKeyEngineFeature (upval), UseMemoResult (upval), SessionId (upval), FFlagBuildExperiencePrefillSkipsDraftPersistModule (upval), UseRefResult29 (upval), UseRefResult16 (upval), BuildAppStorageModule (upval), UseRefResult15 (upval), UseBindingResult2 (upval), FFlagBuildExperienceInGameShellComposer (upval), UseRefResult14 (upval), UseResult18 (upval), refreshKnownSession (copy)
			UseRefResult.current = true
			
			if BuildAppStorageKeyEngineFeature then
				local CasSessionId = UseMemoResult.getCasSessionId()
				
				if (CasSessionId == nil or CasSessionId == "") and (SessionId ~= nil and SessionId ~= "") then
					CasSessionId = SessionId
				end
				local IsCurrentMatch: boolean = FFlagBuildExperiencePrefillSkipsDraftPersistModule and (UseRefResult29.current ~= "" and UseRefResult29.current == UseRefResult16.current)
				
				if CasSessionId ~= nil and CasSessionId ~= "" and not IsCurrentMatch then
					local ChatDraft = BuildAppStorageModule.getChatDraft(CasSessionId) or ""
					UseRefResult15.current = ChatDraft
					UseRefResult29.current = ChatDraft
					UseBindingResult2(ChatDraft)
					
					if FFlagBuildExperienceInGameShellComposer and UseRefResult14 ~= nil and UseRefResult14.current ~= nil then
						UseRefResult14.current(ChatDraft)
					end
					UseResult18(nil)
				end
			end
			refreshKnownSession()
		end, false, true)
		local OnUnhideConnection = AppLifecycleObserverService.OnUnhide:Connect(refreshKnownSession)
		
		return function()
			-- upvalues: Flag (ref), SubscribeResult (copy), OnUnhideConnection (copy)
			Flag = true
			SubscribeResult:Disconnect()
			OnUnhideConnection:Disconnect()
		end
	end, { UseMemoResult, SessionId, UseRefResult, UseRefResult14 })
	ReactModule.useEffect(function()
		-- upvalues: NoHydrateHistoryWhen (copy), UseChatScrollModuleResult (copy)
		if NoHydrateHistoryWhen then
			UseChatScrollModuleResult.lockToBottom()
			
			return
		end
	end, {
		NoHydrateHistoryWhen,
		IsIsLibraryChat,
		UseMemoResult,
		SessionId,
		UseChatScrollModuleResult
	})
	local UseResult10 = ReactModule.useCallback(function(Current)
		-- upvalues: UseRefResult29 (copy), UseBindingResult2 (copy), FFlagBuildExperienceInGameShellComposer (upval), UseRefResult14 (ref), UseResult18 (copy)
		UseRefResult29.current = Current
		UseBindingResult2(Current)
		
		if FFlagBuildExperienceInGameShellComposer and UseRefResult14 ~= nil and UseRefResult14.current ~= nil then
			UseRefResult14.current(Current)
		end
		UseResult18(nil)
	end, { UseBindingResult2, UseResult18 })
	local UseResult11 = if BuildAppStorageKeyEngineFeature then ReactModule.useCallback(function()
		-- upvalues: UseRefResult17 (copy)
		if UseRefResult17.current ~= nil then
			task.cancel(UseRefResult17.current)
			UseRefResult17.current = nil
		end
	end, {}) else nil
	local UseResult12 = if FFlagBuildExperienceNewGameChatDraftModule then ReactModule.useCallback(function()
		-- upvalues: UseRefResult18 (copy), UseRefResult20 (ref), GetNewGameChatDraftKeyModule (upval)
		local Current = UseRefResult18.current
		
		return if Current == nil or Current == "" then if UseRefResult20.current then GetNewGameChatDraftKeyModule() else nil else Current
	end, {}) else nil
	local UseResult13 = if BuildAppStorageKeyEngineFeature then ReactModule.useCallback(function(Current)
		-- upvalues: UseRefResult15 (copy), UseResult11 (copy), FFlagBuildExperienceNewGameChatDraftModule (upval), UseResult12 (copy), UseRefResult18 (copy), UseRefResult17 (copy), BuildAppStorageModule (upval)
		UseRefResult15.current = Current
		UseResult11()
		local UseResultResult = if FFlagBuildExperienceNewGameChatDraftModule then UseResult12() else UseRefResult18.current
		
		if UseResultResult ~= nil and UseResultResult ~= "" then
			UseRefResult17.current = task.delay(0.5, function()
				-- upvalues: UseRefResult17 (upval), BuildAppStorageModule (upval), UseResultResult (copy), Current (copy)
				UseRefResult17.current = nil
				BuildAppStorageModule.setChatDraft(UseResultResult, Current)
			end)
			
			return
		end
	end, { UseResult11, UseResult12 }) else nil
	local UseResult14 = if BuildAppStorageKeyEngineFeature then ReactModule.useCallback(function(Current)
		-- upvalues: FFlagBuildExperienceNewGameChatDraftModule (upval), UseResult12 (copy), UseRefResult18 (copy), UseRefResult15 (copy), UseResult11 (copy), BuildAppStorageModule (upval)
		local UseResultResult = if FFlagBuildExperienceNewGameChatDraftModule then UseResult12() else UseRefResult18.current
		
		if UseResultResult ~= nil and UseResultResult ~= "" then
			UseRefResult15.current = Current
			UseResult11()
			BuildAppStorageModule.setChatDraft(UseResultResult, Current)
			
			return
		end
	end, { UseResult11, UseResult12 }) else nil
	local UseResult15 = if BuildAppStorageKeyEngineFeature then ReactModule.useCallback(function(Current, p2)
		-- upvalues: FFlagBuildExperienceNewGameChatDraftModule (upval), UseRefResult20 (ref), GetNewGameChatDraftKeyModule (upval), BuildAppStorageModule (upval), UseRefResult15 (copy), UseResult11 (copy)
		local NewGameChatDraftKeyModule = if FFlagBuildExperienceNewGameChatDraftModule and UseRefResult20.current then GetNewGameChatDraftKeyModule() else nil
		
		if NewGameChatDraftKeyModule ~= nil then
			BuildAppStorageModule.setChatDraft(NewGameChatDraftKeyModule, "")
		end
		if p2 ~= nil and p2 ~= "" and UseRefResult15.current == Current then
			UseRefResult15.current = ""
			UseResult11()
			BuildAppStorageModule.setChatDraft(p2, "")
			
			return
		end
	end, { UseResult11 }) else nil
	local UseResult16 = ReactModule.useCallback(function(Current)
		-- upvalues: UseResult10 (copy), BuildAppStorageKeyEngineFeature (upval), FFlagBuildExperiencePrefillSkipsDraftPersistModule (upval), UseRefResult16 (copy), UseResult13 (copy)
		UseResult10(Current)
		
		if BuildAppStorageKeyEngineFeature then
			if FFlagBuildExperiencePrefillSkipsDraftPersistModule then
				local Current1 = UseRefResult16.current
				
				if Current1 ~= nil and Current == Current1 then return end
				UseRefResult16.current = nil
			end
			UseResult13(Current)
		end
	end, { UseResult10, UseResult13 })
	local UseResult17 = if FFlagBuildExperiencePrefillSkipsDraftPersistModule and BuildAppStorageKeyEngineFeature then ReactModule.useCallback(function(Current)
		-- upvalues: UseRefResult16 (copy), UseResult10 (copy)
		UseRefResult16.current = Current
		UseResult10(Current)
	end, { UseResult10 }) else UseResult16
	
	if FFlagBuildExperienceNewGameChatDraftModule and BuildAppStorageKeyEngineFeature then
		ReactModule.useEffect(function()
			-- upvalues: NoUniverseId (copy), CasSessionId (copy), GetNewGameChatDraftKeyModule (upval), BuildAppStorageModule (upval), UseRefResult29 (copy), UseRefResult15 (copy), UseResult10 (copy)
			if not NoUniverseId or CasSessionId ~= nil and CasSessionId ~= "" then return end
			local NewGameChatDraftKeyModule = GetNewGameChatDraftKeyModule()
			
			if NewGameChatDraftKeyModule == nil then return end
			local ChatDraft = BuildAppStorageModule.getChatDraft(NewGameChatDraftKeyModule) or ""
			
			if ChatDraft ~= "" and UseRefResult29.current == "" then
				UseRefResult15.current = ChatDraft
				UseResult10(ChatDraft)
			end
		end, { NoUniverseId, CasSessionId, UseResult10 })
	end
	ReactModule.useEffect(function()
		-- upvalues: BuildAppStorageKeyEngineFeature (upval), CasSessionId (copy), UseRefResult19 (copy), UseResult11 (copy), FFlagBuildExperiencePrefillSkipsDraftPersistModule (upval), UseRefResult29 (copy), UseRefResult16 (copy), UseRefResult15 (copy), BuildAppStorageModule (upval), UseResult10 (copy), UseRefResult17 (copy)
		if not BuildAppStorageKeyEngineFeature then return end
		if CasSessionId == nil or CasSessionId == "" then return end
		local Current = UseRefResult19.current
		UseRefResult19.current = CasSessionId
		UseResult11()
		
		if FFlagBuildExperiencePrefillSkipsDraftPersistModule and Current == nil and UseRefResult29.current ~= "" and UseRefResult29.current == UseRefResult16.current then
			UseRefResult15.current = BuildAppStorageModule.getChatDraft(CasSessionId) or ""
		elseif Current == nil and UseRefResult29.current ~= "" then
			UseRefResult15.current = UseRefResult29.current
			BuildAppStorageModule.setChatDraft(CasSessionId, UseRefResult29.current)
		else
			local ChatDraft = BuildAppStorageModule.getChatDraft(CasSessionId) or ""
			UseRefResult15.current = ChatDraft
			UseResult10(ChatDraft)
		end
		return function()
			-- upvalues: UseRefResult17 (upval), UseResult11 (upval), BuildAppStorageModule (upval), CasSessionId (upval), UseRefResult15 (upval)
			local HasCurrent = UseRefResult17.current ~= nil
			UseResult11()
			
			if HasCurrent then
				BuildAppStorageModule.setChatDraft(CasSessionId, UseRefResult15.current)
			end
		end
	end, {
		CasSessionId,
		UseResult11,
		UseResult10,
		if FFlagBuildExperienceModelPickerModule then UseMemoResult else nil
	})
	
	local function commitComposerResourceAttachments(Current)
		-- upvalues: UseRefResult25 (copy), UseStateResult2_7 (copy), UseResult18 (copy)
		UseRefResult25.current = Current
		UseStateResult2_7(Current)
		UseResult18(nil)
	end
	
	local function findComposerResourceAttachmentIndexByUri(ResourceAttachmentUri)
		-- upvalues: UseRefResult25 (copy), ChatTypesModule (upval)
		for i, value in UseRefResult25.current do
			if ChatTypesModule.getResourceAttachmentUri(value) == ResourceAttachmentUri then
				return i
			end
		end
		return nil
	end
	
	local function addComposerResourceAttachment(p2)
		-- upvalues: UseRefResult25 (copy), UseStateResult2_7 (copy), UseResult18 (copy)
		local Copy = table.clone(UseRefResult25.current)
		table.insert(Copy, p2)
		UseRefResult25.current = Copy
		UseStateResult2_7(Copy)
		UseResult18(nil)
	end
	
	local UseResult5 = if FFlagBuildChatPasteAsAttachmentModule then ReactModule.useCallback(addComposerResourceAttachment, {}) else nil
	
	local function removeComposerResourceAttachmentAtIndex(Index)
		-- upvalues: UseRefResult25 (copy), UseStateResult2_7 (copy), UseResult18 (copy)
		local Copy = table.clone(UseRefResult25.current)
		table.remove(Copy, Index)
		UseRefResult25.current = Copy
		UseStateResult2_7(Copy)
		UseResult18(nil)
	end
	
	local function clearComposerResourceAttachments()
		-- upvalues: UseRefResult25 (copy), UseStateResult2_7 (copy), UseResult18 (copy)
		local Current = {}
		UseRefResult25.current = Current
		UseStateResult2_7(Current)
		UseResult18(nil)
	end
	
	local UseRefResult11 = ReactModule.useRef(commitComposerResourceAttachments)
	UseRefResult11.current = commitComposerResourceAttachments
	ReactModule.useLayoutEffect(function()
		-- upvalues: UseRefResult26 (copy), p1 (copy), UseRefResult11 (copy)
		local Current = UseRefResult26.current
		
		if Current.universeId ~= p1.universeId or Current.placeId ~= p1.placeId then
			UseRefResult11.current({})
		end
		UseRefResult26.current = { universeId = p1.universeId, placeId = p1.placeId }
	end, { p1.universeId, p1.placeId })
	
	local function _(Current)
		-- upvalues: UseRefResult24 (copy), UseStateResult2_6 (copy)
		UseRefResult24.current = Current
		UseStateResult2_6(Current)
	end
	
	local _ = function(List): boolean
		for _, value in List do
			if value.uploadStatus == "failed" then
				return true
			end
		end
		return false
	end
	
	local function updateComposerImage(Capture, Callback)
		-- upvalues: UseRefResult24 (copy), UseStateResult2_6 (copy)
		local Current = UseRefResult24.current
		local Copy = table.clone(Current)
		
		for i, value in Current do
			if value.capture == Capture then
				Copy[i] = Callback(value)
				UseRefResult24.current = Copy
				UseStateResult2_6(Copy)
				
				return Copy
			end
		end
		return Current
	end
	
	local function beginComposerImageUpload(Capture)
		-- upvalues: UseRefResult23 (copy), UseRefResult22 (copy), updateComposerImage (copy), UseResult18 (copy), UploadCaptureAsyncModule (upval), FormatResult1 (copy)
		UseRefResult23.current += 1
		local Current = UseRefResult23.current
		UseRefResult22.current[Capture] = Current
		local Flag = false
		
		for _, value in updateComposerImage(Capture, function(Tbl)
			local Copy = table.clone(Tbl)
			Copy.uri = nil
			Copy.uploadStatus = "uploading"
			Copy.uploadError = nil
			
			return Copy
		end) do
			if value.uploadStatus == "failed" then
				Flag = true
				break
			end
		end
		if not Flag then
			UseResult18(nil)
		end
		UploadCaptureAsyncModule(Capture):andThen(function(Result)
			-- upvalues: UseRefResult22 (upval), Capture (copy), Current (copy), updateComposerImage (upval), UseResult18 (upval)
			if UseRefResult22.current[Capture] ~= Current then return end
			UseRefResult22.current[Capture] = nil
			local Flag = false
			
			for _, value in updateComposerImage(Capture, function(Tbl)
				-- upvalues: Result (copy)
				local Copy = table.clone(Tbl)
				Copy.uri = `rbxassetid://{Result.assetId}`
				Copy.uploadStatus = "uploaded"
				Copy.uploadError = nil
				
				return Copy
			end) do
				if value.uploadStatus == "failed" then
					Flag = true
					break
				end
			end
			if not Flag then
				UseResult18(nil)
			end
		end):catch(function(Err)
			-- upvalues: UseRefResult22 (upval), Capture (copy), Current (copy), updateComposerImage (upval), UseResult18 (upval), FormatResult1 (upval)
			if UseRefResult22.current[Capture] == Current then
				UseRefResult22.current[Capture] = nil
				updateComposerImage(Capture, function(Tbl)
					-- upvalues: Err (copy)
					local Copy = table.clone(Tbl)
					Copy.uri = nil
					Copy.uploadStatus = "failed"
					Copy.uploadError = Err
					
					return Copy
				end)
				UseResult18(FormatResult1)
				
				return
			end
		end)
	end
	
	local function setComposerImages(p2)
		-- upvalues: UseRefResult24 (copy), UseRefResult22 (copy), UseStateResult2_6 (copy), UseResult18 (copy), beginComposerImageUpload (copy)
		local Current = UseRefResult24.current
		local Current1 = {}
		local Captures = {}
		local Tbl = nil
		
		for i = 1, math.min(#p2, 2) do
			local v8 = p2[i]
			Tbl = v8
			
			if v8.capture ~= nil and v8.uri == nil and v8.uploadStatus == nil then
				for _, value in Current do
					if value.capture == v8.capture then
						Tbl = value
						break
					end
				end
			end
			if Tbl.uri == nil or Tbl.uploadStatus ~= nil then
				if Tbl.capture ~= nil and Tbl.uri == nil and Tbl.uploadStatus == nil then
					Tbl = table.clone(Tbl)
					Tbl.uploadStatus = "uploading"
					table.insert(Captures, Tbl.capture)
				end
			else
				Tbl = table.clone(Tbl)
				Tbl.uploadStatus = "uploaded"
			end
			table.insert(Current1, Tbl)
		end
		local Flag = nil
		for _, value1 in Current do
			Flag = false
			
			for _, value2 in Current1 do
				if value2.capture == value1.capture then
					Flag = true
					break
				end
			end
			if not Flag and value1.capture ~= nil then
				UseRefResult22.current[value1.capture] = nil
			end
		end
		UseRefResult24.current = Current1
		UseStateResult2_6(Current1)
		local Flag1 = false
		
		for _, value3 in Current1 do
			if value3.uploadStatus == "failed" then
				Flag1 = true
				break
			end
		end
		if not Flag1 then
			UseResult18(nil)
		end
		for _, capture in Captures do
			beginComposerImageUpload(capture)
		end
	end
	
	local UseRefResult12 = ReactModule.useRef(setComposerImages)
	UseRefResult12.current = setComposerImages
	
	local function retryComposerImage(p3)
		-- upvalues: UseRefResult24 (copy), beginComposerImageUpload (copy)
		local CurrentEntry = UseRefResult24.current[p3]
		
		if CurrentEntry ~= nil and CurrentEntry.capture ~= nil and CurrentEntry.uploadStatus == "failed" then
			beginComposerImageUpload(CurrentEntry.capture)
			
			return
		end
	end
	
	local Flag = false
	
	for _, value in UseStateResult11 do
		if value.uri == nil or value.uploadStatus == "uploading" or value.uploadStatus == "failed" then
			Flag = true
			break
		end
	end
	local UseResult2 = ReactModule.useCallback(function(Current)
		-- upvalues: UseRefResult4 (copy), UseRefResult3 (copy), UseMemoResult (copy), SessionId (ref), FFlagBuildExperienceAnswerFormModule (upval), UseRefResult2 (copy), UseRefResult29 (copy), UseResult16 (copy), CreatorAgentChatModule1 (upval), UseContextResult (copy), UseResult18 (copy)
		return function(p3, p4)
			-- upvalues: UseRefResult4 (upval), Current (copy), UseRefResult3 (upval), UseMemoResult (upval), SessionId (upval), FFlagBuildExperienceAnswerFormModule (upval), UseRefResult2 (upval), UseRefResult29 (upval), UseResult16 (upval), CreatorAgentChatModule1 (upval), UseContextResult (upval), UseResult18 (upval)
			if UseRefResult4.current == Current then
				local Current1 = UseRefResult3.current
				local SessionId1 = SessionId
				
				if Current1 ~= nil and Current1.session == UseMemoResult and (SessionId1 == nil or SessionId1 == "" or (Current1.sessionId == SessionId1 or Current1.sessionId == nil and Current1.session.getCasSessionId() == SessionId1)) then
					local HasNextEntry = false
					
					if FFlagBuildExperienceAnswerFormModule then
						local Current2 = UseRefResult2.current
						
						if Current2 ~= nil then
							HasNextEntry = next(Current2.getLocalToolActions(false).onAnswerSelectedByToolCallId) ~= nil
						end
					end
					if p3 ~= nil and UseRefResult29.current == "" and not HasNextEntry then
						UseResult16(p3)
					end
					UseResult18((UseContextResult:Format((CreatorAgentChatModule1.getToolResultFailureComposerError(p4)))))
					
					return
				end
			end
		end
	end, {
		UseMemoResult,
		SessionId,
		UseResult16,
		UseResult18,
		UseContextResult
	})
	local FundingFailure = nil
	local OnPromptFailureFunction = p1.onPromptFailure
	
	if FFlagBuildExperienceModelPickerModule then
		local UseStateResult15, UseStateResult2_10 = ReactModule.useState(nil)
		FundingFailure = if UseStateResult15 == nil or UseStateResult15.owner ~= UseMemoResult then nil else UseStateResult15
		OnPromptFailureFunction = ReactModule.useCallback(function(OutOfCredits, Reason)
			-- upvalues: CreatorAgentChatModule (upval), UseStateResult2_10 (copy), UseMemoResult (copy), p1 (copy)
			if OutOfCredits == CreatorAgentChatModule.ErrorCodes.OutOfCredits then
				UseStateResult2_10(function(p3)
					-- upvalues: Reason (copy), UseMemoResult (upval)
					return {
						count = if p3 then p3.count + 1 else 1,
						reason = Reason,
						owner = UseMemoResult
					}
				end)
			end
			if p1.onPromptFailure ~= nil then
				p1.onPromptFailure(OutOfCredits, Reason)
			end
		end, { UseMemoResult, p1.onPromptFailure })
	end
	local UseResult20 = ReactModule.useCallback(function(Current, p3, p4, p5, p6, Current1)
		-- upvalues: UseRefResult4 (copy), FFlagBuildExperienceModelPickerModule (upval), v1 (ref), GetBuildCreatorCreditRefreshStoreModule (upval), UseResult3 (copy), UseRefResult9 (copy), UseStateResult2_3 (copy), OnPromptFailureFunction (ref), UseResult6 (copy), UseRefResult12 (copy), UseRefResult11 (copy), UseResult16 (copy), CreatorAgentChatModule1 (upval), UseContextResult (copy), UseResult18 (copy), UseChatScrollModuleResult (copy), p1 (copy), SessionId (ref), UseSignalStateResult (ref), UseStateResult2 (copy)
		if UseRefResult4.current ~= Current then return end
		if FFlagBuildExperienceModelPickerModule and v1 ~= nil and not v1.current then
			GetBuildCreatorCreditRefreshStoreModule(false).settled()
			
			return
		end
		UseResult3(nil)
		UseRefResult9.current = nil
		UseStateResult2_3(nil)
		
		if FFlagBuildExperienceModelPickerModule then
			GetBuildCreatorCreditRefreshStoreModule(false).settled()
		end
		if p3 == nil then
			if Current1.placeId ~= nil then
				UseResult6(Current1.placeId, "Completed")
			end
			UseChatScrollModuleResult.scrollToBottomAfterSend()
			local CasSessionId = Current1.getCasSessionId()
			
			if CasSessionId ~= nil and CasSessionId ~= "" then
				if p1.createUniverseOnFirstPrompt and SessionId == nil and Current1.universeId ~= nil then
					local config = {
						universeId = Current1.universeId,
						placeId = Current1.placeId,
						sessionId = CasSessionId
					}
					
					if FFlagBuildExperienceModelPickerModule then
						local Copy = table.clone(config)
						Copy.accountId = UseSignalStateResult
						UseStateResult2(Copy)
					else
						UseStateResult2(config)
					end
					if p1.onProjectResolved ~= nil then
						p1.onProjectResolved(config)
					end
				end
				task.spawn(function()
					-- upvalues: Current1 (copy), UseRefResult4 (upval), Current (copy)
					Current1.refreshSession(function(): boolean
						-- upvalues: UseRefResult4 (upval), Current (upval)
						return UseRefResult4.current ~= Current
					end)
				end)
			end
			return
		else
			if OnPromptFailureFunction ~= nil then
				OnPromptFailureFunction(p3.errorCode, p3.outOfCreditsReason)
			end
			if Current1.placeId ~= nil then
				UseResult6(Current1.placeId, "Idle")
			end
			if p5 ~= nil then
				UseRefResult12.current(p5)
			end
			if p6 ~= nil then
				UseRefResult11.current(p6)
			end
			if p4 ~= nil then
				UseResult16(p4)
				UseResult18((UseContextResult:Format((CreatorAgentChatModule1.getPromptFailureComposerError(p3)))))
			end
			task.spawn(function()
				-- upvalues: Current1 (copy), UseRefResult4 (upval), Current (copy)
				Current1.refreshSession(function(): boolean
					-- upvalues: UseRefResult4 (upval), Current (upval)
					return UseRefResult4.current ~= Current
				end)
			end)
		end
	end, {
		v1, p1.createUniverseOnFirstPrompt, OnPromptFailureFunction,
		p1.onProjectResolved, SessionId, UseResult6, UseStateResult2,
		UseSignalStateResult, UseChatScrollModuleResult, UseResult16, UseResult18,
		UseResult3, UseStateResult2_3, UseContextResult
	})
	local UseRefResult30 = ReactModule.useRef(NoHydrateHistoryWhen)
	ReactModule.useEffect(function()
		-- upvalues: NoHydrateHistoryWhen (copy), UseRefResult30 (copy), IsIsLibraryChat (copy), HasUseStateResult (copy), UseStateResult10 (copy), UseChatScrollModuleResult (copy)
		local NoCurrent: boolean = NoHydrateHistoryWhen and not UseRefResult30.current
		UseRefResult30.current = NoHydrateHistoryWhen
		
		if IsIsLibraryChat then return end
		if not NoHydrateHistoryWhen then return end
		if NoCurrent or HasUseStateResult or UseStateResult10 ~= nil then
			UseChatScrollModuleResult.scrollToBottomUnconditionally()
			task.defer(UseChatScrollModuleResult.scrollToBottomUnconditionally)
			task.delay(0.15, UseChatScrollModuleResult.scrollToBottomUnconditionally)
			
			return
		end
	end, {
		NoHydrateHistoryWhen, IsIsLibraryChat, HasUseStateResult, UseStateResult10,
		#Messages, UseChatScrollModuleResult
	})
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult2 (copy), UseRefResult3 (copy), UseMemoResult (copy), SessionId (ref), UseStateResult8 (copy), UseRefResult4 (copy), UseRefResult9 (copy), PlaceId (ref), UseResult6 (copy), CreatorAgentChatModule1 (upval), UseResult20 (copy), UseResult2 (copy), UseResult (copy), UseResult3 (copy), UseChatScrollModuleResult (copy), UseMemoResult4 (copy), UseStateResult10 (copy), CreatorAgentChatStore (copy), HasUseStateResult (copy)
		if UseRefResult2.current ~= nil then
			local Current = UseRefResult3.current
			local SessionId1 = SessionId
			
			if Current ~= nil and Current.session == UseMemoResult and (SessionId1 == nil or SessionId1 == "" or (Current.sessionId == SessionId1 or Current.sessionId == nil and Current.session.getCasSessionId() == SessionId1)) then return end
		end
		if UseStateResult8 ~= nil then return end
		if UseMemoResult == nil then return end
		local CasSessionId = UseMemoResult.getCasSessionId()
		local Text = nil
		
		if typeof(CasSessionId) == "string" and CasSessionId ~= "" then
			Text = CasSessionId
		else
			local UniverseId = UseMemoResult.universeId
			local PlaceId1 = UseMemoResult.placeId
			Text = if UniverseId == nil or PlaceId1 == nil then nil else `{UniverseId}:{PlaceId1}`
		end
		if Text == nil then return end
		local function attachResumedTurn(ActiveTurnHandle, Current: number)
			-- upvalues: UseRefResult4 (upval), UseRefResult9 (upval), PlaceId (upval), UseResult6 (upval), CreatorAgentChatModule1 (upval), UseMemoResult (upval), UseResult20 (upval), UseResult2 (upval), UseResult (upval), UseResult3 (upval), UseChatScrollModuleResult (upval)
			UseRefResult4.current += 1
			local Current1 = UseRefResult4.current
			UseRefResult9.current = Current
			
			if PlaceId ~= nil then
				UseResult6(PlaceId, "Loading")
			end
			local ResumedAssistantTurn = CreatorAgentChatModule1.createResumedAssistantTurn(UseMemoResult, ActiveTurnHandle, function(p3)
				-- upvalues: UseResult20 (upval), Current1 (copy), UseMemoResult (upval)
				UseResult20(Current1, p3, nil, nil, nil, UseMemoResult)
			end, if Current == nil then nil else Current - 1, UseResult2(Current1), UseResult)
			UseResult3(ResumedAssistantTurn, UseMemoResult)
			ResumedAssistantTurn.start()
			UseChatScrollModuleResult.scrollToBottomUnconditionally()
		end
		
		if UseMemoResult4.activeTurnState == nil or UseMemoResult4.activeTurnItemIndex == nil or UseMemoResult4.activeTurnState.isDone then
			UseRefResult9.current = nil
			local ActiveTurnHandle = CreatorAgentChatStore.getActiveTurnHandle(Text)
			local StateResult = if ActiveTurnHandle == nil then nil else ActiveTurnHandle.state(false)
			local NoIsDone: boolean = ActiveTurnHandle ~= nil and (StateResult ~= nil and not StateResult.isDone)
			
			if not HasUseStateResult and not NoIsDone then return end
			if NoIsDone then
				attachResumedTurn(ActiveTurnHandle, nil)
			end
			return
		else
			local ActiveTurnStartSequenceId = UseMemoResult4.activeTurnStartSequenceId
			
			if UseRefResult9.current == ActiveTurnStartSequenceId and UseStateResult10 ~= nil then return end
			local ResumeTurnFromHistoryResult = CreatorAgentChatStore.resumeTurnFromHistory(Text, UseMemoResult4.activeTurnState, UseMemoResult4.activeTurnSequenceIds)
			
			if ResumeTurnFromHistoryResult ~= nil then
				attachResumedTurn(ResumeTurnFromHistoryResult, ActiveTurnStartSequenceId)
			end
		end
	end, {
		UseMemoResult4, UseMemoResult, SessionId, CreatorAgentChatStore,
		HasUseStateResult, UseStateResult10, PlaceId, UseResult6, UseResult20,
		UseChatScrollModuleResult, UseResult3, UseStateResult8, UseResult2, UseResult
	})
	local UseResult21 = ReactModule.useCallback(function(Current, Text, p3, Images, ResourceAttachments, Current1, AfterSequenceId, p4, Callback3, Callback1: () -> (), Callback4, Attempt, Callback5)
		-- upvalues: UseStateResult2_3 (copy), UseResult4 (ref), BuildAppStorageKeyEngineFeature (upval), UseResult15 (copy), SessionId (ref), FFlagBuildExperienceRestoreStoppedPromptModule (upval), UseRefResult21 (ref), FFlagBuildExperienceLibrary (upval), FFlagBuildExperienceModelPickerModule (upval), CreatorAgentChatModule1 (upval), UseRefResult2 (copy), UseRefResult4 (copy), UseResult3 (copy), UseRefResult9 (copy), UseResult6 (copy), UseResult20 (copy), UseResult2 (copy), UseResult (copy), UseChatScrollModuleResult (copy), UseRefResult5 (ref), Callback2 (ref), BeginBuildModelSendModule (upval), UseBuildModelSessionModuleResult (ref), CreatorCreditModule (upval), CreatorAgentChatModule (upval), v4 (ref), IsEnabled (upval), FFlagBuildExperiencePaywallBlockTelemetryModule (upval), FFlagBuildExperienceChatOpenIdModule (upval), LocalizationStringsModule (upval), GetBuildCreatorCreditRefreshStoreModule (upval), OnPromptFailureFunction (ref), SendBuildExperienceEventModule (upval), FFlagBuildExperiencePromptIsInExperienceTelemetryModule (upval), UseResult19 (copy), UseContextResult (copy)
		local function startAdmitted(p5)
			-- upvalues: UseStateResult2_3 (upval), Text (copy), Images (copy), ResourceAttachments (copy), AfterSequenceId (copy), UseResult4 (upval), BuildAppStorageKeyEngineFeature (upval), p4 (copy), UseResult15 (upval), Current (copy), SessionId (upval), FFlagBuildExperienceRestoreStoppedPromptModule (upval), UseRefResult21 (upval), Current1 (copy), Callback3 (copy), FFlagBuildExperienceLibrary (upval), Callback4 (copy), FFlagBuildExperienceModelPickerModule (upval), Attempt (ref), CreatorAgentChatModule1 (upval), p3 (copy), UseRefResult2 (upval), UseRefResult4 (upval), UseResult3 (upval), UseRefResult9 (upval), UseResult6 (upval), Callback1 (copy), UseResult20 (upval), UseResult2 (upval), UseResult (upval), UseChatScrollModuleResult (upval)
			UseStateResult2_3({
				text = Text,
				images = Images,
				resourceAttachments = ResourceAttachments,
				afterSequenceId = AfterSequenceId
			})
			local UseResult1: (any) -> () = if BuildAppStorageKeyEngineFeature and p4 ~= nil then function(p6)
				-- upvalues: UseResult1 (copy), UseResult15 (upval), p4 (upval), Current (upval), SessionId (upval)
				if UseResult1 ~= nil then
					UseResult1(p6)
				end
				UseResult15(p4, Current.getCasSessionId() or SessionId)
			end else UseResult4
			
			if FFlagBuildExperienceRestoreStoppedPromptModule and UseRefResult21 ~= nil then
				local UseRefResult = UseRefResult21
				
				UseResult1 = function(p6)
					-- upvalues: UseRefResult (copy), Current1 (upval), UseResult1 (copy)
					UseRefResult.current = Current1
					
					if UseResult1 ~= nil then
						UseResult1(p6)
					end
				end
			end
			if Callback3 ~= nil then
				UseResult1 = function(p6)
					-- upvalues: UseResult1 (copy), Callback3 (upval), Current (upval)
					if UseResult1 ~= nil then
						UseResult1(p6)
					end
					Callback3(Current.getCasSessionId())
				end
			end
			local v9: () -> () = if FFlagBuildExperienceLibrary and Callback4 ~= nil then function()
				-- upvalues: BuildAppStorageKeyEngineFeature (upval), p4 (upval), UseResult15 (upval), Current (upval), SessionId (upval), Callback4 (upval)
				if BuildAppStorageKeyEngineFeature and p4 ~= nil then
					UseResult15(p4, Current.getCasSessionId() or SessionId)
				end
				Callback4(Current.getCasSessionId())
			end else nil
			
			if FFlagBuildExperienceModelPickerModule and Attempt ~= nil then
				local Attempt1 = Attempt
				local Callback = UseResult1
				
				if Callback ~= nil then
					UseResult1 = function(p6)
						-- upvalues: Attempt1 (copy), Callback (copy)
						if Attempt1.isCurrent() then
							Callback(p6)
						end
					end
				end
				local Callback2 = v9
				
				if Callback2 ~= nil then
					v9 = function()
						-- upvalues: Attempt1 (copy), Callback2 (copy)
						if Attempt1.isCurrent() then
							Callback2()
						end
					end
				end
			end
			local LiveAssistantTurn = nil
			LiveAssistantTurn = CreatorAgentChatModule1.createLiveAssistantTurn(Current, p3, function(p6)
				-- upvalues: FFlagBuildExperienceModelPickerModule (upval), Attempt (upval), UseRefResult2 (upval), LiveAssistantTurn (ref), UseRefResult4 (upval), Current1 (upval), UseResult3 (upval), UseRefResult9 (upval), UseStateResult2_3 (upval), Current (upval), UseResult6 (upval), Callback1 (upval), UseResult20 (upval), p4 (upval), Images (upval), ResourceAttachments (upval)
				if FFlagBuildExperienceModelPickerModule and Attempt ~= nil then
					local IsCurrent = Attempt.isCurrent()
					Attempt.release()
					
					if not IsCurrent then
						if UseRefResult2.current == LiveAssistantTurn and UseRefResult4.current == Current1 then
							UseResult3(nil)
							UseRefResult9.current = nil
							UseStateResult2_3(nil)
							
							if Current.placeId ~= nil then
								UseResult6(Current.placeId, "Idle")
							end
						end
						if Callback1 ~= nil then
							Callback1()
						end
						return
					end
				end
				UseResult20(Current1, p6, p4, Images, ResourceAttachments, Current)
				
				if Callback1 ~= nil then
					Callback1()
				end
			end, UseResult2(Current1), UseResult, UseResult1, v9, if FFlagBuildExperienceModelPickerModule then p5 else nil, if FFlagBuildExperienceModelPickerModule and p5 ~= nil then p5.sessionId else nil, if FFlagBuildExperienceModelPickerModule and Attempt ~= nil then function(): boolean
				-- upvalues: Attempt (upval)
				return not Attempt.isCurrent()
			end else nil)
			
			if Current.placeId ~= nil then
				UseResult6(Current.placeId, "Loading")
			end
			UseResult3(LiveAssistantTurn, Current)
			UseChatScrollModuleResult.scrollToBottomAfterSend()
			LiveAssistantTurn.start()
		end
		
		if not FFlagBuildExperienceModelPickerModule then
			startAdmitted(nil)
			
			return
		end
		local UseRefResult = UseRefResult5
		local Callback: (any) -> () = Callback2
		Attempt = Attempt or BeginBuildModelSendModule(if UseBuildModelSessionModuleResult == nil then nil else UseBuildModelSessionModuleResult.entry, CreatorCreditModule.getCreatorCreditStore(false), CreatorAgentChatModule.experimentOverride.getPromptExperiment(CreatorAgentChatModule.experimentOverride.getKey(Current.getCasSessionId()) or v4), if IsEnabled and v4 ~= nil then CreatorAgentChatModule.experimentOverride.getInternalSelection(CreatorAgentChatModule.experimentOverride.getKey(Current.getCasSessionId()) or v4, false) else nil)
		
		if Attempt ~= nil then
			local Attempt1 = Attempt
			local Current2 = {
				started = false,
				attempt = Attempt1,
				onTerminal = Callback1,
				restoreDraft = Callback5
			}
			UseRefResult.current = Current2
			Callback(true)
			local ClockTime = os.clock()
			local ChatOpenIdForUniverse = if FFlagBuildExperiencePaywallBlockTelemetryModule and FFlagBuildExperienceChatOpenIdModule then CreatorAgentChatModule.chatOpenTelemetry.getChatOpenIdForUniverse(Current.universeId) else nil
			task.spawn(function()
				-- upvalues: Attempt1 (copy), Current (copy), UseRefResult4 (upval), Current1 (copy), UseRefResult (copy), Current2 (copy), Callback (copy), UseStateResult2_3 (upval), LocalizationStringsModule (upval), CreatorAgentChatModule1 (upval), GetBuildCreatorCreditRefreshStoreModule (upval), OnPromptFailureFunction (upval), FFlagBuildExperiencePaywallBlockTelemetryModule (upval), ChatOpenIdForUniverse (copy), SendBuildExperienceEventModule (upval), FFlagBuildExperiencePromptIsInExperienceTelemetryModule (upval), ClockTime (copy), Callback5 (copy), UseResult19 (upval), UseContextResult (upval), Callback1 (copy), startAdmitted (copy)
				local Success, Result, Result3 = pcall(Attempt1.prepare, Current)
				local Inverted: boolean = not Attempt1.isCurrent() or UseRefResult4.current ~= Current1
				
				if not Inverted and Success and Result ~= nil then
					Callback(false)
					Current2.started = true
					startAdmitted(Result)
					
					return
				end
				Attempt1.release()
				
				if UseRefResult.current == Current2 then
					UseRefResult.current = nil
					Callback(false)
					UseStateResult2_3(nil)
				end
				if Inverted then
					if UseRefResult4.current == Current1 and Callback5 ~= nil then
						Callback5(true)
					end
				else
					local CHATDEFAULTFAILURE = LocalizationStringsModule.CHAT_DEFAULT_FAILURE
					
					if Success and Result3 ~= nil then
						if Result3.kind == "setup" then
							CHATDEFAULTFAILURE = CreatorAgentChatModule1.getPromptFailureComposerError({
								isContentPolicy = false,
								errorCode = Result3.errorCode,
								setupStage = if Result3.setupError and Result3.setupError.stage ~= "session_load" then Result3.setupError.stage else nil
							})
						elseif Result3.kind == "unavailable" then
							CHATDEFAULTFAILURE = LocalizationStringsModule.MODEL_PICKER_UNAVAILABLE
						elseif Result3.kind == "denied" then
							CHATDEFAULTFAILURE = LocalizationStringsModule.CHAT_ERROR_OUT_OF_CREDITS
							GetBuildCreatorCreditRefreshStoreModule(false).refresh()
						end
						if OnPromptFailureFunction ~= nil then
							OnPromptFailureFunction(Result3.errorCode, Result3.reason)
						end
					end
					if FFlagBuildExperiencePaywallBlockTelemetryModule then
						local config = {
							universeId = Current.universeId,
							placeId = Current.placeId,
							conversationId = Current.getCasSessionId(),
							chatOpenId = ChatOpenIdForUniverse
						}
						SendBuildExperienceEventModule("SEND_PROMPT_START", config, if FFlagBuildExperiencePromptIsInExperienceTelemetryModule then {
							isInExperience = if game.GameId == 0 then "false" else "true"
						} else nil)
						local AdmissionFailureTelemetryParameters = CreatorAgentChatModule1.getAdmissionFailureTelemetryParameters(if Success then Result3 else nil, CHATDEFAULTFAILURE, (math.round((os.clock() - ClockTime) * 1000)))
						
						if FFlagBuildExperiencePromptIsInExperienceTelemetryModule then
							AdmissionFailureTelemetryParameters.isInExperience = if game.GameId == 0 then "false" else "true"
						end
						SendBuildExperienceEventModule("SEND_PROMPT_FAILED", config, AdmissionFailureTelemetryParameters)
					end
					if Callback5 ~= nil then
						Callback5(false)
					end
					UseResult19(UseContextResult:Format(CHATDEFAULTFAILURE))
				end
				if Callback1 ~= nil then
					Callback1()
				end
			end)
			
			return
		elseif Callback1 ~= nil then
			Callback1()
		end
	end, {
		UseBuildModelSessionModuleResult, v4, UseRefResult5, UseMemoResult1,
		Callback2, UseResult19, UseContextResult, OnPromptFailureFunction, UseResult20,
		UseResult6, UseChatScrollModuleResult, UseResult3, UseStateResult2_3,
		UseResult2, UseResult, UseResult4, UseResult15, SessionId
	})
	local UseRefResult31 = ReactModule.useRef(UseMemoResult4.latestSequenceId)
	UseRefResult31.current = UseMemoResult4.latestSequenceId
	local UseAgentRollbackRequestModuleResult = UseAgentRollbackRequestModule({
		universeId = UniverseId,
		placeId = PlaceId,
		session = UseMemoResult,
		activeTurnHandleRef = UseRefResult2,
		startRollbackTurn = ReactModule.useCallback(function(p3, Callback1, Callback: () -> ())
			-- upvalues: UseMemoResult (copy), FFlagBuildExperienceModelPickerModule (upval), UseRefResult5 (ref), UseChatScrollModuleResult (copy), UseRefResult4 (copy), UseStateResult2_4 (copy), BuildAgentRollbackPromptModule (upval), UseResult21 (copy), UseRefResult31 (copy)
			if UseMemoResult == nil then
				Callback()
				
				return
			end
			if FFlagBuildExperienceModelPickerModule then
				local Current = UseRefResult5.current
				
				if Current ~= nil and not Current.started and Current.attempt.isCurrent() then
					Callback()
					
					return
				end
			end
			UseChatScrollModuleResult.captureStickToBottomForSend()
			UseRefResult4.current += 1
			local Current = UseRefResult4.current
			UseStateResult2_4(nil)
			local AgentRollbackPromptModule = BuildAgentRollbackPromptModule(p3.versionNumber, p3.noteTitle, p3.noteDescription)
			UseResult21(UseMemoResult, AgentRollbackPromptModule, AgentRollbackPromptModule, nil, nil, Current, UseRefResult31.current, nil, function()
				-- upvalues: UseChatScrollModuleResult (upval), Callback1 (copy)
				UseChatScrollModuleResult.scrollToBottomUnconditionally()
				Callback1()
			end, Callback)
		end, {
			UseMemoResult,
			UseRefResult5,
			UseChatScrollModuleResult,
			UseStateResult2_4,
			UseResult21
		})
	})
	ReactModule.useLayoutEffect(function()
		-- upvalues: UseStateResult9 (copy), UseRefResult3 (copy), UseMemoResult (copy), SessionId (ref), UseRefResult4 (copy), UseRefResult9 (copy), UseAgentRollbackRequestModuleResult (copy), UseResult6 (copy), FFlagBuildExperienceModelPickerModule (upval), UseRefResult5 (ref), UseResult3 (copy), UseStateResult2_3 (copy), UseStateResult2_4 (copy)
		if UseStateResult9 ~= nil then
			local Current = UseRefResult3.current
			local SessionId1 = SessionId
			
			if Current == nil or Current.session ~= UseMemoResult or SessionId1 ~= nil and SessionId1 ~= "" and (Current.sessionId ~= SessionId1 and (Current.sessionId ~= nil or Current.session.getCasSessionId() ~= SessionId1)) then
				local Current1 = UseRefResult3.current
				UseRefResult4.current += 1
				UseRefResult9.current = nil
				
				if UseAgentRollbackRequestModuleResult.stopRequestBeforeReceipt(UseStateResult9) then
					if Current1 ~= nil and Current1.session.placeId ~= nil then
						UseResult6(Current1.session.placeId, "Idle")
					end
				else
					UseStateResult9.detach()
					
					if FFlagBuildExperienceModelPickerModule then
						local UseRefResult = UseRefResult5
						local Current2 = UseRefResult.current
						
						if Current2 ~= nil and Current2.started then
							Current2.attempt.unlockSelection()
							UseRefResult.current = nil
						end
					end
				end
				UseResult3(nil, nil)
				UseStateResult2_3(nil)
				UseStateResult2_4(nil)
				
				return
			end
		end
	end, {
		UseMemoResult, SessionId, UseStateResult9, UseResult3,
		UseAgentRollbackRequestModuleResult, UseResult6, UseRefResult5
	})
	local UseResult22 = ReactModule.useCallback(function(Text, p3, Images, ResourceAttachments, Current, AfterSequenceId, p4, p5)
		-- upvalues: UseStateResult2_3 (copy), FFlagBuildExperienceModelPickerModule (upval), p1 (copy), GetBuildModelSelectionStoreModule (upval), v3 (ref), UseMemoResult1 (ref), UseBuildModelSessionModuleResult (ref), FFlagBuildExperienceChatOpenIdModule (upval), CreatorAgentChatModule (upval), UniverseCreateModule (upval), GetDefaultTemplatePlaceIdModule (upval), Debug (upval), FFlagBuildExperiencePromptFailureTelemetry (upval), UseRefResult4 (copy), UniverseConfigurationModule (upval), UseSignalStateResult (ref), UseStateResult2 (copy), CreatorAgentChatStore (copy), SessionId (ref), IsEnabled (upval), v4 (ref), v5 (ref), UseResult21 (copy), LocalizationStringsModule (upval), ChatConstantsModule (upval), RequestFailureKind (upval), FFlagBuildExperiencePromptIsInExperienceTelemetryModule (upval), SendBuildExperienceEventModule (upval), UseResult3 (copy), UseResult16 (copy), UseRefResult12 (copy), UseRefResult11 (copy), Callback2 (ref), UseResult18 (copy), FormatResult (copy)
		UseStateResult2_3({
			text = Text,
			images = Images,
			resourceAttachments = ResourceAttachments,
			afterSequenceId = AfterSequenceId
		})
		local Callback1 = nil
		local UniverseId = nil
		
		if FFlagBuildExperienceModelPickerModule and p1.modelSelectionDraftId ~= nil then
			Callback1 = GetBuildModelSelectionStoreModule(false).retainDraftForCreation(p1.modelSelectionDraftId)
		end
		local Callback: (any) -> () = v3
		local UseMemoResult = UseMemoResult1
		local Entry = if UseBuildModelSessionModuleResult == nil then nil else UseBuildModelSessionModuleResult.entry
		
		local function _(): boolean
			-- upvalues: Entry (copy)
			return Entry ~= nil and Entry.getSelection(false) ~= nil
		end
		
		if UseMemoResult ~= nil then
			UseMemoResult.pending = true
			Callback(true)
		end
		local ClockTime = os.clock()
		local Config = nil
		local ChatOpenIdForUniverse = if FFlagBuildExperienceChatOpenIdModule then CreatorAgentChatModule.chatOpenTelemetry.getChatOpenIdForUniverse(nil) else nil
		local Promise = UniverseCreateModule.getUniverseCreateStore().createUniverse({
			isPublish = true,
			templatePlaceId = GetDefaultTemplatePlaceIdModule()
		}):andThen(function(Result)
			-- upvalues: FFlagBuildExperienceModelPickerModule (upval), UniverseId (ref), Debug (upval), ClockTime (copy), FFlagBuildExperiencePromptFailureTelemetry (upval), Config (ref), Entry (copy), UseRefResult4 (upval), Current (copy), UniverseConfigurationModule (upval), UseMemoResult (copy), UseSignalStateResult (upval), UseStateResult2 (upval), p1 (upval), p4 (copy), CreatorAgentChatStore (upval), SessionId (upval), IsEnabled (upval), CreatorAgentChatModule (upval), v4 (upval), v5 (upval), UseResult21 (upval), Text (copy), p3 (copy), Images (copy), ResourceAttachments (copy), AfterSequenceId (copy), p5 (copy)
			if FFlagBuildExperienceModelPickerModule then
				UniverseId = Result.universeId
			end
			Debug.log("info", "build_experience create_universe succeeded", {
				durationMs = math.floor((os.clock() - ClockTime) * 1000 + 0.5),
				universeId = Result.universeId,
				rootPlaceId = Result.rootPlaceId
			})
			
			if FFlagBuildExperiencePromptFailureTelemetry then
				Config = {
					universeId = Result.universeId,
					placeId = Result.rootPlaceId
				}
			end
			if if FFlagBuildExperienceModelPickerModule then not (Entry ~= nil and Entry.getSelection(false) ~= nil) else UseRefResult4.current ~= Current then
				return nil
			else
				local UniverseConfigurationStore = UniverseConfigurationModule.getUniverseConfigurationStore()
				
				return UniverseConfigurationStore.patchConfiguration(Result.universeId, { audiences = { 1 } }):andThen(function()
					-- upvalues: FFlagBuildExperienceModelPickerModule (upval), Entry (upval), UniverseConfigurationStore (copy), Result (copy)
					if FFlagBuildExperienceModelPickerModule and (Entry == nil or Entry.getSelection(false) == nil) then
						return nil
					else
						return UniverseConfigurationStore.setTeamCreate(Result.universeId, true)
					end
				end):andThen(function()
					-- upvalues: FFlagBuildExperienceModelPickerModule (upval), Entry (upval), UseMemoResult (upval), UseRefResult4 (upval), Current (upval), Result (copy), UseSignalStateResult (upval), UseStateResult2 (upval), p1 (upval), p4 (upval), CreatorAgentChatStore (upval), SessionId (upval), IsEnabled (upval), CreatorAgentChatModule (upval), v4 (upval), v5 (upval), UseResult21 (upval), Text (upval), p3 (upval), Images (upval), ResourceAttachments (upval), AfterSequenceId (upval), p5 (upval)
					if if FFlagBuildExperienceModelPickerModule then not (Entry ~= nil and Entry.getSelection(false) ~= nil) or (UseMemoResult == nil or not UseMemoResult.mounted) else UseRefResult4.current ~= Current then
						return nil
					end
					local config = {
						universeId = Result.universeId,
						placeId = Result.rootPlaceId
					}
					
					if FFlagBuildExperienceModelPickerModule then
						local Copy = table.clone(config)
						Copy.accountId = UseSignalStateResult
						UseStateResult2(Copy)
					else
						UseStateResult2(config)
					end
					if p1.onProjectResolved ~= nil then
						p1.onProjectResolved(config)
					end
					if p4 ~= nil and not p4.isCurrent() then
						return nil
					end
					local SessionForProject = CreatorAgentChatStore.getSessionForProject(Result.universeId, Result.rootPlaceId, SessionId)
					
					if IsEnabled and (FFlagBuildExperienceModelPickerModule and CreatorAgentChatModule.experimentOverride.has(v4) or v5 ~= nil and v5.current) then
						SessionForProject.setPendingExperimentKey(v4)
					end
					UseResult21(SessionForProject, Text, p3, Images, ResourceAttachments, Current, AfterSequenceId, Text, nil, nil, nil, p4, p5)
					
					return nil
				end)
			end
		end):catch(function(Err)
			-- upvalues: Debug (upval), ClockTime (copy), UseRefResult4 (upval), Current (copy), p4 (copy), FFlagBuildExperiencePromptFailureTelemetry (upval), Config (ref), FFlagBuildExperienceChatOpenIdModule (upval), ChatOpenIdForUniverse (copy), LocalizationStringsModule (upval), ChatConstantsModule (upval), RequestFailureKind (upval), FFlagBuildExperiencePromptIsInExperienceTelemetryModule (upval), SendBuildExperienceEventModule (upval), UseResult3 (upval), UseStateResult2_3 (upval), UseResult16 (upval), Text (copy), Images (copy), UseRefResult12 (upval), ResourceAttachments (copy), UseRefResult11 (upval), Callback2 (upval), UseResult18 (upval), FormatResult (upval)
			Debug.log("warn", "build_experience create_or_configure_universe failed", {
				durationMs = math.floor((os.clock() - ClockTime) * 1000 + 0.5),
				error = Err
			})
			
			if UseRefResult4.current ~= Current or p4 ~= nil and not p4.isCurrent() then return end
			if FFlagBuildExperiencePromptFailureTelemetry then
				local Rounded = math.round((os.clock() - ClockTime) * 1000)
				local T = if Config == nil then {} else { universeId = Config.universeId, placeId = Config.placeId }
				
				if FFlagBuildExperienceChatOpenIdModule then
					T = {
						universeId = T.universeId,
						placeId = T.placeId,
						chatOpenId = ChatOpenIdForUniverse
					}
				end
				local config = {
					isContentPolicy = "false",
					receivedResponse = "false",
					setupStage = if Config == nil then "create_universe" else "configure_universe",
					errorCopyKey = LocalizationStringsModule.CHAT_CREATE_UNIVERSE_ERROR,
					elapsedMs = tostring(Rounded),
					stalled = tostring(ChatConstantsModule.PROMPT_STALL_SECONDS * 1000 <= Rounded),
					failureKind = RequestFailureKind.Unknown
				}
				
				if typeof(Err) == "table" and typeof(Err.responseCode) == "number" then
					config.failureKind = RequestFailureKind.Http
					config.httpStatusCode = tostring(Err.responseCode)
				end
				if FFlagBuildExperiencePromptIsInExperienceTelemetryModule then
					config.isInExperience = if game.GameId == 0 then "false" else "true"
				end
				SendBuildExperienceEventModule("SEND_PROMPT_START", T, if FFlagBuildExperiencePromptIsInExperienceTelemetryModule then {
					isInExperience = if game.GameId == 0 then "false" else "true"
				} else nil)
				SendBuildExperienceEventModule("SEND_PROMPT_FAILED", T, config)
			end
			UseResult3(nil)
			UseStateResult2_3(nil)
			UseResult16(Text)
			
			if Images ~= nil then
				UseRefResult12.current(Images)
			end
			if ResourceAttachments ~= nil then
				UseRefResult11.current(ResourceAttachments)
			end
			if p4 ~= nil then
				p4.release()
				Callback2(false)
			end
			UseResult18(FormatResult)
		end)
		
		if FFlagBuildExperienceModelPickerModule then
			Promise:finally(function()
				-- upvalues: Callback1 (ref), UniverseId (ref), UseMemoResult (copy), Callback (copy)
				if Callback1 ~= nil then
					Callback1(UniverseId)
				end
				if UseMemoResult ~= nil then
					UseMemoResult.pending = false
					
					if UseMemoResult.mounted then
						Callback(false)
					end
				end
			end)
		end
	end, {
		UseMemoResult1, UseBuildModelSessionModuleResult, v3, Callback2, SessionId,
		CreatorAgentChatStore, p1.onProjectResolved, p1.modelSelectionDraftId,
		UseResult3, UseResult16, UseResult18, UseStateResult2, UseSignalStateResult,
		UseStateResult2_3, UseResult21, FormatResult, v4, v5
	})
	local UseResult23 = ReactModule.useCallback(function(p3): boolean
		-- upvalues: NoSendMessageWhen (copy), UseMemoResult1 (ref), UseRefResult29 (copy), UseRefResult24 (copy), UseRefResult25 (copy), FFlagBuildChatPasteAsAttachmentModule (upval), PastedTextAttachmentModule (upval), UseResult16 (copy), UseRefResult3 (copy), UseMemoResult (copy), SessionId (ref), UseRefResult2 (copy), HasUseStateResult (copy), IsIsLibraryChat (copy), UseRefResult27 (copy), UseChatScrollModuleResult (copy), p1 (copy), UniverseId (ref), PlaceId (ref), AgentRollbackRequestStoreModule (copy), UseRefResult12 (copy), UseRefResult11 (copy), FFlagBuildExperienceModelPickerModule (upval), UseResult18 (copy), BeginBuildModelSendModule (upval), UseBuildModelSessionModuleResult (ref), CreatorCreditModule (upval), CreatorAgentChatModule (upval), v4 (ref), IsEnabled (upval), UseRefResult5 (ref), Callback2 (ref), UseRefResult4 (copy), UseStateResult2_4 (copy), BuildAppStorageKeyEngineFeature (upval), UseResult14 (copy), UseResult10 (copy), UseResult22 (copy), UseMemoResult4 (copy), UseResult21 (copy), FFlagBuildExperienceLibrary (upval)
		if not NoSendMessageWhen then
			return false
		end
		if UseMemoResult1 ~= nil and UseMemoResult1.pending then
			return false
		end
		local Replaced = string.gsub(UseRefResult29.current, "^%s*(.-)%s*$", "%1")
		local Current = UseRefResult24.current
		local Current1 = UseRefResult25.current
		
		if Replaced == "" and #Current == 0 and (not FFlagBuildChatPasteAsAttachmentModule or not PastedTextAttachmentModule.hasPastedText(Current1)) then
			UseResult16("")
			
			return false
		end
		for _, value in Current do
			if value.uri == nil or value.uploadStatus == "uploading" or value.uploadStatus == "failed" then
				return false
			end
		end
		local Current2 = UseRefResult3.current
		local SessionId1 = SessionId
		local NoSessionId: boolean = Current2 ~= nil and Current2.session == UseMemoResult and (SessionId1 == nil or SessionId1 == "" or (Current2.sessionId == SessionId1 or Current2.sessionId == nil and Current2.session.getCasSessionId() == SessionId1))
		local Current3 = if NoSessionId then UseRefResult2.current else nil
		
		if HasUseStateResult or IsIsLibraryChat and Current3 ~= nil then
			if #Current > 0 or #Current1 > 0 then
				return false
			end
			if Current3 == nil or not Current3.trySubmitComposerText(Replaced) then
				return false
			end
			UseResult16("")
			
			if UseRefResult27.current then
				UseRefResult27.current.releaseFocus()
			end
			UseChatScrollModuleResult.scrollToBottomAfterSend()
			
			return true
		else
			local NoUniverseId: boolean = p1.createUniverseOnFirstPrompt == true and UniverseId == nil
			
			if not NoUniverseId and UseMemoResult == nil then
				return false
			end
			if PlaceId ~= nil and AgentRollbackRequestStoreModule.getIsPendingForPlaceId(PlaceId)(false) then
				return false
			end
			local function restoreDraft(p4)
				-- upvalues: UseRefResult29 (upval), UseRefResult24 (upval), UseRefResult25 (upval), UseResult16 (upval), Replaced (copy), UseRefResult12 (upval), Current (copy), UseRefResult11 (upval), Current1 (copy)
				if not p4 or UseRefResult29.current == "" and #UseRefResult24.current <= 0 and #UseRefResult25.current <= 0 then
					UseResult16(Replaced)
					UseRefResult12.current(Current)
					UseRefResult11.current(Current1)
					
					return
				end
			end
			
			local Attempt = nil
			
			if FFlagBuildExperienceModelPickerModule then
				UseResult18(nil)
				Attempt = BeginBuildModelSendModule(if UseBuildModelSessionModuleResult == nil then nil else UseBuildModelSessionModuleResult.entry, CreatorCreditModule.getCreatorCreditStore(false), CreatorAgentChatModule.experimentOverride.getPromptExperiment(CreatorAgentChatModule.experimentOverride.getKey(if UseMemoResult == nil then nil else UseMemoResult.getCasSessionId()) or v4), if IsEnabled and v4 ~= nil then CreatorAgentChatModule.experimentOverride.getInternalSelection(CreatorAgentChatModule.experimentOverride.getKey(if UseMemoResult == nil then nil else UseMemoResult.getCasSessionId()) or v4, false) else nil)
				
				if Attempt == nil then
					return false
				end
				UseRefResult5.current = {
					started = false,
					attempt = Attempt,
					restoreDraft = restoreDraft
				}
				Callback2(true)
			end
			UseChatScrollModuleResult.captureStickToBottomForSend()
			UseRefResult4.current += 1
			local Current4 = UseRefResult4.current
			UseStateResult2_4(nil)
			
			if BuildAppStorageKeyEngineFeature then
				UseResult14(Replaced)
			end
			UseResult10("")
			UseRefResult12.current({})
			UseRefResult11.current({})
			
			if UseRefResult27.current then
				UseRefResult27.current.releaseFocus()
			end
			local function startPrompt(Replaced1, p4)
				-- upvalues: NoUniverseId (copy), UseResult22 (upval), Replaced (copy), Current1 (copy), Current4 (copy), UseMemoResult4 (upval), Attempt (ref), FFlagBuildExperienceModelPickerModule (upval), restoreDraft (copy), UseResult21 (upval), UseMemoResult (upval), FFlagBuildExperienceLibrary (upval), p3 (copy)
				if NoUniverseId then
					UseResult22(Replaced, Replaced1, p4, Current1, Current4, UseMemoResult4.latestSequenceId, Attempt, if FFlagBuildExperienceModelPickerModule then restoreDraft else nil)
					
					return
				else
					UseResult21(UseMemoResult, Replaced, Replaced1, p4, Current1, Current4, UseMemoResult4.latestSequenceId, Replaced, nil, nil, if FFlagBuildExperienceLibrary then p3 else nil, Attempt, if FFlagBuildExperienceModelPickerModule then restoreDraft else nil)
				end
			end
			
			if #Current == 0 and #Current1 == 0 then
				startPrompt(Replaced, nil)
				
				return true
			end
			local List = {}
			
			if Replaced ~= "" then
				table.insert(List, { type = "text", text = Replaced })
			end
			for _, value1 in Current1 do
				if value1.type == "resource_link" then
					table.insert(List, {
						type = value1.type,
						uri = value1.uri,
						name = value1.name,
						mimeType = value1.mimeType
					})
				else
					table.insert(List, {
						type = value1.type,
						resource = {
							blob = nil,
							uri = value1.resource.uri,
							text = value1.resource.text,
							mimeType = value1.resource.mimeType
						}
					})
				end
			end
			local List1 = {}
			
			for _, value2 in Current do
				local Uri = value2.uri
				table.insert(List, { type = "image", uri = Uri })
				table.insert(List1, {
					uploadStatus = "uploaded",
					capture = value2.capture,
					uri = Uri
				})
			end
			startPrompt(List, List1)
			
			return true
		end
	end, {
		NoSendMessageWhen, UseMemoResult1, UseBuildModelSessionModuleResult, v4,
		UseRefResult5, Callback2, UseResult18, UseMemoResult, SessionId, UniverseId,
		PlaceId, HasUseStateResult, IsIsLibraryChat, UseChatScrollModuleResult,
		UseResult16, UseResult10, UseResult14, UseResult22, UseResult21,
		p1.createUniverseOnFirstPrompt, UseStateResult2_4, UseMemoResult4,
		AgentRollbackRequestStoreModule
	})
	local UseResult24 = ReactModule.useCallback(function()
		-- upvalues: FFlagBuildExperienceModelPickerModule (upval), UseRefResult5 (ref), Callback2 (ref), UseRefResult4 (copy), UseStateResult2_3 (copy), UseRefResult3 (copy), UseMemoResult (copy), SessionId (ref), UseRefResult2 (copy), UseAgentRollbackRequestModuleResult (copy), FFlagBuildExperiencePromptFailureTelemetry (upval), UseResult3 (copy), UseRefResult9 (copy), FFlagBuildExperienceRestoreStoppedPromptModule (upval), UseRefResult21 (ref), UseStateResult6 (copy), UseRefResult29 (copy), UseMemoResult4 (copy), UseResult16 (copy), UseRefResult24 (copy), UseRefResult12 (copy), UseRefResult25 (copy), UseRefResult11 (copy), UseStateResult2_4 (copy), PlaceId (ref), UseResult6 (copy)
		if FFlagBuildExperienceModelPickerModule then
			local UseRefResult = UseRefResult5
			local Current = UseRefResult.current
			
			if Current ~= nil and not Current.started then
				Current.attempt.release()
				UseRefResult.current = nil
				Callback2(false)
				
				if not Current.started then
					UseRefResult4.current += 1
					UseStateResult2_3(nil)
					
					if Current.restoreDraft ~= nil then
						Current.restoreDraft(true)
					end
					if Current.onTerminal ~= nil then
						Current.onTerminal()
					end
					return
				end
			end
		end
		local Current1 = UseRefResult3.current
		local SessionId1 = SessionId
		local NoSessionId: boolean = Current1 ~= nil and Current1.session == UseMemoResult and (SessionId1 == nil or SessionId1 == "" or (Current1.sessionId == SessionId1 or Current1.sessionId == nil and Current1.session.getCasSessionId() == SessionId1))
		local Current2 = if NoSessionId then UseRefResult2.current else nil
		
		if Current2 == nil then
			UseAgentRollbackRequestModuleResult.cancelRequestBeforeTurnStarts()
			
			return
		end
		if FFlagBuildExperienceModelPickerModule then
			if FFlagBuildExperiencePromptFailureTelemetry and Current2.reportUserStop ~= nil then
				Current2.reportUserStop()
			end
			Current2.stop()
			
			return
		else
			local Current = UseRefResult4.current
			UseRefResult4.current += 1
			
			if FFlagBuildExperiencePromptFailureTelemetry and Current2.reportUserStop ~= nil then
				Current2.reportUserStop()
			end
			if not UseAgentRollbackRequestModuleResult.stopRequestBeforeReceipt(Current2) then
				Current2.stop()
			end
			UseResult3(nil)
			UseRefResult9.current = nil
			
			if FFlagBuildExperienceRestoreStoppedPromptModule and UseRefResult21 ~= nil and UseRefResult21.current ~= Current and UseStateResult6 ~= nil and UseRefResult29.current == "" and UseMemoResult4.isAwaitingUserMessageEcho then
				UseResult16(UseStateResult6.text)
				
				if UseStateResult6.images ~= nil and #UseRefResult24.current == 0 then
					UseRefResult12.current(UseStateResult6.images)
				end
				if UseStateResult6.resourceAttachments ~= nil and #UseRefResult25.current == 0 then
					UseRefResult11.current(UseStateResult6.resourceAttachments)
				end
			end
			UseStateResult2_3(nil)
			UseStateResult2_4({
				session = UseMemoResult,
				sessionId = UseMemoResult.getCasSessionId(),
				startSequenceId = UseMemoResult4.activeTurnStartSequenceId
			})
			
			if PlaceId ~= nil then
				UseResult6(PlaceId, "Idle")
			end
		end
	end, {
		UseRefResult5, Callback2, UseMemoResult, SessionId, PlaceId, UseResult6,
		UseResult3, UseStateResult2_3, UseStateResult2_4, UseMemoResult4,
		UseAgentRollbackRequestModuleResult,
		if FFlagBuildExperienceRestoreStoppedPromptModule then UseStateResult6 else nil,
		if FFlagBuildExperienceRestoreStoppedPromptModule then UseResult16 else nil
	})
	local NoAutoFocusComposer = p1.autoFocusComposer == nil or p1.autoFocusComposer
	local NoAutoFocusComposer1 = if p1.focusComposerWhen == nil then NoAutoFocusComposer else p1.focusComposerWhen
	ReactModule.useEffect(function()
		-- upvalues: NoAutoFocusComposer (copy), NoAutoFocusComposer1 (copy), UseRefResult27 (copy)
		if NoAutoFocusComposer and NoAutoFocusComposer1 then
			local Flag = false
			
			local function v411()
				-- upvalues: Flag (ref)
				return Flag
			end
			
			local v9 = 8
			
			local function tryFocus()
				-- upvalues: v411 (copy), UseRefResult27 (copy), v9 (ref), tryFocus (copy)
				if v411() then return end
				local Current = UseRefResult27.current
				
				if Current then
					Current.focus()
					
					return
				end
				v9 -= 1
				
				if v9 > 0 then
					task.delay(0, tryFocus)
				end
			end
			
			task.defer(tryFocus)
			
			return function()
				-- upvalues: Flag (ref)
				Flag = true
			end
		else
			return function() end
		end
	end, { NoAutoFocusComposer, NoAutoFocusComposer1 })
	local UseResult25 = ReactModule.useCallback(function(p4)
		-- upvalues: PlaceId (ref), UseRefResult (copy), LaunchPlaytestWithLoadingStateModule (upval)
		if PlaceId == nil then return end
		local v9 = if game.GameId == 0 then function()
			-- upvalues: UseRefResult (upval)
			UseRefResult.current = true
		end else nil
		
		if LaunchPlaytestWithLoadingStateModule(PlaceId, p4, true, v9) and v9 ~= nil then
			UseRefResult.current = false
		end
	end, { PlaceId, UseRefResult })
	local UseMemoResult5 = nil
	UseMemoResult5 = if FFlagBuildExperienceAnswerFormModule then ReactModule.useMemo(function()
		-- upvalues: UseSignalStateResult3 (copy), UseResult18 (copy)
		local OnAnswerSelectedByToolCallId = {}
		
		for i, value in UseSignalStateResult3.onAnswerSelectedByToolCallId do
			OnAnswerSelectedByToolCallId[i] = function(p4, p5, p6)
				-- upvalues: UseResult18 (upval), value (copy)
				UseResult18(nil)
				value(p4, p5, p6)
			end
		end
		local OnAnswerConfirmedByToolCallId = {}
		
		for i1, value1 in UseSignalStateResult3.onAnswerConfirmedByToolCallId do
			OnAnswerConfirmedByToolCallId[i1] = function()
				-- upvalues: UseResult18 (upval), value1 (copy)
				UseResult18(nil)
				value1()
			end
		end
		return {
			onAnswerSelectedByToolCallId = OnAnswerSelectedByToolCallId,
			onAnswerConfirmedByToolCallId = OnAnswerConfirmedByToolCallId,
			onPlanAcceptedByToolCallId = UseSignalStateResult3.onPlanAcceptedByToolCallId,
			onDevProductApprovedByToolCallId = UseSignalStateResult3.onDevProductApprovedByToolCallId,
			onDevProductRejectedByToolCallId = UseSignalStateResult3.onDevProductRejectedByToolCallId
		}
	end, { UseSignalStateResult3, UseResult18 }) else UseSignalStateResult3
	
	return {
		currentSessionId = CasSessionId,
		internalTesting = InternalTesting,
		agentSpecVersion = PreviewHash,
		setAgentSpecVersion = UseResult1,
		messages = Messages,
		localToolActions = UseMemoResult5,
		answerForm = if FFlagBuildExperienceAnswerFormModule then ReactModule.useMemo(function()
			-- upvalues: GetActiveAnswerFormModule (upval), ActiveTurnState (copy), UseSignalStateResult2 (copy), UseMemoResult5 (ref)
			return GetActiveAnswerFormModule(ActiveTurnState, UseSignalStateResult2, UseMemoResult5)
		end, { ActiveTurnState, UseSignalStateResult2, UseMemoResult5 }) else nil,
		submitAnswerText = if FFlagBuildExperienceAnswerFormModule then ReactModule.useCallback(function(p4, p5, p6)
			-- upvalues: UseRefResult2 (copy), UseRefResult3 (copy), UseMemoResult (copy), SessionId (ref), UseResult18 (copy)
			local Current = UseRefResult2.current
			
			if Current ~= nil then
				local Current1 = UseRefResult3.current
				local SessionId1 = SessionId
				
				if Current1 ~= nil and Current1.session == UseMemoResult and (SessionId1 == nil or SessionId1 == "" or (Current1.sessionId == SessionId1 or Current1.sessionId == nil and Current1.session.getCasSessionId() == SessionId1)) then
					UseResult18(nil)
					
					return Current.trySubmitAnswerText(p4, p5, p6)
				end
			end
			return false
		end, { UseMemoResult, SessionId, UseResult18 }) else nil,
		composerText = UseBindingResult,
		composerErrorText = UseStateResult13,
		fundingFailure = FundingFailure,
		setComposerText = UseResult16,
		setPrefilledComposerText = UseResult17,
		composerImages = UseStateResult11,
		setComposerImages = setComposerImages,
		retryComposerImage = retryComposerImage,
		composerResourceAttachments = UseStateResult12,
		findComposerResourceAttachmentIndexByUri = findComposerResourceAttachmentIndexByUri,
		addComposerResourceAttachment = if FFlagBuildChatPasteAsAttachmentModule then UseResult5 else addComposerResourceAttachment,
		removeComposerResourceAttachmentAtIndex = removeComposerResourceAttachmentAtIndex,
		clearComposerResourceAttachments = clearComposerResourceAttachments,
		hasPreparedModelSession = if FFlagBuildExperienceModelPickerModule then UseBuildModelSessionModuleResult ~= nil and UseBuildModelSessionModuleResult.hasObservedModels else nil,
		modelSessionModels = if FFlagBuildExperienceModelPickerModule and UseBuildModelSessionModuleResult ~= nil then UseBuildModelSessionModuleResult.models else nil,
		isComposerSendBlocked = Flag or FFlagBuildExperienceModelPickerModule and (v2 or (v6 or (if UseBuildModelSessionModuleResult == nil or not UseBuildModelSessionModuleResult.isBusy then UseStateResult13 ~= nil and not UseStateResult14 else not HasUseStateResult or UseStateResult13 ~= nil and not UseStateResult14))),
		isAssistantResponding = HasUseStateResult,
		canStopAssistantResponse = UseStateResult10 ~= nil or (UseSignalStateResult6 or FFlagBuildExperienceModelPickerModule and v6),
		canSendWhileResponding = HasPendingLocalToolResponse,
		sendMessage = UseResult23,
		stopAssistantResponse = UseResult24,
		setScrollingFrame = UseChatScrollModuleResult.setScrollingFrame,
		anchorScrollToInstance = if FFlagBuildExperienceChatAccordionScrollAnchorModule then UseChatScrollModuleResult.anchorToInstance else nil,
		textBoxRef = UseRefResult27,
		clockBinding = UseClockResult,
		playtestPlaceId = PlaceId,
		launchPlaytest = if PlaceId == nil then nil else UseResult25,
		hasPublishedTurn = IncludesPublishTool,
		subagentTaskState = SubagentTaskState,
		isHistoryHydrationComplete = NoIsLoading,
		isHistoryLoading = NoNoIsLoading,
		isHistoryExhausted = NoHasNextHistoryPageToken
	}
end