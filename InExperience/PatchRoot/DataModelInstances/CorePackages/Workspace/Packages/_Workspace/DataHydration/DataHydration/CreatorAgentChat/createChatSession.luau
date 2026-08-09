local signalsModule = require(script:FindFirstAncestor("DataHydration").Parent.Signals)
local acpProtocolModule = require(script.Parent.Acp.AcpProtocol)
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

return function(p0, p1, p2, p3) --[[ line: 34 | named "createChatSession" ]]
	-- upvalues: signalsModule (ref), sessionScalarStateModule (ref), constantsModule (ref), sessionHistoryCacheModule (ref), sessionHistoryMergeModule (ref), historyPageUtilsModule (ref), historyLoaderModule (ref), historyPollingModule (ref), acpProtocolModule (ref), sendPromptModule (ref)
	local t = {}
	local t_1 = {}
	local var12, var13 = signalsModule.createSignal(false)
	local var14, var15 = signalsModule.createSignal(nil)
	local var16, var17 = signalsModule.createSignal(nil)
	local var18 = sessionScalarStateModule.createSessionScalarState(p3)
	local var19 = nil
	local rpcTimeoutSeconds = p0.rpcTimeoutSeconds or constantsModule.getRpcTimeoutSeconds()
	local var21 = sessionHistoryCacheModule.createSessionHistoryCache()
	local var22 = 0
	
	local function buildMergedHistory() --[[ line: 52 ]]
		-- upvalues: sessionHistoryMergeModule (copy), t (write), t_1 (write)
		return sessionHistoryMergeModule.orderMergedHistoryItems(t, t_1)
	end
	
	local var24, var25 = signalsModule.createSignal(buildMergedHistory())
	
	local function notifyMergedHistoryChanged() --[[ line: 58 ]]
		-- upvalues: var25 (ref), buildMergedHistory (ref)
		var25(buildMergedHistory())
	end
	
	local function noteHistorySequenceIds(p4) --[[ line: 62 ]]
		-- upvalues: var18 (ref), historyPageUtilsModule (copy)
		var18.noteHistorySequenceId(historyPageUtilsModule.getMaxHistorySequenceId(p4))
	end
	
	local function noteTurnSequenceIds(p5) --[[ line: 66 ]]
		-- upvalues: var18 (ref)
		local getLatestProcessedSequenceNumber = p5.getLatestProcessedSequenceNumber
		
		if getLatestProcessedSequenceNumber ~= nil then
			var18.noteHistorySequenceId(getLatestProcessedSequenceNumber())
		end
	end
	
	local function snapshotActiveSession() --[[ line: 73 ]]
		-- upvalues: var18 (ref), t (write), t_1 (write), var14 (ref), var12 (ref), var16 (ref)
		local casSessionId = var18.getCasSessionId(false)
		
		return if casSessionId == nil or casSessionId == "" then nil else {
			loadedBySequenceId = t,
			overlayBySequenceId = t_1,
			hasLoadedHistory = var18.getHasLoadedHistory(false),
			nextHistoryPageToken = var18.getNextHistoryPageToken(false),
			latestObservedHistorySequenceId = var18.getLatestObservedHistorySequenceId(false),
			subagentTaskState = var14(false),
			hasPublishedTurn = var12(false),
			pendingUserMessage = var16(false)
		}
	end
	
	local function _() --[[ line: 90 | named "saveActiveSessionToCache" ]]
		-- upvalues: var18 (ref), snapshotActiveSession (ref), var21 (ref)
		local casSessionId = var18.getCasSessionId(false)
		
		if casSessionId == nil or casSessionId == "" or not var18.getHasLoadedHistory(false) then return end
		local var40 = snapshotActiveSession()
		
		if var40 ~= nil then
			var21.save(casSessionId, var40)
		end
	end
	
	local function restoreSessionFromCache(p6) --[[ line: 101 ]]
		-- upvalues: var21 (ref), t (write), t_1 (write), var18 (ref), var15 (ref), var13 (ref), var17 (ref), var25 (ref), buildMergedHistory (ref)
		local var41 = var21.restore(p6)
		
		if var41 == nil then
			return false
		end
		t = var41.loadedBySequenceId
		t_1 = var41.overlayBySequenceId
		var18.setHasLoadedHistory(var41.hasLoadedHistory)
		var18.setNextHistoryPageToken(var41.nextHistoryPageToken)
		var18.setLatestObservedHistorySequenceId(var41.latestObservedHistorySequenceId)
		var15(var41.subagentTaskState)
		var13(var41.hasPublishedTurn)
		var17(var41.pendingUserMessage)
		var25(buildMergedHistory())
		
		return true
	end
	
	local function clearActiveSessionState() --[[ line: 118 ]]
		-- upvalues: t (write), t_1 (write), var18 (ref), var15 (ref), var13 (ref), var17 (ref), var25 (ref), buildMergedHistory (ref)
		t = {}
		t_1 = {}
		var18.setHasLoadedHistory(false)
		var18.setNextHistoryPageToken(nil)
		var18.setHistoryLoadInFlight(false)
		var18.setLatestObservedHistorySequenceId(nil)
		var15(nil)
		var13(false)
		var17(nil)
		var25(buildMergedHistory())
	end
	
	local function setCasSessionIdInternal(value) --[[ line: 131 ]]
		-- upvalues: var18 (ref), var22 (write), snapshotActiveSession (ref), var21 (ref), restoreSessionFromCache (ref), p0 (ref), clearActiveSessionState (ref)
		if value == "" then return end
		if var18.getCasSessionId(false) == value then return end
		var22 += 1
		local casSessionId = var18.getCasSessionId(false)
		
		if casSessionId ~= nil and casSessionId ~= "" and var18.getHasLoadedHistory(false) then
			local var43 = snapshotActiveSession()
			
			if var43 ~= nil then
				var21.save(casSessionId, var43)
			end
		end
		var18.setCasSessionId(value)
		var18.setHistoryLoadInFlight(false)
		
		if restoreSessionFromCache(value) then
			p0.onCasSessionIdChanged(value)
			
			return
		end
		clearActiveSessionState()
		p0.onCasSessionIdChanged(value)
	end
	
	local function mergeHistoryPage(p7, p8) --[[ line: 150 ]]
		-- upvalues: sessionHistoryMergeModule (copy), t (write), t_1 (write), var18 (ref), historyPageUtilsModule (copy), var25 (ref), buildMergedHistory (ref)
		sessionHistoryMergeModule.mergeHistoryIntoMap(t, p7, t_1)
		var18.setNextHistoryPageToken(p8)
		var18.noteHistorySequenceId(historyPageUtilsModule.getMaxHistorySequenceId(p7))
		var25(buildMergedHistory())
	end
	
	local function ingestRealtimeUpdate(p9, p10) --[[ line: 157 ]]
		-- upvalues: sessionHistoryMergeModule (copy), t_1 (write), t (write), var18 (ref), var25 (ref), buildMergedHistory (ref)
		if sessionHistoryMergeModule.ingestOverlayUpdate(t_1, t, p9, p10) then
			var18.noteHistorySequenceId(p10)
			var25(buildMergedHistory())
		end
	end
	
	local var35 = historyLoaderModule.createHistoryLoader({
		deps = p0,
		rpcTimeoutSeconds = rpcTimeoutSeconds,
		getCasSessionId = function() --[[ line: 167 ]]
			-- upvalues: var18 (ref)
			return var18.getCasSessionId(false)
		end,
		getHistoryLoadInFlight = function() --[[ line: 170 ]]
			-- upvalues: var18 (ref)
			return var18.getHistoryLoadInFlight(false)
		end,
		setHistoryLoadInFlight = var18.setHistoryLoadInFlight,
		getNextHistoryPageToken = function() --[[ line: 174 ]]
			-- upvalues: var18 (ref)
			return var18.getNextHistoryPageToken(false)
		end,
		setNextHistoryPageToken = var18.setNextHistoryPageToken,
		getLoadedBySequenceId = function() --[[ line: 178 ]]
			-- upvalues: t (write)
			return t
		end,
		setLoadedBySequenceId = function(value) --[[ line: 181 ]]
			-- upvalues: t (write)
			t = value
		end,
		getOverlayBySequenceId = function() --[[ line: 184 ]]
			-- upvalues: t_1 (write)
			return t_1
		end,
		setOverlayBySequenceId = function(value) --[[ line: 187 ]]
			-- upvalues: t_1 (write)
			t_1 = value
		end,
		buildMergedHistory = buildMergedHistory,
		mergeHistoryPage = mergeHistoryPage,
		noteHistorySequenceIds = noteHistorySequenceIds,
		notifyMergedHistoryChanged = notifyMergedHistoryChanged,
		markHistoryLoaded = var18.markHistoryLoaded,
		setSubagentTaskState = var15,
		getRefreshGeneration = function() --[[ line: 196 ]]
			-- upvalues: var22 (write)
			return var22
		end
	})
	local var36 = historyPollingModule.createHistoryPolling({
		deps = p0,
		rpcTimeoutSeconds = rpcTimeoutSeconds,
		getNextHistoryPageToken = function() --[[ line: 204 ]]
			-- upvalues: var18 (ref)
			return var18.getNextHistoryPageToken(false)
		end,
		mergeHistoryPage = mergeHistoryPage
	})
	
	local function ensureInitialized() --[[ line: 210 ]]
		-- upvalues: var18 (ref), p0 (ref), acpProtocolModule (copy), historyPageUtilsModule (copy), rpcTimeoutSeconds (ref)
		if var18.getInitialized(false) then
			return true
		elseif historyPageUtilsModule.awaitRequestState(p0.initialize({ protocolVersion = acpProtocolModule.ProtocolVersion }).state, os.clock() + rpcTimeoutSeconds).status == "succeeded" then
			var18.setInitialized(true)
			
			return true
		end
		return false
	end
	
	return {
		universeId = p1,
		placeId = p2,
		getCasSessionId = function() --[[ line: 304 ]]
			-- upvalues: var18 (ref)
			return var18.getCasSessionId(false)
		end,
		setCasSessionId = setCasSessionIdInternal,
		hasLoadedHistory = function() --[[ line: 308 ]]
			-- upvalues: var18 (ref)
			return var18.getHasLoadedHistory(false)
		end,
		markHistoryLoaded = var18.markHistoryLoaded,
		getNextHistoryPageToken = function() --[[ line: 312 ]]
			-- upvalues: var18 (ref)
			return var18.getNextHistoryPageToken(false)
		end,
		getMergedHistory = var24,
		getPendingUserMessage = var16,
		setPendingUserMessage = var17,
		ingestRealtimeUpdate = ingestRealtimeUpdate,
		mergeHistoryPage = mergeHistoryPage,
		getSubagentTaskState = var14,
		setSubagentTaskState = var15,
		getHasPublishedTurn = var12,
		markHasPublishedTurn = function() --[[ line: 323 ]]
			-- upvalues: var13 (ref)
			var13(true)
		end,
		refreshSession = var35.refreshSession,
		loadOlderHistory = var35.loadOlderHistory,
		sendPrompt = sendPromptModule.createSendPrompt({
			ensureInitialized = ensureInitialized,
			ensureCasSession = function() --[[ line: 223 ]]
				-- upvalues: var18 (ref), p1 (ref), p2 (ref), ensureInitialized (ref), p0 (ref), historyPageUtilsModule (copy), rpcTimeoutSeconds (ref), setCasSessionIdInternal (ref)
				local casSessionId = var18.getCasSessionId(false)
				
				if casSessionId ~= nil then
					return casSessionId, nil
				elseif p1 == nil or p2 == nil then
					return nil, { stage = "missing_project" }
				elseif not ensureInitialized() then
					return nil, { stage = "initialize" }
				end
				local var45 = historyPageUtilsModule.awaitRequestState(p0.sessionNew({ project = { universeId = p1, placeId = p2 } }).state, os.clock() + rpcTimeoutSeconds)
				
				if var45.status ~= "succeeded" then
					return nil, { stage = "session_new" }
				end
				local result = var45.result
				local var46 = if typeof(result) == "table" then result.sessionId else nil
				
				if typeof(var46) == "string" and var46 ~= "" then
					setCasSessionIdInternal(var46)
					
					return var46, nil
				end
				return nil, { stage = "session_new" }
			end,
			getLatestObservedHistorySequenceId = function() --[[ line: 253 ]]
				-- upvalues: var18 (ref)
				return var18.getLatestObservedHistorySequenceId(false)
			end,
			noteTurnSequenceIds = noteTurnSequenceIds,
			startPollingTurnFromHistory = var36.startPollingTurnFromHistory,
			getAssistantTurnSequence = function() --[[ line: 258 ]]
				-- upvalues: var18 (ref)
				return var18.getAssistantTurnSequence(false)
			end,
			incrementAssistantTurnSequence = var18.incrementAssistantTurnSequence,
			sessionPrompt = p0.sessionPrompt,
			setActiveStop = function(value) --[[ line: 263 ]]
				-- upvalues: var19 (write)
				var19 = value
			end
		}).sendPrompt,
		stopActiveTurn = function() --[[ line: 295 ]]
			-- upvalues: var19 (write)
			if var19 ~= nil then
				var19()
			end
		end,
		submitActiveToolResult = function(p11, p12, p13, p14) --[[ line: 276 ]]
			-- upvalues: var18 (ref), p0 (ref)
			local casSessionId = var18.getCasSessionId(false)
			
			return if casSessionId == nil then nil else p0.submitToolResult({
				sessionId = casSessionId,
				turnId = p13,
				referenceId = p14,
				content = p11,
				isError = if p12 ~= nil then false else p12
			})
		end,
		getActiveTurnHandle = function() --[[ line: 268 ]]
			-- upvalues: var18 (ref), p0 (ref)
			local casSessionId = var18.getCasSessionId(false)
			
			return if casSessionId == nil then nil else p0.getActiveTurnHandle(casSessionId)
		end,
		startPollingActiveTurn = function(p15) --[[ line: 332 ]]
			-- upvalues: var18 (ref), var36 (ref)
			local casSessionId = var18.getCasSessionId(false)
			
			return if casSessionId == nil then function() --[[ line: 335 ]] end else var36.startPollingActiveTurn(casSessionId, p15)
		end
	}
end