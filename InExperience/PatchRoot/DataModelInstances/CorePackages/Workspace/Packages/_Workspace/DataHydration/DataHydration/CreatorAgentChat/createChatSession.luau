local Parent = script:FindFirstAncestor("DataHydration").Parent
local SignalsModule = require(Parent.Signals)
local SharedFlagsModule = require(Parent.SharedFlags)
local AcpProtocolModule = require(script.Parent.Acp.AcpProtocol)
local ClassifyRequestFailureModule = require(script.Parent.classifyRequestFailure)
local ExperimentOverrideModule = require(script.Parent.experimentOverride)
local GetFundingErrorModule = require(script.Parent.getFundingError)
local SendConfigurationModule = require(script.Parent.sendConfiguration)
local FFlagBuildExperienceModelPickerData = SharedFlagsModule.FFlagBuildExperienceModelPickerData
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

return function(Deps, UniverseId, PlaceId, p1)
	-- upvalues: SessionScalarStateModule (copy), ConstantsModule (copy), SessionHistoryCacheModule (copy), ExperimentOverrideModule (copy), SessionHistoryMergeModule (copy), SignalsModule (copy), HistoryPageUtilsModule (copy), FFlagBuildExperienceModelPickerData (copy), HistoryLoaderModule (copy), HistoryPollingModule (copy), AcpProtocolModule (copy), FFlagBuildExperiencePromptFailureTelemetry (copy), ClassifyRequestFailureModule (copy), FFlagBuildExperiencePinForBuild (copy), GetFundingErrorModule (copy), SendConfigurationModule (copy), SendPromptModule (copy)
	local LoadedBySequenceId = {}
	local OverlayBySequenceId = {}
	local SessionScalarState = SessionScalarStateModule.createSessionScalarState(p1)
	local Callback = nil
	local RpcTimeoutSeconds = Deps.rpcTimeoutSeconds or ConstantsModule.getRpcTimeoutSeconds()
	local SessionHistoryCache = SessionHistoryCacheModule.createSessionHistoryCache()
	local Generation = 0
	local Count = 0
	local v1 = 0
	local PendingExperimentKey = nil
	local Experiment = nil
	
	local function _()
		-- upvalues: ExperimentOverrideModule (upval), SessionScalarState (copy), PendingExperimentKey (ref)
		return ExperimentOverrideModule.getKey(SessionScalarState.getCasSessionId(false)) or PendingExperimentKey
	end
	
	local _ = function()
		-- upvalues: Experiment (ref), ExperimentOverrideModule (upval), SessionScalarState (copy), PendingExperimentKey (ref)
		Experiment = if ExperimentOverrideModule.isEnabled() then ExperimentOverrideModule.getExperiment(ExperimentOverrideModule.getKey(SessionScalarState.getCasSessionId(false)) or PendingExperimentKey) else nil
	end
	
	local function buildMergedHistory()
		-- upvalues: SessionHistoryMergeModule (upval), LoadedBySequenceId (ref), OverlayBySequenceId (ref)
		return SessionHistoryMergeModule.orderMergedHistoryItems(LoadedBySequenceId, OverlayBySequenceId)
	end
	
	local Signal, Signal2 = SignalsModule.createSignal(buildMergedHistory())
	
	local function snapshotActiveSession()
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
	
	local _ = function()
		-- upvalues: SessionScalarState (copy), snapshotActiveSession (copy), SessionHistoryCache (copy)
		local CasSessionId = SessionScalarState.getCasSessionId(false)
		
		if CasSessionId == nil or CasSessionId == "" or not SessionScalarState.getHasLoadedHistory(false) then return end
		local SnapshotActiveSessionResult = snapshotActiveSession()
		
		if SnapshotActiveSessionResult ~= nil then
			SessionHistoryCache.save(CasSessionId, SnapshotActiveSessionResult)
		end
	end
	
	local _ = function(p2): boolean
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
	
	local function clearActiveSessionState()
		-- upvalues: LoadedBySequenceId (ref), OverlayBySequenceId (ref), SessionScalarState (copy), Signal2 (copy), buildMergedHistory (copy)
		LoadedBySequenceId = {}
		OverlayBySequenceId = {}
		SessionScalarState.setHasLoadedHistory(false)
		SessionScalarState.setNextHistoryPageToken(nil)
		SessionScalarState.setHistoryLoadInFlight(false)
		SessionScalarState.setLatestObservedHistorySequenceId(nil)
		Signal2(buildMergedHistory())
	end
	
	local function setCasSessionIdInternal(SessionId)
		-- upvalues: SessionScalarState (copy), Generation (ref), FFlagBuildExperienceModelPickerData (upval), snapshotActiveSession (copy), SessionHistoryCache (copy), ExperimentOverrideModule (upval), PendingExperimentKey (ref), LoadedBySequenceId (ref), OverlayBySequenceId (ref), Signal2 (copy), buildMergedHistory (copy), Deps (copy), clearActiveSessionState (copy)
		if SessionId == "" then return end
		if SessionScalarState.getCasSessionId(false) == SessionId then return end
		Generation += 1
		
		if FFlagBuildExperienceModelPickerData then
			SessionScalarState.setModels(nil)
			SessionScalarState.setHasObservedModels(false)
		end
		local CasSessionId = SessionScalarState.getCasSessionId(false)
		
		if CasSessionId ~= nil and CasSessionId ~= "" and SessionScalarState.getHasLoadedHistory(false) then
			local SnapshotActiveSessionResult = snapshotActiveSession()
			
			if SnapshotActiveSessionResult ~= nil then
				SessionHistoryCache.save(CasSessionId, SnapshotActiveSessionResult)
			end
		end
		SessionScalarState.setCasSessionId(SessionId)
		
		if FFlagBuildExperienceModelPickerData and ExperimentOverrideModule.isEnabled() then
			ExperimentOverrideModule.move(PendingExperimentKey, ExperimentOverrideModule.getKey(SessionId))
		end
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
	
	local function mergeHistoryPage(p2, p3)
		-- upvalues: SessionHistoryMergeModule (upval), LoadedBySequenceId (ref), OverlayBySequenceId (ref), SessionScalarState (copy), HistoryPageUtilsModule (upval), Signal2 (copy), buildMergedHistory (copy)
		SessionHistoryMergeModule.mergeHistoryIntoMap(LoadedBySequenceId, p2, OverlayBySequenceId)
		SessionScalarState.setNextHistoryPageToken(p3)
		SessionScalarState.noteHistorySequenceId(HistoryPageUtilsModule.getMaxHistorySequenceId(p2))
		Signal2(buildMergedHistory())
	end
	
	local _ = function(p2, p3, p4)
		-- upvalues: HistoryPageUtilsModule (upval), RpcTimeoutSeconds (copy)
		local AwaitRequestStateResult = HistoryPageUtilsModule.awaitRequestState(p2.state, p4 or os.clock() + RpcTimeoutSeconds, p3)
		
		if p3 ~= nil then
			p2.dispose()
		end
		return AwaitRequestStateResult
	end
	
	local _ = function(p2)
		-- upvalues: SessionScalarState (copy)
		local Roblox = if p2 and p2._meta then p2._meta._roblox else nil
		SessionScalarState.setModels(if Roblox then Roblox.models else nil)
		SessionScalarState.setHasObservedModels(true)
	end
	
	local function publishExperiment(CasSessionId, p2)
		-- upvalues: ExperimentOverrideModule (upval), FFlagBuildExperienceModelPickerData (upval)
		if not ExperimentOverrideModule.isEnabled() then return end
		local Key = ExperimentOverrideModule.getKey(CasSessionId)
		
		if ExperimentOverrideModule.isPending(Key) or FFlagBuildExperienceModelPickerData and ExperimentOverrideModule.hasInternalEdit(Key) then return end
		local Experiment = if p2 == nil or p2._meta == nil or p2._meta._roblox == nil then nil else p2._meta._roblox.experiment
		
		if Experiment == nil then
			ExperimentOverrideModule.clear(Key)
			
			return
		else
			ExperimentOverrideModule.hydrate(Key, Experiment.specVersion, if FFlagBuildExperienceModelPickerData then Experiment else nil)
		end
	end
	
	local function loadSession(CasSessionId, HistoryPageToken, Callback, p2)
		-- upvalues: Generation (ref), Count (ref), SessionScalarState (copy), Deps (copy), HistoryPageUtilsModule (upval), RpcTimeoutSeconds (copy), v1 (ref), publishExperiment (copy)
		local Generation1 = Generation
		Count += 1
		local Count1: number = Count
		
		local function isStale()
			-- upvalues: Callback (copy), Generation1 (copy), Generation (upval), SessionScalarState (upval), CasSessionId (copy)
			return Callback() or (Generation1 ~= Generation or SessionScalarState.getCasSessionId(false) ~= CasSessionId)
		end
		
		if Callback() or (Generation1 ~= Generation or SessionScalarState.getCasSessionId(false) ~= CasSessionId) then
			return { status = "pending" }
		end
		local SessionLoadResult = Deps.sessionLoad(CasSessionId, { historyPageToken = HistoryPageToken })
		local AwaitRequestStateResult = HistoryPageUtilsModule.awaitRequestState(SessionLoadResult.state, p2 or os.clock() + RpcTimeoutSeconds, isStale)
		
		if isStale ~= nil then
			SessionLoadResult.dispose()
		end
		if Callback() or (Generation1 ~= Generation or SessionScalarState.getCasSessionId(false) ~= CasSessionId) then
			return { status = "pending" }
		end
		if AwaitRequestStateResult.status == "succeeded" and v1 < Count1 then
			v1 = Count1
			local Result = AwaitRequestStateResult.result
			local Roblox = if Result and Result._meta then Result._meta._roblox else nil
			SessionScalarState.setModels(if Roblox then Roblox.models else nil)
			SessionScalarState.setHasObservedModels(true)
			publishExperiment(CasSessionId, AwaitRequestStateResult.result)
		end
		return AwaitRequestStateResult
	end
	
	local HistoryLoader = HistoryLoaderModule.createHistoryLoader({
		deps = Deps,
		rpcTimeoutSeconds = RpcTimeoutSeconds,
		getCasSessionId = function()
			-- upvalues: SessionScalarState (copy)
			return SessionScalarState.getCasSessionId(false)
		end,
		getHistoryLoadInFlight = function()
			-- upvalues: SessionScalarState (copy)
			return SessionScalarState.getHistoryLoadInFlight(false)
		end,
		setHistoryLoadInFlight = SessionScalarState.setHistoryLoadInFlight,
		getNextHistoryPageToken = function()
			-- upvalues: SessionScalarState (copy)
			return SessionScalarState.getNextHistoryPageToken(false)
		end,
		setNextHistoryPageToken = SessionScalarState.setNextHistoryPageToken,
		getLoadedBySequenceId = function()
			-- upvalues: LoadedBySequenceId (ref)
			return LoadedBySequenceId
		end,
		setLoadedBySequenceId = function(Value)
			-- upvalues: LoadedBySequenceId (ref)
			LoadedBySequenceId = Value
		end,
		getOverlayBySequenceId = function()
			-- upvalues: OverlayBySequenceId (ref)
			return OverlayBySequenceId
		end,
		setOverlayBySequenceId = function(Value)
			-- upvalues: OverlayBySequenceId (ref)
			OverlayBySequenceId = Value
		end,
		buildMergedHistory = buildMergedHistory,
		mergeHistoryPage = mergeHistoryPage,
		noteHistorySequenceIds = function(p2)
			-- upvalues: SessionScalarState (copy), HistoryPageUtilsModule (upval)
			SessionScalarState.noteHistorySequenceId(HistoryPageUtilsModule.getMaxHistorySequenceId(p2))
		end,
		notifyMergedHistoryChanged = function()
			-- upvalues: Signal2 (copy), buildMergedHistory (copy)
			Signal2(buildMergedHistory())
		end,
		markHistoryLoaded = SessionScalarState.markHistoryLoaded,
		getRefreshGeneration = function()
			-- upvalues: Generation (ref)
			return Generation
		end,
		onInitialSessionLoad = publishExperiment
	}, if FFlagBuildExperienceModelPickerData then loadSession else nil)
	local HistoryPolling = HistoryPollingModule.createHistoryPolling({
		deps = Deps,
		rpcTimeoutSeconds = RpcTimeoutSeconds,
		getCasSessionId = function()
			-- upvalues: SessionScalarState (copy)
			return SessionScalarState.getCasSessionId(false)
		end,
		getNextHistoryPageToken = function()
			-- upvalues: SessionScalarState (copy)
			return SessionScalarState.getNextHistoryPageToken(false)
		end,
		mergeHistoryPage = mergeHistoryPage
	}, if FFlagBuildExperienceModelPickerData then loadSession else nil)
	
	local function ensureInitialized(Callback)
		-- upvalues: SessionScalarState (copy), Deps (copy), AcpProtocolModule (upval), HistoryPageUtilsModule (upval), RpcTimeoutSeconds (copy), FFlagBuildExperiencePromptFailureTelemetry (upval), ClassifyRequestFailureModule (upval)
		if SessionScalarState.getInitialized(false) then
			return true, nil, nil
		end
		local InitializeResult = Deps.initialize({ protocolVersion = AcpProtocolModule.ProtocolVersion })
		local AwaitRequestStateResult = HistoryPageUtilsModule.awaitRequestState(InitializeResult.state, os.clock() + RpcTimeoutSeconds, Callback)
		
		if Callback ~= nil then
			InitializeResult.dispose()
		end
		if Callback ~= nil and Callback() then
			return false, nil, nil
		elseif AwaitRequestStateResult.status == "succeeded" then
			SessionScalarState.setInitialized(true)
			
			return true, nil, nil
		else
			local v2 = false
			local ErrorCode = AwaitRequestStateResult.errorCode
			
			if FFlagBuildExperiencePromptFailureTelemetry then
				return v2, ErrorCode, (ClassifyRequestFailureModule(AwaitRequestStateResult))
			else
				return v2, ErrorCode, nil
			end
		end
	end
	
	local function createCasSession(Model, Callback, p2, Callback1)
		-- upvalues: Generation (ref), FFlagBuildExperienceModelPickerData (upval), Experiment (ref), SessionScalarState (copy), UniverseId (copy), PlaceId (copy), ensureInitialized (copy), FFlagBuildExperiencePromptFailureTelemetry (upval), Deps (copy), FFlagBuildExperiencePinForBuild (upval), HistoryPageUtilsModule (upval), RpcTimeoutSeconds (copy), GetFundingErrorModule (upval), ClassifyRequestFailureModule (upval), ExperimentOverrideModule (upval), PendingExperimentKey (ref), SendConfigurationModule (upval), setCasSessionIdInternal (copy)
		local Generation1 = Generation
		
		local function isStale()
			-- upvalues: Generation1 (copy), Generation (upval), Callback (copy)
			return Generation1 ~= Generation or Callback ~= nil and Callback()
		end
		
		local Experiment1 = if FFlagBuildExperienceModelPickerData and p2 ~= nil then p2.experiment else Experiment
		local CasSessionId = SessionScalarState.getCasSessionId(false)
		
		if CasSessionId ~= nil and not FFlagBuildExperienceModelPickerData then
			return CasSessionId, nil
		end
		if CasSessionId == nil and (UniverseId == nil or PlaceId == nil) then
			return nil, { stage = "missing_project" }
		end
		local EnsureInitializedResult, EnsureInitializedResult2, EnsureInitializedResult3 = ensureInitialized(if FFlagBuildExperienceModelPickerData then isStale else Callback)
		
		if FFlagBuildExperienceModelPickerData and (Generation1 ~= Generation or Callback ~= nil and Callback()) then
			return nil, nil
		end
		if not EnsureInitializedResult then
			return nil, {
				stage = "initialize",
				errorCode = EnsureInitializedResult2,
				requestFailure = if FFlagBuildExperiencePromptFailureTelemetry then EnsureInitializedResult3 else nil
			}
		end
		if CasSessionId ~= nil then
			return CasSessionId, nil
		end
		if Callback1 ~= nil and Callback1() then
			return nil, nil
		end
		local SessionNewResult = Deps.sessionNew({
			project = { universeId = UniverseId, placeId = PlaceId },
			experiment = if FFlagBuildExperienceModelPickerData then Experiment1 else Experiment,
			model = if FFlagBuildExperienceModelPickerData then Model else nil,
			application = if FFlagBuildExperiencePinForBuild then "build" else nil
		})
		local IsStale = if FFlagBuildExperienceModelPickerData then isStale else Callback
		local AwaitRequestStateResult = HistoryPageUtilsModule.awaitRequestState(SessionNewResult.state, os.clock() + RpcTimeoutSeconds, IsStale)
		
		if IsStale ~= nil then
			SessionNewResult.dispose()
		end
		if FFlagBuildExperienceModelPickerData and (Generation1 ~= Generation or Callback ~= nil and Callback()) then
			return nil, nil
		end
		if AwaitRequestStateResult.status == "succeeded" then
			local Result = AwaitRequestStateResult.result
			local SessionId = if typeof(Result) == "table" then Result.sessionId else nil
			
			if typeof(SessionId) ~= "string" or SessionId == "" then
				return nil, { stage = "session_new" }
			end
			if ExperimentOverrideModule.isEnabled() then
				local Key = ExperimentOverrideModule.getKey(SessionId)
				local Experiment2 = if FFlagBuildExperienceModelPickerData then Experiment1 else Experiment
				
				if ExperimentOverrideModule.has(PendingExperimentKey) then
					ExperimentOverrideModule.move(PendingExperimentKey, Key)
				elseif Experiment2 ~= nil then
					ExperimentOverrideModule.hydrate(Key, Experiment2.specVersion)
				end
				if not FFlagBuildExperienceModelPickerData or p2 == nil or SendConfigurationModule.sameExperiment(ExperimentOverrideModule.getPromptExperiment(Key), Experiment2) then
					ExperimentOverrideModule.consumePending(Key)
				end
			end
			setCasSessionIdInternal(SessionId)
			
			if FFlagBuildExperienceModelPickerData then
				if SessionScalarState.getCasSessionId(false) ~= SessionId then
					return nil, nil
				end
				local Roblox = if Result and Result._meta then Result._meta._roblox else nil
				SessionScalarState.setModels(if Roblox then Roblox.models else nil)
				SessionScalarState.setHasObservedModels(true)
			end
			return SessionId, nil
		else
			local FundingReason = nil
			local FundingDetails = nil
			
			if FFlagBuildExperienceModelPickerData then
				FundingReason, FundingDetails = GetFundingErrorModule(AwaitRequestStateResult)
			end
			return nil, {
				stage = "session_new",
				message = if FFlagBuildExperienceModelPickerData then AwaitRequestStateResult.error else nil,
				errorCode = AwaitRequestStateResult.errorCode,
				fundingReason = FundingReason,
				fundingDetails = FundingDetails,
				requestFailure = if FFlagBuildExperiencePromptFailureTelemetry then ClassifyRequestFailureModule(AwaitRequestStateResult) else nil
			}
		end
	end
	
	local Setup = nil
	
	local function newSetup(Model, p2)
		-- upvalues: Generation (ref), Experiment (ref)
		return {
			persistent = false,
			committed = false,
			done = false,
			generation = Generation,
			model = Model,
			experiment = if p2 == nil then Experiment else p2.experiment,
			abandoners = {}
		}
	end
	
	local _ = function(Setup): boolean
		if Setup.persistent then
			return false
		end
		for abandoner in Setup.abandoners do
			if not abandoner() then
				return false
			end
		end
		return true
	end
	
	local _ = function(Setup): boolean
		local NoCommitted = not Setup.committed
		
		if NoCommitted then
			NoCommitted = not Setup.done
			
			if NoCommitted then
				if Setup.persistent then
					return false
				end
				for abandoner in Setup.abandoners do
					if not abandoner() then
						return false
					end
				end
				NoCommitted = true
			end
		end
		return NoCommitted
	end
	
	local function ensureCasSession(Model: Model, Callback, CaptureResult, p2)
		-- upvalues: FFlagBuildExperienceModelPickerData (upval), SessionScalarState (copy), createCasSession (copy), Setup (ref), Generation (ref), newSetup (copy), SendConfigurationModule (upval)
		if not FFlagBuildExperienceModelPickerData or SessionScalarState.getCasSessionId(false) ~= nil and SessionScalarState.getInitialized(false) then
			return createCasSession(Model, Callback, CaptureResult)
		end
		local function callerCancelled()
			-- upvalues: Callback (copy)
			return Callback ~= nil and Callback()
		end
		
		if Callback ~= nil and Callback() then
			return nil, nil
		end
		local Setup1 = Setup
		local NoSetup: boolean = Setup1 == nil or Setup1.generation ~= Generation
		
		if NoSetup then
			Setup1 = newSetup(Model, CaptureResult)
			Setup = Setup1
		end
		local Setup2 = Setup1
		local IsNotModelMatch: boolean = SessionScalarState.getCasSessionId(false) == nil and (Setup2.model ~= nil and (Model ~= nil and Model ~= Setup2.model))
		local IsNotModelMatch1: boolean = SessionScalarState.getCasSessionId(false) == nil and (CaptureResult ~= nil and (Setup2.model ~= CaptureResult.tier or not SendConfigurationModule.sameExperiment(Setup2.experiment, CaptureResult.experiment)))
		repeat
			if not NoSetup and (IsNotModelMatch or IsNotModelMatch1) then
				local Setup3 = Setup2
				local NoCommitted = not Setup3.committed
				
				if NoCommitted then
					NoCommitted = not Setup3.done
					
					if NoCommitted then
						if Setup3.persistent then
							NoCommitted = false
						else
							NoCommitted = true
							
							for abandoner in Setup3.abandoners do
								if not abandoner() then
									NoCommitted = false
									break
								end
							end
						end
					end
				end
				if NoCommitted then
					NoSetup = true
					Setup2 = newSetup(Model, CaptureResult)
					Setup = Setup2
					break
				end
			end
			if IsNotModelMatch then
				return nil, {
					stage = "session_new",
					message = "session creation already started with a different model"
				}
			end
			if not IsNotModelMatch1 then break end
			return nil, {
				stage = "session_new",
				message = "session creation already started with a different send configuration"
			}
		until true
		if p2 and Callback ~= nil then
			Setup2.abandoners[callerCancelled] = true
		else
			Setup2.persistent = true
		end
		if NoSetup then
			task.spawn(function()
				-- upvalues: createCasSession (upval), Model (copy), CaptureResult (copy), Setup2 (ref), Setup (upval)
				local Success, Result, Result3 = pcall(createCasSession, Model, nil, CaptureResult, function(): boolean
					-- upvalues: Setup2 (upval)
					local Setup = Setup2
					local Flag = nil
					
					if Setup.persistent then
						Flag = false
					else
						Flag = true
						
						for abandoner in Setup.abandoners do
							if not abandoner() then
								Flag = false
								break
							end
						end
					end
					if Flag then
						return true
					else
						Setup2.committed = true
						
						return false
					end
				end)
				Setup2.sessionId = if Success then Result else nil
				Setup2.error = if Success then Result3 else { stage = "session_new", message = tostring(Result) }
				Setup2.done = true
				
				if Setup == Setup2 then
					Setup = nil
				end
			end)
		end
		while not Setup2.done and (Callback == nil or not Callback()) do
			task.wait()
		end
		if Callback ~= nil and Callback() or Setup2.sessionId ~= nil and Setup2.sessionId ~= SessionScalarState.getCasSessionId(false) then
			return nil, nil
		else
			return Setup2.sessionId, Setup2.error
		end
	end
	
	local function prepareSession(p3)
		-- upvalues: SendConfigurationModule (upval), Generation (ref), Experiment (ref), ExperimentOverrideModule (upval), SessionScalarState (copy), PendingExperimentKey (ref), Setup (ref), ensureCasSession (copy), loadSession (copy), FFlagBuildExperienceModelPickerData (upval), GetFundingErrorModule (upval), FFlagBuildExperiencePromptFailureTelemetry (upval), ClassifyRequestFailureModule (upval), HistoryPageUtilsModule (upval)
		local CaptureResult = if p3 == nil or p3.sendConfiguration == nil then nil else SendConfigurationModule.capture(p3.sendConfiguration.tier, p3.sendConfiguration.experiment)
		local Model = if CaptureResult == nil then if p3 == nil then nil else p3.model else CaptureResult.tier
		assert(CaptureResult == nil or (p3 == nil or (p3.model == nil or p3.model == Model)), "conflicting model tiers")
		local Generation1 = Generation
		
		local function isCancelled()
			-- upvalues: Generation1 (copy), Generation (upval), p3 (copy)
			return Generation1 ~= Generation or p3 ~= nil and (p3.isCancelled ~= nil and p3.isCancelled())
		end
		
		if Generation1 ~= Generation or p3 ~= nil and (p3.isCancelled ~= nil and p3.isCancelled()) then
			return nil, nil
		end
		if CaptureResult == nil then
			Experiment = if ExperimentOverrideModule.isEnabled() then ExperimentOverrideModule.getExperiment(ExperimentOverrideModule.getKey(SessionScalarState.getCasSessionId(false)) or PendingExperimentKey) else nil
		end
		local CasSessionId = SessionScalarState.getCasSessionId(false)
		
		if CasSessionId == nil then
			if Setup ~= nil and Setup.generation == Generation1 and Model ~= nil and Model ~= Setup.model then
				local Setup1 = Setup
				local NoCommitted = not Setup1.committed
				
				if NoCommitted then
					NoCommitted = not Setup1.done
					
					if NoCommitted then
						if Setup1.persistent then
							NoCommitted = false
						else
							NoCommitted = true
							
							for abandoner in Setup1.abandoners do
								if not abandoner() then
									NoCommitted = false
									break
								end
							end
						end
					end
				end
				if not NoCommitted then
					return nil, {
						stage = "session_new",
						message = "session creation already started with a different model"
					}
				end
			end
			return ensureCasSession(Model, if p3 == nil then nil else p3.isCancelled, CaptureResult, CaptureResult ~= nil)
		else
			local EnsureCasSessionResult, EnsureCasSessionResult2 = ensureCasSession(nil, isCancelled, CaptureResult)
			
			if Generation1 ~= Generation or p3 ~= nil and (p3.isCancelled ~= nil and p3.isCancelled()) then
				return nil, nil
			end
			if EnsureCasSessionResult == nil then
				return nil, EnsureCasSessionResult2
			end
			local Session = loadSession(CasSessionId, nil, isCancelled)
			
			if Generation1 ~= Generation or p3 ~= nil and (p3.isCancelled ~= nil and p3.isCancelled()) then
				return nil, nil
			end
			if Session.status == "succeeded" then
				SessionScalarState.noteHistorySequenceId(HistoryPageUtilsModule.getMaxHistorySequenceId((HistoryPageUtilsModule.getSessionLoadHistory(Session.result))))
				
				return CasSessionId, nil
			end
			local FundingReason = nil
			local FundingDetails = nil
			
			if FFlagBuildExperienceModelPickerData then
				FundingReason, FundingDetails = GetFundingErrorModule(Session)
			end
			return nil, {
				stage = "session_load",
				message = Session.error,
				errorCode = Session.errorCode,
				fundingReason = FundingReason,
				fundingDetails = FundingDetails,
				requestFailure = if FFlagBuildExperiencePromptFailureTelemetry then ClassifyRequestFailureModule(Session) else nil
			}
		end
	end
	
	local SendPrompt = SendPromptModule.createSendPrompt({
		ensureInitialized = ensureInitialized,
		ensureCasSession = ensureCasSession,
		getLatestObservedHistorySequenceId = function()
			-- upvalues: SessionScalarState (copy)
			return SessionScalarState.getLatestObservedHistorySequenceId(false)
		end,
		noteTurnSequenceIds = function(p4)
			-- upvalues: SessionScalarState (copy)
			local GetLatestProcessedSequenceNumberFunction = p4.getLatestProcessedSequenceNumber
			
			if GetLatestProcessedSequenceNumberFunction ~= nil then
				SessionScalarState.noteHistorySequenceId(GetLatestProcessedSequenceNumberFunction())
			end
		end,
		startPollingTurnFromHistory = HistoryPolling.startPollingTurnFromHistory,
		getAssistantTurnSequence = function()
			-- upvalues: SessionScalarState (copy)
			return SessionScalarState.getAssistantTurnSequence(false)
		end,
		incrementAssistantTurnSequence = SessionScalarState.incrementAssistantTurnSequence,
		sessionPrompt = function(p4, p5)
			-- upvalues: FFlagBuildExperienceModelPickerData (upval), ExperimentOverrideModule (upval), SessionScalarState (copy), PendingExperimentKey (ref), Deps (copy), SendConfigurationModule (upval)
			local Experiment = if FFlagBuildExperienceModelPickerData and p5 ~= nil then p5.experiment elseif ExperimentOverrideModule.isEnabled() then ExperimentOverrideModule.getPromptExperiment(ExperimentOverrideModule.getKey(SessionScalarState.getCasSessionId(false)) or PendingExperimentKey) else nil
			local SessionPromptResult = Deps.sessionPrompt({
				sessionId = p4.sessionId,
				prompt = p4.prompt,
				model = if FFlagBuildExperienceModelPickerData then p4.model else nil,
				_meta = p4._meta,
				experiment = Experiment
			})
			
			if FFlagBuildExperienceModelPickerData then
				local Key = ExperimentOverrideModule.getKey(p4.sessionId)
				
				if Experiment == nil then
					return SessionPromptResult, nil
				else
					return SessionPromptResult, function()
						-- upvalues: SessionPromptResult (copy), SendConfigurationModule (upval), ExperimentOverrideModule (upval), Key (copy), Experiment (copy)
						if (SessionPromptResult.isCurrentOwner == nil or SessionPromptResult.isCurrentOwner()) and SendConfigurationModule.sameExperiment(ExperimentOverrideModule.getPromptExperiment(Key), Experiment) then
							ExperimentOverrideModule.consumePending(Key)
						end
					end
				end
			else
				if Experiment ~= nil then
					ExperimentOverrideModule.consumePending(ExperimentOverrideModule.getKey(SessionScalarState.getCasSessionId(false)) or PendingExperimentKey)
				end
				return SessionPromptResult, nil
			end
		end,
		setActiveStop = function(Value)
			-- upvalues: Callback (ref)
			Callback = Value
		end
	})
	
	return {
		getModels = SessionScalarState.getModels,
		hasObservedModels = SessionScalarState.hasObservedModels,
		prepareSession = if FFlagBuildExperienceModelPickerData then prepareSession else nil,
		universeId = UniverseId,
		placeId = PlaceId,
		getCasSessionId = function()
			-- upvalues: SessionScalarState (copy)
			return SessionScalarState.getCasSessionId(false)
		end,
		setCasSessionId = setCasSessionIdInternal,
		setPendingExperimentKey = function(Value)
			-- upvalues: PendingExperimentKey (ref), FFlagBuildExperienceModelPickerData (upval), ExperimentOverrideModule (upval), SessionScalarState (copy)
			PendingExperimentKey = Value
			
			if FFlagBuildExperienceModelPickerData and ExperimentOverrideModule.isEnabled() then
				ExperimentOverrideModule.move(Value, ExperimentOverrideModule.getKey(SessionScalarState.getCasSessionId(false)))
			end
		end,
		hasLoadedHistory = function()
			-- upvalues: SessionScalarState (copy)
			return SessionScalarState.getHasLoadedHistory(false)
		end,
		markHistoryLoaded = SessionScalarState.markHistoryLoaded,
		getNextHistoryPageToken = function()
			-- upvalues: SessionScalarState (copy)
			return SessionScalarState.getNextHistoryPageToken(false)
		end,
		getMergedHistory = Signal,
		ingestRealtimeUpdate = function(p4, p5)
			-- upvalues: SessionHistoryMergeModule (upval), OverlayBySequenceId (ref), LoadedBySequenceId (ref), SessionScalarState (copy), Signal2 (copy), buildMergedHistory (copy)
			if SessionHistoryMergeModule.ingestOverlayUpdate(OverlayBySequenceId, LoadedBySequenceId, p4, p5) then
				SessionScalarState.noteHistorySequenceId(p5)
				Signal2(buildMergedHistory())
			end
		end,
		mergeHistoryPage = mergeHistoryPage,
		refreshSession = HistoryLoader.refreshSession,
		loadOlderHistory = HistoryLoader.loadOlderHistory,
		requestOlderHistoryWhile = HistoryLoader.requestOlderHistoryWhile,
		sendPrompt = function(p4)
			-- upvalues: FFlagBuildExperienceModelPickerData (upval), Experiment (ref), ExperimentOverrideModule (upval), SessionScalarState (copy), PendingExperimentKey (ref), SendPrompt (copy)
			if not FFlagBuildExperienceModelPickerData or p4.sendConfiguration == nil then
				Experiment = if ExperimentOverrideModule.isEnabled() then ExperimentOverrideModule.getExperiment(ExperimentOverrideModule.getKey(SessionScalarState.getCasSessionId(false)) or PendingExperimentKey) else nil
			end
			return SendPrompt.sendPrompt(p4)
		end,
		stopActiveTurn = function()
			-- upvalues: Callback (ref)
			if Callback ~= nil then
				Callback()
			end
		end,
		submitActiveToolResult = function(Content, p4, TurnId, ReferenceId)
			-- upvalues: SessionScalarState (copy), Deps (copy)
			local CasSessionId = SessionScalarState.getCasSessionId(false)
			
			return if CasSessionId == nil then nil else Deps.submitToolResult({
				sessionId = CasSessionId,
				turnId = TurnId,
				referenceId = ReferenceId,
				content = Content,
				isError = p4 ~= nil and p4
			})
		end,
		getActiveTurnHandle = function()
			-- upvalues: SessionScalarState (copy), Deps (copy)
			local CasSessionId = SessionScalarState.getCasSessionId(false)
			
			return if CasSessionId == nil then nil else Deps.getActiveTurnHandle(CasSessionId)
		end,
		startPollingActiveTurn = function(CasSessionId)
			-- upvalues: SessionScalarState (copy), HistoryPolling (copy)
			local CasSessionId1 = SessionScalarState.getCasSessionId(false)
			
			return if CasSessionId1 == nil then function() end else HistoryPolling.startPollingActiveTurn(CasSessionId1, CasSessionId)
		end
	}
end