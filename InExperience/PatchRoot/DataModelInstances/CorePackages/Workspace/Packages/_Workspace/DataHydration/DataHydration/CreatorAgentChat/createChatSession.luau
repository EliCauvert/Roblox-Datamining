local signalsModule = require(script:FindFirstAncestor("DataHydration").Parent.Signals)
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

return function(p0, p1, p2, p3)
	-- upvalues: sessionScalarStateModule (ref), constantsModule (ref), sessionHistoryCacheModule (ref), sessionHistoryMergeModule (ref), signalsModule (ref), historyPageUtilsModule (ref), historyLoaderModule (ref), historyPollingModule (ref), acpProtocolModule (ref), experimentOverrideModule (ref), sendPromptModule (ref)
	local t = {}
	local t_1 = {}
	local var13 = sessionScalarStateModule.createSessionScalarState(p3)
	local var14 = nil
	local rpcTimeoutSeconds = p0.rpcTimeoutSeconds or constantsModule.getRpcTimeoutSeconds()
	local var16 = sessionHistoryCacheModule.createSessionHistoryCache()
	local var17 = 0
	
	local function buildMergedHistory()
		-- upvalues: sessionHistoryMergeModule (copy), t (write), t_1 (write)
		return sessionHistoryMergeModule.orderMergedHistoryItems(t, t_1)
	end
	
	local var19, var20 = signalsModule.createSignal(buildMergedHistory())
	
	local function notifySessionStateChanged()
		-- upvalues: var20 (ref), buildMergedHistory (ref)
		var20(buildMergedHistory())
	end
	
	local function noteHistorySequenceIds(p4)
		-- upvalues: var13 (ref), historyPageUtilsModule (copy)
		var13.noteHistorySequenceId(historyPageUtilsModule.getMaxHistorySequenceId(p4))
	end
	
	local function noteTurnSequenceIds(p5)
		-- upvalues: var13 (ref)
		local getLatestProcessedSequenceNumber = p5.getLatestProcessedSequenceNumber
		
		if getLatestProcessedSequenceNumber ~= nil then
			var13.noteHistorySequenceId(getLatestProcessedSequenceNumber())
		end
	end
	
	local function snapshotActiveSession()
		-- upvalues: var13 (ref), t (write), t_1 (write)
		local casSessionId = var13.getCasSessionId(false)
		
		return if casSessionId == nil or casSessionId == "" then nil else {
			loadedBySequenceId = t,
			overlayBySequenceId = t_1,
			hasLoadedHistory = var13.getHasLoadedHistory(false),
			nextHistoryPageToken = var13.getNextHistoryPageToken(false),
			latestObservedHistorySequenceId = var13.getLatestObservedHistorySequenceId(false)
		}
	end
	
	local function _()
		-- upvalues: var13 (ref), snapshotActiveSession (ref), var16 (ref)
		local casSessionId = var13.getCasSessionId(false)
		
		if casSessionId == nil or casSessionId == "" or not var13.getHasLoadedHistory(false) then return end
		local var34 = snapshotActiveSession()
		
		if var34 ~= nil then
			var16.save(casSessionId, var34)
		end
	end
	
	local _ = function(p6)
		-- upvalues: var16 (ref), t (write), t_1 (write), var13 (ref), var20 (ref), buildMergedHistory (ref)
		local var35 = var16.restore(p6)
		
		if var35 == nil then
			return false
		end
		t = var35.loadedBySequenceId
		t_1 = var35.overlayBySequenceId
		var13.setHasLoadedHistory(var35.hasLoadedHistory)
		var13.setNextHistoryPageToken(var35.nextHistoryPageToken)
		var13.setLatestObservedHistorySequenceId(var35.latestObservedHistorySequenceId)
		var20(buildMergedHistory())
		
		return true
	end
	
	local function clearActiveSessionState()
		-- upvalues: t (write), t_1 (write), var13 (ref), var20 (ref), buildMergedHistory (ref)
		t = {}
		t_1 = {}
		var13.setHasLoadedHistory(false)
		var13.setNextHistoryPageToken(nil)
		var13.setHistoryLoadInFlight(false)
		var13.setLatestObservedHistorySequenceId(nil)
		var20(buildMergedHistory())
	end
	
	local function setCasSessionIdInternal(value)
		-- upvalues: var13 (ref), var17 (write), snapshotActiveSession (ref), var16 (ref), t (write), t_1 (write), var20 (ref), buildMergedHistory (ref), p0 (ref), clearActiveSessionState (ref)
		if value == "" then return end
		if var13.getCasSessionId(false) == value then return end
		var17 += 1
		local casSessionId = var13.getCasSessionId(false)
		
		if casSessionId ~= nil and casSessionId ~= "" and var13.getHasLoadedHistory(false) then
			local var37 = snapshotActiveSession()
			
			if var37 ~= nil then
				var16.save(casSessionId, var37)
			end
		end
		local var39
		var13.setCasSessionId(value)
		var13.setHistoryLoadInFlight(false)
		local var38 = var16.restore(value)
		
		if var38 == nil then
			var39 = false
		else
			t = var38.loadedBySequenceId
			t_1 = var38.overlayBySequenceId
			var13.setHasLoadedHistory(var38.hasLoadedHistory)
			var13.setNextHistoryPageToken(var38.nextHistoryPageToken)
			var13.setLatestObservedHistorySequenceId(var38.latestObservedHistorySequenceId)
			var20(buildMergedHistory())
			var39 = true
		end
		if var39 then
			p0.onCasSessionIdChanged(value)
			
			return
		end
		clearActiveSessionState()
		p0.onCasSessionIdChanged(value)
	end
	
	local function mergeHistoryPage(p7, p8)
		-- upvalues: sessionHistoryMergeModule (copy), t (write), t_1 (write), var13 (ref), historyPageUtilsModule (copy), var20 (ref), buildMergedHistory (ref)
		sessionHistoryMergeModule.mergeHistoryIntoMap(t, p7, t_1)
		var13.setNextHistoryPageToken(p8)
		var13.noteHistorySequenceId(historyPageUtilsModule.getMaxHistorySequenceId(p7))
		var20(buildMergedHistory())
	end
	
	local function ingestRealtimeUpdate(p9, p10)
		-- upvalues: sessionHistoryMergeModule (copy), t_1 (write), t (write), var13 (ref), var20 (ref), buildMergedHistory (ref)
		if sessionHistoryMergeModule.ingestOverlayUpdate(t_1, t, p9, p10) then
			var13.noteHistorySequenceId(p10)
			var20(buildMergedHistory())
		end
	end
	
	local var29 = historyLoaderModule.createHistoryLoader({
		deps = p0,
		rpcTimeoutSeconds = rpcTimeoutSeconds,
		getCasSessionId = function()
			-- upvalues: var13 (ref)
			return var13.getCasSessionId(false)
		end,
		getHistoryLoadInFlight = function()
			-- upvalues: var13 (ref)
			return var13.getHistoryLoadInFlight(false)
		end,
		setHistoryLoadInFlight = var13.setHistoryLoadInFlight,
		getNextHistoryPageToken = function()
			-- upvalues: var13 (ref)
			return var13.getNextHistoryPageToken(false)
		end,
		setNextHistoryPageToken = var13.setNextHistoryPageToken,
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
		markHistoryLoaded = var13.markHistoryLoaded,
		getRefreshGeneration = function()
			-- upvalues: var17 (write)
			return var17
		end
	})
	local var30 = historyPollingModule.createHistoryPolling({
		deps = p0,
		rpcTimeoutSeconds = rpcTimeoutSeconds,
		getCasSessionId = function()
			-- upvalues: var13 (ref)
			return var13.getCasSessionId(false)
		end,
		getNextHistoryPageToken = function()
			-- upvalues: var13 (ref)
			return var13.getNextHistoryPageToken(false)
		end,
		mergeHistoryPage = mergeHistoryPage
	})
	
	local function ensureInitialized()
		-- upvalues: var13 (ref), p0 (ref), acpProtocolModule (copy), historyPageUtilsModule (copy), rpcTimeoutSeconds (ref)
		if var13.getInitialized(false) then
			return true, nil
		end
		local var40 = historyPageUtilsModule.awaitRequestState(p0.initialize({ protocolVersion = acpProtocolModule.ProtocolVersion }).state, os.clock() + rpcTimeoutSeconds)
		
		if var40.status == "succeeded" then
			var13.setInitialized(true)
			
			return true, nil
		end
		return false, var40.errorCode
	end
	
	return {
		universeId = p1,
		placeId = p2,
		getCasSessionId = function()
			-- upvalues: var13 (ref)
			return var13.getCasSessionId(false)
		end,
		setCasSessionId = setCasSessionIdInternal,
		hasLoadedHistory = function()
			-- upvalues: var13 (ref)
			return var13.getHasLoadedHistory(false)
		end,
		markHistoryLoaded = var13.markHistoryLoaded,
		getNextHistoryPageToken = function()
			-- upvalues: var13 (ref)
			return var13.getNextHistoryPageToken(false)
		end,
		getMergedHistory = var19,
		ingestRealtimeUpdate = ingestRealtimeUpdate,
		mergeHistoryPage = mergeHistoryPage,
		refreshSession = var29.refreshSession,
		loadOlderHistory = var29.loadOlderHistory,
		sendPrompt = sendPromptModule.createSendPrompt({
			ensureInitialized = ensureInitialized,
			ensureCasSession = function()
				-- upvalues: var13 (ref), p1 (ref), p2 (ref), ensureInitialized (ref), p0 (ref), experimentOverrideModule (copy), historyPageUtilsModule (copy), rpcTimeoutSeconds (ref), setCasSessionIdInternal (ref)
				local casSessionId = var13.getCasSessionId(false)
				
				if casSessionId ~= nil then
					return casSessionId, nil
				elseif p1 == nil or p2 == nil then
					return nil, { stage = "missing_project" }
				end
				local var42, var43 = ensureInitialized()
				
				if not var42 then
					return nil, { stage = "initialize", errorCode = var43 }
				end
				local var44 = historyPageUtilsModule.awaitRequestState(p0.sessionNew({
					project = { universeId = p1, placeId = p2 },
					experiment = experimentOverrideModule.getExperiment()
				}).state, os.clock() + rpcTimeoutSeconds)
				
				if var44.status ~= "succeeded" then
					return nil, { stage = "session_new", errorCode = var44.errorCode }
				end
				local result = var44.result
				local var45 = if typeof(result) == "table" then result.sessionId else nil
				
				if typeof(var45) == "string" and var45 ~= "" then
					setCasSessionIdInternal(var45)
					
					return var45, nil
				end
				return nil, { stage = "session_new" }
			end,
			getLatestObservedHistorySequenceId = function()
				-- upvalues: var13 (ref)
				return var13.getLatestObservedHistorySequenceId(false)
			end,
			noteTurnSequenceIds = noteTurnSequenceIds,
			startPollingTurnFromHistory = var30.startPollingTurnFromHistory,
			getAssistantTurnSequence = function()
				-- upvalues: var13 (ref)
				return var13.getAssistantTurnSequence(false)
			end,
			incrementAssistantTurnSequence = var13.incrementAssistantTurnSequence,
			sessionPrompt = p0.sessionPrompt,
			setActiveStop = function(value)
				-- upvalues: var14 (write)
				var14 = value
			end
		}).sendPrompt,
		stopActiveTurn = function()
			-- upvalues: var14 (write)
			if var14 ~= nil then
				var14()
			end
		end,
		submitActiveToolResult = function(p11, p12, p13, p14)
			-- upvalues: var13 (ref), p0 (ref)
			local casSessionId = var13.getCasSessionId(false)
			
			return if casSessionId == nil then nil else p0.submitToolResult({
				sessionId = casSessionId,
				turnId = p13,
				referenceId = p14,
				content = p11,
				isError = if p12 ~= nil then false else p12
			})
		end,
		getActiveTurnHandle = function()
			-- upvalues: var13 (ref), p0 (ref)
			local casSessionId = var13.getCasSessionId(false)
			
			return if casSessionId == nil then nil else p0.getActiveTurnHandle(casSessionId)
		end,
		startPollingActiveTurn = function(p15)
			-- upvalues: var13 (ref), var30 (ref)
			local casSessionId = var13.getCasSessionId(false)
			
			return if casSessionId == nil then function() end else var30.startPollingActiveTurn(casSessionId, p15)
		end
	}
end