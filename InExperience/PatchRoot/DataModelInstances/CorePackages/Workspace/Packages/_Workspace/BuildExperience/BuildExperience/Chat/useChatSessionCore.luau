local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local FFlagBuildExperienceChatImageAttachmentsModule = require(BuildExperience.Flags.FFlagBuildExperienceChatImageAttachments)
local FFlagBuildExperienceChatResourceAttachments = require(Parent.SharedFlags).FFlagBuildExperienceChatResourceAttachments
local FFlagBuildExperiencePersistChatDraftModule = require(BuildExperience.Flags.FFlagBuildExperiencePersistChatDraft)
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
local FFlagBuildExperienceClientDataModelTools = SharedFlagsModule.FFlagBuildExperienceClientDataModelTools
local FFlagBuildExperienceChatAccordionScrollAnchorModule = require(BuildExperience.Flags.FFlagBuildExperienceChatAccordionScrollAnchor)
local FFlagBuildExperienceChatHistoryPrefetchModule = require(BuildExperience.Flags.FFlagBuildExperienceChatHistoryPrefetch)
local FFlagBuildExperienceFixChatBottomLockModule = require(BuildExperience.Flags.FFlagBuildExperienceFixChatBottomLock)
local FFlagBuildExperienceManageDevProductModule = require(BuildExperience.Flags.FFlagBuildExperienceManageDevProduct)
local FFlagBuildExperienceToolResultFailureRecoveryModule = require(BuildExperience.Flags.FFlagBuildExperienceToolResultFailureRecovery)
local FFlagBuildExperiencePersistPlaytestLogsModule = require(BuildExperience.Flags.FFlagBuildExperiencePersistPlaytestLogs)
local FFlagBuildExperienceShowThinkingBeforeUniverseCreationModule = require(BuildExperience.Flags.FFlagBuildExperienceShowThinkingBeforeUniverseCreation)
local FFlagBuildAdUpsellModule = require(BuildExperience.Flags.FFlagBuildAdUpsell)
local FFlagBuildExperiencePinForBuild = SharedFlagsModule.FFlagBuildExperiencePinForBuild
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
local GetAgentRollbackRequestStoreModule = require(BuildExperience.Stores.GetAgentRollbackRequestStore)
local GetPlaytestLoadingStoreModule = require(Parent.BuildExperiencePlaytestLaunch.GetPlaytestLoadingStore)
local _ = require(Parent.BuildExperiencePlaytestLaunch.createPlaytestLoadingStore)
local GetDefaultTemplatePlaceIdModule = require(BuildExperience.utils.getDefaultTemplatePlaceId)
local LaunchPlaytestWithLoadingStateModule = require(Parent.BuildExperiencePlaytestLaunch.launchPlaytestWithLoadingState)
local IsEnabled = CreatorAgentChatModule.experimentOverride.isEnabled()
local BuildAppStorageModule = if FFlagBuildExperiencePersistChatDraftModule then require(BuildExperience.Storage.BuildAppStorage) else nil
local FFlagBuildExperienceChatHistoryLoadingSkeletonModule = require(BuildExperience.Flags.FFlagBuildExperienceChatHistoryLoadingSkeleton)
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
	-- upvalues: FFlagBuildExperienceShowThinkingBeforeUniverseCreationModule (copy)
	local v1: boolean = FFlagBuildExperienceShowThinkingBeforeUniverseCreationModule and (Enabled == true and p2 == nil and p3 ~= nil)
	
	return if p1 == nil and not v1 then nil else { setupErrorText = SetupErrorText }
end

return function(p1)
	-- upvalues: ReactModule (copy), LocalizationRoactContext (copy), LocalizationStringsModule (copy), FFlagBuildExperienceChatImageAttachmentsModule (copy), FFlagBuildExperiencePersistPlaytestLogsModule (copy), FFlagBuildExperienceClientDataModelTools (copy), FFlagBuildExperienceLibrary (copy), FFlagBuildAdUpsellModule (copy), FFlagBuildExperienceChatHistoryLoadingSkeletonModule (copy), CreatorAgentChatModule (copy), GetAgentRollbackRequestStoreModule (copy), Signal4 (copy), SignalsModule (copy), SignalsReactModule (copy), noopSetAgentSpecVersion (copy), IsEnabled (copy), Signal1 (copy), Signal2 (copy), Signal3 (copy), FFlagBuildExperienceShowThinkingBeforeUniverseCreationModule (copy), ParseSessionStreamModule (copy), SessionPromptMessageFilterModule (copy), FFlagBuildExperienceChatResourceAttachments (copy), Signal (copy), hasPendingLocalToolResponse (copy), noteLiveAdUpsellTurns (copy), FFlagBuildExperiencePrefillSkipsDraftPersistModule (copy), FFlagBuildExperiencePersistChatDraftModule (copy), FFlagBuildExperienceNewGameChatDraftModule (copy), FFlagBuildExperienceRestoreStoppedPromptModule (copy), Frozen (copy), ReactUtilsModule (copy), UseChatScrollModule (copy), GetPlaytestLoadingStoreModule (copy), FFlagBuildExperienceChatHistoryPrefetchModule (copy), FFlagBuildExperiencePinForBuild (copy), MessageBusService (copy), GameMessageId (copy), FFlagBuildExperienceRefreshChatDraftOnGameLeaveModule (copy), BuildAppStorageModule (copy), AppLifecycleObserverService (copy), FFlagBuildExperienceFixChatBottomLockModule (copy), GetNewGameChatDraftKeyModule (copy), ChatTypesModule (copy), UploadCaptureAsyncModule (copy), FFlagBuildExperienceToolResultFailureRecoveryModule (copy), FFlagBuildExperienceAnswerFormModule (copy), CreatorAgentChatModule1 (copy), BuildAgentRollbackPromptModule (copy), UseAgentRollbackRequestModule (copy), UniverseCreateModule (copy), GetDefaultTemplatePlaceIdModule (copy), Debug (copy), FFlagBuildExperiencePromptFailureTelemetry (copy), UniverseConfigurationModule (copy), ChatConstantsModule (copy), RequestFailureKind (copy), SendBuildExperienceEventModule (copy), LaunchPlaytestWithLoadingStateModule (copy), GetActiveAnswerFormModule (copy), FFlagBuildExperienceChatAccordionScrollAnchorModule (copy)
	local UseContextResult = ReactModule.useContext(LocalizationRoactContext)
	local FormatResult = UseContextResult:Format(LocalizationStringsModule.CHAT_CREATE_UNIVERSE_ERROR)
	local FormatResult1 = if FFlagBuildExperienceChatImageAttachmentsModule then UseContextResult:Format(LocalizationStringsModule.CHAT_CAPTURE_UPLOAD_ERROR) else nil
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(nil)
	local v1 = nil
	local UseResult = nil
	
	if FFlagBuildExperiencePersistPlaytestLogsModule or FFlagBuildExperienceClientDataModelTools then
		local UseRefResult = ReactModule.useRef(true)
		v1 = UseRefResult
		UseResult = ReactModule.useCallback(function()
			-- upvalues: UseRefResult (copy)
			return UseRefResult.current
		end, { UseRefResult })
	end
	local PlaceId = p1.placeId
	local UniverseId = p1.universeId
	local SessionId = p1.sessionId
	
	if UseStateResult ~= nil then
		PlaceId = UseStateResult.placeId
		UniverseId = UseStateResult.universeId
		SessionId = UseStateResult.sessionId
	end
	if (SessionId == nil or SessionId == "") and (UseStateResult1 ~= nil and UseStateResult1.universeId == UniverseId and UseStateResult1.placeId == PlaceId) then
		SessionId = UseStateResult1.sessionId
	end
	local NoHydrateHistoryWhen = p1.hydrateHistoryWhen == nil or p1.hydrateHistoryWhen
	local NoSendMessageWhen = p1.sendMessageWhen == nil or p1.sendMessageWhen
	local IsIsLibraryChat: boolean = FFlagBuildExperienceLibrary and p1.isLibraryChat == true
	local Current = if FFlagBuildAdUpsellModule then ReactModule.useRef(p1.trackAdUpsellTurns == true).current else false
	local FFlagBuildExperienceChatHistoryLoadingSkeletonModule1 = FFlagBuildExperienceChatHistoryLoadingSkeletonModule or Current
	local CreatorAgentChatStore = CreatorAgentChatModule.getCreatorAgentChatStore()
	local AgentRollbackRequestStoreModule = GetAgentRollbackRequestStoreModule()
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UniverseId (ref), CreatorAgentChatStore (copy), PlaceId (ref), SessionId (ref)
		return if UniverseId == nil then nil else CreatorAgentChatStore.getSessionForProject(UniverseId, PlaceId, SessionId)
	end, { UniverseId, PlaceId, SessionId, CreatorAgentChatStore })
	ReactModule.useLayoutEffect(function()
		-- upvalues: UseMemoResult (copy), SessionId (ref)
		if UseMemoResult ~= nil and SessionId ~= nil and SessionId ~= "" then
			UseMemoResult.setCasSessionId(SessionId)
			
			return
		end
	end, { UseMemoResult, SessionId })
	local UseSignalStateResult = SignalsReactModule.useSignalState((ReactModule.useMemo(function()
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
	local SpecVersion = nil
	local UseResult1 = noopSetAgentSpecVersion
	local v2 = nil
	local v3 = nil
	
	if IsEnabled then
		local UseRefResult2 = ReactModule.useRef(nil)
		
		if UseRefResult2.current == nil then
			UseRefResult2.current = CreatorAgentChatModule.experimentOverride.createPendingKey()
		end
		local Current1 = UseRefResult2.current
		v2 = Current1
		local UseRefResult3 = ReactModule.useRef(false)
		v3 = UseRefResult3
		local Key = CreatorAgentChatModule.experimentOverride.getKey(CasSessionId) or Current1
		SpecVersion = SignalsReactModule.useSignalState((ReactModule.useMemo(function()
			-- upvalues: CreatorAgentChatModule (upval), Key (copy)
			return CreatorAgentChatModule.experimentOverride.getStateSignal(Key)
		end, { Key }))).specVersion
		UseResult1 = ReactModule.useCallback(function(p2)
			-- upvalues: UseMemoResult (copy), CreatorAgentChatModule (upval), Current1 (copy), UseRefResult3 (copy)
			local Key = CreatorAgentChatModule.experimentOverride.getKey(if UseMemoResult == nil then nil else UseMemoResult.getCasSessionId())
			
			if Key == nil then
				Key = Current1
				UseRefResult3.current = true
				
				if UseMemoResult ~= nil then
					UseMemoResult.setPendingExperimentKey(Current1)
				end
			end
			CreatorAgentChatModule.experimentOverride.set(Key, p2)
		end, { UseMemoResult, Current1 })
		ReactModule.useEffect(function()
			-- upvalues: UseMemoResult (copy), UseRefResult3 (copy), Current1 (copy)
			if UseMemoResult ~= nil and UseRefResult3.current then
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
	local Events = if UseSignalStateResult.session == UseMemoResult and UseSignalStateResult.sessionId == CasSessionId then UseSignalStateResult.events else {}
	local IsNotSessionIdMatch: boolean = SessionId ~= nil and SessionId ~= "" or UniverseId ~= nil and UniverseId ~= 0
	local Inverted: boolean = FFlagBuildExperienceChatHistoryLoadingSkeletonModule1 and (NoHydrateHistoryWhen and (UseMemoResult ~= nil and (IsNotSessionIdMatch and not (UseMemoResult.hasLoadedHistory() and #Events > 0))))
	local v4 = nil
	local Callback1 = nil
	
	if FFlagBuildExperienceChatHistoryLoadingSkeletonModule1 then
		v4, Callback1 = ReactModule.useState(function()
			-- upvalues: UseMemoResult (copy), SessionId (ref), UniverseId (ref), NoHydrateHistoryWhen (copy), Inverted (copy)
			return {
				session = UseMemoResult,
				sessionId = SessionId,
				universeId = UniverseId,
				hydrateHistoryWhen = NoHydrateHistoryWhen,
				isLoading = Inverted
			}
		end)
	end
	local IsHydrateHistoryWhenMatch: boolean = v4 ~= nil and (v4.session == UseMemoResult and (v4.sessionId == SessionId and v4.universeId == UniverseId) and v4.hydrateHistoryWhen == NoHydrateHistoryWhen)
	local NoIsLoading: boolean = if IsHydrateHistoryWhenMatch then not v4.isLoading else not Inverted
	local NoNoIsLoading: boolean = FFlagBuildExperienceChatHistoryLoadingSkeletonModule and (not NoIsLoading or UseMemoResult ~= nil and UseMemoResult.getNextHistoryPageToken() ~= nil)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(nil)
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState(nil)
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult2_3 (copy)
		UseStateResult2_3(nil)
	end, { UseMemoResult, SessionId })
	local SessionId1 = SessionId
	local NoSessionId: boolean = UseStateResult4 ~= nil and UseStateResult4.session == UseMemoResult and (SessionId1 == nil or SessionId1 == "" or (UseStateResult4.sessionId == SessionId1 or UseStateResult4.sessionId == nil and UseStateResult4.session.getCasSessionId() == SessionId1))
	local UseStateResult5 = if NoSessionId then UseStateResult4 else nil
	local UseStateResult6, UseStateResult2_4 = ReactModule.useState(nil)
	local UseRefResult4 = ReactModule.useRef(nil)
	local UseRefResult5 = ReactModule.useRef(nil)
	local UseRefResult6 = ReactModule.useRef(0)
	local UseRefResult7 = ReactModule.useRef(nil)
	local UseResult2 = ReactModule.useCallback(function(Current, Session)
		-- upvalues: UseRefResult4 (copy), UseRefResult5 (copy), UseStateResult2_4 (copy)
		assert(Current == nil or Session ~= nil, "Active turns require an owning session")
		UseRefResult4.current = Current
		UseRefResult5.current = if Current == nil then nil else { session = Session, sessionId = Session.getCasSessionId() }
		UseStateResult2_4(Current)
	end, { UseStateResult2_4 })
	local Current2 = UseRefResult5.current
	local SessionId2 = SessionId
	local NoSessionId1: boolean = Current2 ~= nil and Current2.session == UseMemoResult and (SessionId2 == nil or SessionId2 == "" or (Current2.sessionId == SessionId2 or Current2.sessionId == nil and Current2.session.getCasSessionId() == SessionId2))
	local UseStateResult7 = if NoSessionId1 then UseStateResult6 else nil
	local UseSignalStateResult1 = SignalsReactModule.useSignalState(if UseStateResult7 == nil then Signal1 else UseStateResult7.getOptimisticLocalTools)
	local UseSignalStateResult11 = SignalsReactModule.useSignalState(if UseStateResult7 == nil then Signal2 else UseStateResult7.getLocalToolActions)
	local UseSignalStateResult2 = SignalsReactModule.useSignalState(if UseStateResult7 == nil then Signal3 else UseStateResult7.getSetupErrorText)
	local UseSignalStateResult3 = nil
	UseSignalStateResult3 = if UseSignalStateResult2 == nil then UseSignalStateResult2 else UseContextResult:Format(UseSignalStateResult2)
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: UseStateResult7 (copy), p1 (copy), UseMemoResult (copy), UseStateResult3 (copy), UseSignalStateResult3 (ref), FFlagBuildExperienceShowThinkingBeforeUniverseCreationModule (upval)
		local CreateUniverseOnFirstPrompt = p1.createUniverseOnFirstPrompt
		local SetupErrorText = UseSignalStateResult3
		local HasUseStateResult: boolean = FFlagBuildExperienceShowThinkingBeforeUniverseCreationModule and (CreateUniverseOnFirstPrompt == true and UseMemoResult == nil and UseStateResult3 ~= nil)
		
		return if UseStateResult7 == nil and not HasUseStateResult then nil else { setupErrorText = SetupErrorText }
	end, {
		UseStateResult7,
		if FFlagBuildExperienceShowThinkingBeforeUniverseCreationModule then p1.createUniverseOnFirstPrompt else nil,
		if FFlagBuildExperienceShowThinkingBeforeUniverseCreationModule then UseStateResult3 else nil,
		if FFlagBuildExperienceShowThinkingBeforeUniverseCreationModule then UseMemoResult else nil,
		UseSignalStateResult3
	})
	local UseMemoResult2 = ReactModule.useMemo(function()
		-- upvalues: ParseSessionStreamModule (upval), Events (copy), UseMemoResult (copy), SessionId (ref), UniverseId (ref), PlaceId (ref), UseSignalStateResult1 (copy), UseStateResult3 (copy), SessionPromptMessageFilterModule (upval), FFlagBuildExperienceChatImageAttachmentsModule (upval), FFlagBuildExperienceChatResourceAttachments (upval), UseMemoResult1 (copy), UseStateResult5 (copy)
		return ParseSessionStreamModule(Events, {
			sessionId = if UseMemoResult == nil then SessionId else UseMemoResult.getCasSessionId() or SessionId,
			universeId = if UseMemoResult == nil then UniverseId else UseMemoResult.universeId,
			placeId = if UseMemoResult == nil then PlaceId else UseMemoResult.placeId,
			optimisticLocalTools = UseSignalStateResult1,
			pendingUserMessage = if UseStateResult3 == nil or not SessionPromptMessageFilterModule.shouldOptimisticallyDisplay(UseStateResult3.text) then nil else UseStateResult3.text,
			pendingUserImages = if FFlagBuildExperienceChatImageAttachmentsModule and UseStateResult3 ~= nil and SessionPromptMessageFilterModule.shouldOptimisticallyDisplay(UseStateResult3.text) then UseStateResult3.images else nil,
			pendingUserResourceAttachments = if FFlagBuildExperienceChatResourceAttachments and UseStateResult3 ~= nil and SessionPromptMessageFilterModule.shouldOptimisticallyDisplay(UseStateResult3.text) then UseStateResult3.resourceAttachments else nil,
			pendingUserMessageAfterSequenceId = if UseStateResult3 == nil then nil else UseStateResult3.afterSequenceId,
			liveAssistantMessage = UseMemoResult1,
			optimisticCancelledStartSequenceId = if UseStateResult5 == nil then nil else UseStateResult5.startSequenceId
		})
	end, {
		Events, UseMemoResult, SessionId, UniverseId, PlaceId, UseSignalStateResult1,
		UseStateResult3, UseMemoResult1, UseStateResult5
	})
	local UseRefResult8 = if Current then ReactModule.useRef({
		isInitialized = false,
		lastProcessedSequenceId = nil,
		universeId = UniverseId,
		sessionId = if UseMemoResult == nil then SessionId else UseMemoResult.getCasSessionId() or SessionId,
		historyWatermarkSequenceId = UseMemoResult2.latestSequenceId,
		liveTurnIds = {},
		liveTurnStartSequenceIds = {}
	}) else nil
	local UseResult3 = if UseRefResult8 == nil then nil else ReactModule.useCallback(function(p2)
		-- upvalues: UseRefResult8 (ref)
		if p2 ~= nil then
			UseRefResult8.current.liveTurnIds[p2] = true
		end
	end, { UseRefResult8 })
	local Messages = UseMemoResult2.messages
	local HasNextHistoryPageToken: boolean = UseMemoResult ~= nil and UseMemoResult.getNextHistoryPageToken() ~= nil
	local NoUseMemoResult = UseMemoResult == nil or (not IsNotSessionIdMatch or UseMemoResult.hasLoadedHistory())
	local NoUseMemoResult1: boolean = NoIsLoading and (NoUseMemoResult and (UseMemoResult == nil or (#Messages > 0 or not HasNextHistoryPageToken)))
	local NoHasNextHistoryPageToken: boolean = NoUseMemoResult1 and not HasNextHistoryPageToken
	local SubagentTaskState = UseMemoResult2.subagentTaskState
	local IncludesPublishTool = UseMemoResult2.includesPublishTool
	local Message = Messages[#Messages]
	local UseSignalStateResult4 = SignalsReactModule.useSignalState((ReactModule.useMemo(function()
		-- upvalues: PlaceId (ref), AgentRollbackRequestStoreModule (copy), Signal (upval)
		return if PlaceId == nil then Signal else AgentRollbackRequestStoreModule.getIsPendingForPlaceId(PlaceId)
	end, { PlaceId, AgentRollbackRequestStoreModule })))
	local HasUseStateResult = UseStateResult7 ~= nil or (if Message == nil or Message.kind ~= "assistant_turn" then UseSignalStateResult4 else not Message.isDone or UseSignalStateResult4)
	local HasPendingLocalToolResponse = HasUseStateResult and (not UseSignalStateResult4 and hasPendingLocalToolResponse(UseSignalStateResult1))
	local ActiveTurnState = UseMemoResult2.activeTurnState
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult7 (copy), ActiveTurnState (copy)
		if UseStateResult7 ~= nil and ActiveTurnState ~= nil then
			UseStateResult7.syncFromTurnState(ActiveTurnState)
			
			return
		end
	end, { UseStateResult7, ActiveTurnState })
	
	if Current then
		ReactModule.useEffect(function()
			-- upvalues: p1 (copy), UseRefResult8 (ref), UseMemoResult (copy), UniverseId (ref), SessionId (ref), UseMemoResult2 (copy), NoUseMemoResult1 (copy), noteLiveAdUpsellTurns (upval), Messages (copy)
			local OnAssistantTurnCompletedFunction: (any) -> () = p1.onAssistantTurnCompleted
			local UseRefResult = UseRefResult8
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
					historyWatermarkSequenceId = UseMemoResult2.latestSequenceId,
					liveTurnIds = {},
					liveTurnStartSequenceIds = {}
				}
				UseRefResult.current = Current
			end
			if not NoUseMemoResult1 then
				Current.historyWatermarkSequenceId = Current.historyWatermarkSequenceId or UseMemoResult2.latestSequenceId
				noteLiveAdUpsellTurns(Current, Messages)
				
				return
			end
			if not Current.isInitialized then
				Current.isInitialized = true
				noteLiveAdUpsellTurns(Current, Messages)
				local v5: number? = nil
				
				for liveTurnStartSequenceId in Current.liveTurnStartSequenceIds do
					if v5 == nil or liveTurnStartSequenceId < v5 then
						v5 = liveTurnStartSequenceId
					end
				end
				if v5 == nil then
					Current.lastProcessedSequenceId = Current.historyWatermarkSequenceId or UseMemoResult2.latestSequenceId
				else
					Current.lastProcessedSequenceId = v5 - 1
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
			NoUseMemoResult1, Messages, UseMemoResult2.latestSequenceId
		})
	end
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding("")
	local UseStateResult8, UseStateResult2_5 = ReactModule.useState(nil)
	local UseRefResult9 = ReactModule.useRef("")
	local UseRefResult10 = ReactModule.useRef("")
	local UseRefResult11 = if FFlagBuildExperiencePrefillSkipsDraftPersistModule and FFlagBuildExperiencePersistChatDraftModule then ReactModule.useRef(nil) else nil
	local UseRefResult12 = ReactModule.useRef(nil)
	local UseRefResult13 = ReactModule.useRef(CasSessionId)
	local UseRefResult14 = ReactModule.useRef(nil)
	UseRefResult13.current = CasSessionId
	local NoUniverseId: boolean = p1.createUniverseOnFirstPrompt == true and UniverseId == nil
	local IsCreateUniverseOnFirstPrompt = p1.createUniverseOnFirstPrompt == true
	local UseRefResult15 = if FFlagBuildExperienceNewGameChatDraftModule then ReactModule.useRef(IsCreateUniverseOnFirstPrompt) else { current = IsCreateUniverseOnFirstPrompt }
	UseRefResult15.current = IsCreateUniverseOnFirstPrompt
	local UseRefResult16 = if FFlagBuildExperienceRestoreStoppedPromptModule then ReactModule.useRef(nil) else nil
	local Frozen1 = if IsIsLibraryChat then Frozen else {}
	local Callback = nil
	local UseRefResult17 = { current = {} }
	local UseRefResult18 = ReactModule.useRef({})
	local UseRefResult19 = ReactModule.useRef(0)
	
	if FFlagBuildExperienceChatImageAttachmentsModule then
		Frozen1, Callback = ReactModule.useState({})
		UseRefResult17 = ReactModule.useRef({})
	end
	local t = {}
	local Callback2 = nil
	local UseRefResult20 = { current = {} }
	local UseRefResult21 = {
		current = { universeId = p1.universeId, placeId = p1.placeId }
	}
	
	if FFlagBuildExperienceChatResourceAttachments then
		t, Callback2 = ReactModule.useState({})
		UseRefResult20 = ReactModule.useRef({})
		UseRefResult21 = ReactModule.useRef({ universeId = p1.universeId, placeId = p1.placeId })
	end
	local UseRefResult22 = ReactModule.useRef(nil)
	local UseClockResult = ReactUtilsModule.useClock()
	local UseChatScrollModuleResult = UseChatScrollModule(IsIsLibraryChat)
	local UseResult4 = ReactModule.useCallback(function(p2, p3)
		-- upvalues: GetPlaytestLoadingStoreModule (upval)
		GetPlaytestLoadingStoreModule().setAgentStatusForPlaceId(p2, p3)
	end, {})
	local UseResult5 = ReactModule.useCallback(function(Callback)
		-- upvalues: UseChatScrollModuleResult (copy), UseMemoResult (copy), FFlagBuildExperienceChatHistoryPrefetchModule (upval)
		local function v241()
			-- upvalues: Callback (copy)
			return Callback ~= nil and Callback()
		end
		
		UseChatScrollModuleResult.captureDistanceFromBottom()
		
		if UseMemoResult == nil then return end
		if FFlagBuildExperienceChatHistoryPrefetchModule then
			UseMemoResult.requestOlderHistoryWhile(v241, function()
				-- upvalues: UseChatScrollModuleResult (upval)
				return UseChatScrollModuleResult.isNearTopRef.current
			end)
			
			return
		else
			task.spawn(function()
				-- upvalues: UseMemoResult (upval), v241 (copy), UseChatScrollModuleResult (upval), Callback (copy)
				if UseMemoResult.loadOlderHistory(v241) and UseMemoResult.getNextHistoryPageToken() ~= nil and UseChatScrollModuleResult.isAtTopRef.current then
					task.delay(0.1, function()
						-- upvalues: Callback (upval), UseChatScrollModuleResult (upval), UseMemoResult (upval), v241 (upval)
						if Callback ~= nil and Callback() then return end
						if UseChatScrollModuleResult.isViewportUnderfilled() then
							UseMemoResult.loadOlderHistory(v241)
						end
					end)
				end
			end)
		end
	end, { UseMemoResult, UseChatScrollModuleResult })
	local UseResult6 = ReactModule.useCallback(function(Callback)
		-- upvalues: UseMemoResult (copy), FFlagBuildExperienceChatHistoryPrefetchModule (upval), UseChatScrollModuleResult (copy), UseResult5 (copy)
		task.delay(0.1, function()
			-- upvalues: Callback (copy), UseMemoResult (upval), FFlagBuildExperienceChatHistoryPrefetchModule (upval), UseChatScrollModuleResult (upval), UseResult5 (upval)
			if Callback() then return end
			if UseMemoResult == nil then return end
			if UseMemoResult.getNextHistoryPageToken() == nil then return end
			if FFlagBuildExperienceChatHistoryPrefetchModule then
				if not UseChatScrollModuleResult.isNearTopRef.current then return end
			elseif not UseChatScrollModuleResult.isViewportUnderfilled() then return end
			UseResult5(Callback)
		end)
	end, { UseResult5, UseChatScrollModuleResult, UseMemoResult })
	local UseResult7 = ReactModule.useCallback(function(p2)
		-- upvalues: UseMemoResult (copy), UseResult6 (copy)
		if UseMemoResult == nil then return end
		if UseMemoResult.getNextHistoryPageToken() ~= nil then
			UseResult6(p2)
			
			return
		end
	end, { UseResult6, UseMemoResult })
	local UseRefResult23 = ReactModule.useRef(UseResult7)
	UseRefResult23.current = UseResult7
	ReactModule.useEffect(function()
		-- upvalues: UseChatScrollModuleResult (copy), UseResult5 (copy)
		UseChatScrollModuleResult.setOnScrolledToTop(function()
			-- upvalues: UseResult5 (upval)
			UseResult5(nil)
		end)
		
		return function()
			-- upvalues: UseChatScrollModuleResult (upval)
			UseChatScrollModuleResult.setOnScrolledToTop(nil)
		end
	end, { UseChatScrollModuleResult.setOnScrolledToTop, UseResult5 })
	ReactModule.useEffect(function()
		-- upvalues: NoHydrateHistoryWhen (copy), UseMemoResult (copy), FFlagBuildExperienceChatHistoryLoadingSkeletonModule1 (copy), Callback1 (ref), SessionId (ref), UniverseId (ref), UseRefResult23 (copy), IsIsLibraryChat (copy), UseRefResult4 (copy), FFlagBuildExperienceChatHistoryPrefetchModule (upval), CreatorAgentChatStore (copy), FFlagBuildExperiencePinForBuild (upval), UseStateResult2_1 (copy), PlaceId (ref)
		if NoHydrateHistoryWhen and UseMemoResult ~= nil then
			local Flag = false
			
			local function _(IsLoading)
				-- upvalues: FFlagBuildExperienceChatHistoryLoadingSkeletonModule1 (upval), Callback1 (upval), Flag (ref), UseMemoResult (upval), SessionId (upval), UniverseId (upval), NoHydrateHistoryWhen (upval)
				if FFlagBuildExperienceChatHistoryLoadingSkeletonModule1 and Callback1 ~= nil and not Flag then
					Callback1({
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
			
			if FFlagBuildExperienceChatHistoryLoadingSkeletonModule1 and Callback1 ~= nil and not Flag then
				Callback1({
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
				-- upvalues: Flag (ref), CasSessionId (copy), UseMemoResult (upval), UseRefResult23 (upval), isHydrateCancelled (copy)
				if not (if Flag then true else CasSessionId ~= nil and CasSessionId ~= "" and UseMemoResult.getCasSessionId() ~= CasSessionId) then
					UseRefResult23.current(isHydrateCancelled)
					
					return
				end
			end
			
			local function hydrateKnownSession(CasSessionId1)
				-- upvalues: UseMemoResult (upval), IsIsLibraryChat (upval), UseRefResult4 (upval), FFlagBuildExperienceChatHistoryLoadingSkeletonModule1 (upval), Callback1 (upval), Flag (ref), SessionId (upval), UniverseId (upval), NoHydrateHistoryWhen (upval), CasSessionId (copy), UseRefResult23 (upval), isHydrateCancelled (copy), FFlagBuildExperienceChatHistoryPrefetchModule (upval)
				UseMemoResult.setCasSessionId(CasSessionId1)
				
				if not IsIsLibraryChat or UseRefResult4.current == nil then
					if IsIsLibraryChat or not UseMemoResult.hasLoadedHistory() or #UseMemoResult.getMergedHistory(false) <= 0 then
						if (if FFlagBuildExperienceChatHistoryPrefetchModule then UseMemoResult.refreshSession(isHydrateCancelled, true) else UseMemoResult.refreshSession(isHydrateCancelled)) and not (if Flag then true else CasSessionId ~= nil and CasSessionId ~= "" and UseMemoResult.getCasSessionId() ~= CasSessionId) and not (if Flag then true else CasSessionId ~= nil and CasSessionId ~= "" and UseMemoResult.getCasSessionId() ~= CasSessionId) then
							UseRefResult23.current(isHydrateCancelled)
						end
						if FFlagBuildExperienceChatHistoryLoadingSkeletonModule1 and Callback1 ~= nil then
							if Flag then return end
							Callback1({
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
							UseRefResult23.current(isHydrateCancelled)
						end
						if FFlagBuildExperienceChatHistoryLoadingSkeletonModule1 and Callback1 ~= nil then
							if Flag then return end
							Callback1({
								isLoading = false,
								session = UseMemoResult,
								sessionId = SessionId,
								universeId = UniverseId,
								hydrateHistoryWhen = NoHydrateHistoryWhen
							})
						end
						return
					end
				elseif FFlagBuildExperienceChatHistoryLoadingSkeletonModule1 and Callback1 ~= nil then
					if Flag then return end
					Callback1({
						isLoading = false,
						session = UseMemoResult,
						sessionId = SessionId,
						universeId = UniverseId,
						hydrateHistoryWhen = NoHydrateHistoryWhen
					})
				end
			end
			
			task.spawn(function()
				-- upvalues: SessionId (upval), IsIsLibraryChat (upval), UseMemoResult (upval), hydrateKnownSession (copy), UniverseId (upval), FFlagBuildExperienceChatHistoryLoadingSkeletonModule1 (upval), Callback1 (upval), Flag (ref), NoHydrateHistoryWhen (upval), CreatorAgentChatStore (upval), FFlagBuildExperiencePinForBuild (upval), CasSessionId (copy), UseStateResult2_1 (upval), PlaceId (upval)
				local CasSessionId1 = SessionId
				
				if IsIsLibraryChat and (CasSessionId1 == nil or CasSessionId1 == "") then
					CasSessionId1 = UseMemoResult.getCasSessionId()
				end
				if CasSessionId1 ~= nil and CasSessionId1 ~= "" then
					hydrateKnownSession(CasSessionId1)
					
					return
				end
				if UniverseId ~= nil and UniverseId ~= 0 and (not UseMemoResult.hasLoadedHistory() or #UseMemoResult.getMergedHistory(false) <= 0) then
					local SessionFindByUniverseResult = CreatorAgentChatStore.sessionFindByUniverse({
						sort = "desc",
						universeId = UniverseId,
						application = if FFlagBuildExperiencePinForBuild then "build" else nil,
						filterByPinForBuild = if FFlagBuildExperiencePinForBuild then true else nil
					})
					while SessionFindByUniverseResult.state(false).status == "pending" and not (if Flag then true else CasSessionId ~= nil and CasSessionId ~= "" and UseMemoResult.getCasSessionId() ~= CasSessionId) do
						task.wait()
					end
					if IsIsLibraryChat then
						if if Flag then true else CasSessionId ~= nil and CasSessionId ~= "" and UseMemoResult.getCasSessionId() ~= CasSessionId then return end
						local CasSessionId2 = UseMemoResult.getCasSessionId()
						
						if CasSessionId2 ~= nil and CasSessionId2 ~= "" then
							hydrateKnownSession(CasSessionId2)
							
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
								sessionId = SessionId1
							})
							
							return
						end
						UseMemoResult.markHistoryLoaded()
						
						if FFlagBuildExperienceChatHistoryLoadingSkeletonModule1 and Callback1 ~= nil then
							if Flag then return end
							Callback1({
								isLoading = false,
								session = UseMemoResult,
								sessionId = SessionId,
								universeId = UniverseId,
								hydrateHistoryWhen = NoHydrateHistoryWhen
							})
						end
						return
					elseif FFlagBuildExperienceChatHistoryLoadingSkeletonModule1 and Callback1 ~= nil then
						if Flag then return end
						Callback1({
							isLoading = false,
							session = UseMemoResult,
							sessionId = SessionId,
							universeId = UniverseId,
							hydrateHistoryWhen = NoHydrateHistoryWhen
						})
					end
					return
				elseif FFlagBuildExperienceChatHistoryLoadingSkeletonModule1 and Callback1 ~= nil then
					if Flag then return end
					Callback1({
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
		elseif FFlagBuildExperienceChatHistoryLoadingSkeletonModule1 and Callback1 ~= nil then
			Callback1({
				isLoading = false,
				session = UseMemoResult,
				sessionId = SessionId,
				universeId = UniverseId,
				hydrateHistoryWhen = NoHydrateHistoryWhen
			})
		end
	end, {
		UseMemoResult, SessionId, UniverseId, PlaceId, CreatorAgentChatStore,
		NoHydrateHistoryWhen, FFlagBuildExperienceChatHistoryLoadingSkeletonModule1,
		IsIsLibraryChat
	})
	ReactModule.useEffect(function()
		-- upvalues: UseMemoResult (copy), SessionId (ref), FFlagBuildExperienceChatHistoryPrefetchModule (upval), UseRefResult23 (copy), MessageBusService (upval), GameMessageId (upval), FFlagBuildExperiencePersistPlaytestLogsModule (upval), FFlagBuildExperienceClientDataModelTools (upval), v1 (ref), FFlagBuildExperienceRefreshChatDraftOnGameLeaveModule (upval), FFlagBuildExperiencePersistChatDraftModule (upval), FFlagBuildExperiencePrefillSkipsDraftPersistModule (upval), UseRefResult9 (copy), UseRefResult11 (copy), BuildAppStorageModule (upval), UseRefResult10 (copy), UseBindingResult2 (copy), UseStateResult2_5 (copy), AppLifecycleObserverService (upval)
		if UseMemoResult == nil then return end
		local Flag = false
		
		local function refreshKnownSession()
			-- upvalues: UseMemoResult (upval), SessionId (upval), Flag (ref), FFlagBuildExperienceChatHistoryPrefetchModule (upval), UseRefResult23 (upval)
			local CasSessionId = UseMemoResult.getCasSessionId()
			
			if (CasSessionId == nil or CasSessionId == "") and (SessionId ~= nil and SessionId ~= "") then
				CasSessionId = SessionId
			end
			if CasSessionId ~= nil and CasSessionId ~= "" then
				task.spawn(function()
					-- upvalues: Flag (upval), FFlagBuildExperienceChatHistoryPrefetchModule (upval), UseMemoResult (upval), UseRefResult23 (upval)
					local function isRefreshCancelled()
						-- upvalues: Flag (upval)
						return Flag
					end
					
					if (if FFlagBuildExperienceChatHistoryPrefetchModule then UseMemoResult.refreshSession(isRefreshCancelled, true) else UseMemoResult.refreshSession(isRefreshCancelled)) and not Flag then
						UseRefResult23.current(function()
							-- upvalues: Flag (upval)
							return Flag
						end)
					end
				end)
				
				return
			end
		end
		
		local SubscribeResult = MessageBusService:Subscribe(GameMessageId, function(_)
			-- upvalues: FFlagBuildExperiencePersistPlaytestLogsModule (upval), FFlagBuildExperienceClientDataModelTools (upval), v1 (upval), FFlagBuildExperienceRefreshChatDraftOnGameLeaveModule (upval), FFlagBuildExperiencePersistChatDraftModule (upval), UseMemoResult (upval), SessionId (upval), FFlagBuildExperiencePrefillSkipsDraftPersistModule (upval), UseRefResult9 (upval), UseRefResult11 (upval), BuildAppStorageModule (upval), UseRefResult10 (upval), UseBindingResult2 (upval), UseStateResult2_5 (upval), refreshKnownSession (copy)
			if (FFlagBuildExperiencePersistPlaytestLogsModule or FFlagBuildExperienceClientDataModelTools) and v1 ~= nil then
				v1.current = true
			end
			if FFlagBuildExperienceRefreshChatDraftOnGameLeaveModule and FFlagBuildExperiencePersistChatDraftModule then
				local CasSessionId = UseMemoResult.getCasSessionId()
				
				if (CasSessionId == nil or CasSessionId == "") and (SessionId ~= nil and SessionId ~= "") then
					CasSessionId = SessionId
				end
				local IsCurrentMatch: boolean = FFlagBuildExperiencePrefillSkipsDraftPersistModule and (UseRefResult9.current ~= "" and UseRefResult9.current == UseRefResult11.current)
				
				if CasSessionId ~= nil and CasSessionId ~= "" and not IsCurrentMatch then
					local ChatDraft = BuildAppStorageModule.getChatDraft(CasSessionId) or ""
					UseRefResult10.current = ChatDraft
					UseRefResult9.current = ChatDraft
					UseBindingResult2(ChatDraft)
					UseStateResult2_5(nil)
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
	end, { UseMemoResult, SessionId, v1 })
	ReactModule.useEffect(function()
		-- upvalues: FFlagBuildExperienceFixChatBottomLockModule (upval), IsIsLibraryChat (copy), NoHydrateHistoryWhen (copy), UseChatScrollModuleResult (copy)
		if (FFlagBuildExperienceFixChatBottomLockModule or IsIsLibraryChat) and NoHydrateHistoryWhen then
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
	local UseResult8 = ReactModule.useCallback(function(Current)
		-- upvalues: UseRefResult9 (copy), UseBindingResult2 (copy), UseStateResult2_5 (copy)
		UseRefResult9.current = Current
		UseBindingResult2(Current)
		UseStateResult2_5(nil)
	end, { UseBindingResult2, UseStateResult2_5 })
	local UseResult9 = if FFlagBuildExperiencePersistChatDraftModule then ReactModule.useCallback(function()
		-- upvalues: UseRefResult12 (copy)
		if UseRefResult12.current ~= nil then
			task.cancel(UseRefResult12.current)
			UseRefResult12.current = nil
		end
	end, {}) else nil
	local UseResult10 = if FFlagBuildExperienceNewGameChatDraftModule then ReactModule.useCallback(function()
		-- upvalues: UseRefResult13 (copy), UseRefResult15 (ref), GetNewGameChatDraftKeyModule (upval)
		local Current = UseRefResult13.current
		
		return if Current == nil or Current == "" then if UseRefResult15.current then GetNewGameChatDraftKeyModule() else nil else Current
	end, {}) else nil
	local UseResult11 = if FFlagBuildExperiencePersistChatDraftModule then ReactModule.useCallback(function(Current)
		-- upvalues: UseRefResult10 (copy), UseResult9 (copy), FFlagBuildExperienceNewGameChatDraftModule (upval), UseResult10 (copy), UseRefResult13 (copy), UseRefResult12 (copy), BuildAppStorageModule (upval)
		UseRefResult10.current = Current
		UseResult9()
		local UseResultResult = if FFlagBuildExperienceNewGameChatDraftModule then UseResult10() else UseRefResult13.current
		
		if UseResultResult ~= nil and UseResultResult ~= "" then
			UseRefResult12.current = task.delay(0.5, function()
				-- upvalues: UseRefResult12 (upval), BuildAppStorageModule (upval), UseResultResult (copy), Current (copy)
				UseRefResult12.current = nil
				BuildAppStorageModule.setChatDraft(UseResultResult, Current)
			end)
			
			return
		end
	end, { UseResult9, UseResult10 }) else nil
	local UseResult12 = if FFlagBuildExperiencePersistChatDraftModule then ReactModule.useCallback(function(Current)
		-- upvalues: FFlagBuildExperienceNewGameChatDraftModule (upval), UseResult10 (copy), UseRefResult13 (copy), UseRefResult10 (copy), UseResult9 (copy), BuildAppStorageModule (upval)
		local UseResultResult = if FFlagBuildExperienceNewGameChatDraftModule then UseResult10() else UseRefResult13.current
		
		if UseResultResult ~= nil and UseResultResult ~= "" then
			UseRefResult10.current = Current
			UseResult9()
			BuildAppStorageModule.setChatDraft(UseResultResult, Current)
			
			return
		end
	end, { UseResult9, UseResult10 }) else nil
	local UseResult13 = if FFlagBuildExperiencePersistChatDraftModule then ReactModule.useCallback(function(Current, p2)
		-- upvalues: FFlagBuildExperienceNewGameChatDraftModule (upval), UseRefResult15 (ref), GetNewGameChatDraftKeyModule (upval), BuildAppStorageModule (upval), UseRefResult10 (copy), UseResult9 (copy)
		local NewGameChatDraftKeyModule = if FFlagBuildExperienceNewGameChatDraftModule and UseRefResult15.current then GetNewGameChatDraftKeyModule() else nil
		
		if NewGameChatDraftKeyModule ~= nil then
			BuildAppStorageModule.setChatDraft(NewGameChatDraftKeyModule, "")
		end
		if p2 ~= nil and p2 ~= "" and UseRefResult10.current == Current then
			UseRefResult10.current = ""
			UseResult9()
			BuildAppStorageModule.setChatDraft(p2, "")
			
			return
		end
	end, { UseResult9 }) else nil
	local UseResult14 = ReactModule.useCallback(function(Current)
		-- upvalues: UseResult8 (copy), FFlagBuildExperiencePersistChatDraftModule (upval), FFlagBuildExperiencePrefillSkipsDraftPersistModule (upval), UseRefResult11 (copy), UseResult11 (copy)
		UseResult8(Current)
		
		if FFlagBuildExperiencePersistChatDraftModule then
			if FFlagBuildExperiencePrefillSkipsDraftPersistModule then
				local Current1 = UseRefResult11.current
				
				if Current1 ~= nil and Current == Current1 then return end
				UseRefResult11.current = nil
			end
			UseResult11(Current)
		end
	end, { UseResult8, UseResult11 })
	local UseResult15 = if FFlagBuildExperiencePrefillSkipsDraftPersistModule and FFlagBuildExperiencePersistChatDraftModule then ReactModule.useCallback(function(Current)
		-- upvalues: UseRefResult11 (copy), UseResult8 (copy)
		UseRefResult11.current = Current
		UseResult8(Current)
	end, { UseResult8 }) else UseResult14
	
	if FFlagBuildExperienceNewGameChatDraftModule and FFlagBuildExperiencePersistChatDraftModule then
		ReactModule.useEffect(function()
			-- upvalues: NoUniverseId (copy), CasSessionId (copy), GetNewGameChatDraftKeyModule (upval), BuildAppStorageModule (upval), UseRefResult9 (copy), UseRefResult10 (copy), UseResult8 (copy)
			if not NoUniverseId or CasSessionId ~= nil and CasSessionId ~= "" then return end
			local NewGameChatDraftKeyModule = GetNewGameChatDraftKeyModule()
			
			if NewGameChatDraftKeyModule == nil then return end
			local ChatDraft = BuildAppStorageModule.getChatDraft(NewGameChatDraftKeyModule) or ""
			
			if ChatDraft ~= "" and UseRefResult9.current == "" then
				UseRefResult10.current = ChatDraft
				UseResult8(ChatDraft)
			end
		end, { NoUniverseId, CasSessionId, UseResult8 })
	end
	ReactModule.useEffect(function()
		-- upvalues: FFlagBuildExperiencePersistChatDraftModule (upval), CasSessionId (copy), UseRefResult14 (copy), UseResult9 (copy), FFlagBuildExperiencePrefillSkipsDraftPersistModule (upval), UseRefResult9 (copy), UseRefResult11 (copy), UseRefResult10 (copy), BuildAppStorageModule (upval), UseResult8 (copy), UseRefResult12 (copy)
		if not FFlagBuildExperiencePersistChatDraftModule then return end
		if CasSessionId == nil or CasSessionId == "" then return end
		local Current = UseRefResult14.current
		UseRefResult14.current = CasSessionId
		UseResult9()
		
		if FFlagBuildExperiencePrefillSkipsDraftPersistModule and Current == nil and UseRefResult9.current ~= "" and UseRefResult9.current == UseRefResult11.current then
			UseRefResult10.current = BuildAppStorageModule.getChatDraft(CasSessionId) or ""
		elseif Current == nil and UseRefResult9.current ~= "" then
			UseRefResult10.current = UseRefResult9.current
			BuildAppStorageModule.setChatDraft(CasSessionId, UseRefResult9.current)
		else
			local ChatDraft = BuildAppStorageModule.getChatDraft(CasSessionId) or ""
			UseRefResult10.current = ChatDraft
			UseResult8(ChatDraft)
		end
		return function()
			-- upvalues: UseRefResult12 (upval), UseResult9 (upval), BuildAppStorageModule (upval), CasSessionId (upval), UseRefResult10 (upval)
			local HasCurrent = UseRefResult12.current ~= nil
			UseResult9()
			
			if HasCurrent then
				BuildAppStorageModule.setChatDraft(CasSessionId, UseRefResult10.current)
			end
		end
	end, { CasSessionId, UseResult9, UseResult8 })
	
	local function commitComposerResourceAttachments(Current)
		-- upvalues: UseRefResult20 (ref), Callback2 (ref), UseStateResult2_5 (copy)
		UseRefResult20.current = Current
		
		if Callback2 ~= nil then
			Callback2(Current)
		end
		UseStateResult2_5(nil)
	end
	
	local function findComposerResourceAttachmentIndexByUri(ResourceAttachmentUri)
		-- upvalues: UseRefResult20 (ref), ChatTypesModule (upval)
		for i, value in UseRefResult20.current do
			if ChatTypesModule.getResourceAttachmentUri(value) == ResourceAttachmentUri then
				return i
			end
		end
		return nil
	end
	
	local function addComposerResourceAttachment(p2)
		-- upvalues: UseRefResult20 (ref), Callback2 (ref), UseStateResult2_5 (copy)
		local Copy = table.clone(UseRefResult20.current)
		table.insert(Copy, p2)
		UseRefResult20.current = Copy
		
		if Callback2 ~= nil then
			Callback2(Copy)
		end
		UseStateResult2_5(nil)
	end
	
	local function removeComposerResourceAttachmentAtIndex(Index)
		-- upvalues: UseRefResult20 (ref), Callback2 (ref), UseStateResult2_5 (copy)
		local Copy = table.clone(UseRefResult20.current)
		table.remove(Copy, Index)
		UseRefResult20.current = Copy
		
		if Callback2 ~= nil then
			Callback2(Copy)
		end
		UseStateResult2_5(nil)
	end
	
	local function clearComposerResourceAttachments()
		-- upvalues: UseRefResult20 (ref), Callback2 (ref), UseStateResult2_5 (copy)
		local Current = {}
		UseRefResult20.current = Current
		
		if Callback2 ~= nil then
			Callback2(Current)
		end
		UseStateResult2_5(nil)
	end
	
	local UseRefResult1 = ReactModule.useRef(commitComposerResourceAttachments)
	UseRefResult1.current = commitComposerResourceAttachments
	
	if FFlagBuildExperienceChatResourceAttachments then
		ReactModule.useLayoutEffect(function()
			-- upvalues: UseRefResult21 (ref), p1 (copy), UseRefResult1 (copy)
			local Current = UseRefResult21.current
			
			if Current.universeId ~= p1.universeId or Current.placeId ~= p1.placeId then
				UseRefResult1.current({})
			end
			UseRefResult21.current = { universeId = p1.universeId, placeId = p1.placeId }
		end, { p1.universeId, p1.placeId })
	end
	local function _(Current)
		-- upvalues: UseRefResult17 (ref), Callback (ref)
		UseRefResult17.current = Current
		
		if Callback ~= nil then
			Callback(Current)
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
	
	local function updateComposerImage(Capture, Callback1)
		-- upvalues: UseRefResult17 (ref), Callback (ref)
		local Current = UseRefResult17.current
		local Copy = table.clone(Current)
		
		for i, value in Current do
			if value.capture == Capture then
				Copy[i] = Callback1(value)
				UseRefResult17.current = Copy
				
				if Callback ~= nil then
					Callback(Copy)
				end
				return Copy
			end
		end
		return Current
	end
	
	local function beginComposerImageUpload(Capture)
		-- upvalues: UseRefResult19 (copy), UseRefResult18 (copy), updateComposerImage (copy), UseStateResult2_5 (copy), UploadCaptureAsyncModule (upval), FFlagBuildExperienceChatImageAttachmentsModule (upval), FormatResult1 (copy)
		UseRefResult19.current += 1
		local Current = UseRefResult19.current
		UseRefResult18.current[Capture] = Current
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
			UseStateResult2_5(nil)
		end
		UploadCaptureAsyncModule(Capture):andThen(function(Result)
			-- upvalues: UseRefResult18 (upval), Capture (copy), Current (copy), updateComposerImage (upval), UseStateResult2_5 (upval)
			if UseRefResult18.current[Capture] ~= Current then return end
			UseRefResult18.current[Capture] = nil
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
				UseStateResult2_5(nil)
			end
		end):catch(function(Err)
			-- upvalues: UseRefResult18 (upval), Capture (copy), Current (copy), updateComposerImage (upval), FFlagBuildExperienceChatImageAttachmentsModule (upval), UseStateResult2_5 (upval), FormatResult1 (upval)
			if UseRefResult18.current[Capture] ~= Current then return end
			UseRefResult18.current[Capture] = nil
			updateComposerImage(Capture, function(Tbl)
				-- upvalues: Err (copy)
				local Copy = table.clone(Tbl)
				Copy.uri = nil
				Copy.uploadStatus = "failed"
				Copy.uploadError = Err
				
				return Copy
			end)
			
			if FFlagBuildExperienceChatImageAttachmentsModule then
				UseStateResult2_5(FormatResult1)
			end
		end)
	end
	
	local function setComposerImages(p2)
		-- upvalues: UseRefResult17 (ref), UseRefResult18 (copy), Callback (ref), UseStateResult2_5 (copy), beginComposerImageUpload (copy)
		local Current = UseRefResult17.current
		local Current1 = {}
		local Captures = {}
		local Tbl = nil
		
		for i = 1, math.min(#p2, 2) do
			local v6 = p2[i]
			Tbl = v6
			
			if v6.capture ~= nil and v6.uri == nil and v6.uploadStatus == nil then
				for _, value in Current do
					if value.capture == v6.capture then
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
				UseRefResult18.current[value1.capture] = nil
			end
		end
		UseRefResult17.current = Current1
		
		if Callback ~= nil then
			Callback(Current1)
		end
		local Flag1 = false
		
		for _, value3 in Current1 do
			if value3.uploadStatus == "failed" then
				Flag1 = true
				break
			end
		end
		if not Flag1 then
			UseStateResult2_5(nil)
		end
		for _, capture in Captures do
			beginComposerImageUpload(capture)
		end
	end
	
	local UseRefResult24 = ReactModule.useRef(setComposerImages)
	UseRefResult24.current = setComposerImages
	
	local function retryComposerImage(p3)
		-- upvalues: UseRefResult17 (ref), beginComposerImageUpload (copy)
		local CurrentEntry = UseRefResult17.current[p3]
		
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
	local UseResult16 = if FFlagBuildExperienceToolResultFailureRecoveryModule or FFlagBuildExperienceAnswerFormModule then ReactModule.useCallback(function(Current)
		-- upvalues: UseRefResult6 (copy), UseRefResult5 (copy), UseMemoResult (copy), SessionId (ref), FFlagBuildExperienceAnswerFormModule (upval), UseRefResult4 (copy), UseRefResult9 (copy), UseResult14 (copy), CreatorAgentChatModule1 (upval), UseContextResult (copy), UseStateResult2_5 (copy)
		return function(p3, p4)
			-- upvalues: UseRefResult6 (upval), Current (copy), UseRefResult5 (upval), UseMemoResult (upval), SessionId (upval), FFlagBuildExperienceAnswerFormModule (upval), UseRefResult4 (upval), UseRefResult9 (upval), UseResult14 (upval), CreatorAgentChatModule1 (upval), UseContextResult (upval), UseStateResult2_5 (upval)
			if UseRefResult6.current == Current then
				local Current1 = UseRefResult5.current
				local SessionId1 = SessionId
				
				if Current1 ~= nil and Current1.session == UseMemoResult and (SessionId1 == nil or SessionId1 == "" or (Current1.sessionId == SessionId1 or Current1.sessionId == nil and Current1.session.getCasSessionId() == SessionId1)) then
					local HasNextEntry = false
					
					if FFlagBuildExperienceAnswerFormModule then
						local Current2 = UseRefResult4.current
						
						if Current2 ~= nil then
							HasNextEntry = next(Current2.getLocalToolActions(false).onAnswerSelectedByToolCallId) ~= nil
						end
					end
					if p3 ~= nil and UseRefResult9.current == "" and not HasNextEntry then
						UseResult14(p3)
					end
					UseStateResult2_5((UseContextResult:Format((CreatorAgentChatModule1.getToolResultFailureComposerError(p4)))))
					
					return
				end
			end
		end
	end, {
		UseMemoResult,
		SessionId,
		UseResult14,
		UseStateResult2_5,
		UseContextResult
	}) else nil
	local UseResult17 = ReactModule.useCallback(function(Current, p3, p4, p5, p6, Current1)
		-- upvalues: UseRefResult6 (copy), UseResult2 (copy), UseRefResult7 (copy), UseStateResult2_2 (copy), p1 (copy), UseResult4 (copy), FFlagBuildExperienceChatImageAttachmentsModule (upval), UseRefResult24 (copy), FFlagBuildExperienceChatResourceAttachments (upval), UseRefResult1 (copy), UseResult14 (copy), CreatorAgentChatModule1 (upval), UseContextResult (copy), UseStateResult2_5 (copy), UseChatScrollModuleResult (copy), SessionId (ref), UseStateResult2 (copy)
		if UseRefResult6.current ~= Current then return end
		UseResult2(nil)
		UseRefResult7.current = nil
		UseStateResult2_2(nil)
		
		if p3 == nil then
			if Current1.placeId ~= nil then
				UseResult4(Current1.placeId, "Completed")
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
					UseStateResult2(config)
					
					if p1.onProjectResolved ~= nil then
						p1.onProjectResolved(config)
					end
				end
				task.spawn(function()
					-- upvalues: Current1 (copy), UseRefResult6 (upval), Current (copy)
					Current1.refreshSession(function(): boolean
						-- upvalues: UseRefResult6 (upval), Current (upval)
						return UseRefResult6.current ~= Current
					end)
				end)
			end
			return
		else
			if p1.onPromptFailure ~= nil then
				p1.onPromptFailure(p3.errorCode, p3.outOfCreditsReason)
			end
			if Current1.placeId ~= nil then
				UseResult4(Current1.placeId, "Idle")
			end
			if FFlagBuildExperienceChatImageAttachmentsModule and p5 ~= nil then
				UseRefResult24.current(p5)
			end
			if FFlagBuildExperienceChatResourceAttachments and p6 ~= nil then
				UseRefResult1.current(p6)
			end
			if p4 ~= nil then
				UseResult14(p4)
				UseStateResult2_5((UseContextResult:Format((CreatorAgentChatModule1.getPromptFailureComposerError(p3)))))
			end
			task.spawn(function()
				-- upvalues: Current1 (copy), UseRefResult6 (upval), Current (copy)
				Current1.refreshSession(function(): boolean
					-- upvalues: UseRefResult6 (upval), Current (upval)
					return UseRefResult6.current ~= Current
				end)
			end)
		end
	end, {
		p1.createUniverseOnFirstPrompt, p1.onPromptFailure, p1.onProjectResolved,
		SessionId, UseResult4, UseStateResult2, UseChatScrollModuleResult, UseResult14,
		UseStateResult2_5, UseResult2, UseStateResult2_2, UseContextResult
	})
	local UseRefResult25 = ReactModule.useRef(NoHydrateHistoryWhen)
	ReactModule.useEffect(function()
		-- upvalues: NoHydrateHistoryWhen (copy), UseRefResult25 (copy), IsIsLibraryChat (copy), HasUseStateResult (copy), UseStateResult7 (copy), UseChatScrollModuleResult (copy)
		local NoCurrent: boolean = NoHydrateHistoryWhen and not UseRefResult25.current
		UseRefResult25.current = NoHydrateHistoryWhen
		
		if IsIsLibraryChat then return end
		if not NoHydrateHistoryWhen then return end
		if NoCurrent or HasUseStateResult or UseStateResult7 ~= nil then
			UseChatScrollModuleResult.scrollToBottomUnconditionally()
			task.defer(UseChatScrollModuleResult.scrollToBottomUnconditionally)
			task.delay(0.15, UseChatScrollModuleResult.scrollToBottomUnconditionally)
			
			return
		end
	end, {
		NoHydrateHistoryWhen, IsIsLibraryChat, HasUseStateResult, UseStateResult7,
		#Messages, UseChatScrollModuleResult
	})
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult4 (copy), UseRefResult5 (copy), UseMemoResult (copy), SessionId (ref), UseStateResult5 (copy), UseRefResult6 (copy), UseRefResult7 (copy), PlaceId (ref), UseResult4 (copy), CreatorAgentChatModule1 (upval), UseResult17 (copy), FFlagBuildExperienceToolResultFailureRecoveryModule (upval), FFlagBuildExperienceAnswerFormModule (upval), UseResult16 (ref), UseResult (ref), UseResult2 (copy), UseChatScrollModuleResult (copy), UseMemoResult2 (copy), UseStateResult7 (copy), CreatorAgentChatStore (copy), HasUseStateResult (copy)
		if UseRefResult4.current ~= nil then
			local Current = UseRefResult5.current
			local SessionId1 = SessionId
			
			if Current ~= nil and Current.session == UseMemoResult and (SessionId1 == nil or SessionId1 == "" or (Current.sessionId == SessionId1 or Current.sessionId == nil and Current.session.getCasSessionId() == SessionId1)) then return end
		end
		if UseStateResult5 ~= nil then return end
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
			-- upvalues: UseRefResult6 (upval), UseRefResult7 (upval), PlaceId (upval), UseResult4 (upval), CreatorAgentChatModule1 (upval), UseMemoResult (upval), UseResult17 (upval), FFlagBuildExperienceToolResultFailureRecoveryModule (upval), FFlagBuildExperienceAnswerFormModule (upval), UseResult16 (upval), UseResult (upval), UseResult2 (upval), UseChatScrollModuleResult (upval)
			UseRefResult6.current += 1
			local Current1 = UseRefResult6.current
			UseRefResult7.current = Current
			
			if PlaceId ~= nil then
				UseResult4(PlaceId, "Loading")
			end
			local ResumedAssistantTurn = CreatorAgentChatModule1.createResumedAssistantTurn(UseMemoResult, ActiveTurnHandle, function(p3)
				-- upvalues: UseResult17 (upval), Current1 (copy), UseMemoResult (upval)
				UseResult17(Current1, p3, nil, nil, nil, UseMemoResult)
			end, if Current == nil then nil else Current - 1, if FFlagBuildExperienceToolResultFailureRecoveryModule or FFlagBuildExperienceAnswerFormModule then UseResult16(Current1) else nil, UseResult)
			UseResult2(ResumedAssistantTurn, UseMemoResult)
			ResumedAssistantTurn.start()
			UseChatScrollModuleResult.scrollToBottomUnconditionally()
		end
		
		if UseMemoResult2.activeTurnState == nil or UseMemoResult2.activeTurnItemIndex == nil or UseMemoResult2.activeTurnState.isDone then
			UseRefResult7.current = nil
			local ActiveTurnHandle = CreatorAgentChatStore.getActiveTurnHandle(Text)
			local StateResult = if ActiveTurnHandle == nil then nil else ActiveTurnHandle.state(false)
			local NoIsDone: boolean = ActiveTurnHandle ~= nil and (StateResult ~= nil and not StateResult.isDone)
			
			if not HasUseStateResult and not NoIsDone then return end
			if NoIsDone then
				attachResumedTurn(ActiveTurnHandle, nil)
			end
			return
		else
			local ActiveTurnStartSequenceId = UseMemoResult2.activeTurnStartSequenceId
			
			if UseRefResult7.current == ActiveTurnStartSequenceId and UseStateResult7 ~= nil then return end
			local ResumeTurnFromHistoryResult = CreatorAgentChatStore.resumeTurnFromHistory(Text, UseMemoResult2.activeTurnState, UseMemoResult2.activeTurnSequenceIds)
			
			if ResumeTurnFromHistoryResult ~= nil then
				attachResumedTurn(ResumeTurnFromHistoryResult, ActiveTurnStartSequenceId)
			end
		end
	end, {
		UseMemoResult2, UseMemoResult, SessionId, CreatorAgentChatStore,
		HasUseStateResult, UseStateResult7, PlaceId, UseResult4, UseResult17,
		UseChatScrollModuleResult, UseResult2, UseStateResult5, UseResult16, UseResult
	})
	local UseResult18 = ReactModule.useCallback(function(p3, Text, p4, Images, ResourceAttachments, Current, AfterSequenceId, p5, Callback, Callback2, Callback1)
		-- upvalues: UseStateResult2_2 (copy), UseResult3 (ref), FFlagBuildExperiencePersistChatDraftModule (upval), UseResult13 (copy), SessionId (ref), FFlagBuildExperienceRestoreStoppedPromptModule (upval), UseRefResult16 (ref), FFlagBuildExperienceLibrary (upval), CreatorAgentChatModule1 (upval), UseResult17 (copy), FFlagBuildExperienceToolResultFailureRecoveryModule (upval), FFlagBuildExperienceAnswerFormModule (upval), UseResult16 (ref), UseResult (ref), UseResult4 (copy), UseResult2 (copy), UseChatScrollModuleResult (copy)
		UseStateResult2_2({
			text = Text,
			images = Images,
			resourceAttachments = ResourceAttachments,
			afterSequenceId = AfterSequenceId
		})
		local UseResult1: (any) -> () = if FFlagBuildExperiencePersistChatDraftModule and p5 ~= nil then function(p6)
			-- upvalues: UseResult1 (copy), UseResult13 (upval), p5 (copy), p3 (copy), SessionId (upval)
			if UseResult1 ~= nil then
				UseResult1(p6)
			end
			UseResult13(p5, p3.getCasSessionId() or SessionId)
		end else UseResult3
		
		if FFlagBuildExperienceRestoreStoppedPromptModule and UseRefResult16 ~= nil then
			local UseRefResult = UseRefResult16
			
			UseResult1 = function(p6)
				-- upvalues: UseRefResult (copy), Current (copy), UseResult1 (copy)
				UseRefResult.current = Current
				
				if UseResult1 ~= nil then
					UseResult1(p6)
				end
			end
		end
		if Callback ~= nil then
			UseResult1 = function(p6)
				-- upvalues: UseResult1 (copy), Callback (copy), p3 (copy)
				if UseResult1 ~= nil then
					UseResult1(p6)
				end
				Callback(p3.getCasSessionId())
			end
		end
		local LiveAssistantTurn = CreatorAgentChatModule1.createLiveAssistantTurn(p3, p4, function(p6)
			-- upvalues: UseResult17 (upval), Current (copy), p5 (copy), Images (copy), ResourceAttachments (copy), p3 (copy), Callback2 (copy)
			UseResult17(Current, p6, p5, Images, ResourceAttachments, p3)
			
			if Callback2 ~= nil then
				Callback2()
			end
		end, if FFlagBuildExperienceToolResultFailureRecoveryModule or FFlagBuildExperienceAnswerFormModule then UseResult16(Current) else nil, UseResult, UseResult1, if FFlagBuildExperienceLibrary and Callback1 ~= nil then function()
			-- upvalues: FFlagBuildExperiencePersistChatDraftModule (upval), p5 (copy), UseResult13 (upval), p3 (copy), SessionId (upval), Callback1 (copy)
			if FFlagBuildExperiencePersistChatDraftModule and p5 ~= nil then
				UseResult13(p5, p3.getCasSessionId() or SessionId)
			end
			Callback1(p3.getCasSessionId())
		end else nil)
		
		if p3.placeId ~= nil then
			UseResult4(p3.placeId, "Loading")
		end
		UseResult2(LiveAssistantTurn, p3)
		UseChatScrollModuleResult.scrollToBottomAfterSend()
		LiveAssistantTurn.start()
	end, {
		UseResult17, UseResult4, UseChatScrollModuleResult, UseResult2,
		UseStateResult2_2, UseResult16, UseResult, UseResult3, UseResult13, SessionId
	})
	local UseRefResult26 = ReactModule.useRef(UseMemoResult2.latestSequenceId)
	UseRefResult26.current = UseMemoResult2.latestSequenceId
	local UseAgentRollbackRequestModuleResult = UseAgentRollbackRequestModule({
		universeId = UniverseId,
		placeId = PlaceId,
		session = UseMemoResult,
		activeTurnHandleRef = UseRefResult4,
		startRollbackTurn = ReactModule.useCallback(function(p3, Callback1, Callback: () -> ())
			-- upvalues: UseMemoResult (copy), UseChatScrollModuleResult (copy), UseRefResult6 (copy), UseStateResult2_3 (copy), BuildAgentRollbackPromptModule (upval), UseResult18 (copy), UseRefResult26 (copy)
			if UseMemoResult == nil then
				Callback()
				
				return
			else
				UseChatScrollModuleResult.captureStickToBottomForSend()
				UseRefResult6.current += 1
				local Current = UseRefResult6.current
				UseStateResult2_3(nil)
				local AgentRollbackPromptModule = BuildAgentRollbackPromptModule(p3.versionNumber, p3.noteTitle, p3.noteDescription)
				UseResult18(UseMemoResult, AgentRollbackPromptModule, AgentRollbackPromptModule, nil, nil, Current, UseRefResult26.current, nil, function()
					-- upvalues: UseChatScrollModuleResult (upval), Callback1 (copy)
					UseChatScrollModuleResult.scrollToBottomUnconditionally()
					Callback1()
				end, Callback)
			end
		end, {
			UseMemoResult,
			UseChatScrollModuleResult,
			UseStateResult2_3,
			UseResult18
		})
	})
	ReactModule.useLayoutEffect(function()
		-- upvalues: UseStateResult6 (copy), UseRefResult5 (copy), UseMemoResult (copy), SessionId (ref), UseRefResult6 (copy), UseRefResult7 (copy), UseAgentRollbackRequestModuleResult (copy), UseResult4 (copy), UseResult2 (copy), UseStateResult2_2 (copy), UseStateResult2_3 (copy)
		if UseStateResult6 ~= nil then
			local Current = UseRefResult5.current
			local SessionId1 = SessionId
			
			if Current == nil or Current.session ~= UseMemoResult or SessionId1 ~= nil and SessionId1 ~= "" and (Current.sessionId ~= SessionId1 and (Current.sessionId ~= nil or Current.session.getCasSessionId() ~= SessionId1)) then
				local Current1 = UseRefResult5.current
				UseRefResult6.current += 1
				UseRefResult7.current = nil
				
				if UseAgentRollbackRequestModuleResult.stopRequestBeforeReceipt(UseStateResult6) then
					if Current1 ~= nil and Current1.session.placeId ~= nil then
						UseResult4(Current1.session.placeId, "Idle")
					end
				else
					UseStateResult6.detach()
				end
				UseResult2(nil, nil)
				UseStateResult2_2(nil)
				UseStateResult2_3(nil)
				
				return
			end
		end
	end, {
		UseMemoResult, SessionId, UseStateResult6, UseResult2,
		UseAgentRollbackRequestModuleResult, UseResult4
	})
	local UseResult19 = ReactModule.useCallback(function(Text, p3, Images, ResourceAttachments, Current, AfterSequenceId)
		-- upvalues: UseStateResult2_2 (copy), UniverseCreateModule (upval), GetDefaultTemplatePlaceIdModule (upval), Debug (upval), FFlagBuildExperiencePromptFailureTelemetry (upval), UseRefResult6 (copy), UniverseConfigurationModule (upval), UseStateResult2 (copy), p1 (copy), CreatorAgentChatStore (copy), SessionId (ref), IsEnabled (upval), v3 (ref), v2 (ref), UseResult18 (copy), LocalizationStringsModule (upval), ChatConstantsModule (upval), RequestFailureKind (upval), SendBuildExperienceEventModule (upval), UseResult2 (copy), UseResult14 (copy), FFlagBuildExperienceChatImageAttachmentsModule (upval), UseRefResult24 (copy), FFlagBuildExperienceChatResourceAttachments (upval), UseRefResult1 (copy), UseStateResult2_5 (copy), FormatResult (copy)
		UseStateResult2_2({
			text = Text,
			images = Images,
			resourceAttachments = ResourceAttachments,
			afterSequenceId = AfterSequenceId
		})
		local ClockTime = os.clock()
		local Config = nil
		UniverseCreateModule.getUniverseCreateStore().createUniverse({
			isPublish = true,
			templatePlaceId = GetDefaultTemplatePlaceIdModule()
		}):andThen(function(Result)
			-- upvalues: Debug (upval), ClockTime (copy), FFlagBuildExperiencePromptFailureTelemetry (upval), Config (ref), UseRefResult6 (upval), Current (copy), UniverseConfigurationModule (upval), UseStateResult2 (upval), p1 (upval), CreatorAgentChatStore (upval), SessionId (upval), IsEnabled (upval), v3 (upval), v2 (upval), UseResult18 (upval), Text (copy), p3 (copy), Images (copy), ResourceAttachments (copy), AfterSequenceId (copy)
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
			if UseRefResult6.current == Current then
				local UniverseConfigurationStore = UniverseConfigurationModule.getUniverseConfigurationStore()
				
				return UniverseConfigurationStore.patchConfiguration(Result.universeId, { audiences = { 1 } }):andThen(function()
					-- upvalues: UniverseConfigurationStore (copy), Result (copy)
					return UniverseConfigurationStore.setTeamCreate(Result.universeId, true)
				end):andThen(function()
					-- upvalues: UseRefResult6 (upval), Current (upval), Result (copy), UseStateResult2 (upval), p1 (upval), CreatorAgentChatStore (upval), SessionId (upval), IsEnabled (upval), v3 (upval), v2 (upval), UseResult18 (upval), Text (upval), p3 (upval), Images (upval), ResourceAttachments (upval), AfterSequenceId (upval)
					if UseRefResult6.current ~= Current then
						return nil
					end
					local config = {
						universeId = Result.universeId,
						placeId = Result.rootPlaceId
					}
					UseStateResult2(config)
					
					if p1.onProjectResolved ~= nil then
						p1.onProjectResolved(config)
					end
					local SessionForProject = CreatorAgentChatStore.getSessionForProject(Result.universeId, Result.rootPlaceId, SessionId)
					
					if IsEnabled and v3 ~= nil and v3.current then
						SessionForProject.setPendingExperimentKey(v2)
					end
					UseResult18(SessionForProject, Text, p3, Images, ResourceAttachments, Current, AfterSequenceId, Text)
					
					return nil
				end)
			else
				return nil
			end
		end):catch(function(Err)
			-- upvalues: Debug (upval), ClockTime (copy), UseRefResult6 (upval), Current (copy), FFlagBuildExperiencePromptFailureTelemetry (upval), Config (ref), LocalizationStringsModule (upval), ChatConstantsModule (upval), RequestFailureKind (upval), SendBuildExperienceEventModule (upval), UseResult2 (upval), UseStateResult2_2 (upval), UseResult14 (upval), Text (copy), FFlagBuildExperienceChatImageAttachmentsModule (upval), Images (copy), UseRefResult24 (upval), FFlagBuildExperienceChatResourceAttachments (upval), ResourceAttachments (copy), UseRefResult1 (upval), UseStateResult2_5 (upval), FormatResult (upval)
			Debug.log("warn", "build_experience create_or_configure_universe failed", {
				durationMs = math.floor((os.clock() - ClockTime) * 1000 + 0.5),
				error = Err
			})
			
			if UseRefResult6.current ~= Current then return end
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
			UseResult2(nil)
			UseStateResult2_2(nil)
			UseResult14(Text)
			
			if FFlagBuildExperienceChatImageAttachmentsModule and Images ~= nil then
				UseRefResult24.current(Images)
			end
			if FFlagBuildExperienceChatResourceAttachments and ResourceAttachments ~= nil then
				UseRefResult1.current(ResourceAttachments)
			end
			UseStateResult2_5(FormatResult)
		end)
	end, {
		SessionId, CreatorAgentChatStore, p1.onProjectResolved, UseResult2,
		UseResult14, UseStateResult2_5, UseStateResult2, UseStateResult2_2,
		UseResult18, FormatResult, v2, v3
	})
	local UseResult20 = ReactModule.useCallback(function(p3): boolean
		-- upvalues: NoSendMessageWhen (copy), UseRefResult9 (copy), FFlagBuildExperienceChatImageAttachmentsModule (upval), UseRefResult17 (ref), FFlagBuildExperienceChatResourceAttachments (upval), UseRefResult20 (ref), UseResult14 (copy), UseRefResult5 (copy), UseMemoResult (copy), SessionId (ref), UseRefResult4 (copy), HasUseStateResult (copy), IsIsLibraryChat (copy), UseRefResult22 (copy), UseChatScrollModuleResult (copy), p1 (copy), UniverseId (ref), PlaceId (ref), AgentRollbackRequestStoreModule (copy), UseRefResult6 (copy), UseStateResult2_3 (copy), FFlagBuildExperiencePersistChatDraftModule (upval), UseResult12 (copy), UseResult8 (copy), UseRefResult24 (copy), UseRefResult1 (copy), UseResult19 (copy), UseMemoResult2 (copy), UseResult18 (copy), FFlagBuildExperienceLibrary (upval)
		if not NoSendMessageWhen then
			return false
		end
		local Replaced = string.gsub(UseRefResult9.current, "^%s*(.-)%s*$", "%1")
		local Current = if FFlagBuildExperienceChatImageAttachmentsModule then UseRefResult17.current else {}
		local Current1 = if FFlagBuildExperienceChatResourceAttachments then UseRefResult20.current else {}
		
		if Replaced == "" and #Current == 0 then
			UseResult14("")
			
			return false
		end
		if FFlagBuildExperienceChatImageAttachmentsModule then
			for _, value in Current do
				if value.uri == nil or value.uploadStatus == "uploading" or value.uploadStatus == "failed" then
					return false
				end
			end
		end
		local Current2 = UseRefResult5.current
		local SessionId1 = SessionId
		local NoSessionId: boolean = Current2 ~= nil and Current2.session == UseMemoResult and (SessionId1 == nil or SessionId1 == "" or (Current2.sessionId == SessionId1 or Current2.sessionId == nil and Current2.session.getCasSessionId() == SessionId1))
		local Current3 = if NoSessionId then UseRefResult4.current else nil
		
		if HasUseStateResult or IsIsLibraryChat and Current3 ~= nil then
			if FFlagBuildExperienceChatImageAttachmentsModule and #Current > 0 or FFlagBuildExperienceChatResourceAttachments and #Current1 > 0 then
				return false
			end
			if Current3 == nil or not Current3.trySubmitComposerText(Replaced) then
				return false
			end
			UseResult14("")
			
			if UseRefResult22.current then
				UseRefResult22.current.releaseFocus()
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
			UseChatScrollModuleResult.captureStickToBottomForSend()
			UseRefResult6.current += 1
			local Current4 = UseRefResult6.current
			UseStateResult2_3(nil)
			
			if FFlagBuildExperiencePersistChatDraftModule then
				UseResult12(Replaced)
			end
			UseResult8("")
			
			if FFlagBuildExperienceChatImageAttachmentsModule then
				UseRefResult24.current({})
			end
			if FFlagBuildExperienceChatResourceAttachments then
				UseRefResult1.current({})
			end
			if UseRefResult22.current then
				UseRefResult22.current.releaseFocus()
			end
			local function _(p4, p5)
				-- upvalues: NoUniverseId (copy), UseResult19 (upval), Replaced (copy), Current1 (copy), Current4 (copy), UseMemoResult2 (upval), UseResult18 (upval), UseMemoResult (upval), FFlagBuildExperienceLibrary (upval), p3 (copy)
				if NoUniverseId then
					UseResult19(Replaced, p4, p5, Current1, Current4, UseMemoResult2.latestSequenceId)
					
					return
				else
					UseResult18(UseMemoResult, Replaced, p4, p5, Current1, Current4, UseMemoResult2.latestSequenceId, Replaced, nil, nil, if FFlagBuildExperienceLibrary then p3 else nil)
				end
			end
			
			if #Current == 0 and #Current1 == 0 then
				if NoUniverseId then
					UseResult19(Replaced, Replaced, nil, Current1, Current4, UseMemoResult2.latestSequenceId)
				else
					UseResult18(UseMemoResult, Replaced, Replaced, nil, Current1, Current4, UseMemoResult2.latestSequenceId, Replaced, nil, nil, if FFlagBuildExperienceLibrary then p3 else nil)
				end
				return true
			else
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
				if NoUniverseId then
					UseResult19(Replaced, List, List1, Current1, Current4, UseMemoResult2.latestSequenceId)
				else
					UseResult18(UseMemoResult, Replaced, List, List1, Current1, Current4, UseMemoResult2.latestSequenceId, Replaced, nil, nil, if FFlagBuildExperienceLibrary then p3 else nil)
				end
				return true
			end
		end
	end, {
		NoSendMessageWhen, UseMemoResult, SessionId, UniverseId, PlaceId,
		HasUseStateResult, IsIsLibraryChat, UseChatScrollModuleResult, UseResult14,
		UseResult8, UseResult12, UseResult19, UseResult18,
		p1.createUniverseOnFirstPrompt, UseStateResult2_3, UseMemoResult2,
		AgentRollbackRequestStoreModule
	})
	local UseResult21 = ReactModule.useCallback(function()
		-- upvalues: UseRefResult5 (copy), UseMemoResult (copy), SessionId (ref), UseRefResult4 (copy), UseAgentRollbackRequestModuleResult (copy), UseRefResult6 (copy), FFlagBuildExperiencePromptFailureTelemetry (upval), UseResult2 (copy), UseRefResult7 (copy), FFlagBuildExperienceRestoreStoppedPromptModule (upval), UseRefResult16 (ref), UseStateResult3 (copy), UseRefResult9 (copy), UseMemoResult2 (copy), UseResult14 (copy), FFlagBuildExperienceChatImageAttachmentsModule (upval), UseRefResult17 (ref), UseRefResult24 (copy), FFlagBuildExperienceChatResourceAttachments (upval), UseRefResult20 (ref), UseRefResult1 (copy), UseStateResult2_2 (copy), UseStateResult2_3 (copy), PlaceId (ref), UseResult4 (copy)
		local Current = UseRefResult5.current
		local SessionId1 = SessionId
		local NoSessionId: boolean = Current ~= nil and Current.session == UseMemoResult and (SessionId1 == nil or SessionId1 == "" or (Current.sessionId == SessionId1 or Current.sessionId == nil and Current.session.getCasSessionId() == SessionId1))
		local Current1 = if NoSessionId then UseRefResult4.current else nil
		
		if Current1 == nil then
			UseAgentRollbackRequestModuleResult.cancelRequestBeforeTurnStarts()
			
			return
		end
		local Current11 = UseRefResult6.current
		UseRefResult6.current += 1
		
		if FFlagBuildExperiencePromptFailureTelemetry and Current1.reportUserStop ~= nil then
			Current1.reportUserStop()
		end
		if not UseAgentRollbackRequestModuleResult.stopRequestBeforeReceipt(Current1) then
			Current1.stop()
		end
		UseResult2(nil)
		UseRefResult7.current = nil
		
		if FFlagBuildExperienceRestoreStoppedPromptModule and UseRefResult16 ~= nil and UseRefResult16.current ~= Current11 and UseStateResult3 ~= nil and UseRefResult9.current == "" and UseMemoResult2.isAwaitingUserMessageEcho then
			UseResult14(UseStateResult3.text)
			
			if FFlagBuildExperienceChatImageAttachmentsModule and UseStateResult3.images ~= nil and #UseRefResult17.current == 0 then
				UseRefResult24.current(UseStateResult3.images)
			end
			if FFlagBuildExperienceChatResourceAttachments and UseStateResult3.resourceAttachments ~= nil and #UseRefResult20.current == 0 then
				UseRefResult1.current(UseStateResult3.resourceAttachments)
			end
		end
		UseStateResult2_2(nil)
		UseStateResult2_3({
			session = UseMemoResult,
			sessionId = UseMemoResult.getCasSessionId(),
			startSequenceId = UseMemoResult2.activeTurnStartSequenceId
		})
		
		if PlaceId ~= nil then
			UseResult4(PlaceId, "Idle")
		end
	end, {
		UseMemoResult, SessionId, PlaceId, UseResult4, UseResult2, UseStateResult2_2,
		UseStateResult2_3, UseMemoResult2, UseAgentRollbackRequestModuleResult,
		if FFlagBuildExperienceRestoreStoppedPromptModule then UseStateResult3 else nil,
		if FFlagBuildExperienceRestoreStoppedPromptModule then UseResult14 else nil
	})
	local NoAutoFocusComposer = p1.autoFocusComposer == nil or p1.autoFocusComposer
	local NoAutoFocusComposer1 = if p1.focusComposerWhen == nil then NoAutoFocusComposer else p1.focusComposerWhen
	ReactModule.useEffect(function()
		-- upvalues: NoAutoFocusComposer (copy), NoAutoFocusComposer1 (copy), UseRefResult22 (copy)
		if NoAutoFocusComposer and NoAutoFocusComposer1 then
			local Flag = false
			
			local function v350()
				-- upvalues: Flag (ref)
				return Flag
			end
			
			local v7 = 8
			
			local function tryFocus()
				-- upvalues: v350 (copy), UseRefResult22 (copy), v7 (ref), tryFocus (copy)
				if v350() then return end
				local Current = UseRefResult22.current
				
				if Current then
					Current.focus()
					
					return
				end
				v7 -= 1
				
				if v7 > 0 then
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
	local UseResult22 = ReactModule.useCallback(function(p4)
		-- upvalues: PlaceId (ref), v1 (ref), FFlagBuildExperiencePersistPlaytestLogsModule (upval), FFlagBuildExperienceClientDataModelTools (upval), LaunchPlaytestWithLoadingStateModule (upval)
		if PlaceId == nil then return end
		local v7 = v1
		local v8: (() -> ())? = nil
		
		if (FFlagBuildExperiencePersistPlaytestLogsModule or FFlagBuildExperienceClientDataModelTools) and (game.GameId == 0 and v7 ~= nil) then
			v8 = function()
				-- upvalues: v7 (copy)
				v7.current = true
			end
		end
		if LaunchPlaytestWithLoadingStateModule(PlaceId, p4, true, v8) and v8 ~= nil and v7 ~= nil then
			v7.current = false
		end
	end, { PlaceId, v1 })
	local UseMemoResult3 = nil
	UseMemoResult3 = if FFlagBuildExperienceAnswerFormModule then ReactModule.useMemo(function()
		-- upvalues: UseSignalStateResult11 (copy), UseStateResult2_5 (copy)
		local OnAnswerSelectedByToolCallId = {}
		
		for i, value in UseSignalStateResult11.onAnswerSelectedByToolCallId do
			OnAnswerSelectedByToolCallId[i] = function(p4, p5, p6)
				-- upvalues: UseStateResult2_5 (upval), value (copy)
				UseStateResult2_5(nil)
				value(p4, p5, p6)
			end
		end
		local OnAnswerConfirmedByToolCallId = {}
		
		for i1, value1 in UseSignalStateResult11.onAnswerConfirmedByToolCallId do
			OnAnswerConfirmedByToolCallId[i1] = function()
				-- upvalues: UseStateResult2_5 (upval), value1 (copy)
				UseStateResult2_5(nil)
				value1()
			end
		end
		return {
			onAnswerSelectedByToolCallId = OnAnswerSelectedByToolCallId,
			onAnswerConfirmedByToolCallId = OnAnswerConfirmedByToolCallId,
			onPlanAcceptedByToolCallId = UseSignalStateResult11.onPlanAcceptedByToolCallId,
			onDevProductApprovedByToolCallId = UseSignalStateResult11.onDevProductApprovedByToolCallId,
			onDevProductRejectedByToolCallId = UseSignalStateResult11.onDevProductRejectedByToolCallId
		}
	end, { UseSignalStateResult11, UseStateResult2_5 }) else UseSignalStateResult11
	
	return {
		agentSpecVersion = SpecVersion,
		setAgentSpecVersion = UseResult1,
		messages = Messages,
		localToolActions = UseMemoResult3,
		answerForm = if FFlagBuildExperienceAnswerFormModule then ReactModule.useMemo(function()
			-- upvalues: GetActiveAnswerFormModule (upval), ActiveTurnState (copy), UseSignalStateResult1 (copy), UseMemoResult3 (ref)
			return GetActiveAnswerFormModule(ActiveTurnState, UseSignalStateResult1, UseMemoResult3)
		end, { ActiveTurnState, UseSignalStateResult1, UseMemoResult3 }) else nil,
		submitAnswerText = if FFlagBuildExperienceAnswerFormModule then ReactModule.useCallback(function(p4, p5, p6)
			-- upvalues: UseRefResult4 (copy), UseRefResult5 (copy), UseMemoResult (copy), SessionId (ref), UseStateResult2_5 (copy)
			local Current = UseRefResult4.current
			
			if Current ~= nil then
				local Current1 = UseRefResult5.current
				local SessionId1 = SessionId
				
				if Current1 ~= nil and Current1.session == UseMemoResult and (SessionId1 == nil or SessionId1 == "" or (Current1.sessionId == SessionId1 or Current1.sessionId == nil and Current1.session.getCasSessionId() == SessionId1)) then
					UseStateResult2_5(nil)
					
					return Current.trySubmitAnswerText(p4, p5, p6)
				end
			end
			return false
		end, { UseMemoResult, SessionId, UseStateResult2_5 }) else nil,
		composerText = UseBindingResult,
		composerErrorText = UseStateResult8,
		setComposerText = UseResult14,
		setPrefilledComposerText = UseResult15,
		composerImages = if FFlagBuildExperienceChatImageAttachmentsModule then Frozen1 else {},
		setComposerImages = setComposerImages,
		retryComposerImage = retryComposerImage,
		composerResourceAttachments = if FFlagBuildExperienceChatResourceAttachments then t else {},
		findComposerResourceAttachmentIndexByUri = findComposerResourceAttachmentIndexByUri,
		addComposerResourceAttachment = addComposerResourceAttachment,
		removeComposerResourceAttachmentAtIndex = removeComposerResourceAttachmentAtIndex,
		clearComposerResourceAttachments = clearComposerResourceAttachments,
		isComposerSendBlocked = FFlagBuildExperienceChatImageAttachmentsModule and Flag,
		isAssistantResponding = HasUseStateResult,
		canStopAssistantResponse = UseStateResult7 ~= nil or UseSignalStateResult4,
		canSendWhileResponding = HasPendingLocalToolResponse,
		sendMessage = UseResult20,
		stopAssistantResponse = UseResult21,
		setScrollingFrame = UseChatScrollModuleResult.setScrollingFrame,
		anchorScrollToInstance = if FFlagBuildExperienceChatAccordionScrollAnchorModule then UseChatScrollModuleResult.anchorToInstance else nil,
		textBoxRef = UseRefResult22,
		clockBinding = UseClockResult,
		playtestPlaceId = PlaceId,
		launchPlaytest = if PlaceId == nil then nil else UseResult22,
		hasPublishedTurn = IncludesPublishTool,
		subagentTaskState = SubagentTaskState,
		isHistoryLoading = NoNoIsLoading,
		isHistoryExhausted = NoHasNextHistoryPageToken
	}
end