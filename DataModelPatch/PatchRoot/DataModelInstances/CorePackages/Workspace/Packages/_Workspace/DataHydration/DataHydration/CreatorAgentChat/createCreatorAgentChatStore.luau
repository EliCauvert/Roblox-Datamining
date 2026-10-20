local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local HttpClientModule = require(Parent.HttpClient)
local SignalsModule = require(Parent.Signals)
local AcpProtocolModule = require(script.Parent.Acp.AcpProtocol)
local HistoryIngestModule = require(script.Parent.CasStore.historyIngest)
local IngestFrameHandlerModule = require(script.Parent.CasStore.ingestFrameHandler)
local SessionRegistryModule = require(script.Parent.CasStore.sessionRegistry)
local ConstantsModule = require(script.Parent.ChatSession.constants)
local CreateTurnHandleModule = require(script.Parent.createTurnHandle)
local OnTerminalModule = require(script.Parent.onTerminal)
local RpcDecoderModule = require(script.Parent.rpcDecoder)
local _ = require(script.Parent.types)
local WithCsrfRetryModule = require(DataHydration.withCsrfRetry)

local function _(p1)
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
	-- upvalues: WithCsrfRetryModule (copy), HttpClientModule (copy), AcpProtocolModule (copy), config (copy), RpcDecoderModule (copy), SignalsModule (copy), OnTerminalModule (copy), appendSessionListEntries (copy), CreateTurnHandleModule (copy), HistoryIngestModule (copy), SessionRegistryModule (copy), ConstantsModule (copy), IngestFrameHandlerModule (copy)
	local P4 = p1 or {}
	local Network = P4.network or WithCsrfRetryModule(HttpClientModule.createRequestInternalNetwork())
	local BaseUrl = P4.baseUrl or AcpProtocolModule.acpUrl()
	local Logger = P4.logger or config
	
	local function _()
		-- upvalues: P4 (copy)
		return if P4.getAuthHeaders then P4.getAuthHeaders() else {}
	end
	
	local Count = 0
	
	local _ = function()
		-- upvalues: P4 (copy), Count (ref)
		if P4.generateRequestId then
			return P4.generateRequestId()
		else
			Count += 1
			
			return Count
		end
	end
	
	local t = {}
	local t1 = {}
	local t2 = {}
	
	local _ = function(p2)
		return if p2 == nil then nil else tostring(p2)
	end
	
	local function unregisterHandle(p2)
		-- upvalues: t (copy), t2 (copy), t1 (copy)
		for i, value in t do
			if value == p2 then
				t[i] = nil
				t2[i] = nil
				break
			end
		end
		local RequestId = p2.requestId
		local Text = if RequestId == nil then nil else tostring(RequestId)
		
		if Text and t1[Text] == p2 then
			t1[Text] = nil
		end
	end
	
	local function rpcCall(RequestId, SessionCancel: string, p3)
		-- upvalues: Logger (copy), HttpClientModule (upval), Network (copy), BaseUrl (copy), P4 (copy), RpcDecoderModule (upval)
		Logger:debug(`[CAS] -> {SessionCancel} id={tostring(RequestId)}`)
		
		return HttpClientModule.createRequest({
			method = "POST",
			networkImpl = Network,
			url = BaseUrl,
			headers = if P4.getAuthHeaders then P4.getAuthHeaders() else {},
			body = {
				jsonrpc = "2.0",
				id = RequestId,
				method = SessionCancel,
				params = p3 or {}
			},
			analyticsKey = "cas." .. SessionCancel:gsub("/", "-"):lower(),
			decode = RpcDecoderModule()
		})
	end
	
	local function rpcCallSync(Initialize, SessionNewWireParams)
		-- upvalues: rpcCall (copy), P4 (copy), Count (ref)
		local RequestId = nil
		if P4.generateRequestId then
			RequestId = P4.generateRequestId()
		else
			Count += 1
			RequestId = Count
		end
		return rpcCall(RequestId, Initialize, SessionNewWireParams)
	end
	
	local function submitToolResult(p3)
		-- upvalues: P4 (copy), Count (ref), AcpProtocolModule (upval), HttpClientModule (upval), Network (copy), BaseUrl (copy), RpcDecoderModule (upval)
		assert(typeof(p3.sessionId) == "string" and p3.sessionId ~= "", "sessionId is required")
		assert(typeof(p3.content) == "table" and typeof(p3.content.text) == "string", "content.text is required")
		
		if p3.turnId ~= nil then
			assert(typeof(p3.turnId) == "number" and p3.turnId > 0, "turnId must be a positive number")
		end
		if p3.referenceId ~= nil then
			assert(typeof(p3.referenceId) == "string" and p3.referenceId ~= "", "referenceId must be a string")
		end
		local RequestId = nil
		if P4.generateRequestId then
			RequestId = P4.generateRequestId()
		else
			Count += 1
			RequestId = Count
		end
		local Result = {
			sessionId = p3.sessionId,
			tool_name = AcpProtocolModule.AskTool.Name,
			content = p3.content,
			isError = p3.isError ~= nil and p3.isError
		}
		
		if p3.turnId ~= nil then
			Result.turnId = p3.turnId
		end
		if p3.referenceId ~= nil then
			Result.referenceId = p3.referenceId
		end
		return HttpClientModule.createRequest({
			method = "POST",
			analyticsKey = "cas.ask-tool-result",
			networkImpl = Network,
			url = BaseUrl,
			headers = if P4.getAuthHeaders then P4.getAuthHeaders() else {},
			body = { jsonrpc = "2.0", id = RequestId, result = Result },
			decode = RpcDecoderModule()
		})
	end
	
	local function initialize(p3)
		-- upvalues: rpcCallSync (copy), AcpProtocolModule (upval)
		return rpcCallSync(AcpProtocolModule.Methods.Initialize, p3 or { protocolVersion = AcpProtocolModule.ProtocolVersion })
	end
	
	local function sessionNew(p3)
		-- upvalues: rpcCallSync (copy), AcpProtocolModule (upval)
		assert(p3 ~= nil, "sessionNew requires params")
		assert(typeof(p3.project) == "table", "sessionNew requires params.project")
		assert(typeof(p3.project.universeId) == "number", "sessionNew requires params.project.universeId")
		assert(typeof(p3.project.placeId) == "number", "sessionNew requires params.project.placeId")
		
		return rpcCallSync(AcpProtocolModule.Methods.SessionNew, AcpProtocolModule.buildSessionNewWireParams({
			cwd = p3.cwd or "/",
			mcpServers = p3.mcpServers,
			project = p3.project,
			experiment = p3.experiment
		}))
	end
	
	local function sessionList(p3)
		-- upvalues: rpcCallSync (copy), AcpProtocolModule (upval)
		return rpcCallSync(AcpProtocolModule.Methods.SessionList, p3 or {})
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
			-- upvalues: v1 (ref), Count1 (ref), v2 (ref), Pending2 (copy), Signal2_2 (copy), AcpProtocolModule (upval), rpcCall (copy), P4 (copy), Count (ref), OnTerminalModule (upval), Signal2 (copy), Signal2_1 (copy)
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
			
			if P4.generateRequestId then
				RequestId = P4.generateRequestId()
			else
				Count += 1
				RequestId = Count
			end
			local RpcCallResult = rpcCall(RequestId, SessionList, t)
			v1 = RpcCallResult
			OnTerminalModule(RpcCallResult.state, function(p3)
				-- upvalues: Count2 (copy), Count1 (upval), v1 (upval), Signal2 (upval), Signal2_1 (upval), Pending2 (upval)
				if Count2 == Count1 then
					v1 = nil
					local NextPageToken = p3.nextPageToken
					local NextPageToken1 = if typeof(NextPageToken) == "string" and NextPageToken ~= "" then NextPageToken else nil
					Signal2(p3.sessions or {})
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
			-- upvalues: Signal1 (copy), v1 (ref), v2 (ref), Pending (copy), Count1 (ref), Signal2_2 (copy), AcpProtocolModule (upval), rpcCall (copy), P4 (copy), Count (ref), OnTerminalModule (upval), appendSessionListEntries (upval), Signal (copy), Signal2 (copy), Signal2_1 (copy)
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
			
			if P4.generateRequestId then
				RequestId = P4.generateRequestId()
			else
				Count += 1
				RequestId = Count
			end
			local RpcCallResult = rpcCall(RequestId, SessionList, Config)
			v2 = RpcCallResult
			OnTerminalModule(RpcCallResult.state, function(p3)
				-- upvalues: Count2 (copy), Count1 (upval), v2 (upval), appendSessionListEntries (upval), Signal (upval), Signal2 (upval), Signal2_1 (upval), Signal2_2 (upval)
				if Count2 == Count1 then
					v2 = nil
					local NextPageToken = p3.nextPageToken
					local NextPageToken1 = if typeof(NextPageToken) == "string" and NextPageToken ~= "" then NextPageToken else nil
					Signal2((appendSessionListEntries(Signal(false), p3.sessions or {})))
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
	
	local function sessionLoad(SessionId, p3)
		-- upvalues: rpcCallSync (copy), AcpProtocolModule (upval)
		assert(typeof(SessionId) == "string" and SessionId ~= "", "sessionId is required")
		
		return rpcCallSync(AcpProtocolModule.Methods.SessionLoad, {
			sessionId = SessionId,
			cwd = p3 and p3.cwd or "/",
			mcpServers = p3 and p3.mcpServers,
			historyPageToken = p3 and p3.historyPageToken
		})
	end
	
	local _ = function(SessionId)
		-- upvalues: rpcCallSync (copy), AcpProtocolModule (upval)
		return rpcCallSync(AcpProtocolModule.Methods.SessionCancel, { sessionId = SessionId })
	end
	
	local _ = function(Key, p3, p4, p5)
		-- upvalues: CreateTurnHandleModule (upval), AcpProtocolModule (upval), rpcCall (copy), P4 (copy), Count (ref), OnTerminalModule (upval), t (copy), t2 (copy), t1 (copy)
		local TurnHandleModule, TurnHandleModule2 = CreateTurnHandleModule(Key, p3, function()
			-- upvalues: Key (copy), AcpProtocolModule (upval), rpcCall (upval), P4 (upval), Count (upval), OnTerminalModule (upval), t (upval), t2 (upval), t1 (upval)
			assert(typeof(Key) == "string" and Key ~= "", "sessionId is required")
			local SessionCancel = AcpProtocolModule.Methods.SessionCancel
			local config = { sessionId = Key }
			local RequestId = nil
			
			if P4.generateRequestId then
				RequestId = P4.generateRequestId()
			else
				Count += 1
				RequestId = Count
			end
			OnTerminalModule(rpcCall(RequestId, SessionCancel, config).state, function()
				-- upvalues: t (upval), Key (copy), t2 (upval), t1 (upval)
				local v3 = t[Key]
				
				if v3 then
					v3.markCancelled()
					
					for i, value in t do
						if value == v3 then
							t[i] = nil
							t2[i] = nil
							break
						end
					end
					local RequestId = v3.requestId
					local Text = if RequestId == nil then nil else tostring(RequestId)
					
					if Text and t1[Text] == v3 then
						t1[Text] = nil
					end
				end
			end)
		end, p4, p5)
		t[Key] = TurnHandleModule2
		t2[Key] = TurnHandleModule
		
		if p3 ~= nil then
			t1[tostring(p3)] = TurnHandleModule2
		end
		return TurnHandleModule
	end
	
	local function sessionPrompt(p6)
		-- upvalues: P4 (copy), Count (ref), CreateTurnHandleModule (upval), AcpProtocolModule (upval), rpcCall (copy), OnTerminalModule (upval), t (copy), t2 (copy), t1 (copy)
		assert(p6 and (typeof(p6.sessionId) == "string" and p6.sessionId ~= ""), "sessionId is required")
		assert(p6.prompt, "prompt is required")
		local SessionId = p6.sessionId
		local RequestId = nil
		
		if P4.generateRequestId then
			RequestId = P4.generateRequestId()
		else
			Count += 1
			RequestId = Count
		end
		local TurnHandleModule, TurnHandleModule2 = CreateTurnHandleModule(SessionId, RequestId, function()
			-- upvalues: SessionId (copy), AcpProtocolModule (upval), rpcCall (upval), P4 (upval), Count (upval), OnTerminalModule (upval), t (upval), t2 (upval), t1 (upval)
			assert(typeof(SessionId) == "string" and SessionId ~= "", "sessionId is required")
			local SessionCancel = AcpProtocolModule.Methods.SessionCancel
			local config = { sessionId = SessionId }
			local RequestId = nil
			
			if P4.generateRequestId then
				RequestId = P4.generateRequestId()
			else
				Count += 1
				RequestId = Count
			end
			OnTerminalModule(rpcCall(RequestId, SessionCancel, config).state, function()
				-- upvalues: t (upval), SessionId (copy), t2 (upval), t1 (upval)
				local v3 = t[SessionId]
				
				if v3 then
					v3.markCancelled()
					
					for i, value in t do
						if value == v3 then
							t[i] = nil
							t2[i] = nil
							break
						end
					end
					local RequestId = v3.requestId
					local Text = if RequestId == nil then nil else tostring(RequestId)
					
					if Text and t1[Text] == v3 then
						t1[Text] = nil
					end
				end
			end)
		end, nil, nil)
		t[SessionId] = TurnHandleModule2
		t2[SessionId] = TurnHandleModule
		
		if RequestId ~= nil then
			t1[tostring(RequestId)] = TurnHandleModule2
		end
		local Entry = t[SessionId]
		local Prompt = p6.prompt
		local config = {
			sessionId = SessionId,
			prompt = if typeof(Prompt) == "string" then { { type = "text", text = Prompt } } else Prompt
		}
		
		if p6._meta then
			config._meta = p6._meta
		end
		OnTerminalModule(rpcCall(RequestId, AcpProtocolModule.Methods.SessionPrompt, config).state, nil, function(p7, p8)
			-- upvalues: Entry (copy), t (upval), t2 (upval), t1 (upval)
			task.defer(function()
				-- upvalues: Entry (upval), p7 (copy), p8 (copy), t (upval), t2 (upval), t1 (upval)
				if Entry.isDone() then return end
				Entry.fail(("CAS session/prompt failed: %s"):format(p7), p8)
				
				for i, value in t do
					if value == Entry then
						t[i] = nil
						t2[i] = nil
						break
					end
				end
				local RequestId = Entry.requestId
				local Text = if RequestId == nil then nil else tostring(RequestId)
				
				if Text and t1[Text] == Entry then
					t1[Text] = nil
				end
			end)
		end)
		
		return TurnHandleModule
	end
	
	local function getActiveTurnHandle(p7)
		-- upvalues: t2 (copy)
		return t2[p7]
	end
	
	local function ingestSessionHistory(p7, p8, p9)
		-- upvalues: HistoryIngestModule (upval), t (copy), unregisterHandle (copy)
		return HistoryIngestModule.ingestSessionHistory({
			getActiveTurnInternals = function(p10)
				-- upvalues: t (upval)
				return t[p10]
			end,
			onTurnDone = unregisterHandle
		}, p7, p8, p9)
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
		sessionFindByUniverse = function(p7)
			-- upvalues: rpcCallSync (copy), AcpProtocolModule (upval)
			assert(typeof(p7) == "table", "sessionFindByUniverse requires params")
			assert(typeof(p7.universeId) == "number" and p7.universeId ~= 0, "universeId is required")
			
			return rpcCallSync(AcpProtocolModule.Methods.SessionFindByUniverse, p7)
		end,
		sessionLoad = sessionLoad,
		sessionReadTasks = function(SessionId)
			-- upvalues: rpcCallSync (copy), AcpProtocolModule (upval)
			assert(typeof(SessionId) == "string" and SessionId ~= "", "sessionId is required")
			
			return rpcCallSync(AcpProtocolModule.Methods.SessionReadTasks, { sessionId = SessionId })
		end,
		sessionPrompt = sessionPrompt,
		submitToolResult = submitToolResult,
		sessionCancel = function(SessionId)
			-- upvalues: AcpProtocolModule (upval), rpcCall (copy), P4 (copy), Count (ref), OnTerminalModule (upval), t (copy), t2 (copy), t1 (copy)
			assert(typeof(SessionId) == "string" and SessionId ~= "", "sessionId is required")
			local SessionCancel = AcpProtocolModule.Methods.SessionCancel
			local config = { sessionId = SessionId }
			local RequestId = nil
			
			if P4.generateRequestId then
				RequestId = P4.generateRequestId()
			else
				Count += 1
				RequestId = Count
			end
			local RpcCallResult = rpcCall(RequestId, SessionCancel, config)
			OnTerminalModule(RpcCallResult.state, function()
				-- upvalues: t (upval), SessionId (copy), t2 (upval), t1 (upval)
				local v3 = t[SessionId]
				
				if v3 then
					v3.markCancelled()
					
					for i, value in t do
						if value == v3 then
							t[i] = nil
							t2[i] = nil
							break
						end
					end
					local RequestId = v3.requestId
					local Text = if RequestId == nil then nil else tostring(RequestId)
					
					if Text and t1[Text] == v3 then
						t1[Text] = nil
					end
				end
			end)
			
			return RpcCallResult
		end,
		sessionDelete = function(SessionId)
			-- upvalues: AcpProtocolModule (upval), rpcCall (copy), P4 (copy), Count (ref), OnTerminalModule (upval), t (copy), t2 (copy), t1 (copy)
			assert(typeof(SessionId) == "string" and SessionId ~= "", "sessionId is required")
			local SessionDelete = AcpProtocolModule.Methods.SessionDelete
			local config = { sessionId = SessionId }
			local RequestId = nil
			
			if P4.generateRequestId then
				RequestId = P4.generateRequestId()
			else
				Count += 1
				RequestId = Count
			end
			local RpcCallResult = rpcCall(RequestId, SessionDelete, config)
			OnTerminalModule(RpcCallResult.state, function()
				-- upvalues: t (upval), SessionId (copy), AcpProtocolModule (upval), t2 (upval), t1 (upval)
				local Entry = t[SessionId]
				
				if Entry then
					Entry.fail("Session deleted before prompt response", AcpProtocolModule.ErrorCodes.Gone)
					
					for i, value in t do
						if value == Entry then
							t[i] = nil
							t2[i] = nil
							break
						end
					end
					local RequestId = Entry.requestId
					local Text = if RequestId == nil then nil else tostring(RequestId)
					
					if Text and t1[Text] == Entry then
						t1[Text] = nil
					end
				end
			end)
			
			return RpcCallResult
		end,
		sessionUpdateInfo = function(SessionId, Title)
			-- upvalues: rpcCallSync (copy), AcpProtocolModule (upval)
			assert(typeof(SessionId) == "string" and SessionId ~= "", "sessionId is required")
			
			return rpcCallSync(AcpProtocolModule.Methods.SessionUpdateInfo, { sessionId = SessionId, title = Title })
		end,
		ingestSessionHistory = ingestSessionHistory,
		ingestFrame = function(p7, p8)
			-- upvalues: IngestFrameHandlerModule (upval), Logger (copy), SessionRegistry (copy), t (copy), t1 (copy), unregisterHandle (copy)
			IngestFrameHandlerModule.ingestFrame({
				logger = Logger,
				getSessionByCasSessionId = SessionRegistry.getSessionByCasSessionId,
				getSessionForProject = SessionRegistry.getSessionForProject,
				getActiveTurnBySession = function(p9)
					-- upvalues: t (upval)
					return t[p9]
				end,
				getActiveTurnByRequestId = function(p9)
					-- upvalues: t1 (upval)
					return t1[p9]
				end,
				onTurnDone = unregisterHandle
			}, p7, p8)
		end,
		resumeTurnFromHistory = function(Key, p7, p8)
			-- upvalues: t2 (copy), CreateTurnHandleModule (upval), AcpProtocolModule (upval), rpcCall (copy), P4 (copy), Count (ref), OnTerminalModule (upval), t (copy), t1 (copy)
			assert(typeof(Key) == "string" and Key ~= "", "sessionId is required")
			
			if p7.isDone then
				return nil
			end
			local Entry = t2[Key]
			
			if Entry == nil then
				local TurnHandleModule, TurnHandleModule2 = CreateTurnHandleModule(Key, nil, function()
					-- upvalues: Key (copy), AcpProtocolModule (upval), rpcCall (upval), P4 (upval), Count (upval), OnTerminalModule (upval), t (upval), t2 (upval), t1 (upval)
					assert(typeof(Key) == "string" and Key ~= "", "sessionId is required")
					local SessionCancel = AcpProtocolModule.Methods.SessionCancel
					local config = { sessionId = Key }
					local RequestId = nil
					
					if P4.generateRequestId then
						RequestId = P4.generateRequestId()
					else
						Count += 1
						RequestId = Count
					end
					OnTerminalModule(rpcCall(RequestId, SessionCancel, config).state, function()
						-- upvalues: t (upval), Key (copy), t2 (upval), t1 (upval)
						local v3 = t[Key]
						
						if v3 then
							v3.markCancelled()
							
							for i, value in t do
								if value == v3 then
									t[i] = nil
									t2[i] = nil
									break
								end
							end
							local RequestId = v3.requestId
							local Text = if RequestId == nil then nil else tostring(RequestId)
							
							if Text and t1[Text] == v3 then
								t1[Text] = nil
							end
						end
					end)
				end, p7, p8)
				t[Key] = TurnHandleModule2
				t2[Key] = TurnHandleModule
				
				return TurnHandleModule
			else
				return Entry
			end
		end,
		getActiveTurnHandle = getActiveTurnHandle,
		getSessionForProject = SessionRegistry.getSessionForProject
	}
end