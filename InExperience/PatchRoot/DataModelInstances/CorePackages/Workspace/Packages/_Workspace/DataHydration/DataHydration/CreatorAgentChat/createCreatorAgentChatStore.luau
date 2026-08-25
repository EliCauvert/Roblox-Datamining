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

local function _(p0)
	return if typeof(p0) == "string" and p0 ~= "" then p0 else nil
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

local _ = function(p3)
	return if typeof(p3) == "string" then { { type = "text", text = p3 } } else p3
end

local t = {
	debug = function() end,
	info = function() end,
	warning = function() end,
	error = function() end
}

return function(p4)
	-- upvalues: withCsrfRetryModule (ref), httpClientModule (ref), acpProtocolModule (ref), t (ref), rpcDecoderModule (ref), signalsModule (ref), onTerminalModule (ref), appendSessionListEntries (ref), createTurnHandleModule (ref), historyIngestModule (ref), sessionRegistryModule (ref), constantsModule (ref), ingestFrameHandlerModule (ref)
	p4 = p4 or {}
	local network = p4.network or withCsrfRetryModule(httpClientModule.createRequestInternalNetwork())
	local baseUrl = p4.baseUrl or acpProtocolModule.acpUrl()
	local logger = p4.logger or t
	
	local function _()
		-- upvalues: p4 (ref)
		return if p4.getAuthHeaders then p4.getAuthHeaders() else {}
	end
	
	local var20 = 0
	
	local _ = function()
		-- upvalues: p4 (ref), var20 (write)
		if p4.generateRequestId then
			return p4.generateRequestId()
		end
		var20 += 1
		
		return var20
	end
	
	local t_1 = {}
	local t_2 = {}
	local t_3 = {}
	
	local _ = function(p5)
		return if p5 == nil then nil else tostring(p5)
	end
	
	local function unregisterHandle(p6)
		-- upvalues: t_1 (ref), t_3 (ref), t_2 (ref)
		for i, v in t_1 do
			if v == p6 then
				t_1[i] = nil
				t_3[i] = nil
				break
			end
		end
		local requestId = p6.requestId
		local var55 = if requestId == nil then nil else tostring(requestId)
		
		if var55 and t_2[var55] == p6 then
			t_2[var55] = nil
		end
	end
	
	local function rpcCall(p7, p8, p9)
		-- upvalues: logger (ref), httpClientModule (copy), network (ref), baseUrl (ref), p4 (ref), rpcDecoderModule (copy)
		logger:debug(`[CAS] -> {p8} id={tostring(p7)}`)
		
		return httpClientModule.createRequest({
			method = "POST",
			networkImpl = network,
			url = baseUrl,
			headers = if p4.getAuthHeaders then p4.getAuthHeaders() else {},
			body = { jsonrpc = "2.0", id = p7, method = p8, params = p9 or {} },
			analyticsKey = "cas." .. p8:gsub("/", "-"):lower(),
			decode = rpcDecoderModule()
		})
	end
	
	local function rpcCallSync(p10, p11)
		-- upvalues: rpcCall (ref), p4 (ref), var20 (write)
		local var56
		if p4.generateRequestId then
			var56 = p4.generateRequestId()
		else
			var20 += 1
			var56 = var20
		end
		return rpcCall(var56, p10, p11)
	end
	
	local function submitToolResult(p12)
		-- upvalues: p4 (ref), var20 (write), acpProtocolModule (copy), httpClientModule (copy), network (ref), baseUrl (ref), rpcDecoderModule (copy)
		local var57
		assert(typeof(p12.sessionId) == "string" and p12.sessionId ~= "", "sessionId is required")
		assert(typeof(p12.content) == "table" and typeof(p12.content.text) == "string", "content.text is required")
		
		if p12.turnId ~= nil then
			assert(typeof(p12.turnId) == "number" and p12.turnId > 0, "turnId must be a positive number")
		end
		if p12.referenceId ~= nil then
			assert(typeof(p12.referenceId) == "string" and p12.referenceId ~= "", "referenceId must be a string")
		end
		if p4.generateRequestId then
			var57 = p4.generateRequestId()
		else
			var20 += 1
			var57 = var20
		end
		local t = {
			sessionId = p12.sessionId,
			tool_name = acpProtocolModule.AskTool.Name,
			content = p12.content,
			isError = if p12.isError ~= nil then false else p12.isError
		}
		
		if p12.turnId ~= nil then
			t.turnId = p12.turnId
		end
		if p12.referenceId ~= nil then
			t.referenceId = p12.referenceId
		end
		return httpClientModule.createRequest({
			method = "POST",
			analyticsKey = "cas.ask-tool-result",
			networkImpl = network,
			url = baseUrl,
			headers = if p4.getAuthHeaders then p4.getAuthHeaders() else {},
			body = { jsonrpc = "2.0", id = var57, result = t },
			decode = rpcDecoderModule()
		})
	end
	
	local function initialize(p13)
		-- upvalues: rpcCallSync (ref), acpProtocolModule (copy)
		return rpcCallSync(acpProtocolModule.Methods.Initialize, p13 or { protocolVersion = acpProtocolModule.ProtocolVersion })
	end
	
	local function sessionNew(p14)
		-- upvalues: rpcCallSync (ref), acpProtocolModule (copy)
		assert(p14 ~= nil, "sessionNew requires params")
		assert(typeof(p14.project) == "table", "sessionNew requires params.project")
		assert(typeof(p14.project.universeId) == "number", "sessionNew requires params.project.universeId")
		assert(typeof(p14.project.placeId) == "number", "sessionNew requires params.project.placeId")
		
		return rpcCallSync(acpProtocolModule.Methods.SessionNew, acpProtocolModule.buildSessionNewWireParams({
			cwd = p14.cwd or "/",
			mcpServers = p14.mcpServers,
			project = p14.project,
			experiment = p14.experiment
		}))
	end
	
	local function sessionList(p15)
		-- upvalues: rpcCallSync (ref), acpProtocolModule (copy)
		return rpcCallSync(acpProtocolModule.Methods.SessionList, p15 or {})
	end
	
	local var31, var32 = signalsModule.createSignal({})
	local var33, var34 = signalsModule.createSignal(nil)
	local pending, pending_1 = signalsModule.createSignal("pending")
	local var37, var38 = signalsModule.createSignal(nil)
	local var39 = nil
	local var40 = nil
	local var41 = 0
	local t_4 = {
		getSessions = var31,
		getNextPageToken = var33,
		getStatus = pending,
		getLoadMoreStatus = var37,
		refresh = function()
			-- upvalues: var39 (write), var41 (write), var40 (write), pending_1 (ref), var38 (ref), acpProtocolModule (copy), rpcCall (ref), p4 (ref), var20 (write), onTerminalModule (copy), var32 (ref), var34 (ref)
			if var39 ~= nil then
				if var39.state(false).status == "pending" then
					return var39
				end
				var39 = nil
			end
			local var61
			var41 += 1
			local var59 = var41
			var40 = nil
			pending_1("pending")
			var38(nil)
			local sessionList = acpProtocolModule.Methods.SessionList
			local t = {}
			
			if p4.generateRequestId then
				var61 = p4.generateRequestId()
			else
				var20 += 1
				var61 = var20
			end
			local var62 = rpcCall(var61, sessionList, t)
			var39 = var62
			onTerminalModule(var62.state, function(p16)
				-- upvalues: var59 (ref), var41 (copy), var39 (copy), var32 (copy), var34 (copy), pending_1 (copy)
				if var59 ~= var41 then return end
				var39 = nil
				local sessions = p16.sessions or {}
				local nextPageToken = p16.nextPageToken
				local var64 = if typeof(nextPageToken) == "string" and nextPageToken ~= "" then nextPageToken else nil
				var32(sessions)
				var34(var64)
				pending_1("succeeded")
			end, function(_)
				-- upvalues: var59 (ref), var41 (copy), var39 (copy), pending_1 (copy)
				if var59 == var41 then
					var39 = nil
					pending_1("failed")
					
					return
				end
			end)
			
			return var62
		end,
		loadMore = function()
			-- upvalues: var33 (ref), var39 (write), var40 (write), pending (ref), var41 (write), var38 (ref), acpProtocolModule (copy), rpcCall (ref), p4 (ref), var20 (write), onTerminalModule (copy), appendSessionListEntries (copy), var31 (ref), var32 (ref), var34 (ref)
			local var65 = var33(false)
			
			if var65 == nil then
				return nil
			elseif var39 ~= nil then
				return nil
			elseif var40 ~= nil then
				return nil
			elseif pending(false) ~= "succeeded" then
				return nil
			end
			local var67
			var38("pending")
			local sessionList = acpProtocolModule.Methods.SessionList
			local var66 = { pageToken = var65 } or {}
			
			if p4.generateRequestId then
				var67 = p4.generateRequestId()
			else
				var20 += 1
				var67 = var20
			end
			local var68 = rpcCall(var67, sessionList, var66)
			var40 = var68
			onTerminalModule(var68.state, function(p17)
				-- upvalues: var41 (ref), var41 (copy), var40 (copy), appendSessionListEntries (copy), var31 (copy), var32 (copy), var34 (copy), var38 (copy)
				if var41 ~= var41 then return end
				var40 = nil
				local sessions = p17.sessions or {}
				local nextPageToken = p17.nextPageToken
				local var70 = if typeof(nextPageToken) == "string" and nextPageToken ~= "" then nextPageToken else nil
				var32(appendSessionListEntries(var31(false), sessions))
				var34(var70)
				var38("succeeded")
			end, function(_)
				-- upvalues: var41 (ref), var41 (copy), var40 (copy), var38 (copy)
				if var41 == var41 then
					var40 = nil
					var38("failed")
					
					return
				end
			end)
			
			return var68
		end
	}
	
	local function sessionFindByUniverse(p18)
		-- upvalues: rpcCallSync (ref), acpProtocolModule (copy)
		assert(typeof(p18) == "table", "sessionFindByUniverse requires params")
		assert(typeof(p18.universeId) == "number" and p18.universeId ~= 0, "universeId is required")
		
		return rpcCallSync(acpProtocolModule.Methods.SessionFindByUniverse, p18)
	end
	
	local function sessionLoad(p19, p20)
		-- upvalues: rpcCallSync (ref), acpProtocolModule (copy)
		assert(typeof(p19) == "string" and p19 ~= "", "sessionId is required")
		
		return rpcCallSync(acpProtocolModule.Methods.SessionLoad, {
			sessionId = p19,
			cwd = if p20 then p20.cwd else "/",
			mcpServers = p20 and p20.mcpServers,
			historyPageToken = p20 and p20.historyPageToken
		})
	end
	
	local function sessionReadTasks(p21)
		-- upvalues: rpcCallSync (ref), acpProtocolModule (copy)
		assert(typeof(p21) == "string" and p21 ~= "", "sessionId is required")
		
		return rpcCallSync(acpProtocolModule.Methods.SessionReadTasks, { sessionId = p21 })
	end
	
	local _ = function(p22)
		-- upvalues: rpcCallSync (ref), acpProtocolModule (copy)
		return rpcCallSync(acpProtocolModule.Methods.SessionCancel, { sessionId = p22 })
	end
	
	local function sessionCancel(p23)
		-- upvalues: acpProtocolModule (copy), rpcCall (ref), p4 (ref), var20 (write), onTerminalModule (copy), t_1 (ref), t_3 (ref), t_2 (ref)
		local var72
		assert(typeof(p23) == "string" and p23 ~= "", "sessionId is required")
		local sessionCancel = acpProtocolModule.Methods.SessionCancel
		local t = { sessionId = p23 }
		
		if p4.generateRequestId then
			var72 = p4.generateRequestId()
		else
			var20 += 1
			var72 = var20
		end
		local var73 = rpcCall(var72, sessionCancel, t)
		onTerminalModule(var73.state, function()
			-- upvalues: t_1 (copy), p23 (ref), t_3 (copy), t_2 (copy)
			local var74 = t_1[p23]
			
			if var74 then
				var74.markCancelled()
				
				for i, v in t_1 do
					if v == var74 then
						t_1[i] = nil
						t_3[i] = nil
						break
					end
				end
				local requestId = var74.requestId
				local var75 = if requestId == nil then nil else tostring(requestId)
				
				if var75 and t_2[var75] == var74 then
					t_2[var75] = nil
				end
			end
		end)
		
		return var73
	end
	
	local function sessionDelete(p24)
		-- upvalues: acpProtocolModule (copy), rpcCall (ref), p4 (ref), var20 (write), onTerminalModule (copy), t_1 (ref), t_3 (ref), t_2 (ref)
		local var77
		assert(typeof(p24) == "string" and p24 ~= "", "sessionId is required")
		local sessionDelete = acpProtocolModule.Methods.SessionDelete
		local t = { sessionId = p24 }
		
		if p4.generateRequestId then
			var77 = p4.generateRequestId()
		else
			var20 += 1
			var77 = var20
		end
		local var78 = rpcCall(var77, sessionDelete, t)
		onTerminalModule(var78.state, function()
			-- upvalues: t_1 (copy), p24 (ref), acpProtocolModule (copy), t_3 (copy), t_2 (copy)
			local var79 = t_1[p24]
			
			if var79 then
				var79.fail("Session deleted before prompt response", acpProtocolModule.ErrorCodes.Gone)
				
				for i, v in t_1 do
					if v == var79 then
						t_1[i] = nil
						t_3[i] = nil
						break
					end
				end
				local requestId = var79.requestId
				local var80 = if requestId == nil then nil else tostring(requestId)
				
				if var80 and t_2[var80] == var79 then
					t_2[var80] = nil
				end
			end
		end)
		
		return var78
	end
	
	local function sessionUpdateInfo(p25, p26)
		-- upvalues: rpcCallSync (ref), acpProtocolModule (copy)
		assert(typeof(p25) == "string" and p25 ~= "", "sessionId is required")
		
		return rpcCallSync(acpProtocolModule.Methods.SessionUpdateInfo, { sessionId = p25, title = p26 })
	end
	
	local function sessionSaveAndPublish(p27)
		-- upvalues: rpcCallSync (ref), acpProtocolModule (copy)
		assert(typeof(p27) == "table", "sessionSaveAndPublish requires params")
		assert(typeof(p27.placeId) == "number" and p27.placeId > 0, "placeId must be a positive number")
		assert(if p27.title ~= nil then typeof(p27.title) == "string" else true, "title must be a string")
		assert(if p27.description ~= nil then typeof(p27.description) == "string" else true, "description must be a string")
		
		return rpcCallSync(acpProtocolModule.Methods.SessionSaveAndPublish, p27)
	end
	
	local _ = function(p28, p29, p30, p31)
		-- upvalues: createTurnHandleModule (copy), acpProtocolModule (copy), rpcCall (ref), p4 (ref), var20 (write), onTerminalModule (copy), t_1 (ref), t_3 (ref), t_2 (ref)
		local var81, var82 = createTurnHandleModule(p28, p29, function()
			-- upvalues: p28 (ref), acpProtocolModule (copy), rpcCall (copy), p4 (copy), var20 (copy), onTerminalModule (copy), t_1 (copy), t_3 (copy), t_2 (copy)
			local var84
			assert(typeof(p28) == "string" and p28 ~= "", "sessionId is required")
			local sessionCancel = acpProtocolModule.Methods.SessionCancel
			local t = { sessionId = p28 }
			
			if p4.generateRequestId then
				var84 = p4.generateRequestId()
			else
				var20 += 1
				var84 = var20
			end
			onTerminalModule(rpcCall(var84, sessionCancel, t).state, function()
				-- upvalues: t_1 (copy), p28 (ref), t_3 (copy), t_2 (copy)
				local var74 = t_1[p28]
				
				if var74 then
					var74.markCancelled()
					
					for i, v in t_1 do
						if v == var74 then
							t_1[i] = nil
							t_3[i] = nil
							break
						end
					end
					local requestId = var74.requestId
					local var75 = if requestId == nil then nil else tostring(requestId)
					
					if var75 and t_2[var75] == var74 then
						t_2[var75] = nil
					end
				end
			end)
		end, p30, p31)
		t_1[p28] = var82
		t_3[p28] = var81
		
		if p29 ~= nil then
			t_2[tostring(p29)] = var82
		end
		return var81
	end
	
	local function sessionPrompt(p32)
		-- upvalues: p4 (ref), var20 (write), createTurnHandleModule (copy), acpProtocolModule (copy), rpcCall (ref), onTerminalModule (copy), t_1 (ref), t_3 (ref), t_2 (ref)
		local var85
		assert(p32 and (typeof(p32.sessionId) == "string" and p32.sessionId ~= ""), "sessionId is required")
		assert(p32.prompt, "prompt is required")
		local sessionId = p32.sessionId
		
		if p4.generateRequestId then
			var85 = p4.generateRequestId()
		else
			var20 += 1
			var85 = var20
		end
		local var86, var87 = createTurnHandleModule(sessionId, var85, function()
			-- upvalues: sessionId (ref), acpProtocolModule (copy), rpcCall (copy), p4 (copy), var20 (copy), onTerminalModule (copy), t_1 (copy), t_3 (copy), t_2 (copy)
			local var84
			assert(typeof(sessionId) == "string" and sessionId ~= "", "sessionId is required")
			local sessionCancel = acpProtocolModule.Methods.SessionCancel
			local t = { sessionId = sessionId }
			
			if p4.generateRequestId then
				var84 = p4.generateRequestId()
			else
				var20 += 1
				var84 = var20
			end
			onTerminalModule(rpcCall(var84, sessionCancel, t).state, function()
				-- upvalues: t_1 (copy), sessionId (ref), t_3 (copy), t_2 (copy)
				local var74 = t_1[sessionId]
				
				if var74 then
					var74.markCancelled()
					
					for i, v in t_1 do
						if v == var74 then
							t_1[i] = nil
							t_3[i] = nil
							break
						end
					end
					local requestId = var74.requestId
					local var75 = if requestId == nil then nil else tostring(requestId)
					
					if var75 and t_2[var75] == var74 then
						t_2[var75] = nil
					end
				end
			end)
		end, nil, nil)
		t_1[sessionId] = var87
		t_3[sessionId] = var86
		
		if var85 ~= nil then
			t_2[tostring(var85)] = var87
		end
		local var88 = t_1[sessionId]
		local t = { sessionId = sessionId }
		local prompt = p32.prompt
		t.prompt = if typeof(prompt) == "string" then { { type = "text", text = prompt } } else prompt
		
		if p32._meta then
			t._meta = p32._meta
		end
		onTerminalModule(rpcCall(var85, acpProtocolModule.Methods.SessionPrompt, t).state, nil, function(p33, p34)
			-- upvalues: var88 (ref), t_1 (copy), t_3 (copy), t_2 (copy)
			task.defer(function()
				-- upvalues: var88 (copy), p33 (ref), p34 (ref), t_1 (copy), t_3 (copy), t_2 (copy)
				if var88.isDone() then return end
				var88.fail(p33, p34)
				
				for i, v in t_1 do
					if v == var88 then
						t_1[i] = nil
						t_3[i] = nil
						break
					end
				end
				local requestId = var88.requestId
				local var90 = if requestId == nil then nil else tostring(requestId)
				
				if var90 and t_2[var90] == var88 then
					t_2[var90] = nil
				end
			end)
		end)
		
		return var86
	end
	
	local function resumeTurnFromHistory(p35, p36, p37)
		-- upvalues: t_3 (ref), createTurnHandleModule (copy), acpProtocolModule (copy), rpcCall (ref), p4 (ref), var20 (write), onTerminalModule (copy), t_1 (ref), t_2 (ref)
		assert(typeof(p35) == "string" and p35 ~= "", "sessionId is required")
		
		if p36.isDone then
			return nil
		end
		local var91 = t_3[p35]
		
		if var91 == nil then
			local var92, var93 = createTurnHandleModule(p35, nil, function()
				-- upvalues: p35 (ref), acpProtocolModule (copy), rpcCall (copy), p4 (copy), var20 (copy), onTerminalModule (copy), t_1 (copy), t_3 (copy), t_2 (copy)
				local var84
				assert(typeof(p35) == "string" and p35 ~= "", "sessionId is required")
				local sessionCancel = acpProtocolModule.Methods.SessionCancel
				local t = { sessionId = p35 }
				
				if p4.generateRequestId then
					var84 = p4.generateRequestId()
				else
					var20 += 1
					var84 = var20
				end
				onTerminalModule(rpcCall(var84, sessionCancel, t).state, function()
					-- upvalues: t_1 (copy), p35 (ref), t_3 (copy), t_2 (copy)
					local var74 = t_1[p35]
					
					if var74 then
						var74.markCancelled()
						
						for i, v in t_1 do
							if v == var74 then
								t_1[i] = nil
								t_3[i] = nil
								break
							end
						end
						local requestId = var74.requestId
						local var75 = if requestId == nil then nil else tostring(requestId)
						
						if var75 and t_2[var75] == var74 then
							t_2[var75] = nil
						end
					end
				end)
			end, p36, p37)
			t_1[p35] = var93
			t_3[p35] = var92
			
			return var92
		end
		return var91
	end
	
	local function getActiveTurnHandle(p38)
		-- upvalues: t_3 (ref)
		return t_3[p38]
	end
	
	local function ingestSessionHistory(p39, p40, p41)
		-- upvalues: historyIngestModule (copy), t_1 (ref), unregisterHandle (ref)
		return historyIngestModule.ingestSessionHistory({
			getActiveTurnInternals = function(p42)
				-- upvalues: t_1 (copy)
				return t_1[p42]
			end,
			onTurnDone = unregisterHandle
		}, p39, p40, p41)
	end
	
	local var54 = sessionRegistryModule.createSessionRegistry({
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
		ingestFrame = function(p43, p44)
			-- upvalues: ingestFrameHandlerModule (copy), logger (ref), var54 (ref), t_1 (ref), t_2 (ref), unregisterHandle (ref)
			ingestFrameHandlerModule.ingestFrame({
				logger = logger,
				getSessionByCasSessionId = var54.getSessionByCasSessionId,
				getSessionForProject = var54.getSessionForProject,
				getActiveTurnBySession = function(p45)
					-- upvalues: t_1 (copy)
					return t_1[p45]
				end,
				getActiveTurnByRequestId = function(p46)
					-- upvalues: t_2 (copy)
					return t_2[p46]
				end,
				onTurnDone = unregisterHandle
			}, p43, p44)
		end,
		resumeTurnFromHistory = resumeTurnFromHistory,
		getActiveTurnHandle = getActiveTurnHandle,
		getSessionForProject = var54.getSessionForProject
	}
end