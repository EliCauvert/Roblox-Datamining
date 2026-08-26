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

local _ = function(p3)
	return if typeof(p3) == "string" then { { type = "text", text = p3 } } else p3
end

local t = {
	debug = function() end,
	info = function() end,
	warning = function() end,
	error = function() end
}

return function(p3)
	-- upvalues: withCsrfRetryModule (ref), httpClientModule (ref), acpProtocolModule (ref), t (ref), rpcDecoderModule (ref), signalsModule (ref), onTerminalModule (ref), appendSessionListEntries (ref), createTurnHandleModule (ref), historyIngestModule (ref), sessionRegistryModule (ref), constantsModule (ref), ingestFrameHandlerModule (ref)
	p3 = p3 or {}
	local network = p3.network or withCsrfRetryModule(httpClientModule.createRequestInternalNetwork())
	local baseUrl = p3.baseUrl or acpProtocolModule.acpUrl()
	local logger = p3.logger or t
	
	local function _()
		-- upvalues: p3 (ref)
		return if p3.getAuthHeaders then p3.getAuthHeaders() else {}
	end
	
	local var1 = 0
	
	local _ = function()
		-- upvalues: p3 (ref), var1 (write)
		if p3.generateRequestId then
			return p3.generateRequestId()
		end
		var1 += 1
		
		return var1
	end
	
	local t_1 = {}
	local t_2 = {}
	local t_3 = {}
	
	local _ = function(p4)
		return if p4 == nil then nil else tostring(p4)
	end
	
	local function unregisterHandle(p4)
		-- upvalues: t_1 (ref), t_3 (ref), t_2 (ref)
		for i, v in t_1 do
			if v == p4 then
				t_1[i] = nil
				t_3[i] = nil
				break
			end
		end
		local requestId = p4.requestId
		local var2 = if requestId == nil then nil else tostring(requestId)
		
		if var2 and t_2[var2] == p4 then
			t_2[var2] = nil
		end
	end
	
	local function rpcCall(p5, p6, p7, p8)
		-- upvalues: logger (ref), httpClientModule (copy), network (ref), baseUrl (ref), p3 (ref), rpcDecoderModule (copy)
		logger:debug(`[CAS] -> {p6} id={tostring(p5)}`)
		
		return httpClientModule.createRequest({
			method = "POST",
			networkImpl = network,
			url = baseUrl,
			headers = if p3.getAuthHeaders then p3.getAuthHeaders() else {},
			body = { jsonrpc = "2.0", id = p5, method = p6, params = p7 or {} },
			analyticsKey = "cas." .. p8:gsub("/", "-"):lower(),
			decode = rpcDecoderModule(p8)
		})
	end
	
	local function rpcCallSync(p5, p6, p7)
		-- upvalues: rpcCall (ref), p3 (ref), var1 (write)
		local var3
		if p3.generateRequestId then
			var3 = p3.generateRequestId()
		else
			var1 += 1
			var3 = var1
		end
		return rpcCall(var3, p5, p6, p7)
	end
	
	local function submitToolResult(p5)
		-- upvalues: p3 (ref), var1 (write), acpProtocolModule (copy), httpClientModule (copy), network (ref), baseUrl (ref), rpcDecoderModule (copy)
		local var3
		assert(typeof(p5.sessionId) == "string" and p5.sessionId ~= "", "sessionId is required")
		assert(typeof(p5.content) == "table" and typeof(p5.content.text) == "string", "content.text is required")
		
		if p5.turnId ~= nil then
			assert(typeof(p5.turnId) == "number" and p5.turnId > 0, "turnId must be a positive number")
		end
		if p5.referenceId ~= nil then
			assert(typeof(p5.referenceId) == "string" and p5.referenceId ~= "", "referenceId must be a string")
		end
		if p3.generateRequestId then
			var3 = p3.generateRequestId()
		else
			var1 += 1
			var3 = var1
		end
		local t = {
			sessionId = p5.sessionId,
			tool_name = acpProtocolModule.AskTool.Name,
			content = p5.content,
			isError = if p5.isError ~= nil then false else p5.isError
		}
		
		if p5.turnId ~= nil then
			t.turnId = p5.turnId
		end
		if p5.referenceId ~= nil then
			t.referenceId = p5.referenceId
		end
		return httpClientModule.createRequest({
			method = "POST",
			analyticsKey = "cas.ask-tool-result",
			networkImpl = network,
			url = baseUrl,
			headers = if p3.getAuthHeaders then p3.getAuthHeaders() else {},
			body = { jsonrpc = "2.0", id = var3, result = t },
			decode = rpcDecoderModule()
		})
	end
	
	local function initialize(p5)
		-- upvalues: rpcCallSync (ref), acpProtocolModule (copy)
		return rpcCallSync(acpProtocolModule.Methods.Initialize, p5 or { protocolVersion = acpProtocolModule.ProtocolVersion })
	end
	
	local function sessionNew(p5)
		-- upvalues: rpcCallSync (ref), acpProtocolModule (copy)
		assert(p5 ~= nil, "sessionNew requires params")
		assert(typeof(p5.project) == "table", "sessionNew requires params.project")
		assert(typeof(p5.project.universeId) == "number", "sessionNew requires params.project.universeId")
		assert(typeof(p5.project.placeId) == "number", "sessionNew requires params.project.placeId")
		
		return rpcCallSync(acpProtocolModule.Methods.SessionNew, acpProtocolModule.buildSessionNewWireParams({
			cwd = p5.cwd or "/",
			mcpServers = p5.mcpServers,
			project = p5.project,
			experiment = p5.experiment,
			application = p5.application
		}))
	end
	
	local function sessionList(p5)
		-- upvalues: rpcCallSync (ref), acpProtocolModule (copy)
		return rpcCallSync(acpProtocolModule.Methods.SessionList, p5 or {})
	end
	
	local var3, var4 = signalsModule.createSignal({})
	local var5, var6 = signalsModule.createSignal(nil)
	local pending, pending_1 = signalsModule.createSignal("pending")
	local var7, var8 = signalsModule.createSignal(nil)
	local var9 = nil
	local var10 = nil
	local var11 = 0
	local t_4 = {
		getSessions = var3,
		getNextPageToken = var5,
		getStatus = pending,
		getLoadMoreStatus = var7,
		refresh = function()
			-- upvalues: var9 (write), var11 (write), var10 (write), pending_1 (ref), var8 (ref), acpProtocolModule (copy), rpcCall (ref), p3 (ref), var1 (write), onTerminalModule (copy), var4 (ref), var6 (ref)
			if var9 ~= nil then
				if var9.state(false).status == "pending" then
					return var9
				end
				var9 = nil
			end
			local var12
			var11 += 1
			local var13 = var11
			var10 = nil
			pending_1("pending")
			var8(nil)
			local sessionList = acpProtocolModule.Methods.SessionList
			local t = {}
			
			if p3.generateRequestId then
				var12 = p3.generateRequestId()
			else
				var1 += 1
				var12 = var1
			end
			local var14 = rpcCall(var12, sessionList, t, nil)
			var9 = var14
			onTerminalModule(var14.state, function(p5)
				-- upvalues: var13 (ref), var11 (copy), var9 (copy), var4 (copy), var6 (copy), pending_1 (copy)
				if var13 ~= var11 then return end
				var9 = nil
				local sessions = p5.sessions or {}
				local nextPageToken = p5.nextPageToken
				local var15 = if typeof(nextPageToken) == "string" and nextPageToken ~= "" then nextPageToken else nil
				var4(sessions)
				var6(var15)
				pending_1("succeeded")
			end, function(_)
				-- upvalues: var13 (ref), var11 (copy), var9 (copy), pending_1 (copy)
				if var13 == var11 then
					var9 = nil
					pending_1("failed")
					
					return
				end
			end)
			
			return var14
		end,
		loadMore = function()
			-- upvalues: var5 (ref), var9 (write), var10 (write), pending (ref), var11 (write), var8 (ref), acpProtocolModule (copy), rpcCall (ref), p3 (ref), var1 (write), onTerminalModule (copy), appendSessionListEntries (copy), var3 (ref), var4 (ref), var6 (ref)
			local var12 = var5(false)
			
			if var12 == nil then
				return nil
			elseif var9 ~= nil then
				return nil
			elseif var10 ~= nil then
				return nil
			elseif pending(false) ~= "succeeded" then
				return nil
			end
			local var13
			var8("pending")
			local sessionList = acpProtocolModule.Methods.SessionList
			local var14 = { pageToken = var12 } or {}
			
			if p3.generateRequestId then
				var13 = p3.generateRequestId()
			else
				var1 += 1
				var13 = var1
			end
			local var15 = rpcCall(var13, sessionList, var14, nil)
			var10 = var15
			onTerminalModule(var15.state, function(p5)
				-- upvalues: var11 (ref), var11 (copy), var10 (copy), appendSessionListEntries (copy), var3 (copy), var4 (copy), var6 (copy), var8 (copy)
				if var11 ~= var11 then return end
				var10 = nil
				local sessions = p5.sessions or {}
				local nextPageToken = p5.nextPageToken
				local var16 = if typeof(nextPageToken) == "string" and nextPageToken ~= "" then nextPageToken else nil
				var4(appendSessionListEntries(var3(false), sessions))
				var6(var16)
				var8("succeeded")
			end, function(_)
				-- upvalues: var11 (ref), var11 (copy), var10 (copy), var8 (copy)
				if var11 == var11 then
					var10 = nil
					var8("failed")
					
					return
				end
			end)
			
			return var15
		end
	}
	
	local function sessionFindByUniverse(p5)
		-- upvalues: rpcCallSync (ref), acpProtocolModule (copy)
		assert(typeof(p5) == "table", "sessionFindByUniverse requires params")
		assert(typeof(p5.universeId) == "number" and p5.universeId ~= 0, "universeId is required")
		
		return rpcCallSync(acpProtocolModule.Methods.SessionFindByUniverse, p5)
	end
	
	local function sessionLoad(p5, p6)
		-- upvalues: rpcCallSync (ref), acpProtocolModule (copy)
		assert(typeof(p5) == "string" and p5 ~= "", "sessionId is required")
		
		return rpcCallSync(acpProtocolModule.Methods.SessionLoad, {
			sessionId = p5,
			cwd = if p6 then p6.cwd else "/",
			mcpServers = p6 and p6.mcpServers,
			historyPageToken = p6 and p6.historyPageToken
		})
	end
	
	local function sessionReadTasks(p5)
		-- upvalues: rpcCallSync (ref), acpProtocolModule (copy)
		assert(typeof(p5) == "string" and p5 ~= "", "sessionId is required")
		
		return rpcCallSync(acpProtocolModule.Methods.SessionReadTasks, { sessionId = p5 })
	end
	
	local _ = function(p5)
		-- upvalues: rpcCallSync (ref), acpProtocolModule (copy)
		return rpcCallSync(acpProtocolModule.Methods.SessionCancel, { sessionId = p5 })
	end
	
	local function sessionCancel(p5)
		-- upvalues: acpProtocolModule (copy), rpcCall (ref), p3 (ref), var1 (write), onTerminalModule (copy), t_1 (ref), t_3 (ref), t_2 (ref)
		local var12
		assert(typeof(p5) == "string" and p5 ~= "", "sessionId is required")
		local sessionCancel = acpProtocolModule.Methods.SessionCancel
		local t = { sessionId = p5 }
		
		if p3.generateRequestId then
			var12 = p3.generateRequestId()
		else
			var1 += 1
			var12 = var1
		end
		local var13 = rpcCall(var12, sessionCancel, t, nil)
		onTerminalModule(var13.state, function()
			-- upvalues: t_1 (copy), p5 (ref), t_3 (copy), t_2 (copy)
			local var14 = t_1[p5]
			
			if var14 then
				var14.markCancelled()
				
				for i, v in t_1 do
					if v == var14 then
						t_1[i] = nil
						t_3[i] = nil
						break
					end
				end
				local requestId = var14.requestId
				local var15 = if requestId == nil then nil else tostring(requestId)
				
				if var15 and t_2[var15] == var14 then
					t_2[var15] = nil
				end
			end
		end)
		
		return var13
	end
	
	local function sessionDelete(p6)
		-- upvalues: acpProtocolModule (copy), rpcCall (ref), p3 (ref), var1 (write), onTerminalModule (copy), t_1 (ref), t_3 (ref), t_2 (ref)
		local var14
		assert(typeof(p6) == "string" and p6 ~= "", "sessionId is required")
		local sessionDelete = acpProtocolModule.Methods.SessionDelete
		local t = { sessionId = p6 }
		
		if p3.generateRequestId then
			var14 = p3.generateRequestId()
		else
			var1 += 1
			var14 = var1
		end
		local var15 = rpcCall(var14, sessionDelete, t, nil)
		onTerminalModule(var15.state, function()
			-- upvalues: t_1 (copy), p6 (ref), acpProtocolModule (copy), t_3 (copy), t_2 (copy)
			local var16 = t_1[p6]
			
			if var16 then
				var16.fail("Session deleted before prompt response", acpProtocolModule.ErrorCodes.Gone)
				
				for i, v in t_1 do
					if v == var16 then
						t_1[i] = nil
						t_3[i] = nil
						break
					end
				end
				local requestId = var16.requestId
				local var17 = if requestId == nil then nil else tostring(requestId)
				
				if var17 and t_2[var17] == var16 then
					t_2[var17] = nil
				end
			end
		end)
		
		return var15
	end
	
	local function sessionUpdateInfo(p7, p8)
		-- upvalues: rpcCallSync (ref), acpProtocolModule (copy)
		assert(typeof(p7) == "string" and p7 ~= "", "sessionId is required")
		
		return rpcCallSync(acpProtocolModule.Methods.SessionUpdateInfo, { sessionId = p7, title = p8 })
	end
	
	local function sessionSaveAndPublish(p7)
		-- upvalues: rpcCallSync (ref), acpProtocolModule (copy)
		assert(typeof(p7) == "table", "sessionSaveAndPublish requires params")
		assert(typeof(p7.placeId) == "number" and p7.placeId > 0, "placeId must be a positive number")
		assert(if p7.title ~= nil then typeof(p7.title) == "string" else true, "title must be a string")
		assert(if p7.description ~= nil then typeof(p7.description) == "string" else true, "description must be a string")
		
		return rpcCallSync(acpProtocolModule.Methods.SessionSaveAndPublish, p7)
	end
	
	local function adCampaignEligibility(p7)
		-- upvalues: rpcCallSync (ref), acpProtocolModule (copy)
		assert(typeof(p7) == "table", "adCampaignEligibility requires params")
		assert(typeof(p7.universeId) == "number" and p7.universeId > 0, "universeId must be a positive number")
		
		return rpcCallSync(acpProtocolModule.Methods.AdCampaignEligibility, p7, require(script.Parent.decodeAdCampaignEligibilityResult))
	end
	
	local _ = function(p7, p8, p9, p10)
		-- upvalues: createTurnHandleModule (copy), acpProtocolModule (copy), rpcCall (ref), p3 (ref), var1 (write), onTerminalModule (copy), t_1 (ref), t_3 (ref), t_2 (ref)
		local var16, var17 = createTurnHandleModule(p7, p8, function()
			-- upvalues: p7 (ref), acpProtocolModule (copy), rpcCall (copy), p3 (copy), var1 (copy), onTerminalModule (copy), t_1 (copy), t_3 (copy), t_2 (copy)
			local var18
			assert(typeof(p7) == "string" and p7 ~= "", "sessionId is required")
			local sessionCancel = acpProtocolModule.Methods.SessionCancel
			local t = { sessionId = p7 }
			
			if p3.generateRequestId then
				var18 = p3.generateRequestId()
			else
				var1 += 1
				var18 = var1
			end
			onTerminalModule(rpcCall(var18, sessionCancel, t, nil).state, function()
				-- upvalues: t_1 (copy), p7 (ref), t_3 (copy), t_2 (copy)
				local var19 = t_1[p7]
				
				if var19 then
					var19.markCancelled()
					
					for i, v in t_1 do
						if v == var19 then
							t_1[i] = nil
							t_3[i] = nil
							break
						end
					end
					local requestId = var19.requestId
					local var20 = if requestId == nil then nil else tostring(requestId)
					
					if var20 and t_2[var20] == var19 then
						t_2[var20] = nil
					end
				end
			end)
		end, p9, p10)
		t_1[p7] = var17
		t_3[p7] = var16
		
		if p8 ~= nil then
			t_2[tostring(p8)] = var17
		end
		return var16
	end
	
	local function sessionPrompt(p11)
		-- upvalues: p3 (ref), var1 (write), createTurnHandleModule (copy), acpProtocolModule (copy), rpcCall (ref), onTerminalModule (copy), t_1 (ref), t_3 (ref), t_2 (ref)
		local var18
		assert(p11 and (typeof(p11.sessionId) == "string" and p11.sessionId ~= ""), "sessionId is required")
		assert(p11.prompt, "prompt is required")
		local sessionId = p11.sessionId
		
		if p3.generateRequestId then
			var18 = p3.generateRequestId()
		else
			var1 += 1
			var18 = var1
		end
		local var19, var20 = createTurnHandleModule(sessionId, var18, function()
			-- upvalues: sessionId (ref), acpProtocolModule (copy), rpcCall (copy), p3 (copy), var1 (copy), onTerminalModule (copy), t_1 (copy), t_3 (copy), t_2 (copy)
			local var21
			assert(typeof(sessionId) == "string" and sessionId ~= "", "sessionId is required")
			local sessionCancel = acpProtocolModule.Methods.SessionCancel
			local t = { sessionId = sessionId }
			
			if p3.generateRequestId then
				var21 = p3.generateRequestId()
			else
				var1 += 1
				var21 = var1
			end
			onTerminalModule(rpcCall(var21, sessionCancel, t, nil).state, function()
				-- upvalues: t_1 (copy), sessionId (ref), t_3 (copy), t_2 (copy)
				local var22 = t_1[sessionId]
				
				if var22 then
					var22.markCancelled()
					
					for i, v in t_1 do
						if v == var22 then
							t_1[i] = nil
							t_3[i] = nil
							break
						end
					end
					local requestId = var22.requestId
					local var23 = if requestId == nil then nil else tostring(requestId)
					
					if var23 and t_2[var23] == var22 then
						t_2[var23] = nil
					end
				end
			end)
		end, nil, nil)
		t_1[sessionId] = var20
		t_3[sessionId] = var19
		
		if var18 ~= nil then
			t_2[tostring(var18)] = var20
		end
		local var22 = t_1[sessionId]
		local t = { sessionId = sessionId }
		local prompt = p11.prompt
		t.prompt = if typeof(prompt) == "string" then { { type = "text", text = prompt } } else prompt
		
		if p11._meta then
			t._meta = p11._meta
		end
		onTerminalModule(rpcCall(var18, acpProtocolModule.Methods.SessionPrompt, t).state, nil, function(p12, p13)
			-- upvalues: var22 (ref), t_1 (copy), t_3 (copy), t_2 (copy)
			task.defer(function()
				-- upvalues: var22 (copy), p12 (ref), p13 (ref), t_1 (copy), t_3 (copy), t_2 (copy)
				if var22.isDone() then return end
				var22.fail(p12, p13)
				
				for i, v in t_1 do
					if v == var22 then
						t_1[i] = nil
						t_3[i] = nil
						break
					end
				end
				local requestId = var22.requestId
				local var23 = if requestId == nil then nil else tostring(requestId)
				
				if var23 and t_2[var23] == var22 then
					t_2[var23] = nil
				end
			end)
		end)
		
		return var19
	end
	
	local function resumeTurnFromHistory(p12, p13, p14)
		-- upvalues: t_3 (ref), createTurnHandleModule (copy), acpProtocolModule (copy), rpcCall (ref), p3 (ref), var1 (write), onTerminalModule (copy), t_1 (ref), t_2 (ref)
		assert(typeof(p12) == "string" and p12 ~= "", "sessionId is required")
		
		if p13.isDone then
			return nil
		end
		local var23 = t_3[p12]
		
		if var23 == nil then
			local var24, var25 = createTurnHandleModule(p12, nil, function()
				-- upvalues: p12 (ref), acpProtocolModule (copy), rpcCall (copy), p3 (copy), var1 (copy), onTerminalModule (copy), t_1 (copy), t_3 (copy), t_2 (copy)
				local var26
				assert(typeof(p12) == "string" and p12 ~= "", "sessionId is required")
				local sessionCancel = acpProtocolModule.Methods.SessionCancel
				local t = { sessionId = p12 }
				
				if p3.generateRequestId then
					var26 = p3.generateRequestId()
				else
					var1 += 1
					var26 = var1
				end
				onTerminalModule(rpcCall(var26, sessionCancel, t, nil).state, function()
					-- upvalues: t_1 (copy), p12 (ref), t_3 (copy), t_2 (copy)
					local var27 = t_1[p12]
					
					if var27 then
						var27.markCancelled()
						
						for i, v in t_1 do
							if v == var27 then
								t_1[i] = nil
								t_3[i] = nil
								break
							end
						end
						local requestId = var27.requestId
						local var28 = if requestId == nil then nil else tostring(requestId)
						
						if var28 and t_2[var28] == var27 then
							t_2[var28] = nil
						end
					end
				end)
			end, p13, p14)
			t_1[p12] = var25
			t_3[p12] = var24
			
			return var24
		end
		return var23
	end
	
	local function getActiveTurnHandle(p15)
		-- upvalues: t_3 (ref)
		return t_3[p15]
	end
	
	local function ingestSessionHistory(p15, p16, p17)
		-- upvalues: historyIngestModule (copy), t_1 (ref), unregisterHandle (ref)
		return historyIngestModule.ingestSessionHistory({
			getActiveTurnInternals = function(p18)
				-- upvalues: t_1 (copy)
				return t_1[p18]
			end,
			onTurnDone = unregisterHandle
		}, p15, p16, p17)
	end
	
	local var26 = sessionRegistryModule.createSessionRegistry({
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
		adCampaignEligibility = adCampaignEligibility,
		ingestSessionHistory = ingestSessionHistory,
		ingestFrame = function(p15, p16)
			-- upvalues: ingestFrameHandlerModule (copy), logger (ref), var26 (ref), t_1 (ref), t_2 (ref), unregisterHandle (ref)
			ingestFrameHandlerModule.ingestFrame({
				logger = logger,
				getSessionByCasSessionId = var26.getSessionByCasSessionId,
				getSessionForProject = var26.getSessionForProject,
				getActiveTurnBySession = function(p17)
					-- upvalues: t_1 (copy)
					return t_1[p17]
				end,
				getActiveTurnByRequestId = function(p17)
					-- upvalues: t_2 (copy)
					return t_2[p17]
				end,
				onTurnDone = unregisterHandle
			}, p15, p16)
		end,
		resumeTurnFromHistory = resumeTurnFromHistory,
		getActiveTurnHandle = getActiveTurnHandle,
		getSessionForProject = var26.getSessionForProject
	}
end