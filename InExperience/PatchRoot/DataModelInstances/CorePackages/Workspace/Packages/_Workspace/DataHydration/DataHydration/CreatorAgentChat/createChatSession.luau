local Parent = script:FindFirstAncestor("DataHydration").Parent
local SignalsModule = require(Parent.Signals)
local SharedFlagsModule = require(Parent.SharedFlags)
local AcpProtocolModule = require(script.Parent.Acp.AcpProtocol)
local ClassifyRequestFailureModule = require(script.Parent.classifyRequestFailure)
local ExperimentOverrideModule = require(script.Parent.experimentOverride)
local SessionHistoryMergeModule = require(script.Parent.sessionHistoryMerge)
local _ = require(script.Parent.types)
local ConstantsModule = require(script.Parent.ChatSession.constants)
local HistoryLoaderModule = require(script.Parent.ChatSession.historyLoader)
local HistoryPageUtilsModule = require(script.Parent.ChatSession.historyPageUtils)
local HistoryPollingModule = require(script.Parent.ChatSession.historyPolling)
local SendPromptModule = require(script.Parent.ChatSession.sendPrompt)
local SessionHistoryCacheModule = require(script.Parent.ChatSession.sessionHistoryCache)
local SessionScalarStateModule = require(script.Parent.ChatSession.sessionScalarState)
local _ = require(script.Parent.ChatSession.sessionDeps)
local FFlagBuildExperiencePinForBuild = SharedFlagsModule.FFlagBuildExperiencePinForBuild
local FFlagBuildExperiencePromptFailureTelemetry = SharedFlagsModule.FFlagBuildExperiencePromptFailureTelemetry

return function(Deps, UniverseId, PlaceId, p1) --[[ Line: 39 | Named "createChatSession" ]]
	-- upvalues: SessionScalarStateModule (copy), ConstantsModule (copy), SessionHistoryCacheModule (copy), ExperimentOverrideModule (copy), SessionHistoryMergeModule (copy), SignalsModule (copy), HistoryPageUtilsModule (copy), HistoryLoaderModule (copy), HistoryPollingModule (copy), AcpProtocolModule (copy), FFlagBuildExperiencePromptFailureTelemetry (copy), ClassifyRequestFailureModule (copy), FFlagBuildExperiencePinForBuild (copy), SendPromptModule (copy)
	local LoadedBySequenceId = {}
	local OverlayBySequenceId = {}
	local SessionScalarState = SessionScalarStateModule.createSessionScalarState(p1)
	local Callback = nil
	local RpcTimeoutSeconds = Deps.rpcTimeoutSeconds or ConstantsModule.getRpcTimeoutSeconds()
	local SessionHistoryCache = SessionHistoryCacheModule.createSessionHistoryCache()
	local Count = 0
	local PendingExperimentKey = nil
	local Experiment = nil
	
	local function _() --[[ Line: 61 | Named "getExperimentKey" ]]
		-- upvalues: ExperimentOverrideModule (upval), SessionScalarState (copy), PendingExperimentKey (ref)
		return ExperimentOverrideModule.getKey(SessionScalarState.getCasSessionId(false)) or PendingExperimentKey
	end
	
	local _ = function() --[[ Line: 65 | Named "captureSessionNewExperiment" ]]
		-- upvalues: Experiment (ref), ExperimentOverrideModule (upval), SessionScalarState (copy), PendingExperimentKey (ref)
		Experiment = if ExperimentOverrideModule.isEnabled() then ExperimentOverrideModule.getExperiment(ExperimentOverrideModule.getKey(SessionScalarState.getCasSessionId(false)) or PendingExperimentKey) else nil
	end
	
	local function buildMergedHistory() --[[ Line: 71 ]]
		-- upvalues: SessionHistoryMergeModule (upval), LoadedBySequenceId (ref), OverlayBySequenceId (ref)
		return SessionHistoryMergeModule.orderMergedHistoryItems(LoadedBySequenceId, OverlayBySequenceId)
	end
	
	local Signal, Signal2 = SignalsModule.createSignal(buildMergedHistory())
	
	local function snapshotActiveSession() --[[ Line: 94 ]]
		-- upvalues: SessionScalarState (copy), LoadedBySequenceId (ref), OverlayBySequenceId (ref)
		local CasSessionId = SessionScalarState.getCasSessionId(false)
		
		return if CasSessionId == nil or CasSessionId == "" then nil else {
			loadedBySequenceId = LoadedBySequenceId,
			overlayBySequenceId = OverlayBySequenceId,
			hasLoadedHistory = SessionScalarState.getHasLoadedHistory(false),
			nextHistoryPageToken = SessionScalarState.getNextHistoryPageToken(false),
			latestObservedHistorySequenceId = SessionScalarState.getLatestObservedHistorySequenceId(false)
		}
	end
	
	local _ = function() --[[ Line: 108 | Named "saveActiveSessionToCache" ]]
		-- upvalues: SessionScalarState (copy), snapshotActiveSession (copy), SessionHistoryCache (copy)
		local CasSessionId = SessionScalarState.getCasSessionId(false)
		
		if CasSessionId == nil or CasSessionId == "" or not SessionScalarState.getHasLoadedHistory(false) then return end
		local SnapshotActiveSessionResult = snapshotActiveSession()
		
		if SnapshotActiveSessionResult ~= nil then
			SessionHistoryCache.save(CasSessionId, SnapshotActiveSessionResult)
		end
	end
	
	local _ = function(p2): boolean --[[ Line: 119 | Named "restoreSessionFromCache" ]]
		-- upvalues: SessionHistoryCache (copy), LoadedBySequenceId (ref), OverlayBySequenceId (ref), SessionScalarState (copy), Signal2 (copy), buildMergedHistory (copy)
		local RestoreResult = SessionHistoryCache.restore(p2)
		
		if RestoreResult == nil then
			return false
		else
			LoadedBySequenceId = RestoreResult.loadedBySequenceId
			OverlayBySequenceId = RestoreResult.overlayBySequenceId
			SessionScalarState.setHasLoadedHistory(RestoreResult.hasLoadedHistory)
			SessionScalarState.setNextHistoryPageToken(RestoreResult.nextHistoryPageToken)
			SessionScalarState.setLatestObservedHistorySequenceId(RestoreResult.latestObservedHistorySequenceId)
			Signal2(buildMergedHistory())
			
			return true
		end
	end
	
	local function clearActiveSessionState() --[[ Line: 133 ]]
		-- upvalues: LoadedBySequenceId (ref), OverlayBySequenceId (ref), SessionScalarState (copy), Signal2 (copy), buildMergedHistory (copy)
		LoadedBySequenceId = {}
		OverlayBySequenceId = {}
		SessionScalarState.setHasLoadedHistory(false)
		SessionScalarState.setNextHistoryPageToken(nil)
		SessionScalarState.setHistoryLoadInFlight(false)
		SessionScalarState.setLatestObservedHistorySequenceId(nil)
		Signal2(buildMergedHistory())
	end
	
	local function setCasSessionIdInternal(SessionId) --[[ Line: 143 ]]
		-- upvalues: SessionScalarState (copy), Count (ref), snapshotActiveSession (copy), SessionHistoryCache (copy), LoadedBySequenceId (ref), OverlayBySequenceId (ref), Signal2 (copy), buildMergedHistory (copy), Deps (copy), clearActiveSessionState (copy)
		if SessionId == "" then return end
		if SessionScalarState.getCasSessionId(false) == SessionId then return end
		Count += 1
		local CasSessionId = SessionScalarState.getCasSessionId(false)
		
		if CasSessionId ~= nil and CasSessionId ~= "" and SessionScalarState.getHasLoadedHistory(false) then
			local SnapshotActiveSessionResult = snapshotActiveSession()
			
			if SnapshotActiveSessionResult ~= nil then
				SessionHistoryCache.save(CasSessionId, SnapshotActiveSessionResult)
			end
		end
		SessionScalarState.setCasSessionId(SessionId)
		SessionScalarState.setHistoryLoadInFlight(false)
		local RestoreResult = SessionHistoryCache.restore(SessionId)
		local Flag = nil
		
		if RestoreResult == nil then
			Flag = false
		else
			LoadedBySequenceId = RestoreResult.loadedBySequenceId
			OverlayBySequenceId = RestoreResult.overlayBySequenceId
			SessionScalarState.setHasLoadedHistory(RestoreResult.hasLoadedHistory)
			SessionScalarState.setNextHistoryPageToken(RestoreResult.nextHistoryPageToken)
			SessionScalarState.setLatestObservedHistorySequenceId(RestoreResult.latestObservedHistorySequenceId)
			Signal2(buildMergedHistory())
			Flag = true
		end
		if Flag then
			Deps.onCasSessionIdChanged(SessionId)
			
			return
		else
			clearActiveSessionState()
			Deps.onCasSessionIdChanged(SessionId)
		end
	end
	
	local function mergeHistoryPage(p2, p3) --[[ Line: 163 ]]
		-- upvalues: SessionHistoryMergeModule (upval), LoadedBySequenceId (ref), OverlayBySequenceId (ref), SessionScalarState (copy), HistoryPageUtilsModule (upval), Signal2 (copy), buildMergedHistory (copy)
		SessionHistoryMergeModule.mergeHistoryIntoMap(LoadedBySequenceId, p2, OverlayBySequenceId)
		SessionScalarState.setNextHistoryPageToken(p3)
		SessionScalarState.noteHistorySequenceId(HistoryPageUtilsModule.getMaxHistorySequenceId(p2))
		Signal2(buildMergedHistory())
	end
	
	local HistoryLoader = HistoryLoaderModule.createHistoryLoader({
		deps = Deps,
		rpcTimeoutSeconds = RpcTimeoutSeconds,
		getCasSessionId = function() --[[ Line: 180 ]]
			-- upvalues: SessionScalarState (copy)
			return SessionScalarState.getCasSessionId(false)
		end,
		getHistoryLoadInFlight = function() --[[ Line: 183 ]]
			-- upvalues: SessionScalarState (copy)
			return SessionScalarState.getHistoryLoadInFlight(false)
		end,
		setHistoryLoadInFlight = SessionScalarState.setHistoryLoadInFlight,
		getNextHistoryPageToken = function() --[[ Line: 187 ]]
			-- upvalues: SessionScalarState (copy)
			return SessionScalarState.getNextHistoryPageToken(false)
		end,
		setNextHistoryPageToken = SessionScalarState.setNextHistoryPageToken,
		getLoadedBySequenceId = function() --[[ Line: 191 ]]
			-- upvalues: LoadedBySequenceId (ref)
			return LoadedBySequenceId
		end,
		setLoadedBySequenceId = function(Value) --[[ Line: 194 ]]
			-- upvalues: LoadedBySequenceId (ref)
			LoadedBySequenceId = Value
		end,
		getOverlayBySequenceId = function() --[[ Line: 197 ]]
			-- upvalues: OverlayBySequenceId (ref)
			return OverlayBySequenceId
		end,
		setOverlayBySequenceId = function(Value) --[[ Line: 200 ]]
			-- upvalues: OverlayBySequenceId (ref)
			OverlayBySequenceId = Value
		end,
		buildMergedHistory = buildMergedHistory,
		mergeHistoryPage = mergeHistoryPage,
		noteHistorySequenceIds = function(p2) --[[ Line: 83 ]]
			-- upvalues: SessionScalarState (copy), HistoryPageUtilsModule (upval)
			SessionScalarState.noteHistorySequenceId(HistoryPageUtilsModule.getMaxHistorySequenceId(p2))
		end,
		notifyMergedHistoryChanged = function() --[[ Line: 79 ]]
			-- upvalues: Signal2 (copy), buildMergedHistory (copy)
			Signal2(buildMergedHistory())
		end,
		markHistoryLoaded = SessionScalarState.markHistoryLoaded,
		getRefreshGeneration = function() --[[ Line: 208 ]]
			-- upvalues: Count (ref)
			return Count
		end,
		onInitialSessionLoad = function(p2, p3) --[[ Line: 211 ]]
			-- upvalues: ExperimentOverrideModule (upval)
			if not ExperimentOverrideModule.isEnabled() then return end
			local Key = ExperimentOverrideModule.getKey(p2)
			
			if ExperimentOverrideModule.isPending(Key) then return end
			local Experiment = if p3 == nil or p3._meta == nil or p3._meta._roblox == nil then nil else p3._meta._roblox.experiment
			
			if Experiment == nil then
				ExperimentOverrideModule.clear(Key)
				
				return
			else
				ExperimentOverrideModule.hydrate(Key, Experiment.specVersion)
			end
		end
	})
	local HistoryPolling = HistoryPollingModule.createHistoryPolling({
		deps = Deps,
		rpcTimeoutSeconds = RpcTimeoutSeconds,
		getCasSessionId = function() --[[ Line: 238 ]]
			-- upvalues: SessionScalarState (copy)
			return SessionScalarState.getCasSessionId(false)
		end,
		getNextHistoryPageToken = function() --[[ Line: 241 ]]
			-- upvalues: SessionScalarState (copy)
			return SessionScalarState.getNextHistoryPageToken(false)
		end,
		mergeHistoryPage = mergeHistoryPage
	})
	
	local function ensureInitialized() --[[ Line: 247 ]]
		-- upvalues: SessionScalarState (copy), Deps (copy), AcpProtocolModule (upval), HistoryPageUtilsModule (upval), RpcTimeoutSeconds (copy), FFlagBuildExperiencePromptFailureTelemetry (upval), ClassifyRequestFailureModule (upval)
		if SessionScalarState.getInitialized(false) then
			return true, nil, nil
		end
		local AwaitRequestStateResult = HistoryPageUtilsModule.awaitRequestState(Deps.initialize({ protocolVersion = AcpProtocolModule.ProtocolVersion }).state, os.clock() + RpcTimeoutSeconds)
		
		if AwaitRequestStateResult.status == "succeeded" then
			SessionScalarState.setInitialized(true)
			
			return true, nil, nil
		end
		local v1 = false
		local ErrorCode = AwaitRequestStateResult.errorCode
		
		if FFlagBuildExperiencePromptFailureTelemetry then
			return v1, ErrorCode, (ClassifyRequestFailureModule(AwaitRequestStateResult))
		else
			return v1, ErrorCode, nil
		end
	end
	
	local SendPrompt = SendPromptModule.createSendPrompt({
		ensureInitialized = ensureInitialized,
		ensureCasSession = function() --[[ Line: 262 ]]
			-- upvalues: SessionScalarState (copy), UniverseId (copy), PlaceId (copy), ensureInitialized (copy), FFlagBuildExperiencePromptFailureTelemetry (upval), Deps (copy), Experiment (ref), FFlagBuildExperiencePinForBuild (upval), HistoryPageUtilsModule (upval), RpcTimeoutSeconds (copy), ClassifyRequestFailureModule (upval), ExperimentOverrideModule (upval), PendingExperimentKey (ref), setCasSessionIdInternal (copy)
			local CasSessionId = SessionScalarState.getCasSessionId(false)
			
			if CasSessionId ~= nil then
				return CasSessionId, nil
			end
			if UniverseId == nil or PlaceId == nil then
				return nil, { stage = "missing_project" }
			end
			local EnsureInitializedResult, EnsureInitializedResult2, EnsureInitializedResult3 = ensureInitialized()
			
			if not EnsureInitializedResult then
				return nil, {
					stage = "initialize",
					errorCode = EnsureInitializedResult2,
					requestFailure = if FFlagBuildExperiencePromptFailureTelemetry then EnsureInitializedResult3 else nil
				}
			end
			local AwaitRequestStateResult = HistoryPageUtilsModule.awaitRequestState(Deps.sessionNew({
				project = { universeId = UniverseId, placeId = PlaceId },
				experiment = Experiment,
				application = if FFlagBuildExperiencePinForBuild then "build" else nil
			}).state, os.clock() + RpcTimeoutSeconds)
			
			if AwaitRequestStateResult.status ~= "succeeded" then
				return nil, {
					stage = "session_new",
					errorCode = AwaitRequestStateResult.errorCode,
					requestFailure = if FFlagBuildExperiencePromptFailureTelemetry then ClassifyRequestFailureModule(AwaitRequestStateResult) else nil
				}
			end
			local Result = AwaitRequestStateResult.result
			local SessionId = if typeof(Result) == "table" then Result.sessionId else nil
			
			if typeof(SessionId) ~= "string" or SessionId == "" then
				return nil, { stage = "session_new" }
			end
			if ExperimentOverrideModule.isEnabled() then
				local Key = ExperimentOverrideModule.getKey(SessionId)
				
				if ExperimentOverrideModule.has(PendingExperimentKey) then
					ExperimentOverrideModule.move(PendingExperimentKey, Key)
				elseif Experiment ~= nil then
					ExperimentOverrideModule.hydrate(Key, Experiment.specVersion)
				end
				ExperimentOverrideModule.consumePending(Key)
			end
			setCasSessionIdInternal(SessionId)
			
			return SessionId, nil
		end,
		getLatestObservedHistorySequenceId = function() --[[ Line: 318 ]]
			-- upvalues: SessionScalarState (copy)
			return SessionScalarState.getLatestObservedHistorySequenceId(false)
		end,
		noteTurnSequenceIds = function(p2) --[[ Line: 87 ]]
			-- upvalues: SessionScalarState (copy)
			local GetLatestProcessedSequenceNumberFunction = p2.getLatestProcessedSequenceNumber
			
			if GetLatestProcessedSequenceNumberFunction ~= nil then
				SessionScalarState.noteHistorySequenceId(GetLatestProcessedSequenceNumberFunction())
			end
		end,
		startPollingTurnFromHistory = HistoryPolling.startPollingTurnFromHistory,
		getAssistantTurnSequence = function() --[[ Line: 323 ]]
			-- upvalues: SessionScalarState (copy)
			return SessionScalarState.getAssistantTurnSequence(false)
		end,
		incrementAssistantTurnSequence = SessionScalarState.incrementAssistantTurnSequence,
		sessionPrompt = function(p2) --[[ Line: 330 ]]
			-- upvalues: ExperimentOverrideModule (upval), SessionScalarState (copy), PendingExperimentKey (ref), Deps (copy)
			local PromptExperiment = if ExperimentOverrideModule.isEnabled() then ExperimentOverrideModule.getPromptExperiment(ExperimentOverrideModule.getKey(SessionScalarState.getCasSessionId(false)) or PendingExperimentKey) else nil
			local SessionPromptResult = Deps.sessionPrompt({
				sessionId = p2.sessionId,
				prompt = p2.prompt,
				_meta = p2._meta,
				experiment = PromptExperiment
			})
			
			if PromptExperiment ~= nil then
				ExperimentOverrideModule.consumePending(ExperimentOverrideModule.getKey(SessionScalarState.getCasSessionId(false)) or PendingExperimentKey)
			end
			return SessionPromptResult
		end,
		setActiveStop = function(Value) --[[ Line: 345 ]]
			-- upvalues: Callback (ref)
			Callback = Value
		end
	})
	
	return {
		universeId = UniverseId,
		placeId = PlaceId,
		getCasSessionId = function() --[[ Line: 386 ]]
			-- upvalues: SessionScalarState (copy)
			return SessionScalarState.getCasSessionId(false)
		end,
		setCasSessionId = setCasSessionIdInternal,
		setPendingExperimentKey = function(Value) --[[ Line: 390 ]]
			-- upvalues: PendingExperimentKey (ref)
			PendingExperimentKey = Value
		end,
		hasLoadedHistory = function() --[[ Line: 393 ]]
			-- upvalues: SessionScalarState (copy)
			return SessionScalarState.getHasLoadedHistory(false)
		end,
		markHistoryLoaded = SessionScalarState.markHistoryLoaded,
		getNextHistoryPageToken = function() --[[ Line: 397 ]]
			-- upvalues: SessionScalarState (copy)
			return SessionScalarState.getNextHistoryPageToken(false)
		end,
		getMergedHistory = Signal,
		ingestRealtimeUpdate = function(p2, p3) --[[ Line: 170 ]]
			-- upvalues: SessionHistoryMergeModule (upval), OverlayBySequenceId (ref), LoadedBySequenceId (ref), SessionScalarState (copy), Signal2 (copy), buildMergedHistory (copy)
			if SessionHistoryMergeModule.ingestOverlayUpdate(OverlayBySequenceId, LoadedBySequenceId, p2, p3) then
				SessionScalarState.noteHistorySequenceId(p3)
				Signal2(buildMergedHistory())
			end
		end,
		mergeHistoryPage = mergeHistoryPage,
		refreshSession = HistoryLoader.refreshSession,
		loadOlderHistory = HistoryLoader.loadOlderHistory,
		requestOlderHistoryWhile = HistoryLoader.requestOlderHistoryWhile,
		sendPrompt = function(p2) --[[ Line: 406 ]]
			-- upvalues: Experiment (ref), ExperimentOverrideModule (upval), SessionScalarState (copy), PendingExperimentKey (ref), SendPrompt (copy)
			Experiment = if ExperimentOverrideModule.isEnabled() then ExperimentOverrideModule.getExperiment(ExperimentOverrideModule.getKey(SessionScalarState.getCasSessionId(false)) or PendingExperimentKey) else nil
			
			return SendPrompt.sendPrompt(p2)
		end,
		stopActiveTurn = function() --[[ Line: 377 ]]
			-- upvalues: Callback (ref)
			if Callback ~= nil then
				Callback()
			end
		end,
		submitActiveToolResult = function(Content, p2, TurnId, ReferenceId) --[[ Line: 358 ]]
			-- upvalues: SessionScalarState (copy), Deps (copy)
			local CasSessionId = SessionScalarState.getCasSessionId(false)
			
			return if CasSessionId == nil then nil else Deps.submitToolResult({
				sessionId = CasSessionId,
				turnId = TurnId,
				referenceId = ReferenceId,
				content = Content,
				isError = p2 ~= nil and p2
			})
		end,
		getActiveTurnHandle = function() --[[ Line: 350 ]]
			-- upvalues: SessionScalarState (copy), Deps (copy)
			local CasSessionId = SessionScalarState.getCasSessionId(false)
			
			return if CasSessionId == nil then nil else Deps.getActiveTurnHandle(CasSessionId)
		end,
		startPollingActiveTurn = function(CasSessionId) --[[ Line: 413 ]]
			-- upvalues: SessionScalarState (copy), HistoryPolling (copy)
			local CasSessionId1 = SessionScalarState.getCasSessionId(false)
			
			return if CasSessionId1 == nil then function() --[[ Line: 416 ]] end else HistoryPolling.startPollingActiveTurn(CasSessionId1, CasSessionId)
		end
	}
end