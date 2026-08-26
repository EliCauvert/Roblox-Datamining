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
	
	local function _()
		-- upvalues: var1 (ref), snapshotActiveSession (ref), var3 (ref)
		local casSessionId = var1.getCasSessionId(false)
		
		if casSessionId == nil or casSessionId == "" or not var1.getHasLoadedHistory(false) then return end
		local var7 = snapshotActiveSession()
		
		if var7 ~= nil then
			var3.save(casSessionId, var7)
		end
	end
	
	local _ = function(p5)
		-- upvalues: var3 (ref), t (write), t_1 (write), var1 (ref), var6 (ref), buildMergedHistory (ref)
		local var7 = var3.restore(p5)
		
		if var7 == nil then
			return false
		end
		t = var7.loadedBySequenceId
		t_1 = var7.overlayBySequenceId
		var7.setHasLoadedHistory(var7.hasLoadedHistory)
		var7.setNextHistoryPageToken(var7.nextHistoryPageToken)
		var7.setLatestObservedHistorySequenceId(var7.latestObservedHistorySequenceId)
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
			local var7 = snapshotActiveSession()
			
			if var7 ~= nil then
				var3.save(casSessionId, var7)
			end
		end
		local var8
		var7.setCasSessionId(value)
		var7.setHistoryLoadInFlight(false)
		local var9 = var9.restore(value)
		
		if var9 == nil then
			var8 = false
		else
			t = var9.loadedBySequenceId
			t_1 = var9.overlayBySequenceId
			var7.setHasLoadedHistory(var9.hasLoadedHistory)
			var7.setNextHistoryPageToken(var9.nextHistoryPageToken)
			var7.setLatestObservedHistorySequenceId(var9.latestObservedHistorySequenceId)
			var6(buildMergedHistory())
			var8 = true
		end
		if var8 then
			p1.onCasSessionIdChanged(value)
			
			return
		end
		clearActiveSessionState()
		p1.onCasSessionIdChanged(value)
	end
	
	local function mergeHistoryPage(p5, p6)
		-- upvalues: sessionHistoryMergeModule (copy), t (write), t_1 (write), var1 (ref), historyPageUtilsModule (copy), var6 (ref), buildMergedHistory (ref)
		sessionHistoryMergeModule.mergeHistoryIntoMap(t, p5, t_1)
		var1.setNextHistoryPageToken(p6)
		var1.noteHistorySequenceId(historyPageUtilsModule.getMaxHistorySequenceId(p5))
		var6(buildMergedHistory())
	end
	
	local function ingestRealtimeUpdate(p5, p6)
		-- upvalues: sessionHistoryMergeModule (copy), t_1 (write), t (write), var1 (ref), var6 (ref), buildMergedHistory (ref)
		if sessionHistoryMergeModule.ingestOverlayUpdate(t_1, t, p5, p6) then
			var1.noteHistorySequenceId(p6)
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
		local var7 = historyPageUtilsModule.awaitRequestState(p1.initialize({ protocolVersion = acpProtocolModule.ProtocolVersion }).state, os.clock() + rpcTimeoutSeconds)
		
		if var7.status == "succeeded" then
			var7.setInitialized(true)
			
			return true, nil
		end
		return false, var7.errorCode
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
				local var7, var8 = ensureInitialized()
				
				if not var7 then
					return nil, { stage = "initialize", errorCode = var8 }
				end
				local var9 = historyPageUtilsModule.awaitRequestState(p1.sessionNew({
					project = { universeId = p2, placeId = p3 },
					experiment = experimentOverrideModule.getExperiment(),
					application = if fFlagBuildExperiencePinForBuild then "build" else nil
				}).state, os.clock() + rpcTimeoutSeconds)
				
				if var9.status ~= "succeeded" then
					return nil, { stage = "session_new", errorCode = var9.errorCode }
				end
				local result = var9.result
				local var10 = if typeof(result) == "table" then result.sessionId else nil
				
				if typeof(var10) == "string" and var10 ~= "" then
					setCasSessionIdInternal(var10)
					
					return var10, nil
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
		submitActiveToolResult = function(p5, p6, p7, p8)
			-- upvalues: var1 (ref), p5 (ref)
			local casSessionId = var1.getCasSessionId(false)
			
			return if casSessionId == nil then nil else p5.submitToolResult({
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
			-- upvalues: var1 (ref), var2 (ref)
			local casSessionId = var1.getCasSessionId(false)
			
			return if casSessionId == nil then function() end else var2.startPollingActiveTurn(casSessionId, p5)
		end
	}
end