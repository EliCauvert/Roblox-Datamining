local parent = script:FindFirstAncestor("DataHydration").Parent
local signalsModule = require(parent.Signals)
local sharedFlagsModule = require(parent.SharedFlags)
local acpProtocolModule = require(script.Parent.Acp.AcpProtocol)
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

return function(p1, p2, p3, p4)
	-- upvalues: sessionScalarStateModule (ref), constantsModule (ref), sessionHistoryCacheModule (ref), sessionHistoryMergeModule (ref), signalsModule (ref), historyPageUtilsModule (ref), historyLoaderModule (ref), historyPollingModule (ref), acpProtocolModule (ref), experimentOverrideModule (ref), fFlagBuildExperiencePinForBuild (ref), sendPromptModule (ref)
	local t = {}
	local t_1 = {}
	local var1 = sessionScalarStateModule.createSessionScalarState(p4)
	local var2 = nil
	local rpcTimeoutSeconds = p1.rpcTimeoutSeconds or constantsModule.getRpcTimeoutSeconds()
	local var3 = sessionHistoryCacheModule.createSessionHistoryCache()
	local var4 = 0
	
	local function buildMergedHistory()
		-- upvalues: sessionHistoryMergeModule (copy), t (write), t_1 (write)
		return sessionHistoryMergeModule.orderMergedHistoryItems(t, t_1)
	end
	
	local var5, var6 = signalsModule.createSignal(buildMergedHistory())
	
	local function notifySessionStateChanged()
		-- upvalues: var6 (ref), buildMergedHistory (ref)
		var6(buildMergedHistory())
	end
	
	local function noteHistorySequenceIds(p1)
		-- upvalues: var1 (ref), historyPageUtilsModule (copy)
		var1.noteHistorySequenceId(historyPageUtilsModule.getMaxHistorySequenceId(p1))
	end
	
	local function noteTurnSequenceIds(p1)
		-- upvalues: var1 (ref)
		local getLatestProcessedSequenceNumber = p1.getLatestProcessedSequenceNumber
		
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
	
	local function _()
		-- upvalues: var1 (ref), snapshotActiveSession (ref), var3 (ref)
		local casSessionId = var1.getCasSessionId(false)
		
		if casSessionId == nil or casSessionId == "" or not var1.getHasLoadedHistory(false) then return end
		local var1 = snapshotActiveSession()
		
		if var1 ~= nil then
			var3.save(casSessionId, var1)
		end
	end
	
	local _ = function(p1)
		-- upvalues: var3 (ref), t (write), t_1 (write), var1 (ref), var6 (ref), buildMergedHistory (ref)
		local var1 = var3.restore(p1)
		
		if var1 == nil then
			return false
		end
		t = var1.loadedBySequenceId
		t_1 = var1.overlayBySequenceId
		var1.setHasLoadedHistory(var1.hasLoadedHistory)
		var1.setNextHistoryPageToken(var1.nextHistoryPageToken)
		var1.setLatestObservedHistorySequenceId(var1.latestObservedHistorySequenceId)
		var6(buildMergedHistory())
		
		return true
	end
	
	local function clearActiveSessionState()
		-- upvalues: t (write), t_1 (write), var1 (ref), var6 (ref), buildMergedHistory (ref)
		t = {}
		t_1 = {}
		var1.setHasLoadedHistory(false)
		var1.setNextHistoryPageToken(nil)
		var1.setHistoryLoadInFlight(false)
		var1.setLatestObservedHistorySequenceId(nil)
		var6(buildMergedHistory())
	end
	
	local function setCasSessionIdInternal(value)
		-- upvalues: var1 (ref), var4 (write), snapshotActiveSession (ref), var3 (ref), t (write), t_1 (write), var6 (ref), buildMergedHistory (ref), p1 (ref), clearActiveSessionState (ref)
		if value == "" then return end
		if var1.getCasSessionId(false) == value then return end
		var4 += 1
		local casSessionId = var1.getCasSessionId(false)
		
		if casSessionId ~= nil and casSessionId ~= "" and var1.getHasLoadedHistory(false) then
			local var1 = snapshotActiveSession()
			
			if var1 ~= nil then
				var3.save(casSessionId, var1)
			end
		end
		local var2
		var1.setCasSessionId(value)
		var1.setHistoryLoadInFlight(false)
		local var3 = var3.restore(value)
		
		if var3 == nil then
			var2 = false
		else
			t = var3.loadedBySequenceId
			t_1 = var3.overlayBySequenceId
			var1.setHasLoadedHistory(var3.hasLoadedHistory)
			var1.setNextHistoryPageToken(var3.nextHistoryPageToken)
			var1.setLatestObservedHistorySequenceId(var3.latestObservedHistorySequenceId)
			var6(buildMergedHistory())
			var2 = true
		end
		if var2 then
			p1.onCasSessionIdChanged(value)
			
			return
		end
		clearActiveSessionState()
		p1.onCasSessionIdChanged(value)
	end
	
	local function mergeHistoryPage(p1, p2)
		-- upvalues: sessionHistoryMergeModule (copy), t (write), t_1 (write), var1 (ref), historyPageUtilsModule (copy), var6 (ref), buildMergedHistory (ref)
		sessionHistoryMergeModule.mergeHistoryIntoMap(t, p1, t_1)
		var1.setNextHistoryPageToken(p2)
		var1.noteHistorySequenceId(historyPageUtilsModule.getMaxHistorySequenceId(p1))
		var6(buildMergedHistory())
	end
	
	local function ingestRealtimeUpdate(p1, p2)
		-- upvalues: sessionHistoryMergeModule (copy), t_1 (write), t (write), var1 (ref), var6 (ref), buildMergedHistory (ref)
		if sessionHistoryMergeModule.ingestOverlayUpdate(t_1, t, p1, p2) then
			var1.noteHistorySequenceId(p2)
			var6(buildMergedHistory())
		end
	end
	
	local var1 = historyLoaderModule.createHistoryLoader({
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
		end
	})
	local var2 = historyPollingModule.createHistoryPolling({
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
		-- upvalues: var1 (ref), p1 (ref), acpProtocolModule (copy), historyPageUtilsModule (copy), rpcTimeoutSeconds (ref)
		if var1.getInitialized(false) then
			return true, nil
		end
		local var1 = historyPageUtilsModule.awaitRequestState(p1.initialize({ protocolVersion = acpProtocolModule.ProtocolVersion }).state, os.clock() + rpcTimeoutSeconds)
		
		if var1.status == "succeeded" then
			var1.setInitialized(true)
			
			return true, nil
		end
		return false, var1.errorCode
	end
	
	return {
		universeId = p2,
		placeId = p3,
		getCasSessionId = function()
			-- upvalues: var1 (ref)
			return var1.getCasSessionId(false)
		end,
		setCasSessionId = setCasSessionIdInternal,
		hasLoadedHistory = function()
			-- upvalues: var1 (ref)
			return var1.getHasLoadedHistory(false)
		end,
		markHistoryLoaded = var1.markHistoryLoaded,
		getNextHistoryPageToken = function()
			-- upvalues: var1 (ref)
			return var1.getNextHistoryPageToken(false)
		end,
		getMergedHistory = var5,
		ingestRealtimeUpdate = ingestRealtimeUpdate,
		mergeHistoryPage = mergeHistoryPage,
		refreshSession = var1.refreshSession,
		loadOlderHistory = var1.loadOlderHistory,
		sendPrompt = sendPromptModule.createSendPrompt({
			ensureInitialized = ensureInitialized,
			ensureCasSession = function()
				-- upvalues: var1 (ref), p2 (ref), p3 (ref), ensureInitialized (ref), p1 (ref), experimentOverrideModule (copy), fFlagBuildExperiencePinForBuild (copy), historyPageUtilsModule (copy), rpcTimeoutSeconds (ref), setCasSessionIdInternal (ref)
				local casSessionId = var1.getCasSessionId(false)
				
				if casSessionId ~= nil then
					return casSessionId, nil
				elseif p2 == nil or p3 == nil then
					return nil, { stage = "missing_project" }
				end
				local var1, var2 = ensureInitialized()
				
				if not var1 then
					return nil, { stage = "initialize", errorCode = var2 }
				end
				local var3 = historyPageUtilsModule.awaitRequestState(p1.sessionNew({
					project = { universeId = p2, placeId = p3 },
					experiment = experimentOverrideModule.getExperiment(),
					application = if fFlagBuildExperiencePinForBuild then "build" else nil
				}).state, os.clock() + rpcTimeoutSeconds)
				
				if var3.status ~= "succeeded" then
					return nil, { stage = "session_new", errorCode = var3.errorCode }
				end
				local result = var3.result
				local var4 = if typeof(result) == "table" then result.sessionId else nil
				
				if typeof(var4) == "string" and var4 ~= "" then
					setCasSessionIdInternal(var4)
					
					return var4, nil
				end
				return nil, { stage = "session_new" }
			end,
			getLatestObservedHistorySequenceId = function()
				-- upvalues: var1 (ref)
				return var1.getLatestObservedHistorySequenceId(false)
			end,
			noteTurnSequenceIds = noteTurnSequenceIds,
			startPollingTurnFromHistory = var2.startPollingTurnFromHistory,
			getAssistantTurnSequence = function()
				-- upvalues: var1 (ref)
				return var1.getAssistantTurnSequence(false)
			end,
			incrementAssistantTurnSequence = var1.incrementAssistantTurnSequence,
			sessionPrompt = p1.sessionPrompt,
			setActiveStop = function(value)
				-- upvalues: var2 (write)
				var2 = value
			end
		}).sendPrompt,
		stopActiveTurn = function()
			-- upvalues: var2 (write)
			if var2 ~= nil then
				var2()
			end
		end,
		submitActiveToolResult = function(p1, p2, p3, p4)
			-- upvalues: var1 (ref), p1 (ref)
			local casSessionId = var1.getCasSessionId(false)
			
			return if casSessionId == nil then nil else p1.submitToolResult({
				sessionId = casSessionId,
				turnId = p3,
				referenceId = p4,
				content = p1,
				isError = if p2 ~= nil then false else p2
			})
		end,
		getActiveTurnHandle = function()
			-- upvalues: var1 (ref), p1 (ref)
			local casSessionId = var1.getCasSessionId(false)
			
			return if casSessionId == nil then nil else p1.getActiveTurnHandle(casSessionId)
		end,
		startPollingActiveTurn = function(p1)
			-- upvalues: var1 (ref), var2 (ref)
			local casSessionId = var1.getCasSessionId(false)
			
			return if casSessionId == nil then function() end else var2.startPollingActiveTurn(casSessionId, p1)
		end
	}
end