local parent = script:FindFirstAncestor("DataHydration").Parent
local signalsModule = require(parent.Signals)
local sharedFlagsModule = require(parent.SharedFlags)
local acpProtocolModule = require(script.Parent.Acp.AcpProtocol)
local classifyRequestFailureModule = require(script.Parent.classifyRequestFailure)
local experimentOverrideModule = require(script.Parent.experimentOverride)
local sessionHistoryMergeModule = require(script.Parent.sessionHistoryMerge)
local _ = require(script.Parent.types)
local constantsModule = require(script.Parent.ChatSession.constants)
local historyLoaderModule = require(script.Parent.ChatSession.historyLoader)
local historyPageUtilsModule = require(script.Parent.ChatSession.historyPageUtils)
local historyPollingModule = require(script.Parent.ChatSession.historyPolling)
local sendPromptModule = require(script.Parent.ChatSession.sendPrompt)
local sessionHistoryCacheModule = require(script.Parent.ChatSession.sessionHistoryCache)
local sessionScalarStateModule = require(script.Parent.ChatSession.sessionScalarState)
local _ = require(script.Parent.ChatSession.sessionDeps)
local fFlagBuildExperiencePinForBuild = sharedFlagsModule.FFlagBuildExperiencePinForBuild
local fFlagBuildExperiencePromptFailureTelemetry = sharedFlagsModule.FFlagBuildExperiencePromptFailureTelemetry

return function(p1, p2, p3, p4)
	-- upvalues: sessionScalarStateModule (ref), constantsModule (ref), sessionHistoryCacheModule (ref), experimentOverrideModule (ref), sessionHistoryMergeModule (ref), signalsModule (ref), historyPageUtilsModule (ref), historyLoaderModule (ref), historyPollingModule (ref), acpProtocolModule (ref), fFlagBuildExperiencePromptFailureTelemetry (ref), classifyRequestFailureModule (ref), fFlagBuildExperiencePinForBuild (ref), sendPromptModule (ref)
	local t = {}
	local t_1 = {}
	local var1 = sessionScalarStateModule.createSessionScalarState(p4)
	local var2 = nil
	local rpcTimeoutSeconds = p1.rpcTimeoutSeconds or constantsModule.getRpcTimeoutSeconds()
	local var3 = sessionHistoryCacheModule.createSessionHistoryCache()
	local var4 = 0
	local var5 = nil
	local var6 = nil
	
	local function _()
		-- upvalues: experimentOverrideModule (copy), var1 (ref), var5 (write)
		return experimentOverrideModule.getKey(var1.getCasSessionId(false)) or var5
	end
	
	local _ = function()
		-- upvalues: var6 (write), experimentOverrideModule (copy), var1 (ref), var5 (write)
		local getExperiment
		if experimentOverrideModule.isEnabled() then
			getExperiment = experimentOverrideModule.getExperiment
			getExperiment = getExperiment(experimentOverrideModule.getKey(var1.getCasSessionId(false)) or var5)
		else
			getExperiment = nil
		end
		var6 = getExperiment
	end
	
	local function buildMergedHistory()
		-- upvalues: sessionHistoryMergeModule (copy), t (write), t_1 (write)
		return sessionHistoryMergeModule.orderMergedHistoryItems(t, t_1)
	end
	
	local var7, var8 = signalsModule.createSignal(buildMergedHistory())
	
	local function notifySessionStateChanged()
		-- upvalues: var8 (ref), buildMergedHistory (ref)
		var8(buildMergedHistory())
	end
	
	local function noteHistorySequenceIds(p5)
		-- upvalues: var1 (ref), historyPageUtilsModule (copy)
		var1.noteHistorySequenceId(historyPageUtilsModule.getMaxHistorySequenceId(p5))
	end
	
	local function noteTurnSequenceIds(p5)
		-- upvalues: var1 (ref)
		local getLatestProcessedSequenceNumber = p5.getLatestProcessedSequenceNumber
		
		if getLatestProcessedSequenceNumber ~= nil then
			var1.noteHistorySequenceId(getLatestProcessedSequenceNumber())
		end
	end
	
	local function snapshotActiveSession()
		-- upvalues: var1 (ref), t (write), t_1 (write)
		local casSessionId = var1.getCasSessionId(false)
		
		return if casSessionId == nil or casSessionId == "" then nil else {
			loadedBySequenceId = t,
			overlayBySequenceId = t_1,
			hasLoadedHistory = var1.getHasLoadedHistory(false),
			nextHistoryPageToken = var1.getNextHistoryPageToken(false),
			latestObservedHistorySequenceId = var1.getLatestObservedHistorySequenceId(false)
		}
	end
	
	local _ = function()
		-- upvalues: var1 (ref), snapshotActiveSession (ref), var3 (ref)
		local casSessionId = var1.getCasSessionId(false)
		
		if casSessionId == nil or casSessionId == "" or not var1.getHasLoadedHistory(false) then return end
		local var9 = snapshotActiveSession()
		
		if var9 ~= nil then
			var3.save(casSessionId, var9)
		end
	end
	
	local _ = function(p5)
		-- upvalues: var3 (ref), t (write), t_1 (write), var1 (ref), var8 (ref), buildMergedHistory (ref)
		local var9 = var3.restore(p5)
		
		if var9 == nil then
			return false
		end
		t = var9.loadedBySequenceId
		t_1 = var9.overlayBySequenceId
		var1.setHasLoadedHistory(var9.hasLoadedHistory)
		var1.setNextHistoryPageToken(var9.nextHistoryPageToken)
		var1.setLatestObservedHistorySequenceId(var9.latestObservedHistorySequenceId)
		var8(buildMergedHistory())
		
		return true
	end
	
	local function clearActiveSessionState()
		-- upvalues: t (write), t_1 (write), var1 (ref), var8 (ref), buildMergedHistory (ref)
		t = {}
		t_1 = {}
		var1.setHasLoadedHistory(false)
		var1.setNextHistoryPageToken(nil)
		var1.setHistoryLoadInFlight(false)
		var1.setLatestObservedHistorySequenceId(nil)
		var8(buildMergedHistory())
	end
	
	local function setCasSessionIdInternal(value)
		-- upvalues: var1 (ref), var4 (write), snapshotActiveSession (ref), var3 (ref), t (write), t_1 (write), var8 (ref), buildMergedHistory (ref), p1 (ref), clearActiveSessionState (ref)
		if value == "" then return end
		if var1.getCasSessionId(false) == value then return end
		var4 += 1
		local casSessionId = var1.getCasSessionId(false)
		
		if casSessionId ~= nil and casSessionId ~= "" and var1.getHasLoadedHistory(false) then
			local var9 = snapshotActiveSession()
			
			if var9 ~= nil then
				var3.save(casSessionId, var9)
			end
		end
		local var10
		var1.setCasSessionId(value)
		var1.setHistoryLoadInFlight(false)
		local var11 = var3.restore(value)
		
		if var11 == nil then
			var10 = false
		else
			t = var11.loadedBySequenceId
			t_1 = var11.overlayBySequenceId
			var1.setHasLoadedHistory(var11.hasLoadedHistory)
			var1.setNextHistoryPageToken(var11.nextHistoryPageToken)
			var1.setLatestObservedHistorySequenceId(var11.latestObservedHistorySequenceId)
			var8(buildMergedHistory())
			var10 = true
		end
		if var10 then
			p1.onCasSessionIdChanged(value)
			
			return
		end
		clearActiveSessionState()
		p1.onCasSessionIdChanged(value)
	end
	
	local function mergeHistoryPage(p5, p6)
		-- upvalues: sessionHistoryMergeModule (copy), t (write), t_1 (write), var1 (ref), historyPageUtilsModule (copy), var8 (ref), buildMergedHistory (ref)
		sessionHistoryMergeModule.mergeHistoryIntoMap(t, p5, t_1)
		var1.setNextHistoryPageToken(p6)
		var1.noteHistorySequenceId(historyPageUtilsModule.getMaxHistorySequenceId(p5))
		var8(buildMergedHistory())
	end
	
	local function ingestRealtimeUpdate(p5, p6)
		-- upvalues: sessionHistoryMergeModule (copy), t_1 (write), t (write), var1 (ref), var8 (ref), buildMergedHistory (ref)
		if sessionHistoryMergeModule.ingestOverlayUpdate(t_1, t, p5, p6) then
			var1.noteHistorySequenceId(p6)
			var8(buildMergedHistory())
		end
	end
	
	local var9 = historyLoaderModule.createHistoryLoader({
		deps = p1,
		rpcTimeoutSeconds = rpcTimeoutSeconds,
		getCasSessionId = function()
			-- upvalues: var1 (ref)
			return var1.getCasSessionId(false)
		end,
		getHistoryLoadInFlight = function()
			-- upvalues: var1 (ref)
			return var1.getHistoryLoadInFlight(false)
		end,
		setHistoryLoadInFlight = var1.setHistoryLoadInFlight,
		getNextHistoryPageToken = function()
			-- upvalues: var1 (ref)
			return var1.getNextHistoryPageToken(false)
		end,
		setNextHistoryPageToken = var1.setNextHistoryPageToken,
		getLoadedBySequenceId = function()
			-- upvalues: t (write)
			return t
		end,
		setLoadedBySequenceId = function(value)
			-- upvalues: t (write)
			t = value
		end,
		getOverlayBySequenceId = function()
			-- upvalues: t_1 (write)
			return t_1
		end,
		setOverlayBySequenceId = function(value)
			-- upvalues: t_1 (write)
			t_1 = value
		end,
		buildMergedHistory = buildMergedHistory,
		mergeHistoryPage = mergeHistoryPage,
		noteHistorySequenceIds = noteHistorySequenceIds,
		notifyMergedHistoryChanged = notifySessionStateChanged,
		markHistoryLoaded = var1.markHistoryLoaded,
		getRefreshGeneration = function()
			-- upvalues: var4 (write)
			return var4
		end,
		onInitialSessionLoad = function(p5, p6)
			-- upvalues: experimentOverrideModule (copy)
			if not experimentOverrideModule.isEnabled() then return end
			local key = experimentOverrideModule.getKey(p5)
			
			if experimentOverrideModule.isPending(key) then return end
			local var10 = if p6 == nil or p6._meta == nil or p6._meta._roblox == nil then nil else p6._meta._roblox.experiment
			
			if var10 == nil then
				experimentOverrideModule.clear(key)
				
				return
			end
			experimentOverrideModule.hydrate(key, var10.specVersion)
		end
	})
	local var10 = historyPollingModule.createHistoryPolling({
		deps = p1,
		rpcTimeoutSeconds = rpcTimeoutSeconds,
		getCasSessionId = function()
			-- upvalues: var1 (ref)
			return var1.getCasSessionId(false)
		end,
		getNextHistoryPageToken = function()
			-- upvalues: var1 (ref)
			return var1.getNextHistoryPageToken(false)
		end,
		mergeHistoryPage = mergeHistoryPage
	})
	
	local function ensureInitialized()
		-- upvalues: var1 (ref), p1 (ref), acpProtocolModule (copy), historyPageUtilsModule (copy), rpcTimeoutSeconds (ref), fFlagBuildExperiencePromptFailureTelemetry (copy), classifyRequestFailureModule (copy)
		if var1.getInitialized(false) then
			return true, nil, nil
		end
		local var11 = historyPageUtilsModule.awaitRequestState(p1.initialize({ protocolVersion = acpProtocolModule.ProtocolVersion }).state, os.clock() + rpcTimeoutSeconds)
		
		if var11.status == "succeeded" then
			var1.setInitialized(true)
			
			return true, nil, nil
		end
		local var12 = false
		local errorCode = var11.errorCode
		
		if fFlagBuildExperiencePromptFailureTelemetry then
			return var12, errorCode, classifyRequestFailureModule(var11)
		end
		return var12, errorCode, nil
	end
	
	local var11 = sendPromptModule.createSendPrompt({
		ensureInitialized = ensureInitialized,
		ensureCasSession = function()
			-- upvalues: var1 (ref), p2 (ref), p3 (ref), ensureInitialized (ref), fFlagBuildExperiencePromptFailureTelemetry (copy), p1 (ref), var6 (write), fFlagBuildExperiencePinForBuild (copy), historyPageUtilsModule (copy), rpcTimeoutSeconds (ref), classifyRequestFailureModule (copy), experimentOverrideModule (copy), var5 (write), setCasSessionIdInternal (ref)
			local casSessionId = var1.getCasSessionId(false)
			
			if casSessionId ~= nil then
				return casSessionId, nil
			elseif p2 == nil or p3 == nil then
				return nil, { stage = "missing_project" }
			end
			local var12, var13, var14 = ensureInitialized()
			
			if not var12 then
				return nil, {
					stage = "initialize",
					errorCode = var13,
					requestFailure = if fFlagBuildExperiencePromptFailureTelemetry then var14 else nil
				}
			end
			local var15 = historyPageUtilsModule.awaitRequestState(p1.sessionNew({
				project = { universeId = p2, placeId = p3 },
				experiment = var6,
				application = if fFlagBuildExperiencePinForBuild then "build" else nil
			}).state, os.clock() + rpcTimeoutSeconds)
			
			if var15.status ~= "succeeded" then
				return nil, {
					stage = "session_new",
					errorCode = var15.errorCode,
					requestFailure = if fFlagBuildExperiencePromptFailureTelemetry then classifyRequestFailureModule(var15) else nil
				}
			end
			local result = var15.result
			local var16 = if typeof(result) == "table" then result.sessionId else nil
			
			if typeof(var16) ~= "string" or var16 == "" then
				return nil, { stage = "session_new" }
			elseif experimentOverrideModule.isEnabled() then
				local key = experimentOverrideModule.getKey(var16)
				
				if experimentOverrideModule.has(var5) then
					experimentOverrideModule.move(var5, key)
				elseif var6 ~= nil then
					experimentOverrideModule.hydrate(key, var6.specVersion)
				end
				experimentOverrideModule.consumePending(key)
			end
			setCasSessionIdInternal(var16)
			
			return var16, nil
		end,
		getLatestObservedHistorySequenceId = function()
			-- upvalues: var1 (ref)
			return var1.getLatestObservedHistorySequenceId(false)
		end,
		noteTurnSequenceIds = noteTurnSequenceIds,
		startPollingTurnFromHistory = var10.startPollingTurnFromHistory,
		getAssistantTurnSequence = function()
			-- upvalues: var1 (ref)
			return var1.getAssistantTurnSequence(false)
		end,
		incrementAssistantTurnSequence = var1.incrementAssistantTurnSequence,
		sessionPrompt = function(p5)
			-- upvalues: experimentOverrideModule (copy), var1 (ref), var5 (write), p1 (ref)
			local getPromptExperiment
			if experimentOverrideModule.isEnabled() then
				getPromptExperiment = experimentOverrideModule.getPromptExperiment
				getPromptExperiment = getPromptExperiment(experimentOverrideModule.getKey(var1.getCasSessionId(false)) or var5)
			else
				getPromptExperiment = nil
			end
			local var12 = p1.sessionPrompt({
				sessionId = p5.sessionId,
				prompt = p5.prompt,
				_meta = p5._meta,
				experiment = getPromptExperiment
			})
			
			if getPromptExperiment ~= nil then
				experimentOverrideModule.consumePending(experimentOverrideModule.getKey(var1.getCasSessionId(false)) or var5)
			end
			return var12
		end,
		setActiveStop = function(value)
			-- upvalues: var2 (write)
			var2 = value
		end
	})
	
	return {
		universeId = p2,
		placeId = p3,
		getCasSessionId = function()
			-- upvalues: var1 (ref)
			return var1.getCasSessionId(false)
		end,
		setCasSessionId = setCasSessionIdInternal,
		setPendingExperimentKey = function(value)
			-- upvalues: var5 (write)
			var5 = value
		end,
		hasLoadedHistory = function()
			-- upvalues: var1 (ref)
			return var1.getHasLoadedHistory(false)
		end,
		markHistoryLoaded = var1.markHistoryLoaded,
		getNextHistoryPageToken = function()
			-- upvalues: var1 (ref)
			return var1.getNextHistoryPageToken(false)
		end,
		getMergedHistory = var7,
		ingestRealtimeUpdate = ingestRealtimeUpdate,
		mergeHistoryPage = mergeHistoryPage,
		refreshSession = var9.refreshSession,
		loadOlderHistory = var9.loadOlderHistory,
		requestOlderHistoryWhile = var9.requestOlderHistoryWhile,
		sendPrompt = function(p5)
			-- upvalues: var6 (write), experimentOverrideModule (copy), var1 (ref), var5 (write), var11 (ref)
			local getExperiment
			if experimentOverrideModule.isEnabled() then
				getExperiment = experimentOverrideModule.getExperiment
				getExperiment = getExperiment(experimentOverrideModule.getKey(var1.getCasSessionId(false)) or var5)
			else
				getExperiment = nil
			end
			var6 = getExperiment
			
			return var11.sendPrompt(p5)
		end,
		stopActiveTurn = function()
			-- upvalues: var2 (write)
			if var2 ~= nil then
				var2()
			end
		end,
		submitActiveToolResult = function(p5, p6, p7, p8)
			-- upvalues: var1 (ref), p1 (ref)
			local casSessionId = var1.getCasSessionId(false)
			
			return if casSessionId == nil then nil else p1.submitToolResult({
				sessionId = casSessionId,
				turnId = p7,
				referenceId = p8,
				content = p5,
				isError = if p6 ~= nil then false else p6
			})
		end,
		getActiveTurnHandle = function()
			-- upvalues: var1 (ref), p1 (ref)
			local casSessionId = var1.getCasSessionId(false)
			
			return if casSessionId == nil then nil else p1.getActiveTurnHandle(casSessionId)
		end,
		startPollingActiveTurn = function(p5)
			-- upvalues: var1 (ref), var10 (ref)
			local casSessionId = var1.getCasSessionId(false)
			
			return if casSessionId == nil then function() end else var10.startPollingActiveTurn(casSessionId, p5)
		end
	}
end