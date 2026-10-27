local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local HttpClientModule = require(Parent.HttpClient)
local SignalsModule = require(Parent.Signals)
local SharedFlagsModule = require(Parent.SharedFlags)
local SignalsUtilsModule = require(Parent.SignalsUtils)
local FFlagBuildAgentAdCampaignCardModule = require(script.Parent.FFlagBuildAgentAdCampaignCard)
local FFlagBuildAgentAdCampaignToolCallStatusFallback = require(Parent.SharedFlags).FFlagBuildAgentAdCampaignToolCallStatusFallback
local DecodeAdCampaignToolCallStatusResultModule = if FFlagBuildAgentAdCampaignToolCallStatusFallback then require(script.Parent.decodeAdCampaignToolCallStatusResult) else nil
local AcpProtocolModule = require(script.Parent.Acp.AcpProtocol)
local ClassifyRequestFailureModule = require(script.Parent.classifyRequestFailure)
local HistoryIngestModule = require(script.Parent.CasStore.historyIngest)
local IngestFrameHandlerModule = require(script.Parent.CasStore.ingestFrameHandler)
local SessionRegistryModule = require(script.Parent.CasStore.sessionRegistry)
local ConstantsModule = require(script.Parent.ChatSession.constants)
local CreateTurnHandleModule = require(script.Parent.createTurnHandle)
local ExperimentOverrideModule = require(script.Parent.experimentOverride)
local OnTerminalModule = require(script.Parent.onTerminal)
local RpcDecoderModule = require(script.Parent.rpcDecoder)
local GetFundingErrorModule = require(script.Parent.getFundingError)
local _ = require(script.Parent.types)
local WithCsrfRetryModule = require(DataHydration.withCsrfRetry)
local FFlagBuildExperienceModelPickerData = SharedFlagsModule.FFlagBuildExperienceModelPickerData
local FFlagBuildExperiencePromptFailureTelemetry = SharedFlagsModule.FFlagBuildExperiencePromptFailureTelemetry
local FFlagBuildExperienceLibrary = SharedFlagsModule.FFlagBuildExperienceLibrary

local function _(p1)
	assert(p1 == nil or (p1 == "default" or p1 == "advanced"), "invalid model tier")
end

local _ = function(p1)
	return if typeof(p1) == "string" and p1 ~= "" then p1 else nil
end

local function appendSessionListEntries(List, Sessions)
	local t = {}
	local List1 = {}
	
	for _, value in List do
		local SessionId = value.sessionId
		
		if typeof(SessionId) == "string" and SessionId ~= "" then
			t[SessionId] = true
		end
		table.insert(List1, value)
	end
	for _, session in Sessions do
		local SessionId = session.sessionId
		
		if typeof(SessionId) == "string" and SessionId ~= "" and not t[SessionId] then
			t[SessionId] = true
			table.insert(List1, session)
		end
	end
	return List1
end

local _ = function(Text)
	return if typeof(Text) == "string" then { { type = "text", text = Text } } else Text
end

local config = {
	debug = function() end,
	info = function() end,
	warning = function() end,
	error = function() end
}

return function(p1)
	-- upvalues: WithCsrfRetryModule (copy), HttpClientModule (copy), AcpProtocolModule (copy), config (copy), FFlagBuildExperienceModelPickerData (copy), SignalsUtilsModule (copy), RpcDecoderModule (copy), SignalsModule (copy), OnTerminalModule (copy), appendSessionListEntries (copy), FFlagBuildAgentAdCampaignCardModule (copy), DecodeAdCampaignToolCallStatusResultModule (copy), CreateTurnHandleModule (copy), ExperimentOverrideModule (copy), FFlagBuildExperienceLibrary (copy), FFlagBuildExperiencePromptFailureTelemetry (copy), ClassifyRequestFailureModule (copy), GetFundingErrorModule (copy), HistoryIngestModule (copy), SessionRegistryModule (copy), ConstantsModule (copy), IngestFrameHandlerModule (copy), FFlagBuildAgentAdCampaignToolCallStatusFallback (copy)
	local P5 = p1 or {}
	local Network = P5.network or WithCsrfRetryModule(HttpClientModule.createRequestInternalNetwork())
	local BaseUrl = P5.baseUrl or AcpProtocolModule.acpUrl()
	local Logger = P5.logger or config
	
	local function _()
		-- upvalues: P5 (copy)
		return if P5.getAuthHeaders then P5.getAuthHeaders() else {}
	end
	
	local Count = 0
	
	local _ = function()
		-- upvalues: P5 (copy), Count (ref)
		if P5.generateRequestId then
			return P5.generateRequestId()
		else
			Count += 1
			
			return Count
		end
	end
	
	local function createActiveTurns()
		return {
			activeBySession = {},
			activeByRequestId = {},
			publicBySession = {},
			pendingCancels = {}
		}
	end
	
	local ActiveTurns = createActiveTurns()
	local SessionScopedSignal = if FFlagBuildExperienceModelPickerData then SignalsUtilsModule.createSessionScopedSignal(createActiveTurns) else function(_)
		-- upvalues: ActiveTurns (copy)
		return ActiveTurns
	end
	
	local _ = function(p2)
		return if p2 == nil then nil else tostring(p2)
	end
	
	local function unregisterHandle(ActiveBySessionEntry)
		-- upvalues: SessionScopedSignal (copy)
		for i, value in SessionScopedSignal(false).activeBySession do
			if value == ActiveBySessionEntry then
				SessionScopedSignal(false).activeBySession[i] = nil
				SessionScopedSignal(false).publicBySession[i] = nil
				break
			end
		end
		local RequestId = ActiveBySessionEntry.requestId
		local Text = if RequestId == nil then nil else tostring(RequestId)
		
		if Text and SessionScopedSignal(false).activeByRequestId[Text] == ActiveBySessionEntry then
			SessionScopedSignal(false).activeByRequestId[Text] = nil
		end
	end
	
	local function rpcCall(RequestId, SessionList: string, SessionPromptWireParams, p2)
		-- upvalues: Logger (copy), HttpClientModule (upval), Network (copy), BaseUrl (copy), P5 (copy), RpcDecoderModule (upval)
		Logger:debug(`[CAS] -> {SessionList} id={tostring(RequestId)}`)
		
		return HttpClientModule.createRequest({
			method = "POST",
			networkImpl = Network,
			url = BaseUrl,
			headers = if P5.getAuthHeaders then P5.getAuthHeaders() else {},
			body = {
				jsonrpc = "2.0",
				id = RequestId,
				method = SessionList,
				params = SessionPromptWireParams or {}
			},
			analyticsKey = "cas." .. SessionList:gsub("/", "-"):lower(),
			decode = RpcDecoderModule(p2)
		})
	end
	
	local function rpcCallSync(AdCampaignCreate, SessionNewWireParams, DecodeAdCampaignCheckFundsResultModule)
		-- upvalues: rpcCall (copy), P5 (copy), Count (ref)
		local RequestId = nil
		if P5.generateRequestId then
			RequestId = P5.generateRequestId()
		else
			Count += 1
			RequestId = Count
		end
		return rpcCall(RequestId, AdCampaignCreate, SessionNewWireParams, DecodeAdCampaignCheckFundsResultModule)
	end
	
	local function submitToolResult(p2)
		-- upvalues: P5 (copy), Count (ref), AcpProtocolModule (upval), HttpClientModule (upval), Network (copy), BaseUrl (copy), RpcDecoderModule (upval)
		assert(typeof(p2.sessionId) == "string" and p2.sessionId ~= "", "sessionId is required")
		assert(typeof(p2.content) == "table" and typeof(p2.content.text) == "string", "content.text is required")
		
		if p2.turnId ~= nil then
			assert(typeof(p2.turnId) == "number" and p2.turnId > 0, "turnId must be a positive number")
		end
		if p2.referenceId ~= nil then
			assert(typeof(p2.referenceId) == "string" and p2.referenceId ~= "", "referenceId must be a string")
		end
		local RequestId = nil
		if P5.generateRequestId then
			RequestId = P5.generateRequestId()
		else
			Count += 1
			RequestId = Count
		end
		local Result = {
			sessionId = p2.sessionId,
			tool_name = AcpProtocolModule.AskTool.Name,
			content = p2.content,
			isError = p2.isError ~= nil and p2.isError
		}
		
		if p2.turnId ~= nil then
			Result.turnId = p2.turnId
		end
		if p2.referenceId ~= nil then
			Result.referenceId = p2.referenceId
		end
		return (HttpClientModule.createRequest({
			method = "POST",
			analyticsKey = "cas.ask-tool-result",
			networkImpl = Network,
			url = BaseUrl,
			headers = if P5.getAuthHeaders then P5.getAuthHeaders() else {},
			body = { jsonrpc = "2.0", id = RequestId, result = Result },
			decode = RpcDecoderModule()
		}))
	end
	
	local function initialize(p2)
		-- upvalues: rpcCallSync (copy), AcpProtocolModule (upval)
		return rpcCallSync(AcpProtocolModule.Methods.Initialize, p2 or { protocolVersion = AcpProtocolModule.ProtocolVersion })
	end
	
	local function sessionNew(p2)
		-- upvalues: FFlagBuildExperienceModelPickerData (upval), rpcCallSync (copy), AcpProtocolModule (upval)
		assert(p2 ~= nil, "sessionNew requires params")
		assert(typeof(p2.project) == "table", "sessionNew requires params.project")
		assert(typeof(p2.project.universeId) == "number", "sessionNew requires params.project.universeId")
		assert(typeof(p2.project.placeId) == "number", "sessionNew requires params.project.placeId")
		
		if FFlagBuildExperienceModelPickerData then
			local Model = p2.model
			assert(Model == nil or (Model == "default" or Model == "advanced"), "invalid model tier")
		end
		return rpcCallSync(AcpProtocolModule.Methods.SessionNew, AcpProtocolModule.buildSessionNewWireParams({
			cwd = p2.cwd or "/",
			mcpServers = p2.mcpServers,
			project = p2.project,
			model = if FFlagBuildExperienceModelPickerData then p2.model else nil,
			experiment = p2.experiment,
			application = p2.application
		}))
	end
	
	local function sessionList(p2)
		-- upvalues: rpcCallSync (copy), AcpProtocolModule (upval)
		return rpcCallSync(AcpProtocolModule.Methods.SessionList, p2 or {})
	end
	
	local Signal, Signal2 = SignalsModule.createSignal({})
	local Signal1, Signal2_1 = SignalsModule.createSignal(nil)
	local Pending, Pending2 = SignalsModule.createSignal("pending")
	local Signal3, Signal2_2 = SignalsModule.createSignal(nil)
	local v1 = nil
	local v2 = nil
	local Count1 = 0
	local config1 = {
		getSessions = Signal,
		getNextPageToken = Signal1,
		getStatus = Pending,
		getLoadMoreStatus = Signal3,
		refresh = function()
			-- upvalues: v1 (ref), Count1 (ref), v2 (ref), Pending2 (copy), Signal2_2 (copy), AcpProtocolModule (upval), rpcCall (copy), P5 (copy), Count (ref), OnTerminalModule (upval), Signal2 (copy), Signal2_1 (copy)
			if v1 ~= nil then
				if v1.state(false).status == "pending" then
					return v1
				end
				v1 = nil
			end
			Count1 += 1
			local Count2: number = Count1
			v2 = nil
			Pending2("pending")
			Signal2_2(nil)
			local SessionList = AcpProtocolModule.Methods.SessionList
			local t = {}
			local RequestId = nil
			
			if P5.generateRequestId then
				RequestId = P5.generateRequestId()
			else
				Count += 1
				RequestId = Count
			end
			local RpcCallResult = rpcCall(RequestId, SessionList, t, nil)
			v1 = RpcCallResult
			OnTerminalModule(RpcCallResult.state, function(p2)
				-- upvalues: Count2 (copy), Count1 (upval), v1 (upval), Signal2 (upval), Signal2_1 (upval), Pending2 (upval)
				if Count2 == Count1 then
					v1 = nil
					local NextPageToken = p2.nextPageToken
					local NextPageToken1 = if typeof(NextPageToken) == "string" and NextPageToken ~= "" then NextPageToken else nil
					Signal2(p2.sessions or {})
					Signal2_1(NextPageToken1)
					Pending2("succeeded")
					
					return
				end
			end, function(_)
				-- upvalues: Count2 (copy), Count1 (upval), v1 (upval), Pending2 (upval)
				if Count2 == Count1 then
					v1 = nil
					Pending2("failed")
					
					return
				end
			end)
			
			return RpcCallResult
		end,
		loadMore = function()
			-- upvalues: Signal1 (copy), v1 (ref), v2 (ref), Pending (copy), Count1 (ref), Signal2_2 (copy), AcpProtocolModule (upval), rpcCall (copy), P5 (copy), Count (ref), OnTerminalModule (upval), appendSessionListEntries (upval), Signal (copy), Signal2 (copy), Signal2_1 (copy)
			local SignalResult = Signal1(false)
			
			if SignalResult == nil then
				return nil
			end
			if v1 ~= nil then
				return nil
			end
			if v2 ~= nil then
				return nil
			end
			if Pending(false) ~= "succeeded" then
				return nil
			end
			local Count2 = Count1
			Signal2_2("pending")
			local SessionList = AcpProtocolModule.Methods.SessionList
			local Config = { pageToken = SignalResult } or {}
			local RequestId = nil
			
			if P5.generateRequestId then
				RequestId = P5.generateRequestId()
			else
				Count += 1
				RequestId = Count
			end
			local RpcCallResult = rpcCall(RequestId, SessionList, Config, nil)
			v2 = RpcCallResult
			OnTerminalModule(RpcCallResult.state, function(p2)
				-- upvalues: Count2 (copy), Count1 (upval), v2 (upval), appendSessionListEntries (upval), Signal (upval), Signal2 (upval), Signal2_1 (upval), Signal2_2 (upval)
				if Count2 == Count1 then
					v2 = nil
					local NextPageToken = p2.nextPageToken
					local NextPageToken1 = if typeof(NextPageToken) == "string" and NextPageToken ~= "" then NextPageToken else nil
					Signal2((appendSessionListEntries(Signal(false), p2.sessions or {})))
					Signal2_1(NextPageToken1)
					Signal2_2("succeeded")
					
					return
				end
			end, function(_)
				-- upvalues: Count2 (copy), Count1 (upval), v2 (upval), Signal2_2 (upval)
				if Count2 == Count1 then
					v2 = nil
					Signal2_2("failed")
					
					return
				end
			end)
			
			return RpcCallResult
		end
	}
	
	local function sessionLoad(SessionId, p2)
		-- upvalues: rpcCallSync (copy), AcpProtocolModule (upval)
		assert(typeof(SessionId) == "string" and SessionId ~= "", "sessionId is required")
		
		return rpcCallSync(AcpProtocolModule.Methods.SessionLoad, {
			sessionId = SessionId,
			cwd = p2 and p2.cwd or "/",
			mcpServers = p2 and p2.mcpServers,
			historyPageToken = p2 and p2.historyPageToken
		})
	end
	
	local _ = function(SessionId)
		-- upvalues: rpcCallSync (copy), AcpProtocolModule (upval)
		return rpcCallSync(AcpProtocolModule.Methods.SessionCancel, { sessionId = SessionId })
	end
	
	local function sessionCancel(SessionId)
		-- upvalues: SessionScopedSignal (copy), FFlagBuildExperienceModelPickerData (upval), AcpProtocolModule (upval), rpcCall (copy), P5 (copy), Count (ref), OnTerminalModule (upval), unregisterHandle (copy)
		assert(typeof(SessionId) == "string" and SessionId ~= "", "sessionId is required")
		local SessionScopedSignalResult = SessionScopedSignal(false)
		local ActiveBySessionEntry = SessionScopedSignalResult.activeBySession[SessionId]
		local PendingCancel = SessionScopedSignalResult.pendingCancels[SessionId]
		
		if FFlagBuildExperienceModelPickerData and PendingCancel ~= nil and PendingCancel.turn == ActiveBySessionEntry then
			return PendingCancel.handle
		end
		local SessionCancel = AcpProtocolModule.Methods.SessionCancel
		local config = { sessionId = SessionId }
		local RequestId = nil
		
		if P5.generateRequestId then
			RequestId = P5.generateRequestId()
		else
			Count += 1
			RequestId = Count
		end
		local RpcCallResult = rpcCall(RequestId, SessionCancel, config, nil)
		local PendingCancel1 = { handle = RpcCallResult, turn = ActiveBySessionEntry }
		
		if FFlagBuildExperienceModelPickerData then
			SessionScopedSignalResult.pendingCancels[SessionId] = PendingCancel1
		end
		OnTerminalModule(RpcCallResult.state, function()
			-- upvalues: SessionScopedSignalResult (copy), SessionId (copy), PendingCancel1 (copy), FFlagBuildExperienceModelPickerData (upval), ActiveBySessionEntry (copy), SessionScopedSignal (upval), unregisterHandle (upval)
			if SessionScopedSignalResult.pendingCancels[SessionId] == PendingCancel1 then
				SessionScopedSignalResult.pendingCancels[SessionId] = nil
			end
			local ActiveBySessionEntry1 = if FFlagBuildExperienceModelPickerData then ActiveBySessionEntry else SessionScopedSignal(false).activeBySession[SessionId]
			
			if ActiveBySessionEntry1 then
				ActiveBySessionEntry1.markCancelled()
				unregisterHandle(ActiveBySessionEntry1)
			end
		end, function()
			-- upvalues: SessionScopedSignalResult (copy), SessionId (copy), PendingCancel1 (copy)
			if SessionScopedSignalResult.pendingCancels[SessionId] == PendingCancel1 then
				SessionScopedSignalResult.pendingCancels[SessionId] = nil
			end
		end)
		
		return RpcCallResult
	end
	
	local function adCampaignToolCallStatus(p2)
		-- upvalues: rpcCallSync (copy), AcpProtocolModule (upval), DecodeAdCampaignToolCallStatusResultModule (upval)
		assert(typeof(p2) == "table", "adCampaignToolCallStatus requires params")
		assert(typeof(p2.toolCallId) == "string" and p2.toolCallId ~= "", "toolCallId is required")
		
		return rpcCallSync(AcpProtocolModule.Methods.AdCampaignToolCallStatus, p2, DecodeAdCampaignToolCallStatusResultModule)
	end
	
	local function registerTurnHandle(SessionId, RequestId, p2, p3)
		-- upvalues: SessionScopedSignal (copy), CreateTurnHandleModule (upval), FFlagBuildExperienceModelPickerData (upval), sessionCancel (copy)
		local SessionScopedSignalResult = SessionScopedSignal(false)
		local TurnHandleModule, TurnHandleModule2 = CreateTurnHandleModule(SessionId, RequestId, function()
			-- upvalues: FFlagBuildExperienceModelPickerData (upval), SessionScopedSignal (upval), SessionScopedSignalResult (copy), sessionCancel (upval), SessionId (copy)
			if not FFlagBuildExperienceModelPickerData or SessionScopedSignal(false) == SessionScopedSignalResult then
				sessionCancel(SessionId)
			end
		end, p2, p3)
		SessionScopedSignal(false).activeBySession[SessionId] = TurnHandleModule2
		SessionScopedSignal(false).publicBySession[SessionId] = TurnHandleModule
		
		if RequestId ~= nil then
			SessionScopedSignal(false).activeByRequestId[tostring(RequestId)] = TurnHandleModule2
		end
		if FFlagBuildExperienceModelPickerData then
			function TurnHandleModule.isCurrentOwner(): boolean
				-- upvalues: SessionScopedSignal (upval), SessionScopedSignalResult (copy)
				return SessionScopedSignal(false) == SessionScopedSignalResult
			end
		end
		return TurnHandleModule
	end
	
	local function sessionPrompt(p2)
		-- upvalues: FFlagBuildExperienceModelPickerData (upval), P5 (copy), Count (ref), registerTurnHandle (copy), SessionScopedSignal (copy), AcpProtocolModule (upval), ExperimentOverrideModule (upval), rpcCall (copy), FFlagBuildExperienceLibrary (upval), OnTerminalModule (upval), FFlagBuildExperiencePromptFailureTelemetry (upval), ClassifyRequestFailureModule (upval), GetFundingErrorModule (upval), unregisterHandle (copy)
		assert(p2 and (typeof(p2.sessionId) == "string" and p2.sessionId ~= ""), "sessionId is required")
		assert(p2.prompt, "prompt is required")
		
		if FFlagBuildExperienceModelPickerData then
			local Model = p2.model
			assert(Model == nil or (Model == "default" or Model == "advanced"), "invalid model tier")
			local Model1 = p2._meta and (p2._meta._roblox and p2._meta._roblox.model)
			assert(p2.model == nil or (Model1 == nil or Model1 == p2.model), "conflicting model tiers")
		end
		local SessionId = p2.sessionId
		local RequestId = nil
		
		if P5.generateRequestId then
			RequestId = P5.generateRequestId()
		else
			Count += 1
			RequestId = Count
		end
		local RegisterTurnHandleResult = registerTurnHandle(SessionId, RequestId, nil, nil)
		local ActiveBySessionEntry = SessionScopedSignal(false).activeBySession[SessionId]
		local Prompt = p2.prompt
		local RpcCallResult = rpcCall(RequestId, AcpProtocolModule.Methods.SessionPrompt, (AcpProtocolModule.buildSessionPromptWireParams({
			sessionId = SessionId,
			prompt = if typeof(Prompt) == "string" then { { type = "text", text = Prompt } } else Prompt,
			meta = p2._meta,
			model = if FFlagBuildExperienceModelPickerData then p2.model else nil,
			experiment = if FFlagBuildExperienceModelPickerData or ExperimentOverrideModule.isEnabled() then p2.experiment else nil
		})))
		OnTerminalModule(RpcCallResult.state, if FFlagBuildExperienceLibrary then ActiveBySessionEntry.markAccepted else nil, function(p3, p4)
			-- upvalues: FFlagBuildExperiencePromptFailureTelemetry (upval), ClassifyRequestFailureModule (upval), RpcCallResult (copy), ActiveBySessionEntry (copy), FFlagBuildExperienceModelPickerData (upval), GetFundingErrorModule (upval), unregisterHandle (upval)
			local ClassifyRequestFailureModuleResult = if FFlagBuildExperiencePromptFailureTelemetry then ClassifyRequestFailureModule(RpcCallResult.state(false)) else nil
			task.defer(function()
				-- upvalues: ActiveBySessionEntry (upval), FFlagBuildExperienceModelPickerData (upval), GetFundingErrorModule (upval), RpcCallResult (upval), p3 (copy), p4 (copy), ClassifyRequestFailureModuleResult (copy), unregisterHandle (upval)
				if ActiveBySessionEntry.isDone() then return end
				local v3 = nil
				local v4 = nil
				
				if FFlagBuildExperienceModelPickerData then
					v3, v124 = GetFundingErrorModule(RpcCallResult.state(false))
				end
				ActiveBySessionEntry.fail(p3, p4, ClassifyRequestFailureModuleResult, v3, v4)
				
				if ActiveBySessionEntry.isDone() then
					unregisterHandle(ActiveBySessionEntry)
				end
			end)
		end)
		
		return RegisterTurnHandleResult
	end
	
	local function getActiveTurnHandle(p2)
		-- upvalues: SessionScopedSignal (copy)
		return SessionScopedSignal(false).publicBySession[p2]
	end
	
	local function ingestSessionHistory(p2, p3, p4)
		-- upvalues: HistoryIngestModule (upval), SessionScopedSignal (copy), unregisterHandle (copy)
		return HistoryIngestModule.ingestSessionHistory({
			getActiveTurnInternals = function(p5)
				-- upvalues: SessionScopedSignal (upval)
				return SessionScopedSignal(false).activeBySession[p5]
			end,
			onTurnDone = unregisterHandle
		}, p2, p3, p4)
	end
	
	local SessionRegistry = SessionRegistryModule.createSessionRegistry({
		initialize = initialize,
		sessionNew = sessionNew,
		sessionLoad = sessionLoad,
		sessionPrompt = sessionPrompt,
		ingestSessionHistory = ingestSessionHistory,
		submitToolResult = submitToolResult,
		getActiveTurnHandle = getActiveTurnHandle,
		onCasSessionIdChanged = function(_) end,
		rpcTimeoutSeconds = ConstantsModule.getRpcTimeoutSeconds()
	})
	
	return {
		initialize = initialize,
		sessionNew = sessionNew,
		sessionList = sessionList,
		getSessionListStore = function()
			-- upvalues: config1 (copy)
			return config1
		end,
		sessionFindByUniverse = function(p2)
			-- upvalues: rpcCallSync (copy), AcpProtocolModule (upval)
			assert(typeof(p2) == "table", "sessionFindByUniverse requires params")
			assert(typeof(p2.universeId) == "number" and p2.universeId ~= 0, "universeId is required")
			
			return rpcCallSync(AcpProtocolModule.Methods.SessionFindByUniverse, p2)
		end,
		sessionLoad = sessionLoad,
		sessionReadTasks = function(SessionId)
			-- upvalues: rpcCallSync (copy), AcpProtocolModule (upval)
			assert(typeof(SessionId) == "string" and SessionId ~= "", "sessionId is required")
			
			return rpcCallSync(AcpProtocolModule.Methods.SessionReadTasks, { sessionId = SessionId })
		end,
		sessionPrompt = sessionPrompt,
		submitToolResult = submitToolResult,
		sessionCancel = sessionCancel,
		sessionDelete = function(SessionId)
			-- upvalues: AcpProtocolModule (upval), rpcCall (copy), P5 (copy), Count (ref), OnTerminalModule (upval), SessionScopedSignal (copy), unregisterHandle (copy)
			assert(typeof(SessionId) == "string" and SessionId ~= "", "sessionId is required")
			local SessionDelete = AcpProtocolModule.Methods.SessionDelete
			local config = { sessionId = SessionId }
			local RequestId = nil
			
			if P5.generateRequestId then
				RequestId = P5.generateRequestId()
			else
				Count += 1
				RequestId = Count
			end
			local RpcCallResult = rpcCall(RequestId, SessionDelete, config, nil)
			OnTerminalModule(RpcCallResult.state, function()
				-- upvalues: SessionScopedSignal (upval), SessionId (copy), AcpProtocolModule (upval), unregisterHandle (upval)
				local ActiveBySessionEntry = SessionScopedSignal(false).activeBySession[SessionId]
				
				if ActiveBySessionEntry then
					ActiveBySessionEntry.fail("Session deleted before prompt response", AcpProtocolModule.ErrorCodes.Gone)
					unregisterHandle(ActiveBySessionEntry)
				end
			end)
			
			return RpcCallResult
		end,
		sessionUpdateInfo = function(SessionId, Title)
			-- upvalues: rpcCallSync (copy), AcpProtocolModule (upval)
			assert(typeof(SessionId) == "string" and SessionId ~= "", "sessionId is required")
			
			return rpcCallSync(AcpProtocolModule.Methods.SessionUpdateInfo, { sessionId = SessionId, title = Title })
		end,
		sessionSaveAndPublish = function(p2)
			-- upvalues: rpcCallSync (copy), AcpProtocolModule (upval)
			assert(typeof(p2) == "table", "sessionSaveAndPublish requires params")
			assert(typeof(p2.placeId) == "number" and p2.placeId > 0, "placeId must be a positive number")
			assert(p2.title == nil or typeof(p2.title) == "string", "title must be a string")
			assert(p2.description == nil or typeof(p2.description) == "string", "description must be a string")
			
			return rpcCallSync(AcpProtocolModule.Methods.SessionSaveAndPublish, p2)
		end,
		adCampaignEligibility = function(p2)
			-- upvalues: rpcCallSync (copy), AcpProtocolModule (upval)
			assert(typeof(p2) == "table", "adCampaignEligibility requires params")
			assert(typeof(p2.universeId) == "number" and p2.universeId > 0, "universeId must be a positive number")
			
			return rpcCallSync(AcpProtocolModule.Methods.AdCampaignEligibility, p2, (require(script.Parent.decodeAdCampaignEligibilityResult)))
		end,
		adCampaignCheckFunds = function(p2)
			-- upvalues: rpcCallSync (copy), AcpProtocolModule (upval)
			assert(typeof(p2) == "table", "adCampaignCheckFunds requires params")
			assert(p2.campaignOption == "feedback" or p2.campaignOption == "plays", "campaignOption must be feedback or plays")
			
			return rpcCallSync(AcpProtocolModule.Methods.AdCampaignCheckFunds, p2, (require(script.Parent.decodeAdCampaignCheckFundsResult)))
		end,
		adCampaignCreate = function(p2)
			-- upvalues: FFlagBuildAgentAdCampaignCardModule (upval), rpcCallSync (copy), AcpProtocolModule (upval)
			assert(typeof(p2) == "table", "adCampaignCreate requires params")
			assert(typeof(p2.universeId) == "number" and p2.universeId > 0, "universeId must be a positive number")
			assert(typeof(p2.idempotencyKey) == "string" and p2.idempotencyKey ~= "", "idempotencyKey is required")
			local DecodeAdCampaignCreateResultModule = require(script.Parent.decodeAdCampaignCreateResult)
			
			if FFlagBuildAgentAdCampaignCardModule and p2.toolCallId ~= nil then
				assert(typeof(p2.toolCallId) == "string" and p2.toolCallId ~= "", "toolCallId is required")
				
				return rpcCallSync(AcpProtocolModule.Methods.AdCampaignCreate, p2, function(p3)
					-- upvalues: DecodeAdCampaignCreateResultModule (copy), p2 (copy)
					local DecodeAdCampaignCreateResultModuleResult, DecodeAdCampaignCreateResultModuleResult2 = DecodeAdCampaignCreateResultModule(p3)
					
					if DecodeAdCampaignCreateResultModuleResult == nil or DecodeAdCampaignCreateResultModuleResult.toolCallId == nil or DecodeAdCampaignCreateResultModuleResult.toolCallId == p2.toolCallId then
						return DecodeAdCampaignCreateResultModuleResult, DecodeAdCampaignCreateResultModuleResult2
					else
						return nil, "Ad campaign create response does not match the requested tool call"
					end
				end)
			else
				return rpcCallSync(AcpProtocolModule.Methods.AdCampaignCreate, p2, DecodeAdCampaignCreateResultModule)
			end
		end,
		adCampaignToolCallStatus = if FFlagBuildAgentAdCampaignToolCallStatusFallback then adCampaignToolCallStatus else nil,
		ingestSessionHistory = ingestSessionHistory,
		ingestFrame = function(p2, p3)
			-- upvalues: IngestFrameHandlerModule (upval), Logger (copy), SessionRegistry (copy), SessionScopedSignal (copy), unregisterHandle (copy)
			IngestFrameHandlerModule.ingestFrame({
				logger = Logger,
				getSessionByCasSessionId = SessionRegistry.getSessionByCasSessionId,
				getSessionForProject = SessionRegistry.getSessionForProject,
				getActiveTurnBySession = function(p4)
					-- upvalues: SessionScopedSignal (upval)
					return SessionScopedSignal(false).activeBySession[p4]
				end,
				getActiveTurnByRequestId = function(p4)
					-- upvalues: SessionScopedSignal (upval)
					return SessionScopedSignal(false).activeByRequestId[p4]
				end,
				onTurnDone = unregisterHandle
			}, p2, p3)
		end,
		resumeTurnFromHistory = function(p2, p3, p4)
			-- upvalues: SessionScopedSignal (copy), registerTurnHandle (copy)
			assert(typeof(p2) == "string" and p2 ~= "", "sessionId is required")
			
			if p3.isDone then
				return nil
			else
				local PublicBySessionEntry = SessionScopedSignal(false).publicBySession[p2]
				
				return if PublicBySessionEntry == nil then registerTurnHandle(p2, nil, p3, p4) else PublicBySessionEntry
			end
		end,
		getActiveTurnHandle = getActiveTurnHandle,
		getSessionForProject = SessionRegistry.getSessionForProject
	}
end