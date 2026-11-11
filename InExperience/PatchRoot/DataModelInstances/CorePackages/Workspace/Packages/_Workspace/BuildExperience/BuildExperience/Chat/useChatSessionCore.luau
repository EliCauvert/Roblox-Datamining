local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local FFlagBuildExperienceChatImageAttachmentsModule = require(BuildExperience.Flags.FFlagBuildExperienceChatImageAttachments)
local FFlagBuildExperienceChatResourceAttachments = require(Parent.SharedFlags).FFlagBuildExperienceChatResourceAttachments
local FFlagBuildExperienceModelPickerModule = require(BuildExperience.Flags.FFlagBuildExperienceModelPicker)
local BuildAppStorageKeyEngineFeature = game:GetEngineFeature("BuildAppStorageKey")
local FFlagBuildExperienceRefreshChatDraftOnGameLeaveModule = require(BuildExperience.Flags.FFlagBuildExperienceRefreshChatDraftOnGameLeave)
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
local FFlagBuildExperienceChatHistoryPrefetchModule = require(BuildExperience.Flags.FFlagBuildExperienceChatHistoryPrefetch)
local FFlagBuildExperienceManageDevProductModule = require(BuildExperience.Flags.FFlagBuildExperienceManageDevProduct)
local FFlagBuildAdUpsellModule = require(BuildExperience.Flags.FFlagBuildAdUpsell)
local FFlagBuildExperienceLibrary = SharedFlagsModule.FFlagBuildExperienceLibrary
local FFlagBuildExperiencePromptFailureTelemetry = SharedFlagsModule.FFlagBuildExperiencePromptFailureTelemetry
local FFlagBuildExperienceNewGameChatDraftModule = require(BuildExperience.Flags.FFlagBuildExperienceNewGameChatDraft)
local FFlagBuildExperienceRestoreStoppedPromptModule = require(BuildExperience.Flags.FFlagBuildExperienceRestoreStoppedPrompt)
local ChatConstantsModule = require(script.Parent.chatConstants)
local ChatTypesModule = require(script.Parent.chatTypes)
local CreatorAgentChatModule1 = require(script.Parent.creatorAgentChat)
local GetNewGameChatDraftKeyModule = require(script.Parent.getNewGameChatDraftKey)
local ParseSessionStreamModule = require(script.Parent.parseSessionStream)
local FFlagBuildExperienceAnswerFormModule = require(BuildExperience.Flags.FFlagBuildExperienceAnswerForm)
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
local UploadCaptureAsyncModule = if FFlagBuildExperienceChatImageAttachmentsModule then require(BuildExperience.utils.uploadCaptureAsync) else nil
local Debug = CreatorAgentChatModule.debug
local RequestFailureKind = CreatorAgentChatModule.RequestFailureKind
local SendBuildExperienceEventModule = require(BuildExperience.Telemetry.sendBuildExperienceEvent)
local Signal = SignalsModule.createSignal(false)

local function noopSetAgentSpecVersion(_) end

local Frozen = table.freeze({})
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
			local HistoryWatermarkSequenceId = Current.historyWatermarkSequenceId
			local IsHistoryWatermarkSequenceIdBelow: boolean = not message.isDone and (HistoryWatermarkSequenceId ~= nil and HistoryWatermarkSequenceId < message.startSequenceId)
			
			if TurnId ~= nil and Current.liveTurnIds[TurnId] == true or IsHistoryWatermarkSequenceIdBelow then
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
	-- upvalues: FFlagBuildExperienceModelPickerModule (copy), ReactModule (copy), GetBuildCreatorCreditRefreshStoreModule (copy), LocalizationRoactContext (copy), LocalizationStringsModule (copy), FFlagBuildExperienceChatImageAttachmentsModule (copy), SignalsReactModule (copy), LocalUserIdStore (copy), FFlagBuildExperienceLibrary (copy), FFlagBuildAdUpsellModule (copy), CreatorAgentChatModule (copy), GetAgentRollbackRequestStoreModule (copy), UseBuildModelSessionModule (copy), Signal4 (copy), SignalsModule (copy), noopSetAgentSpecVersion (copy), IsEnabled (copy), UseBuildInternalTestingModule (copy), Signal1 (copy), Signal2 (copy), Signal3 (copy), ParseSessionStreamModule (copy), SessionPromptMessageFilterModule (copy), FFlagBuildExperienceChatResourceAttachments (copy), Signal (copy), hasPendingLocalToolResponse (copy), noteLiveAdUpsellTurns (copy), FFlagBuildExperiencePrefillSkipsDraftPersistModule (copy), BuildAppStorageKeyEngineFeature (copy), FFlagBuildExperienceNewGameChatDraftModule (copy), FFlagBuildExperienceRestoreStoppedPromptModule (copy), Frozen (copy), ReactUtilsModule (copy), UseChatScrollModule (copy), GetPlaytestLoadingStoreModule (copy), FFlagBuildExperienceChatHistoryPrefetchModule (copy), MessageBusService (copy), GameMessageId (copy), FFlagBuildExperienceRefreshChatDraftOnGameLeaveModule (copy), BuildAppStorageModule (copy), AppLifecycleObserverService (copy), GetNewGameChatDraftKeyModule (copy), ChatTypesModule (copy), UploadCaptureAsyncModule (copy), FFlagBuildExperienceAnswerFormModule (copy), CreatorAgentChatModule1 (copy), BeginBuildModelSendModule (copy), CreatorCreditModule (copy), BuildAgentRollbackPromptModule (copy), UseAgentRollbackRequestModule (copy), GetBuildModelSelectionStoreModule (copy), UniverseCreateModule (copy), GetDefaultTemplatePlaceIdModule (copy), Debug (copy), FFlagBuildExperiencePromptFailureTelemetry (copy), UniverseConfigurationModule (copy), ChatConstantsModule (copy), RequestFailureKind (copy), SendBuildExperienceEventModule (copy), LaunchPlaytestWithLoadingStateModule (copy), GetActiveAnswerFormModule (copy), FFlagBuildExperienceChatAccordionScrollAnchorModule (copy)
	if FFlagBuildExperienceModelPickerModule then
		ReactModule.useEffect(function()
			-- upvalues: GetBuildCreatorCreditRefreshStoreModule (upval)
			return GetBuildCreatorCreditRefreshStoreModule(false).acquire()
		end, {})
	end
	local UseContextResult = ReactModule.useContext(LocalizationRoactContext)
	local FormatResult = UseContextResult:Format(LocalizationStringsModule.CHAT_CREATE_UNIVERSE_ERROR)
	local FormatResult1 = if FFlagBuildExperienceChatImageAttachmentsModule then UseContextResult:Format(LocalizationStringsModule.CHAT_CAPTURE_UPLOAD_ERROR) else nil
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
		local UseRefResult12 = ReactModule.useRef(true)
		v1 = UseRefResult12
		ReactModule.useLayoutEffect(function()
			-- upvalues: UseRefResult12 (copy)
			UseRefResult12.current = true
			
			return function()
				-- upvalues: UseRefResult12 (upval)
				UseRefResult12.current = false
			end
		end, { UseRefResult12 })
		UseMemoResult1 = ReactModule.useMemo(function()
			return { pending = false, mounted = true }
		end, {
			UseSignalStateResult,
			p1.modelSelectionDraftId,
			p1.universeId,
			p1.placeId,
			p1.sessionId
		})
		v2, v136 = ReactModule.useState(false)
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
	local UseResult3: (any) -> () = noopSetAgentSpecVersion
	local v4 = nil
	local v5 = nil
	local InternalTesting = nil
	
	if FFlagBuildExperienceModelPickerModule and IsEnabled then
		InternalTesting, v144 = UseBuildInternalTestingModule(if UseBuildModelSessionModuleResult == nil then nil else UseBuildModelSessionModuleResult.entry, UseMemoResult, p1.sessionId)
		PreviewHash = if InternalTesting == nil then nil else InternalTesting.previewHash
		
		UseResult3 = function(p2)
			-- upvalues: InternalTesting (ref)
			if InternalTesting ~= nil then
				InternalTesting.onSelect()
				InternalTesting.onSaveSpec(p2, InternalTesting.previewSpecName)
			end
		end
	elseif IsEnabled then
		local UseRefResult18 = ReactModule.useRef(nil)
		
		if UseRefResult18.current == nil then
			UseRefResult18.current = CreatorAgentChatModule.experimentOverride.createPendingKey()
		end
		local Current1 = UseRefResult18.current
		v4 = Current1
		local UseRefResult19 = ReactModule.useRef(false)
		v5 = UseRefResult19
		local Key = CreatorAgentChatModule.experimentOverride.getKey(CasSessionId) or Current1
		PreviewHash = SignalsReactModule.useSignalState((ReactModule.useMemo(function()
			-- upvalues: CreatorAgentChatModule (upval), Key (copy)
			return CreatorAgentChatModule.experimentOverride.getStateSignal(Key)
		end, { Key }))).specVersion
		UseResult3 = ReactModule.useCallback(function(p2)
			-- upvalues: UseMemoResult (copy), CreatorAgentChatModule (upval), Current1 (copy), UseRefResult19 (copy)
			local Key = CreatorAgentChatModule.experimentOverride.getKey(if UseMemoResult == nil then nil else UseMemoResult.getCasSessionId())
			
			if Key == nil then
				Key = Current1
				UseRefResult19.current = true
				
				if UseMemoResult ~= nil then
					UseMemoResult.setPendingExperimentKey(Current1)
				end
			end
			CreatorAgentChatModule.experimentOverride.set(Key, p2)
		end, { UseMemoResult, Current1 })
		ReactModule.useEffect(function()
			-- upvalues: UseMemoResult (copy), UseRefResult19 (copy), Current1 (copy)
			if UseMemoResult ~= nil and UseRefResult19.current then
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
	local UseStateResult2_4 = nil
	local UseStateResult7
	UseStateResult7, UseStateResult2_4 = ReactModule.useState(function()
		-- upvalues: UseMemoResult (copy), SessionId (ref), UniverseId (ref), NoHydrateHistoryWhen (copy), Inverted (copy)
		return {
			session = UseMemoResult,
			sessionId = SessionId,
			universeId = UniverseId,
			hydrateHistoryWhen = NoHydrateHistoryWhen,
			isLoading = Inverted
		}
	end)
	local IsHydrateHistoryWhenMatch: boolean = UseStateResult7 ~= nil and (UseStateResult7.session == UseMemoResult and (UseStateResult7.sessionId == SessionId and UseStateResult7.universeId == UniverseId) and UseStateResult7.hydrateHistoryWhen == NoHydrateHistoryWhen)
	local NoIsLoading: boolean = if IsHydrateHistoryWhenMatch then not UseStateResult7.isLoading else not Inverted
	local NoNoIsLoading: boolean = not NoIsLoading or UseMemoResult ~= nil and UseMemoResult.getNextHistoryPageToken() ~= nil
	local UseStateResult8, UseStateResult2_5 = ReactModule.useState(nil)
	local UseStateResult9, UseStateResult2_6 = ReactModule.useState(nil)
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult2_6 (copy)
		UseStateResult2_6(nil)
	end, { UseMemoResult, SessionId })
	local SessionId1 = SessionId
	local NoSessionId: boolean = UseStateResult9 ~= nil and UseStateResult9.session == UseMemoResult and (SessionId1 == nil or SessionId1 == "" or (UseStateResult9.sessionId == SessionId1 or UseStateResult9.sessionId == nil and UseStateResult9.session.getCasSessionId() == SessionId1))
	local UseStateResult10 = if NoSessionId then UseStateResult9 else nil
	local UseStateResult11, UseStateResult2_7 = ReactModule.useState(nil)
	local UseRefResult14 = ReactModule.useRef(nil)
	local UseRefResult15 = ReactModule.useRef(nil)
	local UseRefResult16 = ReactModule.useRef(0)
	local UseRefResult17 = nil
	local v6 = false
	local Callback4 = nil
	
	if FFlagBuildExperienceModelPickerModule then
		UseRefResult17 = ReactModule.useRef(nil)
		v6, Callback4 = ReactModule.useState(false)
		local UseRefResult20 = UseRefResult17
		local Callback1 = Callback4
		ReactModule.useLayoutEffect(function()
			-- upvalues: IsEnabled (upval), UseRefResult20 (copy), UseRefResult15 (copy), p1 (copy), Callback1 (copy), UseStateResult2_5 (copy)
			if IsEnabled and UseRefResult20.current ~= nil and not UseRefResult20.current.started and UseRefResult15.current ~= nil and p1.sessionId ~= nil and p1.sessionId ~= "" and UseRefResult15.current.sessionId ~= p1.sessionId then
				UseRefResult20.current.attempt.release()
				UseRefResult20.current = nil
			end
			if UseRefResult20.current == nil then
				Callback1(false)
				UseStateResult2_5(nil)
			end
			return function()
				-- upvalues: UseRefResult20 (upval)
				local Current = UseRefResult20.current
				
				if Current ~= nil and (not Current.started or not Current.attempt.isCurrent()) then
					Current.attempt.release()
					UseRefResult20.current = nil
					
					if Current.onTerminal ~= nil then
						Current.onTerminal()
					end
				end
			end
		end, {
			if UseBuildModelSessionModuleResult == nil then nil else UseBuildModelSessionModuleResult.entry,
			p1.sessionId,
			Callback1,
			UseStateResult2_5
		})
	end
	local UseRefResult21 = ReactModule.useRef(nil)
	local UseResult4 = ReactModule.useCallback(function(Current, Session)
		-- upvalues: UseRefResult14 (copy), UseRefResult15 (copy), UseStateResult2_7 (copy)
		assert(Current == nil or Session ~= nil, "Active turns require an owning session")
		UseRefResult14.current = Current
		UseRefResult15.current = if Current == nil then nil else { session = Session, sessionId = Session.getCasSessionId() }
		UseStateResult2_7(Current)
	end, { UseStateResult2_7 })
	local Current2 = UseRefResult15.current
	local SessionId2 = SessionId
	local NoSessionId1: boolean = Current2 ~= nil and Current2.session == UseMemoResult and (SessionId2 == nil or SessionId2 == "" or (Current2.sessionId == SessionId2 or Current2.sessionId == nil and Current2.session.getCasSessionId() == SessionId2))
	local UseStateResult12 = if NoSessionId1 then UseStateResult11 else nil
	local UseSignalStateResult2 = SignalsReactModule.useSignalState(if UseStateResult12 == nil then Signal1 else UseStateResult12.getOptimisticLocalTools)
	local UseSignalStateResult3 = SignalsReactModule.useSignalState(if UseStateResult12 == nil then Signal2 else UseStateResult12.getLocalToolActions)
	local UseSignalStateResult4 = SignalsReactModule.useSignalState(if UseStateResult12 == nil then Signal3 else UseStateResult12.getSetupErrorText)
	local UseSignalStateResult5 = nil
	UseSignalStateResult5 = if UseSignalStateResult4 == nil then UseSignalStateResult4 else UseContextResult:Format(UseSignalStateResult4)
	local UseMemoResult3 = ReactModule.useMemo(function()
		-- upvalues: UseStateResult12 (copy), p1 (copy), UseMemoResult (copy), UseStateResult8 (copy), UseSignalStateResult5 (ref)
		local SetupErrorText = UseSignalStateResult5
		local HasUseStateResult: boolean = p1.createUniverseOnFirstPrompt == true and UseMemoResult == nil and UseStateResult8 ~= nil
		
		return if UseStateResult12 == nil and not HasUseStateResult then nil else { setupErrorText = SetupErrorText }
	end, {
		UseStateResult12,
		p1.createUniverseOnFirstPrompt,
		UseStateResult8,
		UseMemoResult,
		UseSignalStateResult5
	})
	local UseMemoResult4 = ReactModule.useMemo(function()
		-- upvalues: ParseSessionStreamModule (upval), Events (copy), UseMemoResult (copy), SessionId (ref), UniverseId (ref), PlaceId (ref), UseSignalStateResult2 (copy), UseStateResult8 (copy), SessionPromptMessageFilterModule (upval), FFlagBuildExperienceChatImageAttachmentsModule (upval), FFlagBuildExperienceChatResourceAttachments (upval), UseMemoResult3 (copy), UseStateResult10 (copy)
		return ParseSessionStreamModule(Events, {
			sessionId = if UseMemoResult == nil then SessionId else UseMemoResult.getCasSessionId() or SessionId,
			universeId = if UseMemoResult == nil then UniverseId else UseMemoResult.universeId,
			placeId = if UseMemoResult == nil then PlaceId else UseMemoResult.placeId,
			optimisticLocalTools = UseSignalStateResult2,
			pendingUserMessage = if UseStateResult8 == nil or not SessionPromptMessageFilterModule.shouldOptimisticallyDisplay(UseStateResult8.text) then nil else UseStateResult8.text,
			pendingUserImages = if FFlagBuildExperienceChatImageAttachmentsModule and UseStateResult8 ~= nil and SessionPromptMessageFilterModule.shouldOptimisticallyDisplay(UseStateResult8.text) then UseStateResult8.images else nil,
			pendingUserResourceAttachments = if FFlagBuildExperienceChatResourceAttachments and UseStateResult8 ~= nil and SessionPromptMessageFilterModule.shouldOptimisticallyDisplay(UseStateResult8.text) then UseStateResult8.resourceAttachments else nil,
			pendingUserMessageAfterSequenceId = if UseStateResult8 == nil then nil else UseStateResult8.afterSequenceId,
			liveAssistantMessage = UseMemoResult3,
			optimisticCancelledStartSequenceId = if UseStateResult10 == nil then nil else UseStateResult10.startSequenceId
		})
	end, {
		Events, UseMemoResult, SessionId, UniverseId, PlaceId, UseSignalStateResult2,
		UseStateResult8, UseMemoResult3, UseStateResult10
	})
	local UseRefResult22 = if Current then ReactModule.useRef({
		isInitialized = false,
		lastProcessedSequenceId = nil,
		universeId = UniverseId,
		sessionId = if UseMemoResult == nil then SessionId else UseMemoResult.getCasSessionId() or SessionId,
		historyWatermarkSequenceId = UseMemoResult4.latestSequenceId,
		liveTurnIds = {},
		liveTurnStartSequenceIds = {}
	}) else nil
	local UseResult5 = if UseRefResult22 == nil then nil else ReactModule.useCallback(function(p2)
		-- upvalues: UseRefResult22 (ref)
		if p2 ~= nil then
			UseRefResult22.current.liveTurnIds[p2] = true
		end
	end, { UseRefResult22 })
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
	local HasUseStateResult = UseStateResult12 ~= nil or (if Message == nil or Message.kind ~= "assistant_turn" then UseSignalStateResult6 else not Message.isDone or UseSignalStateResult6)
	local HasPendingLocalToolResponse = HasUseStateResult and (not UseSignalStateResult6 and hasPendingLocalToolResponse(UseSignalStateResult2))
	local ActiveTurnState = UseMemoResult4.activeTurnState
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult12 (copy), ActiveTurnState (copy)
		if UseStateResult12 ~= nil and ActiveTurnState ~= nil then
			UseStateResult12.syncFromTurnState(ActiveTurnState)
			
			return
		end
	end, { UseStateResult12, ActiveTurnState })
	
	if Current then
		ReactModule.useEffect(function()
			-- upvalues: p1 (copy), UseRefResult22 (ref), UseMemoResult (copy), UniverseId (ref), SessionId (ref), UseMemoResult4 (copy), NoUseMemoResult1 (copy), noteLiveAdUpsellTurns (upval), Messages (copy)
			local OnAssistantTurnCompletedFunction: (any) -> () = p1.onAssistantTurnCompleted
			local UseRefResult = UseRefResult22
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
	local UseStateResult5, UseStateResult2_2 = ReactModule.useState(nil)
	local UseStateResult6, UseStateResult2_3 = ReactModule.useState(false)
	local UseResult1 = ReactModule.useCallback(function(p2)
		-- upvalues: UseStateResult2_2 (copy), UseStateResult2_3 (copy)
		UseStateResult2_2(p2)
		UseStateResult2_3(false)
	end, {})
	local UseResult2 = ReactModule.useCallback(function(p2)
		-- upvalues: UseStateResult2_2 (copy), UseStateResult2_3 (copy)
		UseStateResult2_2(p2)
		UseStateResult2_3(true)
	end, {})
	local UseRefResult1 = ReactModule.useRef("")
	local UseRefResult2 = ReactModule.useRef("")
	local UseRefResult3 = if FFlagBuildExperiencePrefillSkipsDraftPersistModule and BuildAppStorageKeyEngineFeature then ReactModule.useRef(nil) else nil
	local UseRefResult4 = ReactModule.useRef(nil)
	local UseRefResult5 = ReactModule.useRef(CasSessionId)
	local UseRefResult6 = ReactModule.useRef(nil)
	UseRefResult5.current = CasSessionId
	local NoUniverseId: boolean = p1.createUniverseOnFirstPrompt == true and UniverseId == nil
	local IsCreateUniverseOnFirstPrompt = p1.createUniverseOnFirstPrompt == true
	local UseRefResult7 = if FFlagBuildExperienceNewGameChatDraftModule then ReactModule.useRef(IsCreateUniverseOnFirstPrompt) else { current = IsCreateUniverseOnFirstPrompt }
	UseRefResult7.current = IsCreateUniverseOnFirstPrompt
	local UseRefResult8 = if FFlagBuildExperienceRestoreStoppedPromptModule then ReactModule.useRef(nil) else nil
	local Frozen1 = if IsIsLibraryChat then Frozen else {}
	local Callback3 = nil
	local UseRefResult9 = { current = {} }
	local UseRefResult10 = ReactModule.useRef({})
	local UseRefResult11 = ReactModule.useRef(0)
	
	if FFlagBuildExperienceChatImageAttachmentsModule then
		Frozen1, Callback3 = ReactModule.useState({})
		UseRefResult9 = ReactModule.useRef({})
	end
	local UseStateResult13 = {}
	local Callback2 = nil
	local UseRefResult23 = { current = {} }
	local UseRefResult24 = {
		current = { universeId = p1.universeId, placeId = p1.placeId }
	}
	
	if FFlagBuildExperienceChatResourceAttachments then
		UseStateResult13, Callback2 = ReactModule.useState({})
		UseRefResult23 = ReactModule.useRef({})
		UseRefResult24 = ReactModule.useRef({ universeId = p1.universeId, placeId = p1.placeId })
	end
	local UseRefResult25 = ReactModule.useRef(nil)
	local UseClockResult = ReactUtilsModule.useClock()
	local UseChatScrollModuleResult = UseChatScrollModule(IsIsLibraryChat)
	local UseResult6 = ReactModule.useCallback(function(p2, p3)
		-- upvalues: GetPlaytestLoadingStoreModule (upval)
		GetPlaytestLoadingStoreModule().setAgentStatusForPlaceId(p2, p3)
	end, {})
	local UseResult7 = ReactModule.useCallback(function(Callback)
		-- upvalues: UseChatScrollModuleResult (copy), UseMemoResult (copy), FFlagBuildExperienceChatHistoryPrefetchModule (upval)
		local function v264()
			-- upvalues: Callback (copy)
			return Callback ~= nil and Callback()
		end
		
		UseChatScrollModuleResult.captureDistanceFromBottom()
		
		if UseMemoResult == nil then return end
		if FFlagBuildExperienceChatHistoryPrefetchModule then
			UseMemoResult.requestOlderHistoryWhile(v264, function()
				-- upvalues: UseChatScrollModuleResult (upval)
				return UseChatScrollModuleResult.isNearTopRef.current
			end)
			
			return
		else
			task.spawn(function()
				-- upvalues: UseMemoResult (upval), v264 (copy), UseChatScrollModuleResult (upval), Callback (copy)
				if UseMemoResult.loadOlderHistory(v264) and UseMemoResult.getNextHistoryPageToken() ~= nil and UseChatScrollModuleResult.isAtTopRef.current then
					task.delay(0.1, function()
						-- upvalues: Callback (upval), UseChatScrollModuleResult (upval), UseMemoResult (upval), v264 (upval)
						if Callback ~= nil and Callback() then return end
						if UseChatScrollModuleResult.isViewportUnderfilled() then
							UseMemoResult.loadOlderHistory(v264)
						end
					end)
				end
			end)
		end
	end, { UseMemoResult, UseChatScrollModuleResult })
	local UseResult8 = ReactModule.useCallback(function(Callback)
		-- upvalues: UseMemoResult (copy), FFlagBuildExperienceChatHistoryPrefetchModule (upval), UseChatScrollModuleResult (copy), UseResult7 (copy)
		task.delay(0.1, function()
			-- upvalues: Callback (copy), UseMemoResult (upval), FFlagBuildExperienceChatHistoryPrefetchModule (upval), UseChatScrollModuleResult (upval), UseResult7 (upval)
			if Callback() then return end
			if UseMemoResult == nil then return end
			if UseMemoResult.getNextHistoryPageToken() == nil then return end
			if FFlagBuildExperienceChatHistoryPrefetchModule then
				if not UseChatScrollModuleResult.isNearTopRef.current then return end
			elseif not UseChatScrollModuleResult.isViewportUnderfilled() then return end
			UseResult7(Callback)
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
	local UseRefResult26 = ReactModule.useRef(UseResult9)
	UseRefResult26.current = UseResult9
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
		-- upvalues: NoHydrateHistoryWhen (copy), UseMemoResult (copy), UseStateResult2_4 (ref), SessionId (ref), UniverseId (ref), UseRefResult26 (copy), IsIsLibraryChat (copy), UseRefResult14 (copy), FFlagBuildExperienceModelPickerModule (upval), FFlagBuildExperienceChatHistoryPrefetchModule (upval), CreatorAgentChatStore (copy), UseStateResult2_1 (copy), PlaceId (ref), UseSignalStateResult (ref)
		if NoHydrateHistoryWhen and UseMemoResult ~= nil then
			local Flag = false
			
			local function _(IsLoading)
				-- upvalues: UseStateResult2_4 (upval), Flag (ref), UseMemoResult (upval), SessionId (upval), UniverseId (upval), NoHydrateHistoryWhen (upval)
				if UseStateResult2_4 ~= nil and not Flag then
					UseStateResult2_4({
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
			
			if UseStateResult2_4 ~= nil and not Flag then
				UseStateResult2_4({
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
				-- upvalues: Flag (ref), CasSessionId (copy), UseMemoResult (upval), UseRefResult26 (upval), isHydrateCancelled (copy)
				if not (if Flag then true else CasSessionId ~= nil and CasSessionId ~= "" and UseMemoResult.getCasSessionId() ~= CasSessionId) then
					UseRefResult26.current(isHydrateCancelled)
					
					return
				end
			end
			
			local function hydrateKnownSession(CasSessionId1)
				-- upvalues: UseMemoResult (upval), IsIsLibraryChat (upval), UseRefResult14 (upval), UseStateResult2_4 (upval), Flag (ref), SessionId (upval), UniverseId (upval), NoHydrateHistoryWhen (upval), FFlagBuildExperienceModelPickerModule (upval), CasSessionId (copy), UseRefResult26 (upval), isHydrateCancelled (copy), FFlagBuildExperienceChatHistoryPrefetchModule (upval)
				UseMemoResult.setCasSessionId(CasSessionId1)
				
				if not IsIsLibraryChat or UseRefResult14.current == nil then
					if IsIsLibraryChat or not UseMemoResult.hasLoadedHistory() or #UseMemoResult.getMergedHistory(false) <= 0 or FFlagBuildExperienceModelPickerModule and not UseMemoResult.hasObservedModels(false) then
						if (if FFlagBuildExperienceChatHistoryPrefetchModule then UseMemoResult.refreshSession(isHydrateCancelled, true) else UseMemoResult.refreshSession(isHydrateCancelled)) and not (if Flag then true else CasSessionId ~= nil and CasSessionId ~= "" and UseMemoResult.getCasSessionId() ~= CasSessionId) and not (if Flag then true else CasSessionId ~= nil and CasSessionId ~= "" and UseMemoResult.getCasSessionId() ~= CasSessionId) then
							UseRefResult26.current(isHydrateCancelled)
						end
						if UseStateResult2_4 ~= nil then
							if Flag then return end
							UseStateResult2_4({
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
							UseRefResult26.current(isHydrateCancelled)
						end
						if UseStateResult2_4 ~= nil then
							if Flag then return end
							UseStateResult2_4({
								isLoading = false,
								session = UseMemoResult,
								sessionId = SessionId,
								universeId = UniverseId,
								hydrateHistoryWhen = NoHydrateHistoryWhen
							})
						end
						return
					end
				elseif UseStateResult2_4 ~= nil then
					if Flag then return end
					UseStateResult2_4({
						isLoading = false,
						session = UseMemoResult,
						sessionId = SessionId,
						universeId = UniverseId,
						hydrateHistoryWhen = NoHydrateHistoryWhen
					})
				end
			end
			
			task.spawn(function()
				-- upvalues: SessionId (upval), IsIsLibraryChat (upval), UseMemoResult (upval), hydrateKnownSession (copy), FFlagBuildExperienceModelPickerModule (upval), UniverseId (upval), UseStateResult2_4 (upval), Flag (ref), NoHydrateHistoryWhen (upval), CreatorAgentChatStore (upval), CasSessionId (copy), UseStateResult2_1 (upval), PlaceId (upval), UseSignalStateResult (upval)
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
						
						if UseStateResult2_4 ~= nil then
							if Flag then return end
							UseStateResult2_4({
								isLoading = false,
								session = UseMemoResult,
								sessionId = SessionId,
								universeId = UniverseId,
								hydrateHistoryWhen = NoHydrateHistoryWhen
							})
						end
						return
					elseif UseStateResult2_4 ~= nil then
						if Flag then return end
						UseStateResult2_4({
							isLoading = false,
							session = UseMemoResult,
							sessionId = SessionId,
							universeId = UniverseId,
							hydrateHistoryWhen = NoHydrateHistoryWhen
						})
					end
					return
				elseif UseStateResult2_4 ~= nil then
					if Flag then return end
					UseStateResult2_4({
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
		elseif UseStateResult2_4 ~= nil then
			UseStateResult2_4({
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
		-- upvalues: UseMemoResult (copy), SessionId (ref), FFlagBuildExperienceChatHistoryPrefetchModule (upval), UseRefResult26 (copy), MessageBusService (upval), GameMessageId (upval), UseRefResult (copy), FFlagBuildExperienceRefreshChatDraftOnGameLeaveModule (upval), BuildAppStorageKeyEngineFeature (upval), FFlagBuildExperiencePrefillSkipsDraftPersistModule (upval), UseRefResult1 (copy), UseRefResult3 (copy), BuildAppStorageModule (upval), UseRefResult2 (copy), UseBindingResult2 (copy), UseResult1 (copy), AppLifecycleObserverService (upval)
		if UseMemoResult == nil then return end
		local Flag = false
		
		local function refreshKnownSession()
			-- upvalues: UseMemoResult (upval), SessionId (upval), Flag (ref), FFlagBuildExperienceChatHistoryPrefetchModule (upval), UseRefResult26 (upval)
			local CasSessionId = UseMemoResult.getCasSessionId()
			
			if (CasSessionId == nil or CasSessionId == "") and (SessionId ~= nil and SessionId ~= "") then
				CasSessionId = SessionId
			end
			if CasSessionId ~= nil and CasSessionId ~= "" then
				task.spawn(function()
					-- upvalues: Flag (upval), FFlagBuildExperienceChatHistoryPrefetchModule (upval), UseMemoResult (upval), UseRefResult26 (upval)
					local function isRefreshCancelled()
						-- upvalues: Flag (upval)
						return Flag
					end
					
					if (if FFlagBuildExperienceChatHistoryPrefetchModule then UseMemoResult.refreshSession(isRefreshCancelled, true) else UseMemoResult.refreshSession(isRefreshCancelled)) and not Flag then
						UseRefResult26.current(function()
							-- upvalues: Flag (upval)
							return Flag
						end)
					end
				end)
				
				return
			end
		end
		
		local SubscribeResult = MessageBusService:Subscribe(GameMessageId, function(_)
			-- upvalues: UseRefResult (upval), FFlagBuildExperienceRefreshChatDraftOnGameLeaveModule (upval), BuildAppStorageKeyEngineFeature (upval), UseMemoResult (upval), SessionId (upval), FFlagBuildExperiencePrefillSkipsDraftPersistModule (upval), UseRefResult1 (upval), UseRefResult3 (upval), BuildAppStorageModule (upval), UseRefResult2 (upval), UseBindingResult2 (upval), UseResult1 (upval), refreshKnownSession (copy)
			UseRefResult.current = true
			
			if FFlagBuildExperienceRefreshChatDraftOnGameLeaveModule and BuildAppStorageKeyEngineFeature then
				local CasSessionId = UseMemoResult.getCasSessionId()
				
				if (CasSessionId == nil or CasSessionId == "") and (SessionId ~= nil and SessionId ~= "") then
					CasSessionId = SessionId
				end
				local IsCurrentMatch: boolean = FFlagBuildExperiencePrefillSkipsDraftPersistModule and (UseRefResult1.current ~= "" and UseRefResult1.current == UseRefResult3.current)
				
				if CasSessionId ~= nil and CasSessionId ~= "" and not IsCurrentMatch then
					local ChatDraft = BuildAppStorageModule.getChatDraft(CasSessionId) or ""
					UseRefResult2.current = ChatDraft
					UseRefResult1.current = ChatDraft
					UseBindingResult2(ChatDraft)
					UseResult1(nil)
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
	end, { UseMemoResult, SessionId, UseRefResult })
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
		-- upvalues: UseRefResult1 (copy), UseBindingResult2 (copy), UseResult1 (copy)
		UseRefResult1.current = Current
		UseBindingResult2(Current)
		UseResult1(nil)
	end, { UseBindingResult2, UseResult1 })
	local UseResult11 = if BuildAppStorageKeyEngineFeature then ReactModule.useCallback(function()
		-- upvalues: UseRefResult4 (copy)
		if UseRefResult4.current ~= nil then
			task.cancel(UseRefResult4.current)
			UseRefResult4.current = nil
		end
	end, {}) else nil
	local UseResult12 = if FFlagBuildExperienceNewGameChatDraftModule then ReactModule.useCallback(function()
		-- upvalues: UseRefResult5 (copy), UseRefResult7 (ref), GetNewGameChatDraftKeyModule (upval)
		local Current = UseRefResult5.current
		
		return if Current == nil or Current == "" then if UseRefResult7.current then GetNewGameChatDraftKeyModule() else nil else Current
	end, {}) else nil
	local UseResult13 = if BuildAppStorageKeyEngineFeature then ReactModule.useCallback(function(Current)
		-- upvalues: UseRefResult2 (copy), UseResult11 (copy), FFlagBuildExperienceNewGameChatDraftModule (upval), UseResult12 (copy), UseRefResult5 (copy), UseRefResult4 (copy), BuildAppStorageModule (upval)
		UseRefResult2.current = Current
		UseResult11()
		local UseResultResult = if FFlagBuildExperienceNewGameChatDraftModule then UseResult12() else UseRefResult5.current
		
		if UseResultResult ~= nil and UseResultResult ~= "" then
			UseRefResult4.current = task.delay(0.5, function()
				-- upvalues: UseRefResult4 (upval), BuildAppStorageModule (upval), UseResultResult (copy), Current (copy)
				UseRefResult4.current = nil
				BuildAppStorageModule.setChatDraft(UseResultResult, Current)
			end)
			
			return
		end
	end, { UseResult11, UseResult12 }) else nil
	local UseResult14 = if BuildAppStorageKeyEngineFeature then ReactModule.useCallback(function(Current)
		-- upvalues: FFlagBuildExperienceNewGameChatDraftModule (upval), UseResult12 (copy), UseRefResult5 (copy), UseRefResult2 (copy), UseResult11 (copy), BuildAppStorageModule (upval)
		local UseResultResult = if FFlagBuildExperienceNewGameChatDraftModule then UseResult12() else UseRefResult5.current
		
		if UseResultResult ~= nil and UseResultResult ~= "" then
			UseRefResult2.current = Current
			UseResult11()
			BuildAppStorageModule.setChatDraft(UseResultResult, Current)
			
			return
		end
	end, { UseResult11, UseResult12 }) else nil
	local UseResult15 = if BuildAppStorageKeyEngineFeature then ReactModule.useCallback(function(Current, p2)
		-- upvalues: FFlagBuildExperienceNewGameChatDraftModule (upval), UseRefResult7 (ref), GetNewGameChatDraftKeyModule (upval), BuildAppStorageModule (upval), UseRefResult2 (copy), UseResult11 (copy)
		local NewGameChatDraftKeyModule = if FFlagBuildExperienceNewGameChatDraftModule and UseRefResult7.current then GetNewGameChatDraftKeyModule() else nil
		
		if NewGameChatDraftKeyModule ~= nil then
			BuildAppStorageModule.setChatDraft(NewGameChatDraftKeyModule, "")
		end
		if p2 ~= nil and p2 ~= "" and UseRefResult2.current == Current then
			UseRefResult2.current = ""
			UseResult11()
			BuildAppStorageModule.setChatDraft(p2, "")
			
			return
		end
	end, { UseResult11 }) else nil
	local UseResult16 = ReactModule.useCallback(function(Current)
		-- upvalues: UseResult10 (copy), BuildAppStorageKeyEngineFeature (upval), FFlagBuildExperiencePrefillSkipsDraftPersistModule (upval), UseRefResult3 (copy), UseResult13 (copy)
		UseResult10(Current)
		
		if BuildAppStorageKeyEngineFeature then
			if FFlagBuildExperiencePrefillSkipsDraftPersistModule then
				local Current1 = UseRefResult3.current
				
				if Current1 ~= nil and Current == Current1 then return end
				UseRefResult3.current = nil
			end
			UseResult13(Current)
		end
	end, { UseResult10, UseResult13 })
	local UseResult17 = if FFlagBuildExperiencePrefillSkipsDraftPersistModule and BuildAppStorageKeyEngineFeature then ReactModule.useCallback(function(Current)
		-- upvalues: UseRefResult3 (copy), UseResult10 (copy)
		UseRefResult3.current = Current
		UseResult10(Current)
	end, { UseResult10 }) else UseResult16
	
	if FFlagBuildExperienceNewGameChatDraftModule and BuildAppStorageKeyEngineFeature then
		ReactModule.useEffect(function()
			-- upvalues: NoUniverseId (copy), CasSessionId (copy), GetNewGameChatDraftKeyModule (upval), BuildAppStorageModule (upval), UseRefResult1 (copy), UseRefResult2 (copy), UseResult10 (copy)
			if not NoUniverseId or CasSessionId ~= nil and CasSessionId ~= "" then return end
			local NewGameChatDraftKeyModule = GetNewGameChatDraftKeyModule()
			
			if NewGameChatDraftKeyModule == nil then return end
			local ChatDraft = BuildAppStorageModule.getChatDraft(NewGameChatDraftKeyModule) or ""
			
			if ChatDraft ~= "" and UseRefResult1.current == "" then
				UseRefResult2.current = ChatDraft
				UseResult10(ChatDraft)
			end
		end, { NoUniverseId, CasSessionId, UseResult10 })
	end
	ReactModule.useEffect(function()
		-- upvalues: BuildAppStorageKeyEngineFeature (upval), CasSessionId (copy), UseRefResult6 (copy), UseResult11 (copy), FFlagBuildExperiencePrefillSkipsDraftPersistModule (upval), UseRefResult1 (copy), UseRefResult3 (copy), UseRefResult2 (copy), BuildAppStorageModule (upval), UseResult10 (copy), UseRefResult4 (copy)
		if not BuildAppStorageKeyEngineFeature then return end
		if CasSessionId == nil or CasSessionId == "" then return end
		local Current = UseRefResult6.current
		UseRefResult6.current = CasSessionId
		UseResult11()
		
		if FFlagBuildExperiencePrefillSkipsDraftPersistModule and Current == nil and UseRefResult1.current ~= "" and UseRefResult1.current == UseRefResult3.current then
			UseRefResult2.current = BuildAppStorageModule.getChatDraft(CasSessionId) or ""
		elseif Current == nil and UseRefResult1.current ~= "" then
			UseRefResult2.current = UseRefResult1.current
			BuildAppStorageModule.setChatDraft(CasSessionId, UseRefResult1.current)
		else
			local ChatDraft = BuildAppStorageModule.getChatDraft(CasSessionId) or ""
			UseRefResult2.current = ChatDraft
			UseResult10(ChatDraft)
		end
		return function()
			-- upvalues: UseRefResult4 (upval), UseResult11 (upval), BuildAppStorageModule (upval), CasSessionId (upval), UseRefResult2 (upval)
			local HasCurrent = UseRefResult4.current ~= nil
			UseResult11()
			
			if HasCurrent then
				BuildAppStorageModule.setChatDraft(CasSessionId, UseRefResult2.current)
			end
		end
	end, {
		CasSessionId,
		UseResult11,
		UseResult10,
		if FFlagBuildExperienceModelPickerModule then UseMemoResult else nil
	})
	
	local function commitComposerResourceAttachments(Current)
		-- upvalues: UseRefResult23 (ref), Callback2 (ref), UseResult1 (copy)
		UseRefResult23.current = Current
		
		if Callback2 ~= nil then
			Callback2(Current)
		end
		UseResult1(nil)
	end
	
	local function findComposerResourceAttachmentIndexByUri(ResourceAttachmentUri)
		-- upvalues: UseRefResult23 (ref), ChatTypesModule (upval)
		for i, value in UseRefResult23.current do
			if ChatTypesModule.getResourceAttachmentUri(value) == ResourceAttachmentUri then
				return i
			end
		end
		return nil
	end
	
	local function addComposerResourceAttachment(p2)
		-- upvalues: UseRefResult23 (ref), Callback2 (ref), UseResult1 (copy)
		local Copy = table.clone(UseRefResult23.current)
		table.insert(Copy, p2)
		UseRefResult23.current = Copy
		
		if Callback2 ~= nil then
			Callback2(Copy)
		end
		UseResult1(nil)
	end
	
	local function removeComposerResourceAttachmentAtIndex(Index)
		-- upvalues: UseRefResult23 (ref), Callback2 (ref), UseResult1 (copy)
		local Copy = table.clone(UseRefResult23.current)
		table.remove(Copy, Index)
		UseRefResult23.current = Copy
		
		if Callback2 ~= nil then
			Callback2(Copy)
		end
		UseResult1(nil)
	end
	
	local function clearComposerResourceAttachments()
		-- upvalues: UseRefResult23 (ref), Callback2 (ref), UseResult1 (copy)
		local Current = {}
		UseRefResult23.current = Current
		
		if Callback2 ~= nil then
			Callback2(Current)
		end
		UseResult1(nil)
	end
	
	local UseRefResult13 = ReactModule.useRef(commitComposerResourceAttachments)
	UseRefResult13.current = commitComposerResourceAttachments
	
	if FFlagBuildExperienceChatResourceAttachments then
		ReactModule.useLayoutEffect(function()
			-- upvalues: UseRefResult24 (ref), p1 (copy), UseRefResult13 (copy)
			local Current = UseRefResult24.current
			
			if Current.universeId ~= p1.universeId or Current.placeId ~= p1.placeId then
				UseRefResult13.current({})
			end
			UseRefResult24.current = { universeId = p1.universeId, placeId = p1.placeId }
		end, { p1.universeId, p1.placeId })
	end
	local function _(Current)
		-- upvalues: UseRefResult9 (ref), Callback3 (ref)
		UseRefResult9.current = Current
		
		if Callback3 ~= nil then
			Callback3(Current)
		end
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
		-- upvalues: UseRefResult9 (ref), Callback3 (ref)
		local Current = UseRefResult9.current
		local Copy = table.clone(Current)
		
		for i, value in Current do
			if value.capture == Capture then
				Copy[i] = Callback(value)
				UseRefResult9.current = Copy
				
				if Callback3 ~= nil then
					Callback3(Copy)
				end
				return Copy
			end
		end
		return Current
	end
	
	local function beginComposerImageUpload(Capture)
		-- upvalues: UseRefResult11 (copy), UseRefResult10 (copy), updateComposerImage (copy), UseResult1 (copy), UploadCaptureAsyncModule (upval), FFlagBuildExperienceChatImageAttachmentsModule (upval), FormatResult1 (copy)
		UseRefResult11.current += 1
		local Current = UseRefResult11.current
		UseRefResult10.current[Capture] = Current
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
			UseResult1(nil)
		end
		UploadCaptureAsyncModule(Capture):andThen(function(Result)
			-- upvalues: UseRefResult10 (upval), Capture (copy), Current (copy), updateComposerImage (upval), UseResult1 (upval)
			if UseRefResult10.current[Capture] ~= Current then return end
			UseRefResult10.current[Capture] = nil
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
				UseResult1(nil)
			end
		end):catch(function(Err)
			-- upvalues: UseRefResult10 (upval), Capture (copy), Current (copy), updateComposerImage (upval), FFlagBuildExperienceChatImageAttachmentsModule (upval), UseResult1 (upval), FormatResult1 (upval)
			if UseRefResult10.current[Capture] ~= Current then return end
			UseRefResult10.current[Capture] = nil
			updateComposerImage(Capture, function(Tbl)
				-- upvalues: Err (copy)
				local Copy = table.clone(Tbl)
				Copy.uri = nil
				Copy.uploadStatus = "failed"
				Copy.uploadError = Err
				
				return Copy
			end)
			
			if FFlagBuildExperienceChatImageAttachmentsModule then
				UseResult1(FormatResult1)
			end
		end)
	end
	
	local function setComposerImages(p2)
		-- upvalues: UseRefResult9 (ref), UseRefResult10 (copy), Callback3 (ref), UseResult1 (copy), beginComposerImageUpload (copy)
		local Current = UseRefResult9.current
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
				UseRefResult10.current[value1.capture] = nil
			end
		end
		UseRefResult9.current = Current1
		
		if Callback3 ~= nil then
			Callback3(Current1)
		end
		local Flag1 = false
		
		for _, value3 in Current1 do
			if value3.uploadStatus == "failed" then
				Flag1 = true
				break
			end
		end
		if not Flag1 then
			UseResult1(nil)
		end
		for _, capture in Captures do
			beginComposerImageUpload(capture)
		end
	end
	
	local UseRefResult27 = ReactModule.useRef(setComposerImages)
	UseRefResult27.current = setComposerImages
	
	local function retryComposerImage(p3)
		-- upvalues: UseRefResult9 (ref), beginComposerImageUpload (copy)
		local CurrentEntry = UseRefResult9.current[p3]
		
		if CurrentEntry ~= nil and CurrentEntry.capture ~= nil and CurrentEntry.uploadStatus == "failed" then
			beginComposerImageUpload(CurrentEntry.capture)
			
			return
		end
	end
	
	local Flag = false
	
	for _, value in Frozen1 do
		if value.uri == nil or (value.uploadStatus == "uploading" or value.uploadStatus == "failed") then
			Flag = true
			break
		end
	end
	local UseResult18 = ReactModule.useCallback(function(Current)
		-- upvalues: UseRefResult16 (copy), UseRefResult15 (copy), UseMemoResult (copy), SessionId (ref), FFlagBuildExperienceAnswerFormModule (upval), UseRefResult14 (copy), UseRefResult1 (copy), UseResult16 (copy), CreatorAgentChatModule1 (upval), UseContextResult (copy), UseResult1 (copy)
		return function(p3, p4)
			-- upvalues: UseRefResult16 (upval), Current (copy), UseRefResult15 (upval), UseMemoResult (upval), SessionId (upval), FFlagBuildExperienceAnswerFormModule (upval), UseRefResult14 (upval), UseRefResult1 (upval), UseResult16 (upval), CreatorAgentChatModule1 (upval), UseContextResult (upval), UseResult1 (upval)
			if UseRefResult16.current == Current then
				local Current1 = UseRefResult15.current
				local SessionId1 = SessionId
				
				if Current1 ~= nil and Current1.session == UseMemoResult and (SessionId1 == nil or SessionId1 == "" or (Current1.sessionId == SessionId1 or Current1.sessionId == nil and Current1.session.getCasSessionId() == SessionId1)) then
					local HasNextEntry = false
					
					if FFlagBuildExperienceAnswerFormModule then
						local Current2 = UseRefResult14.current
						
						if Current2 ~= nil then
							HasNextEntry = next(Current2.getLocalToolActions(false).onAnswerSelectedByToolCallId) ~= nil
						end
					end
					if p3 ~= nil and UseRefResult1.current == "" and not HasNextEntry then
						UseResult16(p3)
					end
					UseResult1((UseContextResult:Format((CreatorAgentChatModule1.getToolResultFailureComposerError(p4)))))
					
					return
				end
			end
		end
	end, {
		UseMemoResult,
		SessionId,
		UseResult16,
		UseResult1,
		UseContextResult
	})
	local FundingFailure = nil
	local OnPromptFailureFunction = p1.onPromptFailure
	
	if FFlagBuildExperienceModelPickerModule then
		local UseStateResult14, UseStateResult2_8 = ReactModule.useState(nil)
		FundingFailure = if UseStateResult14 == nil or UseStateResult14.owner ~= UseMemoResult then nil else UseStateResult14
		OnPromptFailureFunction = ReactModule.useCallback(function(OutOfCredits, Reason)
			-- upvalues: CreatorAgentChatModule (upval), UseStateResult2_8 (copy), UseMemoResult (copy), p1 (copy)
			if OutOfCredits == CreatorAgentChatModule.ErrorCodes.OutOfCredits then
				UseStateResult2_8(function(p3)
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
	local UseResult19 = ReactModule.useCallback(function(Current, p3, p4, p5, p6, Current1)
		-- upvalues: UseRefResult16 (copy), FFlagBuildExperienceModelPickerModule (upval), v1 (ref), GetBuildCreatorCreditRefreshStoreModule (upval), UseResult4 (copy), UseRefResult21 (copy), UseStateResult2_5 (copy), OnPromptFailureFunction (ref), UseResult6 (copy), FFlagBuildExperienceChatImageAttachmentsModule (upval), UseRefResult27 (copy), FFlagBuildExperienceChatResourceAttachments (upval), UseRefResult13 (copy), UseResult16 (copy), CreatorAgentChatModule1 (upval), UseContextResult (copy), UseResult1 (copy), UseChatScrollModuleResult (copy), p1 (copy), SessionId (ref), UseSignalStateResult (ref), UseStateResult2 (copy)
		if UseRefResult16.current ~= Current then return end
		if FFlagBuildExperienceModelPickerModule and v1 ~= nil and not v1.current then
			GetBuildCreatorCreditRefreshStoreModule(false).settled()
			
			return
		end
		UseResult4(nil)
		UseRefResult21.current = nil
		UseStateResult2_5(nil)
		
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
					-- upvalues: Current1 (copy), UseRefResult16 (upval), Current (copy)
					Current1.refreshSession(function(): boolean
						-- upvalues: UseRefResult16 (upval), Current (upval)
						return UseRefResult16.current ~= Current
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
			if FFlagBuildExperienceChatImageAttachmentsModule and p5 ~= nil then
				UseRefResult27.current(p5)
			end
			if FFlagBuildExperienceChatResourceAttachments and p6 ~= nil then
				UseRefResult13.current(p6)
			end
			if p4 ~= nil then
				UseResult16(p4)
				UseResult1((UseContextResult:Format((CreatorAgentChatModule1.getPromptFailureComposerError(p3)))))
			end
			task.spawn(function()
				-- upvalues: Current1 (copy), UseRefResult16 (upval), Current (copy)
				Current1.refreshSession(function(): boolean
					-- upvalues: UseRefResult16 (upval), Current (upval)
					return UseRefResult16.current ~= Current
				end)
			end)
		end
	end, {
		v1, p1.createUniverseOnFirstPrompt, OnPromptFailureFunction,
		p1.onProjectResolved, SessionId, UseResult6, UseStateResult2,
		UseSignalStateResult, UseChatScrollModuleResult, UseResult16, UseResult1,
		UseResult4, UseStateResult2_5, UseContextResult
	})
	local UseRefResult28 = ReactModule.useRef(NoHydrateHistoryWhen)
	ReactModule.useEffect(function()
		-- upvalues: NoHydrateHistoryWhen (copy), UseRefResult28 (copy), IsIsLibraryChat (copy), HasUseStateResult (copy), UseStateResult12 (copy), UseChatScrollModuleResult (copy)
		local NoCurrent: boolean = NoHydrateHistoryWhen and not UseRefResult28.current
		UseRefResult28.current = NoHydrateHistoryWhen
		
		if IsIsLibraryChat then return end
		if not NoHydrateHistoryWhen then return end
		if NoCurrent or HasUseStateResult or UseStateResult12 ~= nil then
			UseChatScrollModuleResult.scrollToBottomUnconditionally()
			task.defer(UseChatScrollModuleResult.scrollToBottomUnconditionally)
			task.delay(0.15, UseChatScrollModuleResult.scrollToBottomUnconditionally)
			
			return
		end
	end, {
		NoHydrateHistoryWhen, IsIsLibraryChat, HasUseStateResult, UseStateResult12,
		#Messages, UseChatScrollModuleResult
	})
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult14 (copy), UseRefResult15 (copy), UseMemoResult (copy), SessionId (ref), UseStateResult10 (copy), UseRefResult16 (copy), UseRefResult21 (copy), PlaceId (ref), UseResult6 (copy), CreatorAgentChatModule1 (upval), UseResult19 (copy), UseResult18 (copy), UseResult (copy), UseResult4 (copy), UseChatScrollModuleResult (copy), UseMemoResult4 (copy), UseStateResult12 (copy), CreatorAgentChatStore (copy), HasUseStateResult (copy)
		if UseRefResult14.current ~= nil then
			local Current = UseRefResult15.current
			local SessionId1 = SessionId
			
			if Current ~= nil and Current.session == UseMemoResult and (SessionId1 == nil or SessionId1 == "" or (Current.sessionId == SessionId1 or Current.sessionId == nil and Current.session.getCasSessionId() == SessionId1)) then return end
		end
		if UseStateResult10 ~= nil then return end
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
			-- upvalues: UseRefResult16 (upval), UseRefResult21 (upval), PlaceId (upval), UseResult6 (upval), CreatorAgentChatModule1 (upval), UseMemoResult (upval), UseResult19 (upval), UseResult18 (upval), UseResult (upval), UseResult4 (upval), UseChatScrollModuleResult (upval)
			UseRefResult16.current += 1
			local Current1 = UseRefResult16.current
			UseRefResult21.current = Current
			
			if PlaceId ~= nil then
				UseResult6(PlaceId, "Loading")
			end
			local ResumedAssistantTurn = CreatorAgentChatModule1.createResumedAssistantTurn(UseMemoResult, ActiveTurnHandle, function(p3)
				-- upvalues: UseResult19 (upval), Current1 (copy), UseMemoResult (upval)
				UseResult19(Current1, p3, nil, nil, nil, UseMemoResult)
			end, if Current == nil then nil else Current - 1, UseResult18(Current1), UseResult)
			UseResult4(ResumedAssistantTurn, UseMemoResult)
			ResumedAssistantTurn.start()
			UseChatScrollModuleResult.scrollToBottomUnconditionally()
		end
		
		if UseMemoResult4.activeTurnState == nil or UseMemoResult4.activeTurnItemIndex == nil or UseMemoResult4.activeTurnState.isDone then
			UseRefResult21.current = nil
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
			
			if UseRefResult21.current == ActiveTurnStartSequenceId and UseStateResult12 ~= nil then return end
			local ResumeTurnFromHistoryResult = CreatorAgentChatStore.resumeTurnFromHistory(Text, UseMemoResult4.activeTurnState, UseMemoResult4.activeTurnSequenceIds)
			
			if ResumeTurnFromHistoryResult ~= nil then
				attachResumedTurn(ResumeTurnFromHistoryResult, ActiveTurnStartSequenceId)
			end
		end
	end, {
		UseMemoResult4, UseMemoResult, SessionId, CreatorAgentChatStore,
		HasUseStateResult, UseStateResult12, PlaceId, UseResult6, UseResult19,
		UseChatScrollModuleResult, UseResult4, UseStateResult10, UseResult18, UseResult
	})
	local UseResult20 = ReactModule.useCallback(function(p3, Text, p4, Images, ResourceAttachments, Current, AfterSequenceId, p5, Callback2, Callback1: () -> (), Callback3, Attempt, Callback5)
		-- upvalues: UseStateResult2_5 (copy), UseResult5 (ref), BuildAppStorageKeyEngineFeature (upval), UseResult15 (copy), SessionId (ref), FFlagBuildExperienceRestoreStoppedPromptModule (upval), UseRefResult8 (ref), FFlagBuildExperienceLibrary (upval), FFlagBuildExperienceModelPickerModule (upval), CreatorAgentChatModule1 (upval), UseRefResult14 (copy), UseRefResult16 (copy), UseResult4 (copy), UseRefResult21 (copy), UseResult6 (copy), UseResult19 (copy), UseResult18 (copy), UseResult (copy), UseChatScrollModuleResult (copy), UseRefResult17 (ref), Callback4 (ref), BeginBuildModelSendModule (upval), UseBuildModelSessionModuleResult (ref), CreatorCreditModule (upval), CreatorAgentChatModule (upval), v4 (ref), IsEnabled (upval), LocalizationStringsModule (upval), GetBuildCreatorCreditRefreshStoreModule (upval), OnPromptFailureFunction (ref), UseResult2 (copy), UseContextResult (copy)
		local function startAdmitted(p6)
			-- upvalues: UseStateResult2_5 (upval), Text (copy), Images (copy), ResourceAttachments (copy), AfterSequenceId (copy), UseResult5 (upval), BuildAppStorageKeyEngineFeature (upval), p5 (copy), UseResult15 (upval), p3 (copy), SessionId (upval), FFlagBuildExperienceRestoreStoppedPromptModule (upval), UseRefResult8 (upval), Current (copy), Callback2 (copy), FFlagBuildExperienceLibrary (upval), Callback3 (copy), FFlagBuildExperienceModelPickerModule (upval), Attempt (ref), CreatorAgentChatModule1 (upval), p4 (copy), UseRefResult14 (upval), UseRefResult16 (upval), UseResult4 (upval), UseRefResult21 (upval), UseResult6 (upval), Callback1 (copy), UseResult19 (upval), UseResult18 (upval), UseResult (upval), UseChatScrollModuleResult (upval)
			UseStateResult2_5({
				text = Text,
				images = Images,
				resourceAttachments = ResourceAttachments,
				afterSequenceId = AfterSequenceId
			})
			local UseResult1: (any) -> () = if BuildAppStorageKeyEngineFeature and p5 ~= nil then function(p7)
				-- upvalues: UseResult1 (copy), UseResult15 (upval), p5 (upval), p3 (upval), SessionId (upval)
				if UseResult1 ~= nil then
					UseResult1(p7)
				end
				UseResult15(p5, p3.getCasSessionId() or SessionId)
			end else UseResult5
			
			if FFlagBuildExperienceRestoreStoppedPromptModule and UseRefResult8 ~= nil then
				local UseRefResult = UseRefResult8
				
				UseResult1 = function(p7)
					-- upvalues: UseRefResult (copy), Current (upval), UseResult1 (copy)
					UseRefResult.current = Current
					
					if UseResult1 ~= nil then
						UseResult1(p7)
					end
				end
			end
			if Callback2 ~= nil then
				UseResult1 = function(p7)
					-- upvalues: UseResult1 (copy), Callback2 (upval), p3 (upval)
					if UseResult1 ~= nil then
						UseResult1(p7)
					end
					Callback2(p3.getCasSessionId())
				end
			end
			local v9: () -> () = if FFlagBuildExperienceLibrary and Callback3 ~= nil then function()
				-- upvalues: BuildAppStorageKeyEngineFeature (upval), p5 (upval), UseResult15 (upval), p3 (upval), SessionId (upval), Callback3 (upval)
				if BuildAppStorageKeyEngineFeature and p5 ~= nil then
					UseResult15(p5, p3.getCasSessionId() or SessionId)
				end
				Callback3(p3.getCasSessionId())
			end else nil
			
			if FFlagBuildExperienceModelPickerModule and Attempt ~= nil then
				local Attempt1 = Attempt
				local Callback4 = UseResult1
				
				if Callback4 ~= nil then
					UseResult1 = function(p7)
						-- upvalues: Attempt1 (copy), Callback4 (copy)
						if Attempt1.isCurrent() then
							Callback4(p7)
						end
					end
				end
				local Callback = v9
				
				if Callback ~= nil then
					v9 = function()
						-- upvalues: Attempt1 (copy), Callback (copy)
						if Attempt1.isCurrent() then
							Callback()
						end
					end
				end
			end
			local LiveAssistantTurn = nil
			LiveAssistantTurn = CreatorAgentChatModule1.createLiveAssistantTurn(p3, p4, function(p7)
				-- upvalues: FFlagBuildExperienceModelPickerModule (upval), Attempt (upval), UseRefResult14 (upval), LiveAssistantTurn (ref), UseRefResult16 (upval), Current (upval), UseResult4 (upval), UseRefResult21 (upval), UseStateResult2_5 (upval), p3 (upval), UseResult6 (upval), Callback1 (upval), UseResult19 (upval), p5 (upval), Images (upval), ResourceAttachments (upval)
				if FFlagBuildExperienceModelPickerModule and Attempt ~= nil then
					local IsCurrent = Attempt.isCurrent()
					Attempt.release()
					
					if not IsCurrent then
						if UseRefResult14.current == LiveAssistantTurn and UseRefResult16.current == Current then
							UseResult4(nil)
							UseRefResult21.current = nil
							UseStateResult2_5(nil)
							
							if p3.placeId ~= nil then
								UseResult6(p3.placeId, "Idle")
							end
						end
						if Callback1 ~= nil then
							Callback1()
						end
						return
					end
				end
				UseResult19(Current, p7, p5, Images, ResourceAttachments, p3)
				
				if Callback1 ~= nil then
					Callback1()
				end
			end, UseResult18(Current), UseResult, UseResult1, v9, if FFlagBuildExperienceModelPickerModule then p6 else nil, if FFlagBuildExperienceModelPickerModule and p6 ~= nil then p6.sessionId else nil, if FFlagBuildExperienceModelPickerModule and Attempt ~= nil then function(): boolean
				-- upvalues: Attempt (upval)
				return not Attempt.isCurrent()
			end else nil)
			
			if p3.placeId ~= nil then
				UseResult6(p3.placeId, "Loading")
			end
			UseResult4(LiveAssistantTurn, p3)
			UseChatScrollModuleResult.scrollToBottomAfterSend()
			LiveAssistantTurn.start()
		end
		
		if not FFlagBuildExperienceModelPickerModule then
			startAdmitted(nil)
			
			return
		end
		local UseRefResult = UseRefResult17
		local Callback: (any) -> () = Callback4
		Attempt = Attempt or BeginBuildModelSendModule(if UseBuildModelSessionModuleResult == nil then nil else UseBuildModelSessionModuleResult.entry, CreatorCreditModule.getCreatorCreditStore(false), CreatorAgentChatModule.experimentOverride.getPromptExperiment(CreatorAgentChatModule.experimentOverride.getKey(p3.getCasSessionId()) or v4), if IsEnabled and v4 ~= nil then CreatorAgentChatModule.experimentOverride.getInternalSelection(CreatorAgentChatModule.experimentOverride.getKey(p3.getCasSessionId()) or v4, false) else nil)
		
		if Attempt ~= nil then
			local Attempt1 = Attempt
			local Current1 = {
				started = false,
				attempt = Attempt1,
				onTerminal = Callback1,
				restoreDraft = Callback5
			}
			UseRefResult.current = Current1
			Callback(true)
			task.spawn(function()
				-- upvalues: Attempt1 (copy), p3 (copy), UseRefResult16 (upval), Current (copy), UseRefResult (copy), Current1 (copy), Callback (copy), UseStateResult2_5 (upval), LocalizationStringsModule (upval), CreatorAgentChatModule1 (upval), GetBuildCreatorCreditRefreshStoreModule (upval), OnPromptFailureFunction (upval), Callback5 (copy), UseResult2 (upval), UseContextResult (upval), Callback1 (copy), startAdmitted (copy)
				local Success, Result, Result3 = pcall(Attempt1.prepare, p3)
				local Inverted: boolean = not Attempt1.isCurrent() or UseRefResult16.current ~= Current
				
				if not Inverted and Success and Result ~= nil then
					Callback(false)
					Current1.started = true
					startAdmitted(Result)
					
					return
				end
				Attempt1.release()
				
				if UseRefResult.current == Current1 then
					UseRefResult.current = nil
					Callback(false)
					UseStateResult2_5(nil)
				end
				if Inverted then
					if UseRefResult16.current == Current and Callback5 ~= nil then
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
					if Callback5 ~= nil then
						Callback5(false)
					end
					UseResult2(UseContextResult:Format(CHATDEFAULTFAILURE))
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
		UseBuildModelSessionModuleResult, v4, UseRefResult17, UseMemoResult1,
		Callback4, UseResult2, UseContextResult, OnPromptFailureFunction, UseResult19,
		UseResult6, UseChatScrollModuleResult, UseResult4, UseStateResult2_5,
		UseResult18, UseResult, UseResult5, UseResult15, SessionId
	})
	local UseRefResult29 = ReactModule.useRef(UseMemoResult4.latestSequenceId)
	UseRefResult29.current = UseMemoResult4.latestSequenceId
	local UseAgentRollbackRequestModuleResult = UseAgentRollbackRequestModule({
		universeId = UniverseId,
		placeId = PlaceId,
		session = UseMemoResult,
		activeTurnHandleRef = UseRefResult14,
		startRollbackTurn = ReactModule.useCallback(function(p3, Callback1, Callback: () -> ())
			-- upvalues: UseMemoResult (copy), FFlagBuildExperienceModelPickerModule (upval), UseRefResult17 (ref), UseChatScrollModuleResult (copy), UseRefResult16 (copy), UseStateResult2_6 (copy), BuildAgentRollbackPromptModule (upval), UseResult20 (copy), UseRefResult29 (copy)
			if UseMemoResult == nil then
				Callback()
				
				return
			end
			if FFlagBuildExperienceModelPickerModule then
				local Current = UseRefResult17.current
				
				if Current ~= nil and not Current.started and Current.attempt.isCurrent() then
					Callback()
					
					return
				end
			end
			UseChatScrollModuleResult.captureStickToBottomForSend()
			UseRefResult16.current += 1
			local Current = UseRefResult16.current
			UseStateResult2_6(nil)
			local AgentRollbackPromptModule = BuildAgentRollbackPromptModule(p3.versionNumber, p3.noteTitle, p3.noteDescription)
			UseResult20(UseMemoResult, AgentRollbackPromptModule, AgentRollbackPromptModule, nil, nil, Current, UseRefResult29.current, nil, function()
				-- upvalues: UseChatScrollModuleResult (upval), Callback1 (copy)
				UseChatScrollModuleResult.scrollToBottomUnconditionally()
				Callback1()
			end, Callback)
		end, {
			UseMemoResult,
			UseRefResult17,
			UseChatScrollModuleResult,
			UseStateResult2_6,
			UseResult20
		})
	})
	ReactModule.useLayoutEffect(function()
		-- upvalues: UseStateResult11 (copy), UseRefResult15 (copy), UseMemoResult (copy), SessionId (ref), UseRefResult16 (copy), UseRefResult21 (copy), UseAgentRollbackRequestModuleResult (copy), UseResult6 (copy), FFlagBuildExperienceModelPickerModule (upval), UseRefResult17 (ref), UseResult4 (copy), UseStateResult2_5 (copy), UseStateResult2_6 (copy)
		if UseStateResult11 ~= nil then
			local Current = UseRefResult15.current
			local SessionId1 = SessionId
			
			if Current == nil or Current.session ~= UseMemoResult or SessionId1 ~= nil and SessionId1 ~= "" and (Current.sessionId ~= SessionId1 and (Current.sessionId ~= nil or Current.session.getCasSessionId() ~= SessionId1)) then
				local Current1 = UseRefResult15.current
				UseRefResult16.current += 1
				UseRefResult21.current = nil
				
				if UseAgentRollbackRequestModuleResult.stopRequestBeforeReceipt(UseStateResult11) then
					if Current1 ~= nil and Current1.session.placeId ~= nil then
						UseResult6(Current1.session.placeId, "Idle")
					end
				else
					UseStateResult11.detach()
					
					if FFlagBuildExperienceModelPickerModule then
						local UseRefResult = UseRefResult17
						local Current2 = UseRefResult.current
						
						if Current2 ~= nil and Current2.started then
							Current2.attempt.unlockSelection()
							UseRefResult.current = nil
						end
					end
				end
				UseResult4(nil, nil)
				UseStateResult2_5(nil)
				UseStateResult2_6(nil)
				
				return
			end
		end
	end, {
		UseMemoResult, SessionId, UseStateResult11, UseResult4,
		UseAgentRollbackRequestModuleResult, UseResult6, UseRefResult17
	})
	local UseResult21 = ReactModule.useCallback(function(Text, p3, Images, ResourceAttachments, Current, AfterSequenceId, p4, p5)
		-- upvalues: UseStateResult2_5 (copy), FFlagBuildExperienceModelPickerModule (upval), p1 (copy), GetBuildModelSelectionStoreModule (upval), v3 (ref), UseMemoResult1 (ref), UseBuildModelSessionModuleResult (ref), UniverseCreateModule (upval), GetDefaultTemplatePlaceIdModule (upval), Debug (upval), FFlagBuildExperiencePromptFailureTelemetry (upval), UseRefResult16 (copy), UniverseConfigurationModule (upval), UseSignalStateResult (ref), UseStateResult2 (copy), CreatorAgentChatStore (copy), SessionId (ref), IsEnabled (upval), CreatorAgentChatModule (upval), v4 (ref), v5 (ref), UseResult20 (copy), LocalizationStringsModule (upval), ChatConstantsModule (upval), RequestFailureKind (upval), SendBuildExperienceEventModule (upval), UseResult4 (copy), UseResult16 (copy), FFlagBuildExperienceChatImageAttachmentsModule (upval), UseRefResult27 (copy), FFlagBuildExperienceChatResourceAttachments (upval), UseRefResult13 (copy), Callback4 (ref), UseResult1 (copy), FormatResult (copy)
		UseStateResult2_5({
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
		local Promise = UniverseCreateModule.getUniverseCreateStore().createUniverse({
			isPublish = true,
			templatePlaceId = GetDefaultTemplatePlaceIdModule()
		}):andThen(function(Result)
			-- upvalues: FFlagBuildExperienceModelPickerModule (upval), UniverseId (ref), Debug (upval), ClockTime (copy), FFlagBuildExperiencePromptFailureTelemetry (upval), Config (ref), Entry (copy), UseRefResult16 (upval), Current (copy), UniverseConfigurationModule (upval), UseMemoResult (copy), UseSignalStateResult (upval), UseStateResult2 (upval), p1 (upval), p4 (copy), CreatorAgentChatStore (upval), SessionId (upval), IsEnabled (upval), CreatorAgentChatModule (upval), v4 (upval), v5 (upval), UseResult20 (upval), Text (copy), p3 (copy), Images (copy), ResourceAttachments (copy), AfterSequenceId (copy), p5 (copy)
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
			if if FFlagBuildExperienceModelPickerModule then not (Entry ~= nil and Entry.getSelection(false) ~= nil) else UseRefResult16.current ~= Current then
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
					-- upvalues: FFlagBuildExperienceModelPickerModule (upval), Entry (upval), UseMemoResult (upval), UseRefResult16 (upval), Current (upval), Result (copy), UseSignalStateResult (upval), UseStateResult2 (upval), p1 (upval), p4 (upval), CreatorAgentChatStore (upval), SessionId (upval), IsEnabled (upval), CreatorAgentChatModule (upval), v4 (upval), v5 (upval), UseResult20 (upval), Text (upval), p3 (upval), Images (upval), ResourceAttachments (upval), AfterSequenceId (upval), p5 (upval)
					if if FFlagBuildExperienceModelPickerModule then not (Entry ~= nil and Entry.getSelection(false) ~= nil) or (UseMemoResult == nil or not UseMemoResult.mounted) else UseRefResult16.current ~= Current then
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
					UseResult20(SessionForProject, Text, p3, Images, ResourceAttachments, Current, AfterSequenceId, Text, nil, nil, nil, p4, p5)
					
					return nil
				end)
			end
		end):catch(function(Err)
			-- upvalues: Debug (upval), ClockTime (copy), UseRefResult16 (upval), Current (copy), p4 (copy), FFlagBuildExperiencePromptFailureTelemetry (upval), Config (ref), LocalizationStringsModule (upval), ChatConstantsModule (upval), RequestFailureKind (upval), SendBuildExperienceEventModule (upval), UseResult4 (upval), UseStateResult2_5 (upval), UseResult16 (upval), Text (copy), FFlagBuildExperienceChatImageAttachmentsModule (upval), Images (copy), UseRefResult27 (upval), FFlagBuildExperienceChatResourceAttachments (upval), ResourceAttachments (copy), UseRefResult13 (upval), Callback4 (upval), UseResult1 (upval), FormatResult (upval)
			Debug.log("warn", "build_experience create_or_configure_universe failed", {
				durationMs = math.floor((os.clock() - ClockTime) * 1000 + 0.5),
				error = Err
			})
			
			if UseRefResult16.current ~= Current or p4 ~= nil and not p4.isCurrent() then return end
			if FFlagBuildExperiencePromptFailureTelemetry then
				local Rounded = math.round((os.clock() - ClockTime) * 1000)
				local T = if Config == nil then {} else { universeId = Config.universeId, placeId = Config.placeId }
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
				SendBuildExperienceEventModule("SEND_PROMPT_START", T)
				SendBuildExperienceEventModule("SEND_PROMPT_FAILED", T, config)
			end
			UseResult4(nil)
			UseStateResult2_5(nil)
			UseResult16(Text)
			
			if FFlagBuildExperienceChatImageAttachmentsModule and Images ~= nil then
				UseRefResult27.current(Images)
			end
			if FFlagBuildExperienceChatResourceAttachments and ResourceAttachments ~= nil then
				UseRefResult13.current(ResourceAttachments)
			end
			if p4 ~= nil then
				p4.release()
				Callback4(false)
			end
			UseResult1(FormatResult)
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
		UseMemoResult1, UseBuildModelSessionModuleResult, v3, Callback4, SessionId,
		CreatorAgentChatStore, p1.onProjectResolved, p1.modelSelectionDraftId,
		UseResult4, UseResult16, UseResult1, UseStateResult2, UseSignalStateResult,
		UseStateResult2_5, UseResult20, FormatResult, v4, v5
	})
	local UseResult22 = ReactModule.useCallback(function(p3): boolean
		-- upvalues: NoSendMessageWhen (copy), UseMemoResult1 (ref), UseRefResult1 (copy), FFlagBuildExperienceChatImageAttachmentsModule (upval), UseRefResult9 (ref), FFlagBuildExperienceChatResourceAttachments (upval), UseRefResult23 (ref), UseResult16 (copy), UseRefResult15 (copy), UseMemoResult (copy), SessionId (ref), UseRefResult14 (copy), HasUseStateResult (copy), IsIsLibraryChat (copy), UseRefResult25 (copy), UseChatScrollModuleResult (copy), p1 (copy), UniverseId (ref), PlaceId (ref), AgentRollbackRequestStoreModule (copy), UseRefResult27 (copy), UseRefResult13 (copy), FFlagBuildExperienceModelPickerModule (upval), UseResult1 (copy), BeginBuildModelSendModule (upval), UseBuildModelSessionModuleResult (ref), CreatorCreditModule (upval), CreatorAgentChatModule (upval), v4 (ref), IsEnabled (upval), UseRefResult17 (ref), Callback4 (ref), UseRefResult16 (copy), UseStateResult2_6 (copy), BuildAppStorageKeyEngineFeature (upval), UseResult14 (copy), UseResult10 (copy), UseResult21 (copy), UseMemoResult4 (copy), UseResult20 (copy), FFlagBuildExperienceLibrary (upval)
		if not NoSendMessageWhen then
			return false
		end
		if UseMemoResult1 ~= nil and UseMemoResult1.pending then
			return false
		end
		local Replaced = string.gsub(UseRefResult1.current, "^%s*(.-)%s*$", "%1")
		local Current = if FFlagBuildExperienceChatImageAttachmentsModule then UseRefResult9.current else {}
		local Current1 = if FFlagBuildExperienceChatResourceAttachments then UseRefResult23.current else {}
		
		if Replaced == "" and #Current == 0 then
			UseResult16("")
			
			return false
		end
		if FFlagBuildExperienceChatImageAttachmentsModule then
			for _, value in Current do
				if value.uri == nil or value.uploadStatus == "uploading" or value.uploadStatus == "failed" then
					return false
				end
			end
		end
		local Current2 = UseRefResult15.current
		local SessionId1 = SessionId
		local NoSessionId: boolean = Current2 ~= nil and Current2.session == UseMemoResult and (SessionId1 == nil or SessionId1 == "" or (Current2.sessionId == SessionId1 or Current2.sessionId == nil and Current2.session.getCasSessionId() == SessionId1))
		local Current3 = if NoSessionId then UseRefResult14.current else nil
		
		if HasUseStateResult or IsIsLibraryChat and Current3 ~= nil then
			if FFlagBuildExperienceChatImageAttachmentsModule and #Current > 0 or FFlagBuildExperienceChatResourceAttachments and #Current1 > 0 then
				return false
			end
			if Current3 == nil or not Current3.trySubmitComposerText(Replaced) then
				return false
			end
			UseResult16("")
			
			if UseRefResult25.current then
				UseRefResult25.current.releaseFocus()
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
				-- upvalues: UseRefResult1 (upval), FFlagBuildExperienceChatImageAttachmentsModule (upval), UseRefResult9 (upval), FFlagBuildExperienceChatResourceAttachments (upval), UseRefResult23 (upval), UseResult16 (upval), Replaced (copy), UseRefResult27 (upval), Current (copy), UseRefResult13 (upval), Current1 (copy)
				if p4 and (UseRefResult1.current ~= "" or FFlagBuildExperienceChatImageAttachmentsModule and #UseRefResult9.current > 0 or FFlagBuildExperienceChatResourceAttachments and #UseRefResult23.current > 0) then return end
				UseResult16(Replaced)
				
				if FFlagBuildExperienceChatImageAttachmentsModule then
					UseRefResult27.current(Current)
				end
				if FFlagBuildExperienceChatResourceAttachments then
					UseRefResult13.current(Current1)
				end
			end
			
			local Attempt = nil
			
			if FFlagBuildExperienceModelPickerModule then
				UseResult1(nil)
				Attempt = BeginBuildModelSendModule(if UseBuildModelSessionModuleResult == nil then nil else UseBuildModelSessionModuleResult.entry, CreatorCreditModule.getCreatorCreditStore(false), CreatorAgentChatModule.experimentOverride.getPromptExperiment(CreatorAgentChatModule.experimentOverride.getKey(if UseMemoResult == nil then nil else UseMemoResult.getCasSessionId()) or v4), if IsEnabled and v4 ~= nil then CreatorAgentChatModule.experimentOverride.getInternalSelection(CreatorAgentChatModule.experimentOverride.getKey(if UseMemoResult == nil then nil else UseMemoResult.getCasSessionId()) or v4, false) else nil)
				
				if Attempt == nil then
					return false
				end
				UseRefResult17.current = {
					started = false,
					attempt = Attempt,
					restoreDraft = restoreDraft
				}
				Callback4(true)
			end
			UseChatScrollModuleResult.captureStickToBottomForSend()
			UseRefResult16.current += 1
			local Current4 = UseRefResult16.current
			UseStateResult2_6(nil)
			
			if BuildAppStorageKeyEngineFeature then
				UseResult14(Replaced)
			end
			UseResult10("")
			
			if FFlagBuildExperienceChatImageAttachmentsModule then
				UseRefResult27.current({})
			end
			if FFlagBuildExperienceChatResourceAttachments then
				UseRefResult13.current({})
			end
			if UseRefResult25.current then
				UseRefResult25.current.releaseFocus()
			end
			local function startPrompt(Replaced1, p4)
				-- upvalues: NoUniverseId (copy), UseResult21 (upval), Replaced (copy), Current1 (copy), Current4 (copy), UseMemoResult4 (upval), Attempt (ref), FFlagBuildExperienceModelPickerModule (upval), restoreDraft (copy), UseResult20 (upval), UseMemoResult (upval), FFlagBuildExperienceLibrary (upval), p3 (copy)
				if NoUniverseId then
					UseResult21(Replaced, Replaced1, p4, Current1, Current4, UseMemoResult4.latestSequenceId, Attempt, if FFlagBuildExperienceModelPickerModule then restoreDraft else nil)
					
					return
				else
					UseResult20(UseMemoResult, Replaced, Replaced1, p4, Current1, Current4, UseMemoResult4.latestSequenceId, Replaced, nil, nil, if FFlagBuildExperienceLibrary then p3 else nil, Attempt, if FFlagBuildExperienceModelPickerModule then restoreDraft else nil)
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
		UseRefResult17, Callback4, UseResult1, UseMemoResult, SessionId, UniverseId,
		PlaceId, HasUseStateResult, IsIsLibraryChat, UseChatScrollModuleResult,
		UseResult16, UseResult10, UseResult14, UseResult21, UseResult20,
		p1.createUniverseOnFirstPrompt, UseStateResult2_6, UseMemoResult4,
		AgentRollbackRequestStoreModule
	})
	local UseResult23 = ReactModule.useCallback(function()
		-- upvalues: FFlagBuildExperienceModelPickerModule (upval), UseRefResult17 (ref), Callback4 (ref), UseRefResult16 (copy), UseStateResult2_5 (copy), UseRefResult15 (copy), UseMemoResult (copy), SessionId (ref), UseRefResult14 (copy), UseAgentRollbackRequestModuleResult (copy), FFlagBuildExperiencePromptFailureTelemetry (upval), UseResult4 (copy), UseRefResult21 (copy), FFlagBuildExperienceRestoreStoppedPromptModule (upval), UseRefResult8 (ref), UseStateResult8 (copy), UseRefResult1 (copy), UseMemoResult4 (copy), UseResult16 (copy), FFlagBuildExperienceChatImageAttachmentsModule (upval), UseRefResult9 (ref), UseRefResult27 (copy), FFlagBuildExperienceChatResourceAttachments (upval), UseRefResult23 (ref), UseRefResult13 (copy), UseStateResult2_6 (copy), PlaceId (ref), UseResult6 (copy)
		if FFlagBuildExperienceModelPickerModule then
			local UseRefResult = UseRefResult17
			local Current = UseRefResult.current
			
			if Current ~= nil and not Current.started then
				Current.attempt.release()
				UseRefResult.current = nil
				Callback4(false)
				
				if not Current.started then
					UseRefResult16.current += 1
					UseStateResult2_5(nil)
					
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
		local Current1 = UseRefResult15.current
		local SessionId1 = SessionId
		local NoSessionId: boolean = Current1 ~= nil and Current1.session == UseMemoResult and (SessionId1 == nil or SessionId1 == "" or (Current1.sessionId == SessionId1 or Current1.sessionId == nil and Current1.session.getCasSessionId() == SessionId1))
		local Current2 = if NoSessionId then UseRefResult14.current else nil
		
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
			local Current = UseRefResult16.current
			UseRefResult16.current += 1
			
			if FFlagBuildExperiencePromptFailureTelemetry and Current2.reportUserStop ~= nil then
				Current2.reportUserStop()
			end
			if not UseAgentRollbackRequestModuleResult.stopRequestBeforeReceipt(Current2) then
				Current2.stop()
			end
			UseResult4(nil)
			UseRefResult21.current = nil
			
			if FFlagBuildExperienceRestoreStoppedPromptModule and UseRefResult8 ~= nil and UseRefResult8.current ~= Current and UseStateResult8 ~= nil and UseRefResult1.current == "" and UseMemoResult4.isAwaitingUserMessageEcho then
				UseResult16(UseStateResult8.text)
				
				if FFlagBuildExperienceChatImageAttachmentsModule and UseStateResult8.images ~= nil and #UseRefResult9.current == 0 then
					UseRefResult27.current(UseStateResult8.images)
				end
				if FFlagBuildExperienceChatResourceAttachments and UseStateResult8.resourceAttachments ~= nil and #UseRefResult23.current == 0 then
					UseRefResult13.current(UseStateResult8.resourceAttachments)
				end
			end
			UseStateResult2_5(nil)
			UseStateResult2_6({
				session = UseMemoResult,
				sessionId = UseMemoResult.getCasSessionId(),
				startSequenceId = UseMemoResult4.activeTurnStartSequenceId
			})
			
			if PlaceId ~= nil then
				UseResult6(PlaceId, "Idle")
			end
		end
	end, {
		UseRefResult17, Callback4, UseMemoResult, SessionId, PlaceId, UseResult6,
		UseResult4, UseStateResult2_5, UseStateResult2_6, UseMemoResult4,
		UseAgentRollbackRequestModuleResult,
		if FFlagBuildExperienceRestoreStoppedPromptModule then UseStateResult8 else nil,
		if FFlagBuildExperienceRestoreStoppedPromptModule then UseResult16 else nil
	})
	local NoAutoFocusComposer = p1.autoFocusComposer == nil or p1.autoFocusComposer
	local NoAutoFocusComposer1 = if p1.focusComposerWhen == nil then NoAutoFocusComposer else p1.focusComposerWhen
	ReactModule.useEffect(function()
		-- upvalues: NoAutoFocusComposer (copy), NoAutoFocusComposer1 (copy), UseRefResult25 (copy)
		if NoAutoFocusComposer and NoAutoFocusComposer1 then
			local Flag = false
			
			local function v400()
				-- upvalues: Flag (ref)
				return Flag
			end
			
			local v9 = 8
			
			local function tryFocus()
				-- upvalues: v400 (copy), UseRefResult25 (copy), v9 (ref), tryFocus (copy)
				if v400() then return end
				local Current = UseRefResult25.current
				
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
	local UseResult24 = ReactModule.useCallback(function(p4)
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
		-- upvalues: UseSignalStateResult3 (copy), UseResult1 (copy)
		local OnAnswerSelectedByToolCallId = {}
		
		for i, value in UseSignalStateResult3.onAnswerSelectedByToolCallId do
			OnAnswerSelectedByToolCallId[i] = function(p4, p5, p6)
				-- upvalues: UseResult1 (upval), value (copy)
				UseResult1(nil)
				value(p4, p5, p6)
			end
		end
		local OnAnswerConfirmedByToolCallId = {}
		
		for i1, value1 in UseSignalStateResult3.onAnswerConfirmedByToolCallId do
			OnAnswerConfirmedByToolCallId[i1] = function()
				-- upvalues: UseResult1 (upval), value1 (copy)
				UseResult1(nil)
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
	end, { UseSignalStateResult3, UseResult1 }) else UseSignalStateResult3
	
	return {
		currentSessionId = CasSessionId,
		internalTesting = InternalTesting,
		agentSpecVersion = PreviewHash,
		setAgentSpecVersion = UseResult3,
		messages = Messages,
		localToolActions = UseMemoResult5,
		answerForm = if FFlagBuildExperienceAnswerFormModule then ReactModule.useMemo(function()
			-- upvalues: GetActiveAnswerFormModule (upval), ActiveTurnState (copy), UseSignalStateResult2 (copy), UseMemoResult5 (ref)
			return GetActiveAnswerFormModule(ActiveTurnState, UseSignalStateResult2, UseMemoResult5)
		end, { ActiveTurnState, UseSignalStateResult2, UseMemoResult5 }) else nil,
		submitAnswerText = if FFlagBuildExperienceAnswerFormModule then ReactModule.useCallback(function(p4, p5, p6)
			-- upvalues: UseRefResult14 (copy), UseRefResult15 (copy), UseMemoResult (copy), SessionId (ref), UseResult1 (copy)
			local Current = UseRefResult14.current
			
			if Current ~= nil then
				local Current1 = UseRefResult15.current
				local SessionId1 = SessionId
				
				if Current1 ~= nil and Current1.session == UseMemoResult and (SessionId1 == nil or SessionId1 == "" or (Current1.sessionId == SessionId1 or Current1.sessionId == nil and Current1.session.getCasSessionId() == SessionId1)) then
					UseResult1(nil)
					
					return Current.trySubmitAnswerText(p4, p5, p6)
				end
			end
			return false
		end, { UseMemoResult, SessionId, UseResult1 }) else nil,
		composerText = UseBindingResult,
		composerErrorText = UseStateResult5,
		fundingFailure = FundingFailure,
		setComposerText = UseResult16,
		setPrefilledComposerText = UseResult17,
		composerImages = if FFlagBuildExperienceChatImageAttachmentsModule then Frozen1 else {},
		setComposerImages = setComposerImages,
		retryComposerImage = retryComposerImage,
		composerResourceAttachments = if FFlagBuildExperienceChatResourceAttachments then UseStateResult13 else {},
		findComposerResourceAttachmentIndexByUri = findComposerResourceAttachmentIndexByUri,
		addComposerResourceAttachment = addComposerResourceAttachment,
		removeComposerResourceAttachmentAtIndex = removeComposerResourceAttachmentAtIndex,
		clearComposerResourceAttachments = clearComposerResourceAttachments,
		hasPreparedModelSession = if FFlagBuildExperienceModelPickerModule then UseBuildModelSessionModuleResult ~= nil and UseBuildModelSessionModuleResult.hasObservedModels else nil,
		modelSessionModels = if FFlagBuildExperienceModelPickerModule and UseBuildModelSessionModuleResult ~= nil then UseBuildModelSessionModuleResult.models else nil,
		isComposerSendBlocked = FFlagBuildExperienceChatImageAttachmentsModule and Flag or FFlagBuildExperienceModelPickerModule and (v2 or (v6 or (if UseBuildModelSessionModuleResult == nil or not UseBuildModelSessionModuleResult.isBusy then UseStateResult5 ~= nil and not UseStateResult6 else not HasUseStateResult or UseStateResult5 ~= nil and not UseStateResult6))),
		isAssistantResponding = HasUseStateResult,
		canStopAssistantResponse = UseStateResult12 ~= nil or (UseSignalStateResult6 or FFlagBuildExperienceModelPickerModule and v6),
		canSendWhileResponding = HasPendingLocalToolResponse,
		sendMessage = UseResult22,
		stopAssistantResponse = UseResult23,
		setScrollingFrame = UseChatScrollModuleResult.setScrollingFrame,
		anchorScrollToInstance = if FFlagBuildExperienceChatAccordionScrollAnchorModule then UseChatScrollModuleResult.anchorToInstance else nil,
		textBoxRef = UseRefResult25,
		clockBinding = UseClockResult,
		playtestPlaceId = PlaceId,
		launchPlaytest = if PlaceId == nil then nil else UseResult24,
		hasPublishedTurn = IncludesPublishTool,
		subagentTaskState = SubagentTaskState,
		isHistoryHydrationComplete = NoIsLoading,
		isHistoryLoading = NoNoIsLoading,
		isHistoryExhausted = NoHasNextHistoryPageToken
	}
end