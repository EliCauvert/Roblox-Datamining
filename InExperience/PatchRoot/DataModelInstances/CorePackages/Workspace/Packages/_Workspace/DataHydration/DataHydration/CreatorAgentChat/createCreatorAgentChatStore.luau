local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local httpClientModule = require(parent.HttpClient)
local signalsModule = require(parent.Signals)
local acpProtocolModule = require(script.Parent.Acp.AcpProtocol)
local historyIngestModule = require(script.Parent.CasStore.historyIngest)
local ingestFrameHandlerModule = require(script.Parent.CasStore.ingestFrameHandler)
local sessionRegistryModule = require(script.Parent.CasStore.sessionRegistry)
local constantsModule = require(script.Parent.ChatSession.constants)
local createTurnHandleModule = require(script.Parent.createTurnHandle)
local onTerminalModule = require(script.Parent.onTerminal)
local rpcDecoderModule = require(script.Parent.rpcDecoder)
local _ = require(script.Parent.types)
local withCsrfRetryModule = require(dataHydration.withCsrfRetry)

local function _(p1)
	return if typeof(p1) == "string" and p1 ~= "" then p1 else nil
end

local function appendSessionListEntries(p1, p2)
	local t = {}
	local t_1 = {}
	
	for i, v in p1 do
		local sessionId = v.sessionId
		
		if typeof(sessionId) == "string" and sessionId ~= "" then
			t[sessionId] = true
		end
		table.insert(t_1, v)
	end
	for i, v_1 in p2 do
		local sessionId = v_1.sessionId
		
		if typeof(sessionId) == "string" and sessionId ~= "" and not t[sessionId] then
			t[sessionId] = true
			table.insert(t_1, v_1)
		end
	end
	return t_1
end

local _ = function(p1)
	return if typeof(p1) == "string" then { { type = "text", text = p1 } } else p1
end

local t = {
	debug = function() end,
	info = function() end,
	warning = function() end,
	error = function() end
}

return function(p1)
	-- upvalues: withCsrfRetryModule (ref), httpClientModule (ref), acpProtocolModule (ref), t (ref), rpcDecoderModule (ref), signalsModule (ref), onTerminalModule (ref), appendSessionListEntries (ref), createTurnHandleModule (ref), historyIngestModule (ref), sessionRegistryModule (ref), constantsModule (ref), ingestFrameHandlerModule (ref)
	p1 = p1 or {}
	local network = p1.network or withCsrfRetryModule(httpClientModule.createRequestInternalNetwork())
	local baseUrl = p1.baseUrl or acpProtocolModule.acpUrl()
	local logger = p1.logger or t
	
	local function _()
		-- upvalues: p1 (ref)
		return if p1.getAuthHeaders then p1.getAuthHeaders() else {}
	end
	
	local var1 = 0
	
	local _ = function()
		-- upvalues: p1 (ref), var1 (write)
		if p1.generateRequestId then
			return p1.generateRequestId()
		end
		var1 += 1
		
		return var1
	end
	
	local t_1 = {}
	local t_2 = {}
	local t_3 = {}
	
	local _ = function(p1)
		return if p1 == nil then nil else tostring(p1)
	end
	
	local function unregisterHandle(p1)
		-- upvalues: t_1 (ref), t_3 (ref), t_2 (ref)
		for i, v in t_1 do
			if v == p1 then
				t_1[i] = nil
				t_3[i] = nil
				break
			end
		end
		local requestId = p1.requestId
		local var1 = if requestId == nil then nil else tostring(requestId)
		
		if var1 and t_2[var1] == p1 then
			t_2[var1] = nil
		end
	end
	
	local function rpcCall(p1, p2, p3)
		-- upvalues: logger (ref), httpClientModule (copy), network (ref), baseUrl (ref), p1 (ref), rpcDecoderModule (copy)
		logger:debug(`[CAS] -> {p2} id={tostring(p1)}`)
		
		return httpClientModule.createRequest({
			method = "POST",
			networkImpl = network,
			url = baseUrl,
			headers = if p1.getAuthHeaders then p1.getAuthHeaders() else {},
			body = { jsonrpc = "2.0", id = p1, method = p2, params = p3 or {} },
			analyticsKey = "cas." .. p8:gsub("/", "-"):lower(),
			decode = rpcDecoderModule()
		})
	end
	
	local function rpcCallSync(p1, p2)
		-- upvalues: rpcCall (ref), p1 (ref), var1 (write)
		local var1
		if p1.generateRequestId then
			var1 = p1.generateRequestId()
		else
			var1 += 1
			var1 = var1
		end
		return rpcCall(var1, p1, p2)
	end
	
	local function submitToolResult(p1)
		-- upvalues: p1 (ref), var1 (write), acpProtocolModule (copy), httpClientModule (copy), network (ref), baseUrl (ref), rpcDecoderModule (copy)
		local var1
		assert(typeof(p1.sessionId) == "string" and p1.sessionId ~= "", "sessionId is required")
		assert(typeof(p1.content) == "table" and typeof(p1.content.text) == "string", "content.text is required")
		
		if p1.turnId ~= nil then
			assert(typeof(p1.turnId) == "number" and p1.turnId > 0, "turnId must be a positive number")
		end
		if p1.referenceId ~= nil then
			assert(typeof(p1.referenceId) == "string" and p1.referenceId ~= "", "referenceId must be a string")
		end
		if p1.generateRequestId then
			var1 = p1.generateRequestId()
		else
			var1 += 1
			var1 = var1
		end
		local t = {
			sessionId = p1.sessionId,
			tool_name = acpProtocolModule.AskTool.Name,
			content = p1.content,
			isError = if p1.isError ~= nil then false else p1.isError
		}
		
		if p1.turnId ~= nil then
			t.turnId = p1.turnId
		end
		if p1.referenceId ~= nil then
			t.referenceId = p1.referenceId
		end
		return httpClientModule.createRequest({
			method = "POST",
			analyticsKey = "cas.ask-tool-result",
			networkImpl = network,
			url = baseUrl,
			headers = if p1.getAuthHeaders then p1.getAuthHeaders() else {},
			body = { jsonrpc = "2.0", id = var1, result = t },
			decode = rpcDecoderModule()
		})
	end
	
	local function initialize(p1)
		-- upvalues: rpcCallSync (ref), acpProtocolModule (copy)
		return rpcCallSync(acpProtocolModule.Methods.Initialize, p1 or { protocolVersion = acpProtocolModule.ProtocolVersion })
	end
	
	local function sessionNew(p1)
		-- upvalues: rpcCallSync (ref), acpProtocolModule (copy)
		assert(p1 ~= nil, "sessionNew requires params")
		assert(typeof(p1.project) == "table", "sessionNew requires params.project")
		assert(typeof(p1.project.universeId) == "number", "sessionNew requires params.project.universeId")
		assert(typeof(p1.project.placeId) == "number", "sessionNew requires params.project.placeId")
		
		return rpcCallSync(acpProtocolModule.Methods.SessionNew, acpProtocolModule.buildSessionNewWireParams({
			cwd = p1.cwd or "/",
			mcpServers = p1.mcpServers,
			project = p1.project,
			experiment = p1.experiment,
			application = p1.application
		}))
	end
	
	local function sessionList(p1)
		-- upvalues: rpcCallSync (ref), acpProtocolModule (copy)
		return rpcCallSync(acpProtocolModule.Methods.SessionList, p1 or {})
	end
	
	local var2, var3 = signalsModule.createSignal({})
	local var4, var5 = signalsModule.createSignal(nil)
	local pending, pending_1 = signalsModule.createSignal("pending")
	local var6, var7 = signalsModule.createSignal(nil)
	local var8 = nil
	local var9 = nil
	local var10 = 0
	local t_4 = {
		getSessions = var2,
		getNextPageToken = var4,
		getStatus = pending,
		getLoadMoreStatus = var6,
		refresh = function()
			-- upvalues: var8 (write), var10 (write), var9 (write), pending_1 (ref), var7 (ref), acpProtocolModule (copy), rpcCall (ref), p1 (ref), var1 (write), onTerminalModule (copy), var3 (ref), var5 (ref)
			if var8 ~= nil then
				if var8.state(false).status == "pending" then
					return var8
				end
				var8 = nil
			end
			local var1
			var10 += 1
			local var2 = var10
			var9 = nil
			pending_1("pending")
			var7(nil)
			local sessionList = acpProtocolModule.Methods.SessionList
			local t = {}
			
			if p1.generateRequestId then
				var1 = p1.generateRequestId()
			else
				var1 += 1
				var1 = var1
			end
			local var3 = rpcCall(var1, sessionList, t)
			var8 = var3
			onTerminalModule(var3.state, function(p1)
				-- upvalues: var2 (ref), var10 (copy), var8 (copy), var3 (copy), var5 (copy), pending_1 (copy)
				if var2 ~= var10 then return end
				var8 = nil
				local sessions = p1.sessions or {}
				local nextPageToken = p1.nextPageToken
				local var1 = if typeof(nextPageToken) == "string" and nextPageToken ~= "" then nextPageToken else nil
				var3(sessions)
				var5(var1)
				pending_1("succeeded")
			end, function(_)
				-- upvalues: var2 (ref), var10 (copy), var8 (copy), pending_1 (copy)
				if var2 == var10 then
					var8 = nil
					pending_1("failed")
					
					return
				end
			end)
			
			return var3
		end,
		loadMore = function()
			-- upvalues: var4 (ref), var8 (write), var9 (write), pending (ref), var10 (write), var7 (ref), acpProtocolModule (copy), rpcCall (ref), p1 (ref), var1 (write), onTerminalModule (copy), appendSessionListEntries (copy), var2 (ref), var3 (ref), var5 (ref)
			local var1 = var4(false)
			
			if var1 == nil then
				return nil
			elseif var8 ~= nil then
				return nil
			elseif var9 ~= nil then
				return nil
			elseif pending(false) ~= "succeeded" then
				return nil
			end
			local var2
			var7("pending")
			local sessionList = acpProtocolModule.Methods.SessionList
			local var3 = { pageToken = var1 } or {}
			
			if p1.generateRequestId then
				var2 = p1.generateRequestId()
			else
				var1 += 1
				var2 = var1
			end
			local var4 = rpcCall(var2, sessionList, var3)
			var9 = var4
			onTerminalModule(var4.state, function(p1)
				-- upvalues: var10 (ref), var10 (copy), var9 (copy), appendSessionListEntries (copy), var2 (copy), var3 (copy), var5 (copy), var7 (copy)
				if var10 ~= var10 then return end
				var9 = nil
				local sessions = p1.sessions or {}
				local nextPageToken = p1.nextPageToken
				local var1 = if typeof(nextPageToken) == "string" and nextPageToken ~= "" then nextPageToken else nil
				var3(appendSessionListEntries(var2(false), sessions))
				var5(var1)
				var7("succeeded")
			end, function(_)
				-- upvalues: var10 (ref), var10 (copy), var9 (copy), var7 (copy)
				if var10 == var10 then
					var9 = nil
					var7("failed")
					
					return
				end
			end)
			
			return var4
		end
	}
	
	local function sessionFindByUniverse(p1)
		-- upvalues: rpcCallSync (ref), acpProtocolModule (copy)
		assert(typeof(p1) == "table", "sessionFindByUniverse requires params")
		assert(typeof(p1.universeId) == "number" and p1.universeId ~= 0, "universeId is required")
		
		return rpcCallSync(acpProtocolModule.Methods.SessionFindByUniverse, p1)
	end
	
	local function sessionLoad(p1, p2)
		-- upvalues: rpcCallSync (ref), acpProtocolModule (copy)
		assert(typeof(p1) == "string" and p1 ~= "", "sessionId is required")
		
		return rpcCallSync(acpProtocolModule.Methods.SessionLoad, {
			sessionId = p1,
			cwd = if p2 then p2.cwd else "/",
			mcpServers = p2 and p2.mcpServers,
			historyPageToken = p2 and p2.historyPageToken
		})
	end
	
	local function sessionReadTasks(p1)
		-- upvalues: rpcCallSync (ref), acpProtocolModule (copy)
		assert(typeof(p1) == "string" and p1 ~= "", "sessionId is required")
		
		return rpcCallSync(acpProtocolModule.Methods.SessionReadTasks, { sessionId = p1 })
	end
	
	local _ = function(p1)
		-- upvalues: rpcCallSync (ref), acpProtocolModule (copy)
		return rpcCallSync(acpProtocolModule.Methods.SessionCancel, { sessionId = p1 })
	end
	
	local function sessionCancel(p1)
		-- upvalues: acpProtocolModule (copy), rpcCall (ref), p1 (ref), var1 (write), onTerminalModule (copy), t_1 (ref), t_3 (ref), t_2 (ref)
		local var1
		assert(typeof(p1) == "string" and p1 ~= "", "sessionId is required")
		local sessionCancel = acpProtocolModule.Methods.SessionCancel
		local t = { sessionId = p1 }
		
		if p1.generateRequestId then
			var1 = p1.generateRequestId()
		else
			var1 += 1
			var1 = var1
		end
		local var2 = rpcCall(var1, sessionCancel, t)
		onTerminalModule(var2.state, function()
			-- upvalues: t_1 (copy), p1 (ref), t_3 (copy), t_2 (copy)
			local var1 = t_1[p1]
			
			if var1 then
				var1.markCancelled()
				
				for i, v in t_1 do
					if v == var1 then
						t_1[i] = nil
						t_3[i] = nil
						break
					end
				end
				local requestId = var1.requestId
				local var2 = if requestId == nil then nil else tostring(requestId)
				
				if var2 and t_2[var2] == var1 then
					t_2[var2] = nil
				end
			end
		end)
		
		return var2
	end
	
	local function sessionDelete(p1)
		-- upvalues: acpProtocolModule (copy), rpcCall (ref), p1 (ref), var1 (write), onTerminalModule (copy), t_1 (ref), t_3 (ref), t_2 (ref)
		local var1
		assert(typeof(p1) == "string" and p1 ~= "", "sessionId is required")
		local sessionDelete = acpProtocolModule.Methods.SessionDelete
		local t = { sessionId = p1 }
		
		if p1.generateRequestId then
			var1 = p1.generateRequestId()
		else
			var1 += 1
			var1 = var1
		end
		local var2 = rpcCall(var1, sessionDelete, t)
		onTerminalModule(var2.state, function()
			-- upvalues: t_1 (copy), p1 (ref), acpProtocolModule (copy), t_3 (copy), t_2 (copy)
			local var1 = t_1[p1]
			
			if var1 then
				var1.fail("Session deleted before prompt response", acpProtocolModule.ErrorCodes.Gone)
				
				for i, v in t_1 do
					if v == var1 then
						t_1[i] = nil
						t_3[i] = nil
						break
					end
				end
				local requestId = var1.requestId
				local var2 = if requestId == nil then nil else tostring(requestId)
				
				if var2 and t_2[var2] == var1 then
					t_2[var2] = nil
				end
			end
		end)
		
		return var2
	end
	
	local function sessionUpdateInfo(p1, p2)
		-- upvalues: rpcCallSync (ref), acpProtocolModule (copy)
		assert(typeof(p1) == "string" and p1 ~= "", "sessionId is required")
		
		return rpcCallSync(acpProtocolModule.Methods.SessionUpdateInfo, { sessionId = p1, title = p2 })
	end
	
	local function sessionSaveAndPublish(p1)
		-- upvalues: rpcCallSync (ref), acpProtocolModule (copy)
		assert(typeof(p1) == "table", "sessionSaveAndPublish requires params")
		assert(typeof(p1.placeId) == "number" and p1.placeId > 0, "placeId must be a positive number")
		assert(if p1.title ~= nil then typeof(p1.title) == "string" else true, "title must be a string")
		assert(if p1.description ~= nil then typeof(p1.description) == "string" else true, "description must be a string")
		
		return rpcCallSync(acpProtocolModule.Methods.SessionSaveAndPublish, p1)
	end
	
	local _ = function(p1, p2, p3, p4)
		-- upvalues: createTurnHandleModule (copy), acpProtocolModule (copy), rpcCall (ref), p1 (ref), var1 (write), onTerminalModule (copy), t_1 (ref), t_3 (ref), t_2 (ref)
		local var1, var2 = createTurnHandleModule(p1, p2, function()
			-- upvalues: p1 (ref), acpProtocolModule (copy), rpcCall (copy), p1 (copy), var1 (copy), onTerminalModule (copy), t_1 (copy), t_3 (copy), t_2 (copy)
			local var1
			assert(typeof(p1) == "string" and p1 ~= "", "sessionId is required")
			local sessionCancel = acpProtocolModule.Methods.SessionCancel
			local t = { sessionId = p1 }
			
			if p1.generateRequestId then
				var1 = p1.generateRequestId()
			else
				var1 += 1
				var1 = var1
			end
			onTerminalModule(rpcCall(var1, sessionCancel, t).state, function()
				-- upvalues: t_1 (copy), p1 (ref), t_3 (copy), t_2 (copy)
				local var1 = t_1[p1]
				
				if var1 then
					var1.markCancelled()
					
					for i, v in t_1 do
						if v == var1 then
							t_1[i] = nil
							t_3[i] = nil
							break
						end
					end
					local requestId = var1.requestId
					local var2 = if requestId == nil then nil else tostring(requestId)
					
					if var2 and t_2[var2] == var1 then
						t_2[var2] = nil
					end
				end
			end)
		end, p3, p4)
		t_1[p1] = var2
		t_3[p1] = var1
		
		if p2 ~= nil then
			t_2[tostring(p2)] = var2
		end
		return var1
	end
	
	local function sessionPrompt(p1)
		-- upvalues: p1 (ref), var1 (write), createTurnHandleModule (copy), acpProtocolModule (copy), rpcCall (ref), onTerminalModule (copy), t_1 (ref), t_3 (ref), t_2 (ref)
		local var1
		assert(p1 and (typeof(p1.sessionId) == "string" and p1.sessionId ~= ""), "sessionId is required")
		assert(p1.prompt, "prompt is required")
		local sessionId = p1.sessionId
		
		if p1.generateRequestId then
			var1 = p1.generateRequestId()
		else
			var1 += 1
			var1 = var1
		end
		local var2, var3 = createTurnHandleModule(sessionId, var1, function()
			-- upvalues: sessionId (ref), acpProtocolModule (copy), rpcCall (copy), p1 (copy), var1 (copy), onTerminalModule (copy), t_1 (copy), t_3 (copy), t_2 (copy)
			local var1
			assert(typeof(sessionId) == "string" and sessionId ~= "", "sessionId is required")
			local sessionCancel = acpProtocolModule.Methods.SessionCancel
			local t = { sessionId = sessionId }
			
			if p1.generateRequestId then
				var1 = p1.generateRequestId()
			else
				var1 += 1
				var1 = var1
			end
			onTerminalModule(rpcCall(var1, sessionCancel, t).state, function()
				-- upvalues: t_1 (copy), sessionId (ref), t_3 (copy), t_2 (copy)
				local var1 = t_1[sessionId]
				
				if var1 then
					var1.markCancelled()
					
					for i, v in t_1 do
						if v == var1 then
							t_1[i] = nil
							t_3[i] = nil
							break
						end
					end
					local requestId = var1.requestId
					local var2 = if requestId == nil then nil else tostring(requestId)
					
					if var2 and t_2[var2] == var1 then
						t_2[var2] = nil
					end
				end
			end)
		end, nil, nil)
		t_1[sessionId] = var3
		t_3[sessionId] = var2
		
		if var1 ~= nil then
			t_2[tostring(var1)] = var3
		end
		local var3 = t_1[sessionId]
		local t = { sessionId = sessionId }
		local prompt = p1.prompt
		t.prompt = if typeof(prompt) == "string" then { { type = "text", text = prompt } } else prompt
		
		if p1._meta then
			t._meta = p1._meta
		end
		onTerminalModule(rpcCall(var1, acpProtocolModule.Methods.SessionPrompt, t).state, nil, function(p1, p2)
			-- upvalues: var3 (ref), t_1 (copy), t_3 (copy), t_2 (copy)
			task.defer(function()
				-- upvalues: var3 (copy), p1 (ref), p2 (ref), t_1 (copy), t_3 (copy), t_2 (copy)
				if var3.isDone() then return end
				var3.fail(p1, p2)
				
				for i, v in t_1 do
					if v == var3 then
						t_1[i] = nil
						t_3[i] = nil
						break
					end
				end
				local requestId = var3.requestId
				local var1 = if requestId == nil then nil else tostring(requestId)
				
				if var1 and t_2[var1] == var3 then
					t_2[var1] = nil
				end
			end)
		end)
		
		return var2
	end
	
	local function resumeTurnFromHistory(p1, p2, p3)
		-- upvalues: t_3 (ref), createTurnHandleModule (copy), acpProtocolModule (copy), rpcCall (ref), p1 (ref), var1 (write), onTerminalModule (copy), t_1 (ref), t_2 (ref)
		assert(typeof(p1) == "string" and p1 ~= "", "sessionId is required")
		
		if p2.isDone then
			return nil
		end
		local var1 = t_3[p1]
		
		if var1 == nil then
			local var2, var3 = createTurnHandleModule(p1, nil, function()
				-- upvalues: p1 (ref), acpProtocolModule (copy), rpcCall (copy), p1 (copy), var1 (copy), onTerminalModule (copy), t_1 (copy), t_3 (copy), t_2 (copy)
				local var1
				assert(typeof(p1) == "string" and p1 ~= "", "sessionId is required")
				local sessionCancel = acpProtocolModule.Methods.SessionCancel
				local t = { sessionId = p1 }
				
				if p1.generateRequestId then
					var1 = p1.generateRequestId()
				else
					var1 += 1
					var1 = var1
				end
				onTerminalModule(rpcCall(var1, sessionCancel, t).state, function()
					-- upvalues: t_1 (copy), p1 (ref), t_3 (copy), t_2 (copy)
					local var1 = t_1[p1]
					
					if var1 then
						var1.markCancelled()
						
						for i, v in t_1 do
							if v == var1 then
								t_1[i] = nil
								t_3[i] = nil
								break
							end
						end
						local requestId = var1.requestId
						local var2 = if requestId == nil then nil else tostring(requestId)
						
						if var2 and t_2[var2] == var1 then
							t_2[var2] = nil
						end
					end
				end)
			end, p2, p3)
			t_1[p1] = var3
			t_3[p1] = var2
			
			return var2
		end
		return var1
	end
	
	local function getActiveTurnHandle(p1)
		-- upvalues: t_3 (ref)
		return t_3[p1]
	end
	
	local function ingestSessionHistory(p1, p2, p3)
		-- upvalues: historyIngestModule (copy), t_1 (ref), unregisterHandle (ref)
		return historyIngestModule.ingestSessionHistory({
			getActiveTurnInternals = function(p1)
				-- upvalues: t_1 (copy)
				return t_1[p1]
			end,
			onTurnDone = unregisterHandle
		}, p1, p2, p3)
	end
	
	local var4 = sessionRegistryModule.createSessionRegistry({
		initialize = initialize,
		sessionNew = sessionNew,
		sessionLoad = sessionLoad,
		sessionPrompt = sessionPrompt,
		ingestSessionHistory = ingestSessionHistory,
		submitToolResult = submitToolResult,
		getActiveTurnHandle = getActiveTurnHandle,
		onCasSessionIdChanged = function(_) end,
		rpcTimeoutSeconds = constantsModule.getRpcTimeoutSeconds()
	})
	
	return {
		initialize = initialize,
		sessionNew = sessionNew,
		sessionList = sessionList,
		getSessionListStore = function()
			-- upvalues: t_4 (ref)
			return t_4
		end,
		sessionFindByUniverse = sessionFindByUniverse,
		sessionLoad = sessionLoad,
		sessionReadTasks = sessionReadTasks,
		sessionPrompt = sessionPrompt,
		submitToolResult = submitToolResult,
		sessionCancel = sessionCancel,
		sessionDelete = sessionDelete,
		sessionUpdateInfo = sessionUpdateInfo,
		sessionSaveAndPublish = sessionSaveAndPublish,
		ingestSessionHistory = ingestSessionHistory,
		ingestFrame = function(p1, p2)
			-- upvalues: ingestFrameHandlerModule (copy), logger (ref), var4 (ref), t_1 (ref), t_2 (ref), unregisterHandle (ref)
			ingestFrameHandlerModule.ingestFrame({
				logger = logger,
				getSessionByCasSessionId = var4.getSessionByCasSessionId,
				getSessionForProject = var4.getSessionForProject,
				getActiveTurnBySession = function(p1)
					-- upvalues: t_1 (copy)
					return t_1[p1]
				end,
				getActiveTurnByRequestId = function(p1)
					-- upvalues: t_2 (copy)
					return t_2[p1]
				end,
				onTurnDone = unregisterHandle
			}, p1, p2)
		end,
		resumeTurnFromHistory = resumeTurnFromHistory,
		getActiveTurnHandle = getActiveTurnHandle,
		getSessionForProject = var4.getSessionForProject
	}
end