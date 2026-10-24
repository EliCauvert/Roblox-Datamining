local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local FFlagBuildExperienceChatImageAttachmentsModule = require(BuildExperience.Flags.FFlagBuildExperienceChatImageAttachments)
local FFlagBuildExperienceChatResourceAttachments = require(Parent.SharedFlags).FFlagBuildExperienceChatResourceAttachments
local FFlagBuildExperienceModelPickerModule = require(BuildExperience.Flags.FFlagBuildExperienceModelPicker)
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
local GetBuildPromptDraftStoreModule = require(BuildExperience.Stores.GetBuildPromptDraftStore)
local FFlagBuildExperienceClientDataModelTools = SharedFlagsModule.FFlagBuildExperienceClientDataModelTools
local FFlagBuildExperienceChatAccordionScrollAnchorModule = require(BuildExperience.Flags.FFlagBuildExperienceChatAccordionScrollAnchor)
local FFlagBuildExperienceChatHistoryPrefetchModule = require(BuildExperience.Flags.FFlagBuildExperienceChatHistoryPrefetch)
local FFlagBuildExperienceFixChatBottomLockModule = require(BuildExperience.Flags.FFlagBuildExperienceFixChatBottomLock)
local FFlagBuildExperienceManageDevProductModule = require(BuildExperience.Flags.FFlagBuildExperienceManageDevProduct)
local FFlagBuildExperienceToolResultFailureRecoveryModule = require(BuildExperience.Flags.FFlagBuildExperienceToolResultFailureRecovery)
local FFlagBuildExperiencePersistPlaytestLogsModule = require(BuildExperience.Flags.FFlagBuildExperiencePersistPlaytestLogs)
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
	local v1: boolean = Enabled == true and p2 == nil and p3 ~= nil
	
	return if p1 == nil and not v1 then nil else { setupErrorText = SetupErrorText }
end

return function(p1)
	-- upvalues: FFlagBuildExperienceModelPickerModule (copy), ReactModule (copy), GetBuildCreatorCreditRefreshStoreModule (copy), LocalizationRoactContext (copy), LocalizationStringsModule (copy), FFlagBuildExperienceChatImageAttachmentsModule (copy), SignalsReactModule (copy), LocalUserIdStore (copy), FFlagBuildExperiencePersistPlaytestLogsModule (copy), FFlagBuildExperienceClientDataModelTools (copy), FFlagBuildExperienceLibrary (copy), FFlagBuildAdUpsellModule (copy), FFlagBuildExperienceChatHistoryLoadingSkeletonModule (copy), CreatorAgentChatModule (copy), GetAgentRollbackRequestStoreModule (copy), UseBuildModelSessionModule (copy), Signal4 (copy), SignalsModule (copy), noopSetAgentSpecVersion (copy), IsEnabled (copy), UseBuildInternalTestingModule (copy), Signal1 (copy), Signal2 (copy), Signal3 (copy), ParseSessionStreamModule (copy), SessionPromptMessageFilterModule (copy), FFlagBuildExperienceChatResourceAttachments (copy), Signal (copy), hasPendingLocalToolResponse (copy), noteLiveAdUpsellTurns (copy), FFlagBuildExperiencePrefillSkipsDraftPersistModule (copy), FFlagBuildExperiencePersistChatDraftModule (copy), FFlagBuildExperienceNewGameChatDraftModule (copy), FFlagBuildExperienceRestoreStoppedPromptModule (copy), Frozen (copy), ReactUtilsModule (copy), UseChatScrollModule (copy), GetPlaytestLoadingStoreModule (copy), FFlagBuildExperienceChatHistoryPrefetchModule (copy), FFlagBuildExperiencePinForBuild (copy), MessageBusService (copy), GameMessageId (copy), FFlagBuildExperienceRefreshChatDraftOnGameLeaveModule (copy), BuildAppStorageModule (copy), AppLifecycleObserverService (copy), FFlagBuildExperienceFixChatBottomLockModule (copy), GetNewGameChatDraftKeyModule (copy), GetBuildPromptDraftStoreModule (copy), ChatTypesModule (copy), UploadCaptureAsyncModule (copy), FFlagBuildExperienceToolResultFailureRecoveryModule (copy), FFlagBuildExperienceAnswerFormModule (copy), CreatorAgentChatModule1 (copy), BeginBuildModelSendModule (copy), CreatorCreditModule (copy), BuildAgentRollbackPromptModule (copy), UseAgentRollbackRequestModule (copy), GetBuildModelSelectionStoreModule (copy), UniverseCreateModule (copy), GetDefaultTemplatePlaceIdModule (copy), Debug (copy), FFlagBuildExperiencePromptFailureTelemetry (copy), UniverseConfigurationModule (copy), ChatConstantsModule (copy), RequestFailureKind (copy), SendBuildExperienceEventModule (copy), LaunchPlaytestWithLoadingStateModule (copy), GetActiveAnswerFormModule (copy), FFlagBuildExperienceChatAccordionScrollAnchorModule (copy)
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
	local FFlagBuildExperienceChatHistoryLoadingSkeletonModule1 = FFlagBuildExperienceChatHistoryLoadingSkeletonModule or Current
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
	local v2 = nil
	local v3 = false
	local v4 = nil
	
	if FFlagBuildExperienceModelPickerModule then
		local UseRefResult2 = ReactModule.useRef(true)
		v2 = UseRefResult2
		ReactModule.useLayoutEffect(function()
			-- upvalues: UseRefResult2 (copy)
			UseRefResult2.current = true
			
			return function()
				-- upvalues: UseRefResult2 (upval)
				UseRefResult2.current = false
			end
		end, { UseRefResult2 })
		UseMemoResult1 = ReactModule.useMemo(function()
			return { pending = false, mounted = true }
		end, {
			UseSignalStateResult,
			p1.modelSelectionDraftId,
			p1.universeId,
			p1.placeId,
			p1.sessionId
		})
		v3, v123 = ReactModule.useState(false)
		local UseMemoResult2 = UseMemoResult1
		local Callback = v4
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
	local v5 = nil
	local v6 = nil
	local InternalTesting = nil
	
	if FFlagBuildExperienceModelPickerModule and IsEnabled then
		InternalTesting, v137 = UseBuildInternalTestingModule(if UseBuildModelSessionModuleResult == nil then nil else UseBuildModelSessionModuleResult.entry, UseMemoResult, p1.sessionId)
		PreviewHash = if InternalTesting == nil then nil else InternalTesting.previewHash
		
		UseResult1 = function(p2)
			-- upvalues: InternalTesting (ref)
			if InternalTesting ~= nil then
				InternalTesting.onSelect()
				InternalTesting.onSaveSpec(p2)
			end
		end
	elseif IsEnabled then
		local UseRefResult4 = ReactModule.useRef(nil)
		
		if UseRefResult4.current == nil then
			UseRefResult4.current = CreatorAgentChatModule.experimentOverride.createPendingKey()
		end
		local Current1 = UseRefResult4.current
		v5 = Current1
		local UseRefResult5 = ReactModule.useRef(false)
		v6 = UseRefResult5
		local Key = CreatorAgentChatModule.experimentOverride.getKey(CasSessionId) or Current1
		PreviewHash = SignalsReactModule.useSignalState((ReactModule.useMemo(function()
			-- upvalues: CreatorAgentChatModule (upval), Key (copy)
			return CreatorAgentChatModule.experimentOverride.getStateSignal(Key)
		end, { Key }))).specVersion
		UseResult1 = ReactModule.useCallback(function(p2)
			-- upvalues: UseMemoResult (copy), CreatorAgentChatModule (upval), Current1 (copy), UseRefResult5 (copy)
			local Key = CreatorAgentChatModule.experimentOverride.getKey(if UseMemoResult == nil then nil else UseMemoResult.getCasSessionId())
			
			if Key == nil then
				Key = Current1
				UseRefResult5.current = true
				
				if UseMemoResult ~= nil then
					UseMemoResult.setPendingExperimentKey(Current1)
				end
			end
			CreatorAgentChatModule.experimentOverride.set(Key, p2)
		end, { UseMemoResult, Current1 })
		ReactModule.useEffect(function()
			-- upvalues: UseMemoResult (copy), UseRefResult5 (copy), Current1 (copy)
			if UseMemoResult ~= nil and UseRefResult5.current then
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
	local Inverted: boolean = FFlagBuildExperienceChatHistoryLoadingSkeletonModule1 and (NoHydrateHistoryWhen and (UseMemoResult ~= nil and (IsNotSessionIdMatch and not (UseMemoResult.hasLoadedHistory() and #Events > 0))))
	local v7 = nil
	local Callback2 = nil
	
	if FFlagBuildExperienceChatHistoryLoadingSkeletonModule1 then
		v7, Callback2 = ReactModule.useState(function()
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
	local IsHydrateHistoryWhenMatch: boolean = v7 ~= nil and (v7.session == UseMemoResult and (v7.sessionId == SessionId and v7.universeId == UniverseId) and v7.hydrateHistoryWhen == NoHydrateHistoryWhen)
	local NoIsLoading: boolean = if IsHydrateHistoryWhenMatch then not v7.isLoading else not Inverted
	local NoNoIsLoading: boolean = FFlagBuildExperienceChatHistoryLoadingSkeletonModule and (not NoIsLoading or UseMemoResult ~= nil and UseMemoResult.getNextHistoryPageToken() ~= nil)
	local UseStateResult6, UseStateResult2_2 = ReactModule.useState(nil)
	local UseStateResult7, UseStateResult2_3 = ReactModule.useState(nil)
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult2_3 (copy)
		UseStateResult2_3(nil)
	end, { UseMemoResult, SessionId })
	local SessionId2 = SessionId
	local NoSessionId: boolean = UseStateResult7 ~= nil and UseStateResult7.session == UseMemoResult and (SessionId2 == nil or SessionId2 == "" or (UseStateResult7.sessionId == SessionId2 or UseStateResult7.sessionId == nil and UseStateResult7.session.getCasSessionId() == SessionId2))
	local UseStateResult8 = if NoSessionId then UseStateResult7 else nil
	local UseStateResult9, UseStateResult2_4 = ReactModule.useState(nil)
	local UseRefResult10 = ReactModule.useRef(nil)
	local UseRefResult11 = ReactModule.useRef(nil)
	local UseRefResult12 = ReactModule.useRef(0)
	local UseRefResult6 = nil
	local UseStateResult5 = false
	local Callback5 = nil
	
	if FFlagBuildExperienceModelPickerModule then
		UseRefResult6 = ReactModule.useRef(nil)
		UseStateResult5, Callback5 = ReactModule.useState(false)
		local UseRefResult7 = UseRefResult6
		local Callback1 = Callback5
		ReactModule.useLayoutEffect(function()
			-- upvalues: IsEnabled (upval), UseRefResult7 (copy), UseRefResult11 (copy), p1 (copy), Callback1 (copy), UseStateResult2_2 (copy)
			if IsEnabled and UseRefResult7.current ~= nil and not UseRefResult7.current.started and UseRefResult11.current ~= nil and p1.sessionId ~= nil and p1.sessionId ~= "" and UseRefResult11.current.sessionId ~= p1.sessionId then
				UseRefResult7.current.attempt.release()
				UseRefResult7.current = nil
			end
			if UseRefResult7.current == nil then
				Callback1(false)
				UseStateResult2_2(nil)
			end
			return function()
				-- upvalues: UseRefResult7 (upval)
				local Current = UseRefResult7.current
				
				if Current ~= nil and (not Current.started or not Current.attempt.isCurrent()) then
					Current.attempt.release()
					UseRefResult7.current = nil
					
					if Current.onTerminal ~= nil then
						Current.onTerminal()
					end
				end
			end
		end, {
			if UseBuildModelSessionModuleResult == nil then nil else UseBuildModelSessionModuleResult.entry,
			p1.sessionId,
			Callback1,
			UseStateResult2_2
		})
	end
	local UseRefResult8 = ReactModule.useRef(nil)
	local UseResult2 = ReactModule.useCallback(function(Current, Session)
		-- upvalues: UseRefResult10 (copy), UseRefResult11 (copy), UseStateResult2_4 (copy)
		assert(Current == nil or Session ~= nil, "Active turns require an owning session")
		UseRefResult10.current = Current
		UseRefResult11.current = if Current == nil then nil else { session = Session, sessionId = Session.getCasSessionId() }
		UseStateResult2_4(Current)
	end, { UseStateResult2_4 })
	local Current2 = UseRefResult11.current
	local SessionId1 = SessionId
	local NoSessionId1: boolean = Current2 ~= nil and Current2.session == UseMemoResult and (SessionId1 == nil or SessionId1 == "" or (Current2.sessionId == SessionId1 or Current2.sessionId == nil and Current2.session.getCasSessionId() == SessionId1))
	local v8 = if NoSessionId1 then UseStateResult9 else nil
	local UseSignalStateResult2 = SignalsReactModule.useSignalState(if v8 == nil then Signal1 else v8.getOptimisticLocalTools)
	local UseSignalStateResult3 = SignalsReactModule.useSignalState(if v8 == nil then Signal2 else v8.getLocalToolActions)
	local UseSignalStateResult4 = SignalsReactModule.useSignalState(if v8 == nil then Signal3 else v8.getSetupErrorText)
	local UseSignalStateResult5 = nil
	UseSignalStateResult5 = if UseSignalStateResult4 == nil then UseSignalStateResult4 else UseContextResult:Format(UseSignalStateResult4)
	local UseMemoResult3 = ReactModule.useMemo(function()
		-- upvalues: v8 (copy), p1 (copy), UseMemoResult (copy), UseStateResult6 (copy), UseSignalStateResult5 (ref)
		local SetupErrorText = UseSignalStateResult5
		local HasUseStateResult: boolean = p1.createUniverseOnFirstPrompt == true and UseMemoResult == nil and UseStateResult6 ~= nil
		
		return if v8 == nil and not HasUseStateResult then nil else { setupErrorText = SetupErrorText }
	end, {
		v8,
		p1.createUniverseOnFirstPrompt,
		UseStateResult6,
		UseMemoResult,
		UseSignalStateResult5
	})
	local UseMemoResult4 = ReactModule.useMemo(function()
		-- upvalues: ParseSessionStreamModule (upval), Events (copy), UseMemoResult (copy), SessionId (ref), UniverseId (ref), PlaceId (ref), UseSignalStateResult2 (copy), UseStateResult6 (copy), SessionPromptMessageFilterModule (upval), FFlagBuildExperienceChatImageAttachmentsModule (upval), FFlagBuildExperienceChatResourceAttachments (upval), UseMemoResult3 (copy), UseStateResult8 (copy)
		return ParseSessionStreamModule(Events, {
			sessionId = if UseMemoResult == nil then SessionId else UseMemoResult.getCasSessionId() or SessionId,
			universeId = if UseMemoResult == nil then UniverseId else UseMemoResult.universeId,
			placeId = if UseMemoResult == nil then PlaceId else UseMemoResult.placeId,
			optimisticLocalTools = UseSignalStateResult2,
			pendingUserMessage = if UseStateResult6 == nil or not SessionPromptMessageFilterModule.shouldOptimisticallyDisplay(UseStateResult6.text) then nil else UseStateResult6.text,
			pendingUserImages = if FFlagBuildExperienceChatImageAttachmentsModule and UseStateResult6 ~= nil and SessionPromptMessageFilterModule.shouldOptimisticallyDisplay(UseStateResult6.text) then UseStateResult6.images else nil,
			pendingUserResourceAttachments = if FFlagBuildExperienceChatResourceAttachments and UseStateResult6 ~= nil and SessionPromptMessageFilterModule.shouldOptimisticallyDisplay(UseStateResult6.text) then UseStateResult6.resourceAttachments else nil,
			pendingUserMessageAfterSequenceId = if UseStateResult6 == nil then nil else UseStateResult6.afterSequenceId,
			liveAssistantMessage = UseMemoResult3,
			optimisticCancelledStartSequenceId = if UseStateResult8 == nil then nil else UseStateResult8.startSequenceId
		})
	end, {
		Events, UseMemoResult, SessionId, UniverseId, PlaceId, UseSignalStateResult2,
		UseStateResult6, UseMemoResult3, UseStateResult8
	})
	local UseRefResult9 = if Current then ReactModule.useRef({
		isInitialized = false,
		lastProcessedSequenceId = nil,
		universeId = UniverseId,
		sessionId = if UseMemoResult == nil then SessionId else UseMemoResult.getCasSessionId() or SessionId,
		historyWatermarkSequenceId = UseMemoResult4.latestSequenceId,
		liveTurnIds = {},
		liveTurnStartSequenceIds = {}
	}) else nil
	local UseResult3 = if UseRefResult9 == nil then nil else ReactModule.useCallback(function(p2)
		-- upvalues: UseRefResult9 (ref)
		if p2 ~= nil then
			UseRefResult9.current.liveTurnIds[p2] = true
		end
	end, { UseRefResult9 })
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
	local IsAssistantResponding = v8 ~= nil or (if Message == nil or Message.kind ~= "assistant_turn" then UseSignalStateResult6 else not Message.isDone or UseSignalStateResult6)
	local HasPendingLocalToolResponse = IsAssistantResponding and (not UseSignalStateResult6 and hasPendingLocalToolResponse(UseSignalStateResult2))
	local ActiveTurnState = UseMemoResult4.activeTurnState
	ReactModule.useEffect(function()
		-- upvalues: v8 (copy), ActiveTurnState (copy)
		if v8 ~= nil and ActiveTurnState ~= nil then
			v8.syncFromTurnState(ActiveTurnState)
			
			return
		end
	end, { v8, ActiveTurnState })
	
	if Current then
		ReactModule.useEffect(function()
			-- upvalues: p1 (copy), UseRefResult9 (ref), UseMemoResult (copy), UniverseId (ref), SessionId (ref), UseMemoResult4 (copy), NoUseMemoResult1 (copy), noteLiveAdUpsellTurns (upval), Messages (copy)
			local OnAssistantTurnCompletedFunction: (any) -> () = p1.onAssistantTurnCompleted
			local UseRefResult = UseRefResult9
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
				local v9: number? = nil
				
				for liveTurnStartSequenceId in Current.liveTurnStartSequenceIds do
					if v9 == nil or liveTurnStartSequenceId < v9 then
						v9 = liveTurnStartSequenceId
					end
				end
				if v9 == nil then
					Current.lastProcessedSequenceId = Current.historyWatermarkSequenceId or UseMemoResult4.latestSequenceId
				else
					Current.lastProcessedSequenceId = v9 - 1
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
	local UseStateResult11, UseStateResult2_5 = ReactModule.useState(nil)
	local UseStateResult12, UseStateResult2_6 = ReactModule.useState(false)
	local UseResult5 = ReactModule.useCallback(function(p2)
		-- upvalues: UseStateResult2_5 (copy), UseStateResult2_6 (copy)
		UseStateResult2_5(p2)
		UseStateResult2_6(false)
	end, {})
	local UseResult6 = ReactModule.useCallback(function(p2)
		-- upvalues: UseStateResult2_5 (copy), UseStateResult2_6 (copy)
		UseStateResult2_5(p2)
		UseStateResult2_6(true)
	end, {})
	local Current3 = if FFlagBuildExperienceModelPickerModule then ReactModule.useRef({ revision = 0 }).current else nil
	local UseRefResult16 = ReactModule.useRef("")
	local UseRefResult17 = ReactModule.useRef("")
	local UseRefResult18 = if FFlagBuildExperiencePrefillSkipsDraftPersistModule and FFlagBuildExperiencePersistChatDraftModule then ReactModule.useRef(nil) else nil
	local UseRefResult19 = ReactModule.useRef(nil)
	local UseRefResult20 = ReactModule.useRef(CasSessionId)
	local UseRefResult21 = ReactModule.useRef(nil)
	UseRefResult20.current = CasSessionId
	local NoUniverseId: boolean = p1.createUniverseOnFirstPrompt == true and UniverseId == nil
	local IsCreateUniverseOnFirstPrompt = p1.createUniverseOnFirstPrompt == true
	local UseRefResult22 = if FFlagBuildExperienceNewGameChatDraftModule then ReactModule.useRef(IsCreateUniverseOnFirstPrompt) else { current = IsCreateUniverseOnFirstPrompt }
	UseRefResult22.current = IsCreateUniverseOnFirstPrompt
	local UseRefResult23 = if FFlagBuildExperienceRestoreStoppedPromptModule then ReactModule.useRef(nil) else nil
	local UseStateResult10 = if IsIsLibraryChat then Frozen else {}
	local Callback4 = nil
	local UseRefResult13 = { current = {} }
	local UseRefResult24 = ReactModule.useRef({})
	local UseRefResult25 = ReactModule.useRef(0)
	
	if FFlagBuildExperienceChatImageAttachmentsModule then
		UseStateResult10, Callback4 = ReactModule.useState({})
		UseRefResult13 = ReactModule.useRef({})
	end
	local t = {}
	local Callback3 = nil
	local UseRefResult14 = { current = {} }
	local UseRefResult15 = {
		current = { universeId = p1.universeId, placeId = p1.placeId }
	}
	
	if FFlagBuildExperienceChatResourceAttachments then
		t, Callback3 = ReactModule.useState({})
		UseRefResult14 = ReactModule.useRef({})
		UseRefResult15 = ReactModule.useRef({ universeId = p1.universeId, placeId = p1.placeId })
	end
	local UseRefResult26 = ReactModule.useRef(nil)
	local UseClockResult = ReactUtilsModule.useClock()
	local UseChatScrollModuleResult = UseChatScrollModule(IsIsLibraryChat)
	local UseResult7 = ReactModule.useCallback(function(p2, p3)
		-- upvalues: GetPlaytestLoadingStoreModule (upval)
		GetPlaytestLoadingStoreModule().setAgentStatusForPlaceId(p2, p3)
	end, {})
	local UseResult8 = ReactModule.useCallback(function(Callback)
		-- upvalues: UseChatScrollModuleResult (copy), UseMemoResult (copy), FFlagBuildExperienceChatHistoryPrefetchModule (upval)
		local function v272()
			-- upvalues: Callback (copy)
			return Callback ~= nil and Callback()
		end
		
		UseChatScrollModuleResult.captureDistanceFromBottom()
		
		if UseMemoResult == nil then return end
		if FFlagBuildExperienceChatHistoryPrefetchModule then
			UseMemoResult.requestOlderHistoryWhile(v272, function()
				-- upvalues: UseChatScrollModuleResult (upval)
				return UseChatScrollModuleResult.isNearTopRef.current
			end)
			
			return
		else
			task.spawn(function()
				-- upvalues: UseMemoResult (upval), v272 (copy), UseChatScrollModuleResult (upval), Callback (copy)
				if UseMemoResult.loadOlderHistory(v272) and UseMemoResult.getNextHistoryPageToken() ~= nil and UseChatScrollModuleResult.isAtTopRef.current then
					task.delay(0.1, function()
						-- upvalues: Callback (upval), UseChatScrollModuleResult (upval), UseMemoResult (upval), v272 (upval)
						if Callback ~= nil and Callback() then return end
						if UseChatScrollModuleResult.isViewportUnderfilled() then
							UseMemoResult.loadOlderHistory(v272)
						end
					end)
				end
			end)
		end
	end, { UseMemoResult, UseChatScrollModuleResult })
	local UseResult9 = ReactModule.useCallback(function(Callback)
		-- upvalues: UseMemoResult (copy), FFlagBuildExperienceChatHistoryPrefetchModule (upval), UseChatScrollModuleResult (copy), UseResult8 (copy)
		task.delay(0.1, function()
			-- upvalues: Callback (copy), UseMemoResult (upval), FFlagBuildExperienceChatHistoryPrefetchModule (upval), UseChatScrollModuleResult (upval), UseResult8 (upval)
			if Callback() then return end
			if UseMemoResult == nil then return end
			if UseMemoResult.getNextHistoryPageToken() == nil then return end
			if FFlagBuildExperienceChatHistoryPrefetchModule then
				if not UseChatScrollModuleResult.isNearTopRef.current then return end
			elseif not UseChatScrollModuleResult.isViewportUnderfilled() then return end
			UseResult8(Callback)
		end)
	end, { UseResult8, UseChatScrollModuleResult, UseMemoResult })
	local UseResult10 = ReactModule.useCallback(function(p2)
		-- upvalues: UseMemoResult (copy), UseResult9 (copy)
		if UseMemoResult == nil then return end
		if UseMemoResult.getNextHistoryPageToken() ~= nil then
			UseResult9(p2)
			
			return
		end
	end, { UseResult9, UseMemoResult })
	local UseRefResult27 = ReactModule.useRef(UseResult10)
	UseRefResult27.current = UseResult10
	ReactModule.useEffect(function()
		-- upvalues: UseChatScrollModuleResult (copy), UseResult8 (copy)
		UseChatScrollModuleResult.setOnScrolledToTop(function()
			-- upvalues: UseResult8 (upval)
			UseResult8(nil)
		end)
		
		return function()
			-- upvalues: UseChatScrollModuleResult (upval)
			UseChatScrollModuleResult.setOnScrolledToTop(nil)
		end
	end, { UseChatScrollModuleResult.setOnScrolledToTop, UseResult8 })
	ReactModule.useEffect(function()
		-- upvalues: NoHydrateHistoryWhen (copy), UseMemoResult (copy), FFlagBuildExperienceChatHistoryLoadingSkeletonModule1 (copy), Callback2 (ref), SessionId (ref), UniverseId (ref), UseRefResult27 (copy), IsIsLibraryChat (copy), UseRefResult10 (copy), FFlagBuildExperienceModelPickerModule (upval), FFlagBuildExperienceChatHistoryPrefetchModule (upval), CreatorAgentChatStore (copy), FFlagBuildExperiencePinForBuild (upval), UseStateResult2_1 (copy), PlaceId (ref), UseSignalStateResult (ref)
		if NoHydrateHistoryWhen and UseMemoResult ~= nil then
			local Flag = false
			
			local function _(IsLoading)
				-- upvalues: FFlagBuildExperienceChatHistoryLoadingSkeletonModule1 (upval), Callback2 (upval), Flag (ref), UseMemoResult (upval), SessionId (upval), UniverseId (upval), NoHydrateHistoryWhen (upval)
				if FFlagBuildExperienceChatHistoryLoadingSkeletonModule1 and Callback2 ~= nil and not Flag then
					Callback2({
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
			
			if FFlagBuildExperienceChatHistoryLoadingSkeletonModule1 and Callback2 ~= nil and not Flag then
				Callback2({
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
				-- upvalues: Flag (ref), CasSessionId (copy), UseMemoResult (upval), UseRefResult27 (upval), isHydrateCancelled (copy)
				if not (if Flag then true else CasSessionId ~= nil and CasSessionId ~= "" and UseMemoResult.getCasSessionId() ~= CasSessionId) then
					UseRefResult27.current(isHydrateCancelled)
					
					return
				end
			end
			
			local function hydrateKnownSession(CasSessionId1)
				-- upvalues: UseMemoResult (upval), IsIsLibraryChat (upval), UseRefResult10 (upval), FFlagBuildExperienceChatHistoryLoadingSkeletonModule1 (upval), Callback2 (upval), Flag (ref), SessionId (upval), UniverseId (upval), NoHydrateHistoryWhen (upval), FFlagBuildExperienceModelPickerModule (upval), CasSessionId (copy), UseRefResult27 (upval), isHydrateCancelled (copy), FFlagBuildExperienceChatHistoryPrefetchModule (upval)
				UseMemoResult.setCasSessionId(CasSessionId1)
				
				if not IsIsLibraryChat or UseRefResult10.current == nil then
					if IsIsLibraryChat or not UseMemoResult.hasLoadedHistory() or #UseMemoResult.getMergedHistory(false) <= 0 or FFlagBuildExperienceModelPickerModule and not UseMemoResult.hasObservedModels(false) then
						if (if FFlagBuildExperienceChatHistoryPrefetchModule then UseMemoResult.refreshSession(isHydrateCancelled, true) else UseMemoResult.refreshSession(isHydrateCancelled)) and not (if Flag then true else CasSessionId ~= nil and CasSessionId ~= "" and UseMemoResult.getCasSessionId() ~= CasSessionId) and not (if Flag then true else CasSessionId ~= nil and CasSessionId ~= "" and UseMemoResult.getCasSessionId() ~= CasSessionId) then
							UseRefResult27.current(isHydrateCancelled)
						end
						if FFlagBuildExperienceChatHistoryLoadingSkeletonModule1 and Callback2 ~= nil then
							if Flag then return end
							Callback2({
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
							UseRefResult27.current(isHydrateCancelled)
						end
						if FFlagBuildExperienceChatHistoryLoadingSkeletonModule1 and Callback2 ~= nil then
							if Flag then return end
							Callback2({
								isLoading = false,
								session = UseMemoResult,
								sessionId = SessionId,
								universeId = UniverseId,
								hydrateHistoryWhen = NoHydrateHistoryWhen
							})
						end
						return
					end
				elseif FFlagBuildExperienceChatHistoryLoadingSkeletonModule1 and Callback2 ~= nil then
					if Flag then return end
					Callback2({
						isLoading = false,
						session = UseMemoResult,
						sessionId = SessionId,
						universeId = UniverseId,
						hydrateHistoryWhen = NoHydrateHistoryWhen
					})
				end
			end
			
			task.spawn(function()
				-- upvalues: SessionId (upval), IsIsLibraryChat (upval), UseMemoResult (upval), hydrateKnownSession (copy), FFlagBuildExperienceModelPickerModule (upval), UniverseId (upval), FFlagBuildExperienceChatHistoryLoadingSkeletonModule1 (upval), Callback2 (upval), Flag (ref), NoHydrateHistoryWhen (upval), CreatorAgentChatStore (upval), FFlagBuildExperiencePinForBuild (upval), CasSessionId (copy), UseStateResult2_1 (upval), PlaceId (upval), UseSignalStateResult (upval)
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
						universeId = UniverseId,
						application = if FFlagBuildExperiencePinForBuild then "build" else nil,
						filterByPinForBuild = if FFlagBuildExperiencePinForBuild then true else nil
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
						
						if FFlagBuildExperienceChatHistoryLoadingSkeletonModule1 and Callback2 ~= nil then
							if Flag then return end
							Callback2({
								isLoading = false,
								session = UseMemoResult,
								sessionId = SessionId,
								universeId = UniverseId,
								hydrateHistoryWhen = NoHydrateHistoryWhen
							})
						end
						return
					elseif FFlagBuildExperienceChatHistoryLoadingSkeletonModule1 and Callback2 ~= nil then
						if Flag then return end
						Callback2({
							isLoading = false,
							session = UseMemoResult,
							sessionId = SessionId,
							universeId = UniverseId,
							hydrateHistoryWhen = NoHydrateHistoryWhen
						})
					end
					return
				elseif FFlagBuildExperienceChatHistoryLoadingSkeletonModule1 and Callback2 ~= nil then
					if Flag then return end
					Callback2({
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
		elseif FFlagBuildExperienceChatHistoryLoadingSkeletonModule1 and Callback2 ~= nil then
			Callback2({
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
		IsIsLibraryChat, UseSignalStateResult
	})
	ReactModule.useEffect(function()
		-- upvalues: UseMemoResult (copy), SessionId (ref), FFlagBuildExperienceChatHistoryPrefetchModule (upval), UseRefResult27 (copy), MessageBusService (upval), GameMessageId (upval), FFlagBuildExperiencePersistPlaytestLogsModule (upval), FFlagBuildExperienceClientDataModelTools (upval), v1 (ref), FFlagBuildExperienceRefreshChatDraftOnGameLeaveModule (upval), FFlagBuildExperiencePersistChatDraftModule (upval), FFlagBuildExperiencePrefillSkipsDraftPersistModule (upval), UseRefResult16 (copy), UseRefResult18 (copy), BuildAppStorageModule (upval), UseRefResult17 (copy), UseBindingResult2 (copy), UseResult5 (copy), AppLifecycleObserverService (upval)
		if UseMemoResult == nil then return end
		local Flag = false
		
		local function refreshKnownSession()
			-- upvalues: UseMemoResult (upval), SessionId (upval), Flag (ref), FFlagBuildExperienceChatHistoryPrefetchModule (upval), UseRefResult27 (upval)
			local CasSessionId = UseMemoResult.getCasSessionId()
			
			if (CasSessionId == nil or CasSessionId == "") and (SessionId ~= nil and SessionId ~= "") then
				CasSessionId = SessionId
			end
			if CasSessionId ~= nil and CasSessionId ~= "" then
				task.spawn(function()
					-- upvalues: Flag (upval), FFlagBuildExperienceChatHistoryPrefetchModule (upval), UseMemoResult (upval), UseRefResult27 (upval)
					local function isRefreshCancelled()
						-- upvalues: Flag (upval)
						return Flag
					end
					
					if (if FFlagBuildExperienceChatHistoryPrefetchModule then UseMemoResult.refreshSession(isRefreshCancelled, true) else UseMemoResult.refreshSession(isRefreshCancelled)) and not Flag then
						UseRefResult27.current(function()
							-- upvalues: Flag (upval)
							return Flag
						end)
					end
				end)
				
				return
			end
		end
		
		local SubscribeResult = MessageBusService:Subscribe(GameMessageId, function(_)
			-- upvalues: FFlagBuildExperiencePersistPlaytestLogsModule (upval), FFlagBuildExperienceClientDataModelTools (upval), v1 (upval), FFlagBuildExperienceRefreshChatDraftOnGameLeaveModule (upval), FFlagBuildExperiencePersistChatDraftModule (upval), UseMemoResult (upval), SessionId (upval), FFlagBuildExperiencePrefillSkipsDraftPersistModule (upval), UseRefResult16 (upval), UseRefResult18 (upval), BuildAppStorageModule (upval), UseRefResult17 (upval), UseBindingResult2 (upval), UseResult5 (upval), refreshKnownSession (copy)
			if (FFlagBuildExperiencePersistPlaytestLogsModule or FFlagBuildExperienceClientDataModelTools) and v1 ~= nil then
				v1.current = true
			end
			if FFlagBuildExperienceRefreshChatDraftOnGameLeaveModule and FFlagBuildExperiencePersistChatDraftModule then
				local CasSessionId = UseMemoResult.getCasSessionId()
				
				if (CasSessionId == nil or CasSessionId == "") and (SessionId ~= nil and SessionId ~= "") then
					CasSessionId = SessionId
				end
				local IsCurrentMatch: boolean = FFlagBuildExperiencePrefillSkipsDraftPersistModule and (UseRefResult16.current ~= "" and UseRefResult16.current == UseRefResult18.current)
				
				if CasSessionId ~= nil and CasSessionId ~= "" and not IsCurrentMatch then
					local ChatDraft = BuildAppStorageModule.getChatDraft(CasSessionId) or ""
					UseRefResult17.current = ChatDraft
					UseRefResult16.current = ChatDraft
					UseBindingResult2(ChatDraft)
					UseResult5(nil)
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
	local UseResult11 = ReactModule.useCallback(function(Current1)
		-- upvalues: Current3 (ref), UseRefResult16 (copy), UseBindingResult2 (copy), UseResult5 (copy)
		if Current3 ~= nil and UseRefResult16.current ~= Current1 then
			local Current2 = Current3
			Current2.revision += 1
		end
		UseRefResult16.current = Current1
		UseBindingResult2(Current1)
		UseResult5(nil)
	end, { Current3, UseBindingResult2, UseResult5 })
	local UseResult12 = if FFlagBuildExperiencePersistChatDraftModule then ReactModule.useCallback(function()
		-- upvalues: UseRefResult19 (copy)
		if UseRefResult19.current ~= nil then
			task.cancel(UseRefResult19.current)
			UseRefResult19.current = nil
		end
	end, {}) else nil
	local UseResult13 = if FFlagBuildExperienceNewGameChatDraftModule then ReactModule.useCallback(function()
		-- upvalues: UseRefResult20 (copy), UseRefResult22 (ref), GetNewGameChatDraftKeyModule (upval)
		local Current = UseRefResult20.current
		
		return if Current == nil or Current == "" then if UseRefResult22.current then GetNewGameChatDraftKeyModule() else nil else Current
	end, {}) else nil
	local UseResult14 = if FFlagBuildExperiencePersistChatDraftModule then ReactModule.useCallback(function(Current)
		-- upvalues: UseRefResult17 (copy), UseResult12 (copy), FFlagBuildExperienceNewGameChatDraftModule (upval), UseResult13 (copy), UseRefResult20 (copy), UseRefResult19 (copy), BuildAppStorageModule (upval)
		UseRefResult17.current = Current
		UseResult12()
		local UseResultResult = if FFlagBuildExperienceNewGameChatDraftModule then UseResult13() else UseRefResult20.current
		
		if UseResultResult ~= nil and UseResultResult ~= "" then
			UseRefResult19.current = task.delay(0.5, function()
				-- upvalues: UseRefResult19 (upval), BuildAppStorageModule (upval), UseResultResult (copy), Current (copy)
				UseRefResult19.current = nil
				BuildAppStorageModule.setChatDraft(UseResultResult, Current)
			end)
			
			return
		end
	end, { UseResult12, UseResult13 }) else nil
	local UseResult15 = if FFlagBuildExperiencePersistChatDraftModule then ReactModule.useCallback(function(Current)
		-- upvalues: FFlagBuildExperienceNewGameChatDraftModule (upval), UseResult13 (copy), UseRefResult20 (copy), UseRefResult17 (copy), UseResult12 (copy), BuildAppStorageModule (upval)
		local UseResultResult = if FFlagBuildExperienceNewGameChatDraftModule then UseResult13() else UseRefResult20.current
		
		if UseResultResult ~= nil and UseResultResult ~= "" then
			UseRefResult17.current = Current
			UseResult12()
			BuildAppStorageModule.setChatDraft(UseResultResult, Current)
			
			return
		end
	end, { UseResult12, UseResult13 }) else nil
	local UseResult16 = if FFlagBuildExperiencePersistChatDraftModule then ReactModule.useCallback(function(Current, p2)
		-- upvalues: FFlagBuildExperienceNewGameChatDraftModule (upval), UseRefResult22 (ref), GetNewGameChatDraftKeyModule (upval), BuildAppStorageModule (upval), UseRefResult17 (copy), UseResult12 (copy)
		local NewGameChatDraftKeyModule = if FFlagBuildExperienceNewGameChatDraftModule and UseRefResult22.current then GetNewGameChatDraftKeyModule() else nil
		
		if NewGameChatDraftKeyModule ~= nil then
			BuildAppStorageModule.setChatDraft(NewGameChatDraftKeyModule, "")
		end
		if p2 ~= nil and p2 ~= "" and UseRefResult17.current == Current then
			UseRefResult17.current = ""
			UseResult12()
			BuildAppStorageModule.setChatDraft(p2, "")
			
			return
		end
	end, { UseResult12 }) else nil
	local UseResult17 = ReactModule.useCallback(function(Current)
		-- upvalues: UseResult11 (copy), FFlagBuildExperiencePersistChatDraftModule (upval), FFlagBuildExperiencePrefillSkipsDraftPersistModule (upval), UseRefResult18 (copy), UseResult14 (copy)
		UseResult11(Current)
		
		if FFlagBuildExperiencePersistChatDraftModule then
			if FFlagBuildExperiencePrefillSkipsDraftPersistModule then
				local Current1 = UseRefResult18.current
				
				if Current1 ~= nil and Current == Current1 then return end
				UseRefResult18.current = nil
			end
			UseResult14(Current)
		end
	end, { UseResult11, UseResult14 })
	local UseResult18 = if FFlagBuildExperiencePrefillSkipsDraftPersistModule and FFlagBuildExperiencePersistChatDraftModule then ReactModule.useCallback(function(Current)
		-- upvalues: UseRefResult18 (copy), UseResult11 (copy)
		UseRefResult18.current = Current
		UseResult11(Current)
	end, { UseResult11 }) else UseResult17
	
	if FFlagBuildExperienceNewGameChatDraftModule and FFlagBuildExperiencePersistChatDraftModule then
		ReactModule.useEffect(function()
			-- upvalues: NoUniverseId (copy), CasSessionId (copy), GetNewGameChatDraftKeyModule (upval), BuildAppStorageModule (upval), UseRefResult16 (copy), UseRefResult17 (copy), UseResult11 (copy)
			if not NoUniverseId or CasSessionId ~= nil and CasSessionId ~= "" then return end
			local NewGameChatDraftKeyModule = GetNewGameChatDraftKeyModule()
			
			if NewGameChatDraftKeyModule == nil then return end
			local ChatDraft = BuildAppStorageModule.getChatDraft(NewGameChatDraftKeyModule) or ""
			
			if ChatDraft ~= "" and UseRefResult16.current == "" then
				UseRefResult17.current = ChatDraft
				UseResult11(ChatDraft)
			end
		end, { NoUniverseId, CasSessionId, UseResult11 })
	end
	ReactModule.useEffect(function()
		-- upvalues: FFlagBuildExperiencePersistChatDraftModule (upval), CasSessionId (copy), UseRefResult21 (copy), UseResult12 (copy), FFlagBuildExperiencePrefillSkipsDraftPersistModule (upval), UseRefResult16 (copy), UseRefResult18 (copy), UseRefResult17 (copy), BuildAppStorageModule (upval), FFlagBuildExperienceModelPickerModule (upval), UseMemoResult (copy), GetBuildPromptDraftStoreModule (upval), UseResult11 (copy), UseRefResult19 (copy)
		if not FFlagBuildExperiencePersistChatDraftModule then return end
		if CasSessionId == nil or CasSessionId == "" then return end
		local Current = UseRefResult21.current
		UseRefResult21.current = CasSessionId
		UseResult12()
		
		if FFlagBuildExperiencePrefillSkipsDraftPersistModule and Current == nil and UseRefResult16.current ~= "" and UseRefResult16.current == UseRefResult18.current then
			UseRefResult17.current = BuildAppStorageModule.getChatDraft(CasSessionId) or ""
		elseif Current == nil and UseRefResult16.current ~= "" then
			UseRefResult17.current = UseRefResult16.current
			BuildAppStorageModule.setChatDraft(CasSessionId, UseRefResult16.current)
		else
			local ChatDraft = BuildAppStorageModule.getChatDraft(CasSessionId) or ""
			
			if FFlagBuildExperienceModelPickerModule and UseMemoResult ~= nil then
				local SubmittedDraft = GetBuildPromptDraftStoreModule(false).getSubmittedDraft(UseMemoResult)
				
				if SubmittedDraft ~= nil and SubmittedDraft.ownsDraft() and ChatDraft == SubmittedDraft.text then
					ChatDraft = ""
				end
			end
			UseRefResult17.current = ChatDraft
			UseResult11(ChatDraft)
		end
		return function()
			-- upvalues: UseRefResult19 (upval), UseResult12 (upval), BuildAppStorageModule (upval), CasSessionId (upval), UseRefResult17 (upval)
			local HasCurrent = UseRefResult19.current ~= nil
			UseResult12()
			
			if HasCurrent then
				BuildAppStorageModule.setChatDraft(CasSessionId, UseRefResult17.current)
			end
		end
	end, {
		CasSessionId,
		UseResult12,
		UseResult11,
		if FFlagBuildExperienceModelPickerModule then UseMemoResult else nil
	})
	
	local function commitComposerResourceAttachments(Current1)
		-- upvalues: Current3 (ref), UseRefResult14 (ref), Callback3 (ref), UseResult5 (copy)
		if Current3 ~= nil then
			local Current2 = Current3
			Current2.revision += 1
		end
		UseRefResult14.current = Current1
		
		if Callback3 ~= nil then
			Callback3(Current1)
		end
		UseResult5(nil)
	end
	
	local function findComposerResourceAttachmentIndexByUri(ResourceAttachmentUri)
		-- upvalues: UseRefResult14 (ref), ChatTypesModule (upval)
		for i, value in UseRefResult14.current do
			if ChatTypesModule.getResourceAttachmentUri(value) == ResourceAttachmentUri then
				return i
			end
		end
		return nil
	end
	
	local function addComposerResourceAttachment(p2)
		-- upvalues: UseRefResult14 (ref), Current3 (ref), Callback3 (ref), UseResult5 (copy)
		local Copy = table.clone(UseRefResult14.current)
		table.insert(Copy, p2)
		
		if Current3 ~= nil then
			local Current1 = Current3
			Current1.revision += 1
		end
		UseRefResult14.current = Copy
		
		if Callback3 ~= nil then
			Callback3(Copy)
		end
		UseResult5(nil)
	end
	
	local function removeComposerResourceAttachmentAtIndex(Index)
		-- upvalues: UseRefResult14 (ref), Current3 (ref), Callback3 (ref), UseResult5 (copy)
		local Copy = table.clone(UseRefResult14.current)
		table.remove(Copy, Index)
		
		if Current3 ~= nil then
			local Current1 = Current3
			Current1.revision += 1
		end
		UseRefResult14.current = Copy
		
		if Callback3 ~= nil then
			Callback3(Copy)
		end
		UseResult5(nil)
	end
	
	local function clearComposerResourceAttachments()
		-- upvalues: Current3 (ref), UseRefResult14 (ref), Callback3 (ref), UseResult5 (copy)
		local Current1 = {}
		
		if Current3 ~= nil then
			local Current2 = Current3
			Current2.revision += 1
		end
		UseRefResult14.current = Current1
		
		if Callback3 ~= nil then
			Callback3(Current1)
		end
		UseResult5(nil)
	end
	
	local UseRefResult1 = ReactModule.useRef(commitComposerResourceAttachments)
	UseRefResult1.current = commitComposerResourceAttachments
	
	if FFlagBuildExperienceChatResourceAttachments then
		ReactModule.useLayoutEffect(function()
			-- upvalues: UseRefResult15 (ref), p1 (copy), UseRefResult1 (copy)
			local Current = UseRefResult15.current
			
			if Current.universeId ~= p1.universeId or Current.placeId ~= p1.placeId then
				UseRefResult1.current({})
			end
			UseRefResult15.current = { universeId = p1.universeId, placeId = p1.placeId }
		end, { p1.universeId, p1.placeId })
	end
	local function _(Current1)
		-- upvalues: Current3 (ref), UseRefResult13 (ref), Callback4 (ref)
		if Current3 ~= nil then
			local Current2 = Current3
			Current2.revision += 1
		end
		UseRefResult13.current = Current1
		
		if Callback4 ~= nil then
			Callback4(Current1)
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
		-- upvalues: UseRefResult13 (ref), Current3 (ref), Callback4 (ref)
		local Current1 = UseRefResult13.current
		local Copy = table.clone(Current1)
		
		for i, value in Current1 do
			if value.capture == Capture then
				Copy[i] = Callback(value)
				
				if Current3 ~= nil then
					local Current2 = Current3
					Current2.revision += 1
				end
				UseRefResult13.current = Copy
				
				if Callback4 ~= nil then
					Callback4(Copy)
				end
				return Copy
			end
		end
		return Current1
	end
	
	local function beginComposerImageUpload(Capture)
		-- upvalues: UseRefResult25 (copy), UseRefResult24 (copy), updateComposerImage (copy), UseResult5 (copy), UploadCaptureAsyncModule (upval), FFlagBuildExperienceChatImageAttachmentsModule (upval), FormatResult1 (copy)
		UseRefResult25.current += 1
		local Current = UseRefResult25.current
		UseRefResult24.current[Capture] = Current
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
			UseResult5(nil)
		end
		UploadCaptureAsyncModule(Capture):andThen(function(Result)
			-- upvalues: UseRefResult24 (upval), Capture (copy), Current (copy), updateComposerImage (upval), UseResult5 (upval)
			if UseRefResult24.current[Capture] ~= Current then return end
			UseRefResult24.current[Capture] = nil
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
				UseResult5(nil)
			end
		end):catch(function(Err)
			-- upvalues: UseRefResult24 (upval), Capture (copy), Current (copy), updateComposerImage (upval), FFlagBuildExperienceChatImageAttachmentsModule (upval), UseResult5 (upval), FormatResult1 (upval)
			if UseRefResult24.current[Capture] ~= Current then return end
			UseRefResult24.current[Capture] = nil
			updateComposerImage(Capture, function(Tbl)
				-- upvalues: Err (copy)
				local Copy = table.clone(Tbl)
				Copy.uri = nil
				Copy.uploadStatus = "failed"
				Copy.uploadError = Err
				
				return Copy
			end)
			
			if FFlagBuildExperienceChatImageAttachmentsModule then
				UseResult5(FormatResult1)
			end
		end)
	end
	
	local function setComposerImages(p2)
		-- upvalues: UseRefResult13 (ref), UseRefResult24 (copy), Current3 (ref), Callback4 (ref), UseResult5 (copy), beginComposerImageUpload (copy)
		local Current1 = UseRefResult13.current
		local Current2 = {}
		local Captures = {}
		local Tbl = nil
		
		for i = 1, math.min(#p2, 2) do
			local v10 = p2[i]
			Tbl = v10
			
			if v10.capture ~= nil and v10.uri == nil and v10.uploadStatus == nil then
				for _, value in Current1 do
					if value.capture == v10.capture then
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
			table.insert(Current2, Tbl)
		end
		local Flag = nil
		for _, value1 in Current1 do
			Flag = false
			
			for _, value2 in Current2 do
				if value2.capture == value1.capture then
					Flag = true
					break
				end
			end
			if not Flag and value1.capture ~= nil then
				UseRefResult24.current[value1.capture] = nil
			end
		end
		if Current3 ~= nil then
			local Current3 = Current3
			Current3.revision += 1
		end
		UseRefResult13.current = Current2
		
		if Callback4 ~= nil then
			Callback4(Current2)
		end
		local Flag1 = false
		
		for _, value3 in Current2 do
			if value3.uploadStatus == "failed" then
				Flag1 = true
				break
			end
		end
		if not Flag1 then
			UseResult5(nil)
		end
		for _, capture in Captures do
			beginComposerImageUpload(capture)
		end
	end
	
	local UseRefResult3 = ReactModule.useRef(setComposerImages)
	UseRefResult3.current = setComposerImages
	
	local function retryComposerImage(p3)
		-- upvalues: UseRefResult13 (ref), beginComposerImageUpload (copy)
		local CurrentEntry = UseRefResult13.current[p3]
		
		if CurrentEntry ~= nil and CurrentEntry.capture ~= nil and CurrentEntry.uploadStatus == "failed" then
			beginComposerImageUpload(CurrentEntry.capture)
			
			return
		end
	end
	
	local Flag = false
	
	for _, value in UseStateResult10 do
		if value.uri == nil or value.uploadStatus == "uploading" or value.uploadStatus == "failed" then
			Flag = true
			break
		end
	end
	local UseResult4 = if FFlagBuildExperienceToolResultFailureRecoveryModule or FFlagBuildExperienceAnswerFormModule then ReactModule.useCallback(function(Current)
		-- upvalues: UseRefResult12 (copy), UseRefResult11 (copy), UseMemoResult (copy), SessionId (ref), FFlagBuildExperienceAnswerFormModule (upval), UseRefResult10 (copy), UseRefResult16 (copy), UseResult17 (copy), CreatorAgentChatModule1 (upval), UseContextResult (copy), UseResult5 (copy)
		return function(p3, p4)
			-- upvalues: UseRefResult12 (upval), Current (copy), UseRefResult11 (upval), UseMemoResult (upval), SessionId (upval), FFlagBuildExperienceAnswerFormModule (upval), UseRefResult10 (upval), UseRefResult16 (upval), UseResult17 (upval), CreatorAgentChatModule1 (upval), UseContextResult (upval), UseResult5 (upval)
			if UseRefResult12.current == Current then
				local Current1 = UseRefResult11.current
				local SessionId1 = SessionId
				
				if Current1 ~= nil and Current1.session == UseMemoResult and (SessionId1 == nil or SessionId1 == "" or (Current1.sessionId == SessionId1 or Current1.sessionId == nil and Current1.session.getCasSessionId() == SessionId1)) then
					local HasNextEntry = false
					
					if FFlagBuildExperienceAnswerFormModule then
						local Current2 = UseRefResult10.current
						
						if Current2 ~= nil then
							HasNextEntry = next(Current2.getLocalToolActions(false).onAnswerSelectedByToolCallId) ~= nil
						end
					end
					if p3 ~= nil and UseRefResult16.current == "" and not HasNextEntry then
						UseResult17(p3)
					end
					UseResult5((UseContextResult:Format((CreatorAgentChatModule1.getToolResultFailureComposerError(p4)))))
					
					return
				end
			end
		end
	end, {
		UseMemoResult,
		SessionId,
		UseResult17,
		UseResult5,
		UseContextResult
	}) else nil
	local FundingFailure = nil
	local OnPromptFailureFunction = p1.onPromptFailure
	
	if FFlagBuildExperienceModelPickerModule then
		local UseStateResult13, UseStateResult2_7 = ReactModule.useState(nil)
		FundingFailure = if UseStateResult13 == nil or UseStateResult13.owner ~= UseMemoResult then nil else UseStateResult13
		OnPromptFailureFunction = ReactModule.useCallback(function(OutOfCredits, Reason)
			-- upvalues: CreatorAgentChatModule (upval), UseStateResult2_7 (copy), UseMemoResult (copy), p1 (copy)
			if OutOfCredits == CreatorAgentChatModule.ErrorCodes.OutOfCredits then
				UseStateResult2_7(function(p3)
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
	local UseResult19 = ReactModule.useCallback(function(Current1, Failure, p3, p4, p5, Current2, Callback)
		-- upvalues: UseRefResult12 (copy), FFlagBuildExperienceModelPickerModule (upval), v2 (ref), GetBuildPromptDraftStoreModule (upval), GetBuildCreatorCreditRefreshStoreModule (upval), UseResult2 (copy), UseRefResult8 (copy), UseStateResult2_2 (copy), OnPromptFailureFunction (ref), UseResult7 (copy), Current3 (ref), FFlagBuildExperienceChatImageAttachmentsModule (upval), UseRefResult3 (copy), FFlagBuildExperienceChatResourceAttachments (upval), UseRefResult1 (copy), UseResult17 (copy), CreatorAgentChatModule1 (upval), UseContextResult (copy), UseResult5 (copy), UseChatScrollModuleResult (copy), p1 (copy), SessionId (ref), UseSignalStateResult (ref), UseStateResult2 (copy)
		if UseRefResult12.current ~= Current1 then return end
		if FFlagBuildExperienceModelPickerModule and v2 ~= nil and not v2.current then
			local BuildPromptDraftStoreModule = GetBuildPromptDraftStoreModule(false)
			local SubmittedDraft = BuildPromptDraftStoreModule.getSubmittedDraft(Current2)
			
			if Failure == nil or SubmittedDraft == nil then
				BuildPromptDraftStoreModule.setSubmittedDraft(Current2, nil)
			else
				SubmittedDraft.failure = Failure
			end
			GetBuildCreatorCreditRefreshStoreModule(false).settled()
			
			return
		else
			UseResult2(nil)
			UseRefResult8.current = nil
			UseStateResult2_2(nil)
			
			if FFlagBuildExperienceModelPickerModule then
				GetBuildCreatorCreditRefreshStoreModule(false).settled()
				GetBuildPromptDraftStoreModule(false).setSubmittedDraft(Current2, nil)
			end
			if Failure == nil then
				if Current2.placeId ~= nil then
					UseResult7(Current2.placeId, "Completed")
				end
				UseChatScrollModuleResult.scrollToBottomAfterSend()
				local CasSessionId = Current2.getCasSessionId()
				
				if CasSessionId ~= nil and CasSessionId ~= "" then
					if p1.createUniverseOnFirstPrompt and SessionId == nil and Current2.universeId ~= nil then
						local config = {
							universeId = Current2.universeId,
							placeId = Current2.placeId,
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
						-- upvalues: Current2 (copy), UseRefResult12 (upval), Current1 (copy)
						Current2.refreshSession(function(): boolean
							-- upvalues: UseRefResult12 (upval), Current1 (upval)
							return UseRefResult12.current ~= Current1
						end)
					end)
				end
				return
			else
				if OnPromptFailureFunction ~= nil then
					OnPromptFailureFunction(Failure.errorCode, Failure.outOfCreditsReason)
				end
				if Current2.placeId ~= nil then
					UseResult7(Current2.placeId, "Idle")
				end
				if not FFlagBuildExperienceModelPickerModule or Current3 ~= nil and (Current3.ownerSequence == Current1 and Current3.ownerRevision == Current3.revision and (Callback == nil or Callback())) then
					if FFlagBuildExperienceChatImageAttachmentsModule and p4 ~= nil then
						UseRefResult3.current(p4)
					end
					if FFlagBuildExperienceChatResourceAttachments and p5 ~= nil then
						UseRefResult1.current(p5)
					end
					if p3 ~= nil then
						UseResult17(p3)
					end
				end
				if p3 ~= nil then
					UseResult5((UseContextResult:Format((CreatorAgentChatModule1.getPromptFailureComposerError(Failure)))))
				end
				task.spawn(function()
					-- upvalues: Current2 (copy), UseRefResult12 (upval), Current1 (copy)
					Current2.refreshSession(function(): boolean
						-- upvalues: UseRefResult12 (upval), Current1 (upval)
						return UseRefResult12.current ~= Current1
					end)
				end)
			end
		end
	end, {
		Current3, v2, p1.createUniverseOnFirstPrompt, OnPromptFailureFunction,
		p1.onProjectResolved, SessionId, UseResult7, UseStateResult2,
		UseSignalStateResult, UseChatScrollModuleResult, UseResult17, UseResult5,
		UseResult2, UseStateResult2_2, UseContextResult
	})
	local UseRefResult28 = ReactModule.useRef(NoHydrateHistoryWhen)
	ReactModule.useEffect(function()
		-- upvalues: NoHydrateHistoryWhen (copy), UseRefResult28 (copy), IsIsLibraryChat (copy), IsAssistantResponding (copy), v8 (copy), UseChatScrollModuleResult (copy)
		local NoCurrent: boolean = NoHydrateHistoryWhen and not UseRefResult28.current
		UseRefResult28.current = NoHydrateHistoryWhen
		
		if IsIsLibraryChat then return end
		if not NoHydrateHistoryWhen then return end
		if NoCurrent or IsAssistantResponding or v8 ~= nil then
			UseChatScrollModuleResult.scrollToBottomUnconditionally()
			task.defer(UseChatScrollModuleResult.scrollToBottomUnconditionally)
			task.delay(0.15, UseChatScrollModuleResult.scrollToBottomUnconditionally)
			
			return
		end
	end, {
		NoHydrateHistoryWhen, IsIsLibraryChat, IsAssistantResponding, v8, #Messages,
		UseChatScrollModuleResult
	})
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult10 (copy), UseRefResult11 (copy), UseMemoResult (copy), SessionId (ref), UseStateResult8 (copy), GetBuildPromptDraftStoreModule (upval), Current3 (ref), UseRefResult16 (copy), UseRefResult12 (copy), FFlagBuildExperienceModelPickerModule (upval), UseResult19 (copy), UseRefResult8 (copy), PlaceId (ref), UseResult7 (copy), CreatorAgentChatModule1 (upval), FFlagBuildExperienceToolResultFailureRecoveryModule (upval), FFlagBuildExperienceAnswerFormModule (upval), UseResult4 (ref), UseResult (ref), UseResult2 (copy), UseChatScrollModuleResult (copy), UseMemoResult4 (copy), v8 (copy), CreatorAgentChatStore (copy), IsAssistantResponding (copy)
		if UseRefResult10.current ~= nil then
			local Current1 = UseRefResult11.current
			local SessionId1 = SessionId
			
			if Current1 ~= nil and Current1.session == UseMemoResult and (SessionId1 == nil or SessionId1 == "" or (Current1.sessionId == SessionId1 or Current1.sessionId == nil and Current1.session.getCasSessionId() == SessionId1)) then return end
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
		local function claimSubmittedDraft()
			-- upvalues: GetBuildPromptDraftStoreModule (upval), UseMemoResult (upval), Current3 (upval), UseRefResult16 (upval), UseRefResult12 (upval)
			local SubmittedDraft = GetBuildPromptDraftStoreModule(false).getSubmittedDraft(UseMemoResult)
			
			if SubmittedDraft ~= nil and SubmittedDraft.ownsDraft() and Current3 ~= nil and UseRefResult16.current == "" then
				local Current1 = Current3
				local Current2 = UseRefResult12.current
				local OwnsDraftFunction = SubmittedDraft.ownsDraft
				Current3.ownerSequence = Current2
				Current3.ownerRevision = Current3.revision
				
				function SubmittedDraft.ownsDraft(): boolean
					-- upvalues: OwnsDraftFunction (copy), Current1 (copy), Current2 (copy)
					return OwnsDraftFunction() and (Current1.ownerSequence == Current2 and Current1.ownerRevision == Current1.revision)
				end
			end
			return SubmittedDraft
		end
		
		if FFlagBuildExperienceModelPickerModule then
			local SubmittedDraft = GetBuildPromptDraftStoreModule(false).getSubmittedDraft(UseMemoResult)
			
			if SubmittedDraft ~= nil and SubmittedDraft.failure ~= nil then
				UseRefResult12.current += 1
				claimSubmittedDraft()
				local OwnsDraftResult = SubmittedDraft.ownsDraft()
				UseResult19(UseRefResult12.current, SubmittedDraft.failure, if OwnsDraftResult then SubmittedDraft.text else nil, if OwnsDraftResult then SubmittedDraft.images else nil, if OwnsDraftResult then SubmittedDraft.resourceAttachments else nil, UseMemoResult)
				
				return
			end
		end
		local function attachResumedTurn(ActiveTurnHandle, Current: number)
			-- upvalues: UseRefResult12 (upval), FFlagBuildExperienceModelPickerModule (upval), claimSubmittedDraft (copy), UseRefResult8 (upval), PlaceId (upval), UseResult7 (upval), CreatorAgentChatModule1 (upval), UseMemoResult (upval), UseResult19 (upval), FFlagBuildExperienceToolResultFailureRecoveryModule (upval), FFlagBuildExperienceAnswerFormModule (upval), UseResult4 (upval), UseResult (upval), UseResult2 (upval), UseChatScrollModuleResult (upval)
			UseRefResult12.current += 1
			local Current1 = UseRefResult12.current
			local ClaimSubmittedDraftResult = if FFlagBuildExperienceModelPickerModule then claimSubmittedDraft() else nil
			UseRefResult8.current = Current
			
			if PlaceId ~= nil then
				UseResult7(PlaceId, "Loading")
			end
			local ResumedAssistantTurn = CreatorAgentChatModule1.createResumedAssistantTurn(UseMemoResult, ActiveTurnHandle, function(p3)
				-- upvalues: ClaimSubmittedDraftResult (copy), UseResult19 (upval), Current1 (copy), UseMemoResult (upval)
				local OwnsDraftResult = ClaimSubmittedDraftResult ~= nil and ClaimSubmittedDraftResult.ownsDraft()
				UseResult19(Current1, p3, if OwnsDraftResult and ClaimSubmittedDraftResult ~= nil then ClaimSubmittedDraftResult.text else nil, if OwnsDraftResult and ClaimSubmittedDraftResult ~= nil then ClaimSubmittedDraftResult.images else nil, if OwnsDraftResult and ClaimSubmittedDraftResult ~= nil then ClaimSubmittedDraftResult.resourceAttachments else nil, UseMemoResult)
			end, if Current == nil then nil else Current - 1, if FFlagBuildExperienceToolResultFailureRecoveryModule or FFlagBuildExperienceAnswerFormModule then UseResult4(Current1) else nil, UseResult)
			UseResult2(ResumedAssistantTurn, UseMemoResult)
			ResumedAssistantTurn.start()
			UseChatScrollModuleResult.scrollToBottomUnconditionally()
		end
		
		if UseMemoResult4.activeTurnState == nil or UseMemoResult4.activeTurnItemIndex == nil or UseMemoResult4.activeTurnState.isDone then
			UseRefResult8.current = nil
			local ActiveTurnHandle = CreatorAgentChatStore.getActiveTurnHandle(Text)
			local StateResult = if ActiveTurnHandle == nil then nil else ActiveTurnHandle.state(false)
			local NoIsDone: boolean = ActiveTurnHandle ~= nil and (StateResult ~= nil and not StateResult.isDone)
			
			if not IsAssistantResponding and not NoIsDone then return end
			if NoIsDone then
				attachResumedTurn(ActiveTurnHandle, nil)
			end
			return
		else
			local ActiveTurnStartSequenceId = UseMemoResult4.activeTurnStartSequenceId
			
			if UseRefResult8.current == ActiveTurnStartSequenceId and v8 ~= nil then return end
			local ResumeTurnFromHistoryResult = CreatorAgentChatStore.resumeTurnFromHistory(Text, UseMemoResult4.activeTurnState, UseMemoResult4.activeTurnSequenceIds)
			
			if ResumeTurnFromHistoryResult ~= nil then
				attachResumedTurn(ResumeTurnFromHistoryResult, ActiveTurnStartSequenceId)
			end
		end
	end, {
		UseMemoResult4, UseMemoResult, SessionId, Current3, CreatorAgentChatStore,
		IsAssistantResponding, v8, PlaceId, UseResult7, UseResult19,
		UseChatScrollModuleResult, UseResult2, UseStateResult8, UseResult4, UseResult
	})
	local UseResult20 = ReactModule.useCallback(function(p3, Text, p4, Images, ResourceAttachments, Current1, AfterSequenceId, p5, Callback4, Callback1: () -> (), Callback3, Attempt, Callback2)
		-- upvalues: FFlagBuildExperienceModelPickerModule (upval), Current3 (ref), GetBuildPromptDraftStoreModule (upval), UseStateResult2_2 (copy), UseResult3 (ref), FFlagBuildExperiencePersistChatDraftModule (upval), UseResult16 (copy), SessionId (ref), FFlagBuildExperienceRestoreStoppedPromptModule (upval), UseRefResult23 (ref), FFlagBuildExperienceLibrary (upval), CreatorAgentChatModule1 (upval), UseRefResult10 (copy), UseRefResult12 (copy), UseResult2 (copy), UseRefResult8 (copy), UseResult7 (copy), UseResult19 (copy), FFlagBuildExperienceToolResultFailureRecoveryModule (upval), FFlagBuildExperienceAnswerFormModule (upval), UseResult4 (ref), UseResult (ref), UseChatScrollModuleResult (copy), UseRefResult6 (ref), Callback5 (ref), BeginBuildModelSendModule (upval), UseBuildModelSessionModuleResult (ref), CreatorCreditModule (upval), CreatorAgentChatModule (upval), v5 (ref), IsEnabled (upval), LocalizationStringsModule (upval), GetBuildCreatorCreditRefreshStoreModule (upval), OnPromptFailureFunction (ref), UseResult6 (copy), UseContextResult (copy)
		local function startAdmitted(p6)
			-- upvalues: FFlagBuildExperienceModelPickerModule (upval), Current3 (upval), p5 (copy), Text (copy), Images (copy), ResourceAttachments (copy), Current1 (copy), GetBuildPromptDraftStoreModule (upval), p3 (copy), UseStateResult2_2 (upval), AfterSequenceId (copy), UseResult3 (upval), FFlagBuildExperiencePersistChatDraftModule (upval), UseResult16 (upval), SessionId (upval), FFlagBuildExperienceRestoreStoppedPromptModule (upval), UseRefResult23 (upval), Callback4 (copy), FFlagBuildExperienceLibrary (upval), Callback3 (copy), Attempt (ref), CreatorAgentChatModule1 (upval), p4 (copy), UseRefResult10 (upval), UseRefResult12 (upval), UseResult2 (upval), UseRefResult8 (upval), UseResult7 (upval), Callback1 (copy), UseResult19 (upval), FFlagBuildExperienceToolResultFailureRecoveryModule (upval), FFlagBuildExperienceAnswerFormModule (upval), UseResult4 (upval), UseResult (upval), UseChatScrollModuleResult (upval)
			local v11: (() -> any)? = nil
			
			if FFlagBuildExperienceModelPickerModule and Current3 ~= nil then
				local Current2 = Current3
				local config = {
					text = p5 or Text,
					images = Images,
					resourceAttachments = ResourceAttachments,
					ownsDraft = function(): boolean
						-- upvalues: Current2 (copy), Current1 (upval)
						return Current2.ownerSequence == Current1 and Current2.ownerRevision == Current2.revision
					end
				}
				
				v11 = function()
					-- upvalues: config (copy)
					return config.ownsDraft()
				end
				
				GetBuildPromptDraftStoreModule(false).setSubmittedDraft(p3, config)
			end
			UseStateResult2_2({
				text = Text,
				images = Images,
				resourceAttachments = ResourceAttachments,
				afterSequenceId = AfterSequenceId
			})
			local UseResult1: (any) -> () = if FFlagBuildExperiencePersistChatDraftModule and p5 ~= nil then function(p7)
				-- upvalues: UseResult1 (copy), UseResult16 (upval), p5 (upval), p3 (upval), SessionId (upval)
				if UseResult1 ~= nil then
					UseResult1(p7)
				end
				UseResult16(p5, p3.getCasSessionId() or SessionId)
			end else UseResult3
			
			if FFlagBuildExperienceRestoreStoppedPromptModule and UseRefResult23 ~= nil then
				local UseRefResult = UseRefResult23
				
				UseResult1 = function(p7)
					-- upvalues: UseRefResult (copy), Current1 (upval), UseResult1 (copy)
					UseRefResult.current = Current1
					
					if UseResult1 ~= nil then
						UseResult1(p7)
					end
				end
			end
			if Callback4 ~= nil then
				UseResult1 = function(p7)
					-- upvalues: UseResult1 (copy), Callback4 (upval), p3 (upval)
					if UseResult1 ~= nil then
						UseResult1(p7)
					end
					Callback4(p3.getCasSessionId())
				end
			end
			local v12: () -> () = if FFlagBuildExperienceLibrary and Callback3 ~= nil then function()
				-- upvalues: FFlagBuildExperiencePersistChatDraftModule (upval), p5 (upval), UseResult16 (upval), p3 (upval), SessionId (upval), Callback3 (upval)
				if FFlagBuildExperiencePersistChatDraftModule and p5 ~= nil then
					UseResult16(p5, p3.getCasSessionId() or SessionId)
				end
				Callback3(p3.getCasSessionId())
			end else nil
			
			if FFlagBuildExperienceModelPickerModule and Attempt ~= nil then
				local Attempt1 = Attempt
				local Callback2 = UseResult1
				
				if Callback2 ~= nil then
					UseResult1 = function(p7)
						-- upvalues: Attempt1 (copy), Callback2 (copy)
						if Attempt1.isCurrent() then
							Callback2(p7)
						end
					end
				end
				local Callback = v12
				
				if Callback ~= nil then
					v12 = function()
						-- upvalues: Attempt1 (copy), Callback (copy)
						if Attempt1.isCurrent() then
							Callback()
						end
					end
				end
			end
			local LiveAssistantTurn = nil
			LiveAssistantTurn = CreatorAgentChatModule1.createLiveAssistantTurn(p3, p4, function(p7)
				-- upvalues: FFlagBuildExperienceModelPickerModule (upval), Attempt (upval), UseRefResult10 (upval), LiveAssistantTurn (ref), UseRefResult12 (upval), Current1 (upval), UseResult2 (upval), UseRefResult8 (upval), UseStateResult2_2 (upval), p3 (upval), UseResult7 (upval), Callback1 (upval), UseResult19 (upval), p5 (upval), Images (upval), ResourceAttachments (upval), v11 (ref)
				if FFlagBuildExperienceModelPickerModule and Attempt ~= nil then
					local IsCurrent = Attempt.isCurrent()
					Attempt.release()
					
					if not IsCurrent then
						if UseRefResult10.current == LiveAssistantTurn and UseRefResult12.current == Current1 then
							UseResult2(nil)
							UseRefResult8.current = nil
							UseStateResult2_2(nil)
							
							if p3.placeId ~= nil then
								UseResult7(p3.placeId, "Idle")
							end
						end
						if Callback1 ~= nil then
							Callback1()
						end
						return
					end
				end
				UseResult19(Current1, p7, p5, Images, ResourceAttachments, p3, v11)
				
				if Callback1 ~= nil then
					Callback1()
				end
			end, if FFlagBuildExperienceToolResultFailureRecoveryModule or FFlagBuildExperienceAnswerFormModule then UseResult4(Current1) else nil, UseResult, UseResult1, v12, if FFlagBuildExperienceModelPickerModule then p6 else nil, if FFlagBuildExperienceModelPickerModule and p6 ~= nil then p6.sessionId else nil, if FFlagBuildExperienceModelPickerModule and Attempt ~= nil then function(): boolean
				-- upvalues: Attempt (upval)
				return not Attempt.isCurrent()
			end else nil)
			
			if p3.placeId ~= nil then
				UseResult7(p3.placeId, "Loading")
			end
			UseResult2(LiveAssistantTurn, p3)
			UseChatScrollModuleResult.scrollToBottomAfterSend()
			LiveAssistantTurn.start()
		end
		
		if not FFlagBuildExperienceModelPickerModule then
			startAdmitted(nil)
			
			return
		end
		local UseRefResult = UseRefResult6
		local Callback: (any) -> () = Callback5
		Attempt = Attempt or BeginBuildModelSendModule(if UseBuildModelSessionModuleResult == nil then nil else UseBuildModelSessionModuleResult.entry, CreatorCreditModule.getCreatorCreditStore(false), CreatorAgentChatModule.experimentOverride.getPromptExperiment(CreatorAgentChatModule.experimentOverride.getKey(p3.getCasSessionId()) or v5), IsEnabled and (v5 ~= nil and CreatorAgentChatModule.experimentOverride.getInternalSelection(CreatorAgentChatModule.experimentOverride.getKey(p3.getCasSessionId()) or v5, false).isSelected))
		
		if Attempt ~= nil then
			local Attempt1 = Attempt
			local Current2 = {
				started = false,
				attempt = Attempt1,
				onTerminal = Callback1
			}
			UseRefResult.current = Current2
			Callback(true)
			task.spawn(function()
				-- upvalues: Attempt1 (copy), p3 (copy), UseRefResult12 (upval), Current1 (copy), UseRefResult (copy), Current2 (copy), Callback (copy), UseStateResult2_2 (upval), LocalizationStringsModule (upval), CreatorAgentChatModule1 (upval), GetBuildCreatorCreditRefreshStoreModule (upval), OnPromptFailureFunction (upval), UseResult6 (upval), UseContextResult (upval), Callback1 (copy), Callback2 (copy), startAdmitted (copy)
				local Success, Result, Result3 = pcall(Attempt1.prepare, p3)
				local Inverted: boolean = not Attempt1.isCurrent() or UseRefResult12.current ~= Current1
				
				if Inverted or not Success or Result == nil then
					Attempt1.release()
					
					if UseRefResult.current == Current2 then
						UseRefResult.current = nil
						Callback(false)
						UseStateResult2_2(nil)
					end
					if not Inverted then
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
						UseResult6(UseContextResult:Format(CHATDEFAULTFAILURE))
					end
					if Callback1 ~= nil then
						Callback1()
					end
					return
				else
					Callback(false)
					Current2.started = true
					
					if Callback2 ~= nil then
						Callback2()
					end
					startAdmitted(Result)
				end
			end)
			
			return
		elseif Callback1 ~= nil then
			Callback1()
		end
	end, {
		UseBuildModelSessionModuleResult, v5, UseRefResult6, Current3,
		UseMemoResult1, Callback5, UseResult6, UseContextResult,
		OnPromptFailureFunction, UseResult19, UseResult7, UseChatScrollModuleResult,
		UseResult2, UseStateResult2_2, UseResult4, UseResult, UseResult3, UseResult16,
		SessionId
	})
	local UseRefResult29 = ReactModule.useRef(UseMemoResult4.latestSequenceId)
	UseRefResult29.current = UseMemoResult4.latestSequenceId
	local UseAgentRollbackRequestModuleResult = UseAgentRollbackRequestModule({
		universeId = UniverseId,
		placeId = PlaceId,
		session = UseMemoResult,
		activeTurnHandleRef = UseRefResult10,
		startRollbackTurn = ReactModule.useCallback(function(p3, Callback1, Callback: () -> ())
			-- upvalues: UseMemoResult (copy), FFlagBuildExperienceModelPickerModule (upval), UseRefResult6 (ref), UseChatScrollModuleResult (copy), UseRefResult12 (copy), UseStateResult2_3 (copy), BuildAgentRollbackPromptModule (upval), UseResult20 (copy), UseRefResult29 (copy)
			if UseMemoResult == nil then
				Callback()
				
				return
			end
			if FFlagBuildExperienceModelPickerModule then
				local Current = UseRefResult6.current
				
				if Current ~= nil and not Current.started and Current.attempt.isCurrent() then
					Callback()
					
					return
				end
			end
			UseChatScrollModuleResult.captureStickToBottomForSend()
			UseRefResult12.current += 1
			local Current = UseRefResult12.current
			UseStateResult2_3(nil)
			local AgentRollbackPromptModule = BuildAgentRollbackPromptModule(p3.versionNumber, p3.noteTitle, p3.noteDescription)
			UseResult20(UseMemoResult, AgentRollbackPromptModule, AgentRollbackPromptModule, nil, nil, Current, UseRefResult29.current, nil, function()
				-- upvalues: UseChatScrollModuleResult (upval), Callback1 (copy)
				UseChatScrollModuleResult.scrollToBottomUnconditionally()
				Callback1()
			end, Callback)
		end, {
			UseMemoResult,
			UseRefResult6,
			UseChatScrollModuleResult,
			UseStateResult2_3,
			UseResult20
		})
	})
	ReactModule.useLayoutEffect(function()
		-- upvalues: UseStateResult9 (copy), UseRefResult11 (copy), UseMemoResult (copy), SessionId (ref), UseRefResult12 (copy), UseRefResult8 (copy), UseAgentRollbackRequestModuleResult (copy), UseResult7 (copy), FFlagBuildExperienceModelPickerModule (upval), UseRefResult6 (ref), UseResult2 (copy), UseStateResult2_2 (copy), UseStateResult2_3 (copy)
		if UseStateResult9 ~= nil then
			local Current = UseRefResult11.current
			local SessionId1 = SessionId
			
			if Current == nil or Current.session ~= UseMemoResult or SessionId1 ~= nil and SessionId1 ~= "" and (Current.sessionId ~= SessionId1 and (Current.sessionId ~= nil or Current.session.getCasSessionId() ~= SessionId1)) then
				local Current1 = UseRefResult11.current
				UseRefResult12.current += 1
				UseRefResult8.current = nil
				
				if UseAgentRollbackRequestModuleResult.stopRequestBeforeReceipt(UseStateResult9) then
					if Current1 ~= nil and Current1.session.placeId ~= nil then
						UseResult7(Current1.session.placeId, "Idle")
					end
				else
					UseStateResult9.detach()
					
					if FFlagBuildExperienceModelPickerModule then
						local UseRefResult = UseRefResult6
						local Current2 = UseRefResult.current
						
						if Current2 ~= nil and Current2.started then
							Current2.attempt.unlockSelection()
							UseRefResult.current = nil
						end
					end
				end
				UseResult2(nil, nil)
				UseStateResult2_2(nil)
				UseStateResult2_3(nil)
				
				return
			end
		end
	end, {
		UseMemoResult, SessionId, UseStateResult9, UseResult2,
		UseAgentRollbackRequestModuleResult, UseResult7, UseRefResult6
	})
	local UseResult21 = ReactModule.useCallback(function(Text, p3, Images, ResourceAttachments, Current, AfterSequenceId, p4, p5)
		-- upvalues: UseStateResult2_2 (copy), FFlagBuildExperienceModelPickerModule (upval), p1 (copy), GetBuildModelSelectionStoreModule (upval), v4 (ref), UseMemoResult1 (ref), UseBuildModelSessionModuleResult (ref), UniverseCreateModule (upval), GetDefaultTemplatePlaceIdModule (upval), Debug (upval), FFlagBuildExperiencePromptFailureTelemetry (upval), UseRefResult12 (copy), UniverseConfigurationModule (upval), UseSignalStateResult (ref), UseStateResult2 (copy), CreatorAgentChatStore (copy), SessionId (ref), IsEnabled (upval), CreatorAgentChatModule (upval), v5 (ref), v6 (ref), UseResult20 (copy), LocalizationStringsModule (upval), ChatConstantsModule (upval), RequestFailureKind (upval), SendBuildExperienceEventModule (upval), UseResult2 (copy), UseResult17 (copy), FFlagBuildExperienceChatImageAttachmentsModule (upval), UseRefResult3 (copy), FFlagBuildExperienceChatResourceAttachments (upval), UseRefResult1 (copy), Callback5 (ref), UseResult5 (copy), FormatResult (copy)
		UseStateResult2_2({
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
		local Callback: (any) -> () = v4
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
			-- upvalues: FFlagBuildExperienceModelPickerModule (upval), UniverseId (ref), Debug (upval), ClockTime (copy), FFlagBuildExperiencePromptFailureTelemetry (upval), Config (ref), Entry (copy), UseRefResult12 (upval), Current (copy), UniverseConfigurationModule (upval), UseMemoResult (copy), UseSignalStateResult (upval), UseStateResult2 (upval), p1 (upval), p4 (copy), CreatorAgentChatStore (upval), SessionId (upval), IsEnabled (upval), CreatorAgentChatModule (upval), v5 (upval), v6 (upval), UseResult20 (upval), Text (copy), p3 (copy), Images (copy), ResourceAttachments (copy), AfterSequenceId (copy), p5 (copy)
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
			if if FFlagBuildExperienceModelPickerModule then not (Entry ~= nil and Entry.getSelection(false) ~= nil) else UseRefResult12.current ~= Current then
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
					-- upvalues: FFlagBuildExperienceModelPickerModule (upval), Entry (upval), UseMemoResult (upval), UseRefResult12 (upval), Current (upval), Result (copy), UseSignalStateResult (upval), UseStateResult2 (upval), p1 (upval), p4 (upval), CreatorAgentChatStore (upval), SessionId (upval), IsEnabled (upval), CreatorAgentChatModule (upval), v5 (upval), v6 (upval), UseResult20 (upval), Text (upval), p3 (upval), Images (upval), ResourceAttachments (upval), AfterSequenceId (upval), p5 (upval)
					if if FFlagBuildExperienceModelPickerModule then not (Entry ~= nil and Entry.getSelection(false) ~= nil) or (UseMemoResult == nil or not UseMemoResult.mounted) else UseRefResult12.current ~= Current then
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
					
					if IsEnabled and (FFlagBuildExperienceModelPickerModule and CreatorAgentChatModule.experimentOverride.has(v5) or v6 ~= nil and v6.current) then
						SessionForProject.setPendingExperimentKey(v5)
					end
					UseResult20(SessionForProject, Text, p3, Images, ResourceAttachments, Current, AfterSequenceId, Text, nil, nil, nil, p4, p5)
					
					return nil
				end)
			end
		end):catch(function(Err)
			-- upvalues: Debug (upval), ClockTime (copy), UseRefResult12 (upval), Current (copy), p4 (copy), FFlagBuildExperiencePromptFailureTelemetry (upval), Config (ref), LocalizationStringsModule (upval), ChatConstantsModule (upval), RequestFailureKind (upval), SendBuildExperienceEventModule (upval), UseResult2 (upval), UseStateResult2_2 (upval), FFlagBuildExperienceModelPickerModule (upval), UseResult17 (upval), Text (copy), FFlagBuildExperienceChatImageAttachmentsModule (upval), Images (copy), UseRefResult3 (upval), FFlagBuildExperienceChatResourceAttachments (upval), ResourceAttachments (copy), UseRefResult1 (upval), Callback5 (upval), UseResult5 (upval), FormatResult (upval)
			Debug.log("warn", "build_experience create_or_configure_universe failed", {
				durationMs = math.floor((os.clock() - ClockTime) * 1000 + 0.5),
				error = Err
			})
			
			if UseRefResult12.current ~= Current or p4 ~= nil and not p4.isCurrent() then return end
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
			
			if not FFlagBuildExperienceModelPickerModule then
				UseResult17(Text)
				
				if FFlagBuildExperienceChatImageAttachmentsModule and Images ~= nil then
					UseRefResult3.current(Images)
				end
				if FFlagBuildExperienceChatResourceAttachments and ResourceAttachments ~= nil then
					UseRefResult1.current(ResourceAttachments)
				end
			end
			if p4 ~= nil then
				p4.release()
				Callback5(false)
			end
			UseResult5(FormatResult)
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
		UseMemoResult1, UseBuildModelSessionModuleResult, v4, Callback5, SessionId,
		CreatorAgentChatStore, p1.onProjectResolved, p1.modelSelectionDraftId,
		UseResult2, UseResult17, UseResult5, UseStateResult2, UseSignalStateResult,
		UseStateResult2_2, UseResult20, FormatResult, v5, v6
	})
	local UseResult22 = ReactModule.useCallback(function(p3): boolean
		-- upvalues: NoSendMessageWhen (copy), UseMemoResult1 (ref), Current3 (ref), UseRefResult16 (copy), FFlagBuildExperienceChatImageAttachmentsModule (upval), UseRefResult13 (ref), FFlagBuildExperienceChatResourceAttachments (upval), UseRefResult14 (ref), UseResult17 (copy), UseRefResult11 (copy), UseMemoResult (copy), SessionId (ref), UseRefResult10 (copy), IsAssistantResponding (copy), IsIsLibraryChat (copy), UseRefResult26 (copy), UseChatScrollModuleResult (copy), p1 (copy), UniverseId (ref), PlaceId (ref), AgentRollbackRequestStoreModule (copy), FFlagBuildExperienceModelPickerModule (upval), UseResult5 (copy), BeginBuildModelSendModule (upval), UseBuildModelSessionModuleResult (ref), CreatorCreditModule (upval), CreatorAgentChatModule (upval), v5 (ref), IsEnabled (upval), UseRefResult6 (ref), Callback5 (ref), UseRefResult12 (copy), UseStateResult2_3 (copy), FFlagBuildExperiencePersistChatDraftModule (upval), UseResult15 (copy), UseResult11 (copy), UseRefResult3 (copy), UseRefResult1 (copy), UseResult21 (copy), UseMemoResult4 (copy), UseResult20 (copy), FFlagBuildExperienceLibrary (upval)
		if not NoSendMessageWhen then
			return false
		end
		if UseMemoResult1 ~= nil and UseMemoResult1.pending then
			return false
		end
		local Revision = if Current3 == nil then nil else Current3.revision
		local Current1: string = UseRefResult16.current
		local Replaced = string.gsub(Current1, "^%s*(.-)%s*$", "%1")
		local Current2 = if FFlagBuildExperienceChatImageAttachmentsModule then UseRefResult13.current else {}
		local Current3 = if FFlagBuildExperienceChatResourceAttachments then UseRefResult14.current else {}
		
		if Replaced == "" and #Current2 == 0 then
			UseResult17("")
			
			return false
		end
		if FFlagBuildExperienceChatImageAttachmentsModule then
			for _, value1 in Current2 do
				if value1.uri == nil or value1.uploadStatus == "uploading" or value1.uploadStatus == "failed" then
					return false
				end
			end
		end
		local Current4 = UseRefResult11.current
		local SessionId1 = SessionId
		local NoSessionId: boolean = Current4 ~= nil and Current4.session == UseMemoResult and (SessionId1 == nil or SessionId1 == "" or (Current4.sessionId == SessionId1 or Current4.sessionId == nil and Current4.session.getCasSessionId() == SessionId1))
		local Current5 = if NoSessionId then UseRefResult10.current else nil
		
		if IsAssistantResponding or IsIsLibraryChat and Current5 ~= nil then
			if FFlagBuildExperienceChatImageAttachmentsModule and #Current2 > 0 or FFlagBuildExperienceChatResourceAttachments and #Current3 > 0 then
				return false
			end
			if Current5 == nil or not Current5.trySubmitComposerText(Replaced) then
				return false
			end
			UseResult17("")
			
			if UseRefResult26.current then
				UseRefResult26.current.releaseFocus()
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
			local Attempt = nil
			
			if FFlagBuildExperienceModelPickerModule then
				UseResult5(nil)
				Attempt = BeginBuildModelSendModule(if UseBuildModelSessionModuleResult == nil then nil else UseBuildModelSessionModuleResult.entry, CreatorCreditModule.getCreatorCreditStore(false), CreatorAgentChatModule.experimentOverride.getPromptExperiment(CreatorAgentChatModule.experimentOverride.getKey(if UseMemoResult == nil then nil else UseMemoResult.getCasSessionId()) or v5), IsEnabled and (v5 ~= nil and CreatorAgentChatModule.experimentOverride.getInternalSelection(CreatorAgentChatModule.experimentOverride.getKey(if UseMemoResult == nil then nil else UseMemoResult.getCasSessionId()) or v5, false).isSelected))
				
				if Attempt == nil then
					return false
				end
				UseRefResult6.current = { started = false, attempt = Attempt }
				Callback5(true)
			end
			UseChatScrollModuleResult.captureStickToBottomForSend()
			UseRefResult12.current += 1
			local Current6 = UseRefResult12.current
			UseStateResult2_3(nil)
			
			if FFlagBuildExperiencePersistChatDraftModule then
				UseResult15(Replaced)
			end
			local function clearAdmittedDraft()
				-- upvalues: Current3 (upval), Revision (copy), UseRefResult16 (upval), Current1 (copy), UseResult11 (upval), FFlagBuildExperienceChatImageAttachmentsModule (upval), UseRefResult13 (upval), Current2 (copy), UseRefResult3 (upval), FFlagBuildExperienceChatResourceAttachments (upval), UseRefResult14 (upval), Current3 (copy), UseRefResult1 (upval), Current6 (copy), UseRefResult26 (upval)
				local Current4 = Current3
				
				if Current4 == nil or Current4.revision ~= Revision then return end
				if UseRefResult16.current == Current1 then
					UseResult11("")
				end
				if FFlagBuildExperienceChatImageAttachmentsModule and UseRefResult13.current == Current2 then
					UseRefResult3.current({})
				end
				if FFlagBuildExperienceChatResourceAttachments and UseRefResult14.current == Current3 then
					UseRefResult1.current({})
				end
				Current4.ownerSequence = Current6
				Current4.ownerRevision = Current4.revision
				
				if UseRefResult26.current then
					UseRefResult26.current.releaseFocus()
				end
			end
			
			if not FFlagBuildExperienceModelPickerModule then
				UseResult11("")
				
				if FFlagBuildExperienceChatImageAttachmentsModule then
					UseRefResult3.current({})
				end
				if FFlagBuildExperienceChatResourceAttachments then
					UseRefResult1.current({})
				end
				if UseRefResult26.current then
					UseRefResult26.current.releaseFocus()
				end
			end
			local function startPrompt(Replaced1, p4)
				-- upvalues: NoUniverseId (copy), UseResult21 (upval), Replaced (copy), Current3 (copy), Current6 (copy), UseMemoResult4 (upval), Attempt (ref), FFlagBuildExperienceModelPickerModule (upval), clearAdmittedDraft (copy), UseResult20 (upval), UseMemoResult (upval), FFlagBuildExperienceLibrary (upval), p3 (copy)
				if NoUniverseId then
					UseResult21(Replaced, Replaced1, p4, Current3, Current6, UseMemoResult4.latestSequenceId, Attempt, if FFlagBuildExperienceModelPickerModule then clearAdmittedDraft else nil)
					
					return
				else
					UseResult20(UseMemoResult, Replaced, Replaced1, p4, Current3, Current6, UseMemoResult4.latestSequenceId, Replaced, nil, nil, if FFlagBuildExperienceLibrary then p3 else nil, Attempt, if FFlagBuildExperienceModelPickerModule then clearAdmittedDraft else nil)
				end
			end
			
			if #Current2 == 0 and #Current3 == 0 then
				startPrompt(Replaced, nil)
				
				return true
			end
			local List = {}
			
			if Replaced ~= "" then
				table.insert(List, { type = "text", text = Replaced })
			end
			for _, value in Current3 do
				if value.type == "resource_link" then
					table.insert(List, {
						type = value.type,
						uri = value.uri,
						name = value.name,
						mimeType = value.mimeType
					})
				else
					table.insert(List, {
						type = value.type,
						resource = {
							blob = nil,
							uri = value.resource.uri,
							text = value.resource.text,
							mimeType = value.resource.mimeType
						}
					})
				end
			end
			local List1 = {}
			
			for _, value2 in Current2 do
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
		NoSendMessageWhen, Current3, UseMemoResult1, UseBuildModelSessionModuleResult,
		v5, UseRefResult6, Callback5, UseResult5, UseMemoResult, SessionId,
		UniverseId, PlaceId, IsAssistantResponding, IsIsLibraryChat,
		UseChatScrollModuleResult, UseResult17, UseResult11, UseResult15, UseResult21,
		UseResult20, p1.createUniverseOnFirstPrompt, UseStateResult2_3,
		UseMemoResult4, AgentRollbackRequestStoreModule
	})
	local UseResult23 = ReactModule.useCallback(function()
		-- upvalues: FFlagBuildExperienceModelPickerModule (upval), UseRefResult6 (ref), Callback5 (ref), UseRefResult12 (copy), UseStateResult2_2 (copy), UseRefResult11 (copy), UseMemoResult (copy), SessionId (ref), UseRefResult10 (copy), UseAgentRollbackRequestModuleResult (copy), FFlagBuildExperiencePromptFailureTelemetry (upval), UseResult2 (copy), UseRefResult8 (copy), FFlagBuildExperienceRestoreStoppedPromptModule (upval), UseRefResult23 (ref), UseStateResult6 (copy), UseRefResult16 (copy), UseMemoResult4 (copy), UseResult17 (copy), FFlagBuildExperienceChatImageAttachmentsModule (upval), UseRefResult13 (ref), UseRefResult3 (copy), FFlagBuildExperienceChatResourceAttachments (upval), UseRefResult14 (ref), UseRefResult1 (copy), UseStateResult2_3 (copy), PlaceId (ref), UseResult7 (copy)
		if FFlagBuildExperienceModelPickerModule then
			local UseRefResult = UseRefResult6
			local Current = UseRefResult.current
			
			if Current ~= nil and not Current.started then
				Current.attempt.release()
				UseRefResult.current = nil
				Callback5(false)
				
				if not Current.started then
					UseRefResult12.current += 1
					UseStateResult2_2(nil)
					
					if Current.onTerminal ~= nil then
						Current.onTerminal()
					end
					return
				end
			end
		end
		local Current1 = UseRefResult11.current
		local SessionId1 = SessionId
		local NoSessionId: boolean = Current1 ~= nil and Current1.session == UseMemoResult and (SessionId1 == nil or SessionId1 == "" or (Current1.sessionId == SessionId1 or Current1.sessionId == nil and Current1.session.getCasSessionId() == SessionId1))
		local Current2 = if NoSessionId then UseRefResult10.current else nil
		
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
			local Current = UseRefResult12.current
			UseRefResult12.current += 1
			
			if FFlagBuildExperiencePromptFailureTelemetry and Current2.reportUserStop ~= nil then
				Current2.reportUserStop()
			end
			if not UseAgentRollbackRequestModuleResult.stopRequestBeforeReceipt(Current2) then
				Current2.stop()
			end
			UseResult2(nil)
			UseRefResult8.current = nil
			
			if FFlagBuildExperienceRestoreStoppedPromptModule and UseRefResult23 ~= nil and UseRefResult23.current ~= Current and UseStateResult6 ~= nil and UseRefResult16.current == "" and UseMemoResult4.isAwaitingUserMessageEcho then
				UseResult17(UseStateResult6.text)
				
				if FFlagBuildExperienceChatImageAttachmentsModule and UseStateResult6.images ~= nil and #UseRefResult13.current == 0 then
					UseRefResult3.current(UseStateResult6.images)
				end
				if FFlagBuildExperienceChatResourceAttachments and UseStateResult6.resourceAttachments ~= nil and #UseRefResult14.current == 0 then
					UseRefResult1.current(UseStateResult6.resourceAttachments)
				end
			end
			UseStateResult2_2(nil)
			UseStateResult2_3({
				session = UseMemoResult,
				sessionId = UseMemoResult.getCasSessionId(),
				startSequenceId = UseMemoResult4.activeTurnStartSequenceId
			})
			
			if PlaceId ~= nil then
				UseResult7(PlaceId, "Idle")
			end
		end
	end, {
		UseRefResult6, Callback5, UseMemoResult, SessionId, PlaceId, UseResult7,
		UseResult2, UseStateResult2_2, UseStateResult2_3, UseMemoResult4,
		UseAgentRollbackRequestModuleResult,
		if FFlagBuildExperienceRestoreStoppedPromptModule then UseStateResult6 else nil,
		if FFlagBuildExperienceRestoreStoppedPromptModule then UseResult17 else nil
	})
	local NoAutoFocusComposer = p1.autoFocusComposer == nil or p1.autoFocusComposer
	local NoAutoFocusComposer1 = if p1.focusComposerWhen == nil then NoAutoFocusComposer else p1.focusComposerWhen
	ReactModule.useEffect(function()
		-- upvalues: NoAutoFocusComposer (copy), NoAutoFocusComposer1 (copy), UseRefResult26 (copy)
		if NoAutoFocusComposer and NoAutoFocusComposer1 then
			local Flag = false
			
			local function v433()
				-- upvalues: Flag (ref)
				return Flag
			end
			
			local v11 = 8
			
			local function tryFocus()
				-- upvalues: v433 (copy), UseRefResult26 (copy), v11 (ref), tryFocus (copy)
				if v433() then return end
				local Current = UseRefResult26.current
				
				if Current then
					Current.focus()
					
					return
				end
				v11 -= 1
				
				if v11 > 0 then
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
		-- upvalues: PlaceId (ref), v1 (ref), FFlagBuildExperiencePersistPlaytestLogsModule (upval), FFlagBuildExperienceClientDataModelTools (upval), LaunchPlaytestWithLoadingStateModule (upval)
		if PlaceId == nil then return end
		local v11 = v1
		local v12: (() -> ())? = nil
		
		if (FFlagBuildExperiencePersistPlaytestLogsModule or FFlagBuildExperienceClientDataModelTools) and (game.GameId == 0 and v11 ~= nil) then
			v12 = function()
				-- upvalues: v11 (copy)
				v11.current = true
			end
		end
		if LaunchPlaytestWithLoadingStateModule(PlaceId, p4, true, v12) and v12 ~= nil and v11 ~= nil then
			v11.current = false
		end
	end, { PlaceId, v1 })
	local UseMemoResult5 = nil
	UseMemoResult5 = if FFlagBuildExperienceAnswerFormModule then ReactModule.useMemo(function()
		-- upvalues: UseSignalStateResult3 (copy), UseResult5 (copy)
		local OnAnswerSelectedByToolCallId = {}
		
		for i, value in UseSignalStateResult3.onAnswerSelectedByToolCallId do
			OnAnswerSelectedByToolCallId[i] = function(p4, p5, p6)
				-- upvalues: UseResult5 (upval), value (copy)
				UseResult5(nil)
				value(p4, p5, p6)
			end
		end
		local OnAnswerConfirmedByToolCallId = {}
		
		for i1, value1 in UseSignalStateResult3.onAnswerConfirmedByToolCallId do
			OnAnswerConfirmedByToolCallId[i1] = function()
				-- upvalues: UseResult5 (upval), value1 (copy)
				UseResult5(nil)
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
	end, { UseSignalStateResult3, UseResult5 }) else UseSignalStateResult3
	
	return {
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
			-- upvalues: UseRefResult10 (copy), UseRefResult11 (copy), UseMemoResult (copy), SessionId (ref), UseResult5 (copy)
			local Current = UseRefResult10.current
			
			if Current ~= nil then
				local Current1 = UseRefResult11.current
				local SessionId1 = SessionId
				
				if Current1 ~= nil and Current1.session == UseMemoResult and (SessionId1 == nil or SessionId1 == "" or (Current1.sessionId == SessionId1 or Current1.sessionId == nil and Current1.session.getCasSessionId() == SessionId1)) then
					UseResult5(nil)
					
					return Current.trySubmitAnswerText(p4, p5, p6)
				end
			end
			return false
		end, { UseMemoResult, SessionId, UseResult5 }) else nil,
		composerText = UseBindingResult,
		composerErrorText = UseStateResult11,
		fundingFailure = FundingFailure,
		setComposerText = UseResult17,
		setPrefilledComposerText = UseResult18,
		composerImages = if FFlagBuildExperienceChatImageAttachmentsModule then UseStateResult10 else {},
		setComposerImages = setComposerImages,
		retryComposerImage = retryComposerImage,
		composerResourceAttachments = if FFlagBuildExperienceChatResourceAttachments then t else {},
		findComposerResourceAttachmentIndexByUri = findComposerResourceAttachmentIndexByUri,
		addComposerResourceAttachment = addComposerResourceAttachment,
		removeComposerResourceAttachmentAtIndex = removeComposerResourceAttachmentAtIndex,
		clearComposerResourceAttachments = clearComposerResourceAttachments,
		hasPreparedModelSession = if FFlagBuildExperienceModelPickerModule then UseBuildModelSessionModuleResult ~= nil and UseBuildModelSessionModuleResult.hasObservedModels else nil,
		modelSessionModels = if FFlagBuildExperienceModelPickerModule and UseBuildModelSessionModuleResult ~= nil then UseBuildModelSessionModuleResult.models else nil,
		isComposerSendBlocked = FFlagBuildExperienceChatImageAttachmentsModule and Flag or FFlagBuildExperienceModelPickerModule and (v3 or (UseStateResult5 or (if UseBuildModelSessionModuleResult == nil or not UseBuildModelSessionModuleResult.isBusy then UseStateResult11 ~= nil and not UseStateResult12 else not IsAssistantResponding or UseStateResult11 ~= nil and not UseStateResult12))),
		isAssistantResponding = IsAssistantResponding,
		canStopAssistantResponse = v8 ~= nil or (UseSignalStateResult6 or FFlagBuildExperienceModelPickerModule and UseStateResult5),
		canSendWhileResponding = HasPendingLocalToolResponse,
		sendMessage = UseResult22,
		stopAssistantResponse = UseResult23,
		setScrollingFrame = UseChatScrollModuleResult.setScrollingFrame,
		anchorScrollToInstance = if FFlagBuildExperienceChatAccordionScrollAnchorModule then UseChatScrollModuleResult.anchorToInstance else nil,
		textBoxRef = UseRefResult26,
		clockBinding = UseClockResult,
		playtestPlaceId = PlaceId,
		launchPlaytest = if PlaceId == nil then nil else UseResult24,
		hasPublishedTurn = IncludesPublishTool,
		subagentTaskState = SubagentTaskState,
		isHistoryLoading = NoNoIsLoading,
		isHistoryExhausted = NoHasNextHistoryPageToken
	}
end