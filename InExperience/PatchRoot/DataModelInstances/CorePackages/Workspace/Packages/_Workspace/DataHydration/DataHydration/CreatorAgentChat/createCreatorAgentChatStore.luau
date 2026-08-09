local dataHydration = script:FindFirstAncestor("DataHydration")
local httpClientModule = require(dataHydration.Parent.HttpClient)
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
local buildLiveActivity = game:DefineFastFlag("BuildLiveActivity", false)

local function _(p0) --[[ line: 40 | named "normalizePrompt" ]]
	return if typeof(p0) == "string" then { { type = "text", text = p0 } } else p0
end

local t = {
	debug = function() --[[ line: 48 ]] end,
	info = function() --[[ line: 49 ]] end,
	warning = function() --[[ line: 50 ]] end,
	error = function() --[[ line: 51 ]] end
}

return function(p1) --[[ line: 54 | named "createCreatorAgentChatStore" ]]
	-- upvalues: withCsrfRetryModule (ref), httpClientModule (ref), acpProtocolModule (ref), t (ref), rpcDecoderModule (ref), onTerminalModule (ref), createTurnHandleModule (ref), historyIngestModule (ref), buildLiveActivity (ref), sessionRegistryModule (ref), constantsModule (ref), ingestFrameHandlerModule (ref)
	p1 = p1 or {}
	local network = p1.network or withCsrfRetryModule(httpClientModule.createRequestInternalNetwork())
	local baseUrl = p1.baseUrl or acpProtocolModule.acpUrl()
	local logger = p1.logger or t
	
	local function _() --[[ line: 61 | named "authHeaders" ]]
		-- upvalues: p1 (ref)
		return if p1.getAuthHeaders then p1.getAuthHeaders() else {}
	end
	
	local var17 = 0
	
	local _ = function() --[[ line: 66 | named "nextId" ]]
		-- upvalues: p1 (ref), var17 (write)
		if p1.generateRequestId then
			return p1.generateRequestId()
		end
		var17 += 1
		
		return var17
	end
	
	local t_1 = {}
	local t_2 = {}
	local t_3 = {}
	local t_4 = {}
	local var22 = 1
	
	local function notifyCanonicalUpdate(p2) --[[ line: 80 ]]
		-- upvalues: t_4 (ref)
		for i, v in t_4 do
			pcall(function() --[[ line: 82 ]]
				-- upvalues: v (ref), p2 (ref)
				v(p2)
			end)
		end
	end
	
	local _ = function(p3) --[[ line: 88 | named "requestIdKey" ]]
		return if p3 == nil then nil else tostring(p3)
	end
	
	local function unregisterHandle(p4) --[[ line: 92 ]]
		-- upvalues: t_1 (ref), t_3 (ref), t_2 (ref)
		for i, v in t_1 do
			if v == p4 then
				t_1[i] = nil
				t_3[i] = nil
				break
			end
		end
		local requestId = p4.requestId
		local var43 = if requestId == nil then nil else tostring(requestId)
		
		if var43 and t_2[var43] == p4 then
			t_2[var43] = nil
		end
	end
	
	local function rpcCall(p5, p6, p7) --[[ line: 106 ]]
		-- upvalues: logger (ref), httpClientModule (copy), network (ref), baseUrl (ref), p1 (ref), rpcDecoderModule (copy)
		logger:debug(`[CAS] -> {p6} id={tostring(p5)}`)
		
		return httpClientModule.createRequest({
			method = "POST",
			networkImpl = network,
			url = baseUrl,
			headers = if p1.getAuthHeaders then p1.getAuthHeaders() else {},
			body = { jsonrpc = "2.0", id = p5, method = p6, params = p7 or {} },
			analyticsKey = "cas." .. p6:gsub("/", "-"):lower(),
			decode = rpcDecoderModule()
		})
	end
	
	local function rpcCallSync(p8, p9) --[[ line: 124 ]]
		-- upvalues: rpcCall (ref), p1 (ref), var17 (write)
		local var44
		if p1.generateRequestId then
			var44 = p1.generateRequestId()
		else
			var17 += 1
			var44 = var17
		end
		return rpcCall(var44, p8, p9)
	end
	
	local function submitToolResult(p10) --[[ line: 128 ]]
		-- upvalues: p1 (ref), var17 (write), acpProtocolModule (copy), httpClientModule (copy), network (ref), baseUrl (ref), rpcDecoderModule (copy)
		local var45
		assert(typeof(p10.sessionId) == "string" and p10.sessionId ~= "", "sessionId is required")
		assert(typeof(p10.content) == "table" and typeof(p10.content.text) == "string", "content.text is required")
		
		if p10.turnId ~= nil then
			assert(typeof(p10.turnId) == "number" and p10.turnId > 0, "turnId must be a positive number")
		end
		if p10.referenceId ~= nil then
			assert(typeof(p10.referenceId) == "string" and p10.referenceId ~= "", "referenceId must be a string")
		end
		if p1.generateRequestId then
			var45 = p1.generateRequestId()
		else
			var17 += 1
			var45 = var17
		end
		local t = {
			sessionId = p10.sessionId,
			tool_name = acpProtocolModule.AskTool.Name,
			content = p10.content,
			isError = if p10.isError ~= nil then false else p10.isError
		}
		
		if p10.turnId ~= nil then
			t.turnId = p10.turnId
		end
		if p10.referenceId ~= nil then
			t.referenceId = p10.referenceId
		end
		return httpClientModule.createRequest({
			method = "POST",
			analyticsKey = "cas.ask-tool-result",
			networkImpl = network,
			url = baseUrl,
			headers = if p1.getAuthHeaders then p1.getAuthHeaders() else {},
			body = { jsonrpc = "2.0", id = var45, result = t },
			decode = rpcDecoderModule()
		})
	end
	
	local function initialize(p11) --[[ line: 168 ]]
		-- upvalues: rpcCallSync (ref), acpProtocolModule (copy)
		return rpcCallSync(acpProtocolModule.Methods.Initialize, p11 or { protocolVersion = acpProtocolModule.ProtocolVersion })
	end
	
	local function sessionNew(p12) --[[ line: 172 ]]
		-- upvalues: rpcCallSync (ref), acpProtocolModule (copy)
		assert(p12 ~= nil, "sessionNew requires params")
		assert(typeof(p12.project) == "table", "sessionNew requires params.project")
		assert(typeof(p12.project.universeId) == "number", "sessionNew requires params.project.universeId")
		assert(typeof(p12.project.placeId) == "number", "sessionNew requires params.project.placeId")
		
		return rpcCallSync(acpProtocolModule.Methods.SessionNew, acpProtocolModule.buildSessionNewWireParams({
			cwd = p12.cwd or "/",
			mcpServers = p12.mcpServers,
			project = p12.project
		}))
	end
	
	local function sessionList(p13) --[[ line: 187 ]]
		-- upvalues: rpcCallSync (ref), acpProtocolModule (copy)
		return rpcCallSync(acpProtocolModule.Methods.SessionList, p13 or {})
	end
	
	local function sessionFindByUniverse(p14) --[[ line: 191 ]]
		-- upvalues: rpcCallSync (ref), acpProtocolModule (copy)
		assert(typeof(p14) == "table", "sessionFindByUniverse requires params")
		assert(typeof(p14.universeId) == "number" and p14.universeId ~= 0, "universeId is required")
		
		return rpcCallSync(acpProtocolModule.Methods.SessionFindByUniverse, p14)
	end
	
	local function sessionLoad(p15, p16) --[[ line: 199 ]]
		-- upvalues: rpcCallSync (ref), acpProtocolModule (copy)
		assert(typeof(p15) == "string" and p15 ~= "", "sessionId is required")
		
		return rpcCallSync(acpProtocolModule.Methods.SessionLoad, {
			sessionId = p15,
			cwd = if p16 then p16.cwd else "/",
			mcpServers = p16 and p16.mcpServers,
			historyPageToken = p16 and p16.historyPageToken
		})
	end
	
	local function sessionReadTasks(p17) --[[ line: 212 ]]
		-- upvalues: rpcCallSync (ref), acpProtocolModule (copy)
		assert(typeof(p17) == "string" and p17 ~= "", "sessionId is required")
		
		return rpcCallSync(acpProtocolModule.Methods.SessionReadTasks, { sessionId = p17 })
	end
	
	local _ = function(p18) --[[ line: 217 | named "postSessionCancel" ]]
		-- upvalues: rpcCallSync (ref), acpProtocolModule (copy)
		return rpcCallSync(acpProtocolModule.Methods.SessionCancel, { sessionId = p18 })
	end
	
	local function sessionCancel(p19) --[[ line: 221 ]]
		-- upvalues: acpProtocolModule (copy), rpcCall (ref), p1 (ref), var17 (write), onTerminalModule (copy), t_1 (ref), t_3 (ref), t_2 (ref)
		local var48
		assert(typeof(p19) == "string" and p19 ~= "", "sessionId is required")
		local sessionCancel = acpProtocolModule.Methods.SessionCancel
		local t = { sessionId = p19 }
		
		if p1.generateRequestId then
			var48 = p1.generateRequestId()
		else
			var17 += 1
			var48 = var17
		end
		local var49 = rpcCall(var48, sessionCancel, t)
		onTerminalModule(var49.state, function() --[[ line: 224 ]]
			-- upvalues: t_1 (copy), p19 (ref), t_3 (copy), t_2 (copy)
			local var50 = t_1[p19]
			
			if var50 then
				var50.markCancelled()
				
				for i, v in t_1 do
					if v == var50 then
						t_1[i] = nil
						t_3[i] = nil
						break
					end
				end
				local requestId = var50.requestId
				local var51 = if requestId == nil then nil else tostring(requestId)
				
				if var51 and t_2[var51] == var50 then
					t_2[var51] = nil
				end
			end
		end)
		
		return var49
	end
	
	local function sessionDelete(p20) --[[ line: 234 ]]
		-- upvalues: acpProtocolModule (copy), rpcCall (ref), p1 (ref), var17 (write), onTerminalModule (copy), t_1 (ref), t_3 (ref), t_2 (ref)
		local var53
		assert(typeof(p20) == "string" and p20 ~= "", "sessionId is required")
		local sessionDelete = acpProtocolModule.Methods.SessionDelete
		local t = { sessionId = p20 }
		
		if p1.generateRequestId then
			var53 = p1.generateRequestId()
		else
			var17 += 1
			var53 = var17
		end
		local var54 = rpcCall(var53, sessionDelete, t)
		onTerminalModule(var54.state, function() --[[ line: 237 ]]
			-- upvalues: t_1 (copy), p20 (ref), acpProtocolModule (copy), t_3 (copy), t_2 (copy)
			local var55 = t_1[p20]
			
			if var55 then
				var55.fail("Session deleted before prompt response", acpProtocolModule.ErrorCodes.Gone)
				
				for i, v in t_1 do
					if v == var55 then
						t_1[i] = nil
						t_3[i] = nil
						break
					end
				end
				local requestId = var55.requestId
				local var56 = if requestId == nil then nil else tostring(requestId)
				
				if var56 and t_2[var56] == var55 then
					t_2[var56] = nil
				end
			end
		end)
		
		return var54
	end
	
	local function sessionUpdateInfo(p21, p22) --[[ line: 247 ]]
		-- upvalues: rpcCallSync (ref), acpProtocolModule (copy)
		assert(typeof(p21) == "string" and p21 ~= "", "sessionId is required")
		
		return rpcCallSync(acpProtocolModule.Methods.SessionUpdateInfo, { sessionId = p21, title = p22 })
	end
	
	local function registerTurnHandle(p23, p24, p25, p26) --[[ line: 252 ]]
		-- upvalues: createTurnHandleModule (copy), acpProtocolModule (copy), rpcCall (ref), p1 (ref), var17 (write), onTerminalModule (copy), t_1 (ref), t_3 (ref), t_2 (ref)
		local var57 = nil
		
		if p26 ~= nil then
			for i, v in p26 do
				if typeof(v) == "number" and (var57 == nil or v < var57) then
					var57 = v
				end
			end
		end
		local var58, var59 = createTurnHandleModule(p23, p24, function() --[[ line: 273 ]]
			-- upvalues: p23 (ref), acpProtocolModule (copy), rpcCall (copy), p1 (copy), var17 (copy), onTerminalModule (copy), t_1 (copy), t_3 (copy), t_2 (copy)
			local var61
			assert(typeof(p23) == "string" and p23 ~= "", "sessionId is required")
			local sessionCancel = acpProtocolModule.Methods.SessionCancel
			local t = { sessionId = p23 }
			
			if p1.generateRequestId then
				var61 = p1.generateRequestId()
			else
				var17 += 1
				var61 = var17
			end
			onTerminalModule(rpcCall(var61, sessionCancel, t).state, function() --[[ line: 224 ]]
				-- upvalues: t_1 (copy), p23 (ref), t_3 (copy), t_2 (copy)
				local var50 = t_1[p23]
				
				if var50 then
					var50.markCancelled()
					
					for i, v in t_1 do
						if v == var50 then
							t_1[i] = nil
							t_3[i] = nil
							break
						end
					end
					local requestId = var50.requestId
					local var51 = if requestId == nil then nil else tostring(requestId)
					
					if var51 and t_2[var51] == var50 then
						t_2[var51] = nil
					end
				end
			end)
		end, p25, var57, p26)
		t_1[p23] = var59
		t_3[p23] = var58
		
		if p24 ~= nil then
			t_2[tostring(p24)] = var59
		end
		return var58
	end
	
	local function sessionPrompt(p27) --[[ line: 284 ]]
		-- upvalues: p1 (ref), var17 (write), createTurnHandleModule (copy), acpProtocolModule (copy), rpcCall (ref), onTerminalModule (copy), t_1 (ref), t_3 (ref), t_2 (ref)
		local var62
		assert(p27 and (typeof(p27.sessionId) == "string" and p27.sessionId ~= ""), "sessionId is required")
		assert(p27.prompt, "prompt is required")
		local sessionId = p27.sessionId
		
		if p1.generateRequestId then
			var62 = p1.generateRequestId()
		else
			var17 += 1
			var62 = var17
		end
		local var63, var64 = createTurnHandleModule(sessionId, var62, function() --[[ line: 273 ]]
			-- upvalues: sessionId (ref), acpProtocolModule (copy), rpcCall (copy), p1 (copy), var17 (copy), onTerminalModule (copy), t_1 (copy), t_3 (copy), t_2 (copy)
			local var61
			assert(typeof(sessionId) == "string" and sessionId ~= "", "sessionId is required")
			local sessionCancel = acpProtocolModule.Methods.SessionCancel
			local t = { sessionId = sessionId }
			
			if p1.generateRequestId then
				var61 = p1.generateRequestId()
			else
				var17 += 1
				var61 = var17
			end
			onTerminalModule(rpcCall(var61, sessionCancel, t).state, function() --[[ line: 224 ]]
				-- upvalues: t_1 (copy), sessionId (ref), t_3 (copy), t_2 (copy)
				local var50 = t_1[sessionId]
				
				if var50 then
					var50.markCancelled()
					
					for i, v in t_1 do
						if v == var50 then
							t_1[i] = nil
							t_3[i] = nil
							break
						end
					end
					local requestId = var50.requestId
					local var51 = if requestId == nil then nil else tostring(requestId)
					
					if var51 and t_2[var51] == var50 then
						t_2[var51] = nil
					end
				end
			end)
		end, nil, nil, nil)
		t_1[sessionId] = var64
		t_3[sessionId] = var63
		
		if var62 ~= nil then
			t_2[tostring(var62)] = var64
		end
		local var65 = t_1[sessionId]
		local t = { sessionId = sessionId }
		local prompt = p27.prompt
		t.prompt = if typeof(prompt) == "string" then { { type = "text", text = prompt } } else prompt
		
		if p27._meta then
			t._meta = p27._meta
		end
		onTerminalModule(rpcCall(var62, acpProtocolModule.Methods.SessionPrompt, t).state, nil, function(p28, p29) --[[ line: 303 ]]
			-- upvalues: var65 (ref), t_1 (copy), t_3 (copy), t_2 (copy)
			task.defer(function() --[[ line: 304 ]]
				-- upvalues: var65 (copy), p28 (ref), p29 (ref), t_1 (copy), t_3 (copy), t_2 (copy)
				if var65.isDone() then return end
				var65.fail(("CAS session/prompt failed: %s"):format(p28), p29)
				
				for i, v in t_1 do
					if v == var65 then
						t_1[i] = nil
						t_3[i] = nil
						break
					end
				end
				local requestId = var65.requestId
				local var67 = if requestId == nil then nil else tostring(requestId)
				
				if var67 and t_2[var67] == var65 then
					t_2[var67] = nil
				end
			end)
		end)
		
		return var63
	end
	
	local function resumeTurnFromHistory(p30, p31, p32) --[[ line: 316 ]]
		-- upvalues: t_3 (ref), registerTurnHandle (ref)
		assert(typeof(p30) == "string" and p30 ~= "", "sessionId is required")
		
		if p31.isDone then
			return nil
		end
		local var68 = t_3[p30]
		
		return if var68 == nil then registerTurnHandle(p30, nil, p31, p32) else var68
	end
	
	local function getActiveTurnHandle(p33) --[[ line: 332 ]]
		-- upvalues: t_3 (ref)
		return t_3[p33]
	end
	
	local function ingestSessionHistory(p34, p35, p36) --[[ line: 336 ]]
		-- upvalues: historyIngestModule (copy), t_1 (ref), unregisterHandle (ref), buildLiveActivity (copy), notifyCanonicalUpdate (ref)
		return historyIngestModule.ingestSessionHistory({
			getActiveTurnInternals = function(p37) --[[ line: 342 ]]
				-- upvalues: t_1 (copy)
				return t_1[p37]
			end,
			onTurnDone = unregisterHandle,
			onCanonicalSessionUpdate = if buildLiveActivity then notifyCanonicalUpdate else nil
		}, p34, p35, p36)
	end
	
	local var42 = sessionRegistryModule.createSessionRegistry({
		initialize = initialize,
		sessionNew = sessionNew,
		sessionLoad = sessionLoad,
		sessionReadTasks = sessionReadTasks,
		sessionPrompt = sessionPrompt,
		ingestSessionHistory = ingestSessionHistory,
		submitToolResult = submitToolResult,
		getActiveTurnHandle = getActiveTurnHandle,
		onCasSessionIdChanged = function(_) --[[ line: 359 ]] end,
		rpcTimeoutSeconds = constantsModule.getRpcTimeoutSeconds()
	})
	
	return {
		initialize = initialize,
		sessionNew = sessionNew,
		sessionList = sessionList,
		sessionFindByUniverse = sessionFindByUniverse,
		sessionLoad = sessionLoad,
		sessionReadTasks = sessionReadTasks,
		sessionPrompt = sessionPrompt,
		submitToolResult = submitToolResult,
		sessionCancel = sessionCancel,
		sessionDelete = sessionDelete,
		sessionUpdateInfo = sessionUpdateInfo,
		ingestSessionHistory = ingestSessionHistory,
		ingestFrame = function(p38, p39) --[[ line: 363 ]]
			-- upvalues: ingestFrameHandlerModule (copy), logger (ref), var42 (ref), t_1 (ref), t_2 (ref), unregisterHandle (ref), buildLiveActivity (copy), notifyCanonicalUpdate (ref)
			ingestFrameHandlerModule.ingestFrame({
				logger = logger,
				getSessionByCasSessionId = var42.getSessionByCasSessionId,
				getSessionForProject = var42.getSessionForProject,
				getActiveTurnBySession = function(p40) --[[ line: 368 ]]
					-- upvalues: t_1 (copy)
					return t_1[p40]
				end,
				getActiveTurnByRequestId = function(p41) --[[ line: 371 ]]
					-- upvalues: t_2 (copy)
					return t_2[p41]
				end,
				onTurnDone = unregisterHandle,
				onCanonicalSessionUpdate = if buildLiveActivity then notifyCanonicalUpdate else nil
			}, p38, p39)
		end,
		resumeTurnFromHistory = resumeTurnFromHistory,
		getActiveTurnHandle = getActiveTurnHandle,
		observeCanonicalSessionUpdates = function(p42) --[[ line: 379 ]]
			-- upvalues: buildLiveActivity (copy), var22 (write), t_4 (ref)
			if buildLiveActivity then
				var22 += 1
				t_4[var22] = p42
				
				return function() --[[ line: 386 ]]
					-- upvalues: t_4 (copy), var22 (ref)
					t_4[var22] = nil
				end
			end
			return function() --[[ line: 381 ]] end
		end,
		getSessionForProject = var42.getSessionForProject
	}
end