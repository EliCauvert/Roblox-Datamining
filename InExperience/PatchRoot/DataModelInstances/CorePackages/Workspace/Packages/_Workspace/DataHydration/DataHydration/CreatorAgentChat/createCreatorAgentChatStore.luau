local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local httpClientModule = require(parent.HttpClient)
local signalsModule = require(parent.Signals)
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagBuildAgentAdCampaignCardModule = require(script.Parent.FFlagBuildAgentAdCampaignCard)
local fFlagBuildAgentAdCampaignToolCallStatusFallback = require(parent.SharedFlags).FFlagBuildAgentAdCampaignToolCallStatusFallback
local var1 = if fFlagBuildAgentAdCampaignToolCallStatusFallback then require(script.Parent.decodeAdCampaignToolCallStatusResult) else nil
local acpProtocolModule = require(script.Parent.Acp.AcpProtocol)
local classifyRequestFailureModule = require(script.Parent.classifyRequestFailure)
local historyIngestModule = require(script.Parent.CasStore.historyIngest)
local ingestFrameHandlerModule = require(script.Parent.CasStore.ingestFrameHandler)
local sessionRegistryModule = require(script.Parent.CasStore.sessionRegistry)
local constantsModule = require(script.Parent.ChatSession.constants)
local createTurnHandleModule = require(script.Parent.createTurnHandle)
local experimentOverrideModule = require(script.Parent.experimentOverride)
local onTerminalModule = require(script.Parent.onTerminal)
local rpcDecoderModule = require(script.Parent.rpcDecoder)
local _ = require(script.Parent.types)
local withCsrfRetryModule = require(dataHydration.withCsrfRetry)
local fFlagBuildExperiencePromptFailureTelemetry = sharedFlagsModule.FFlagBuildExperiencePromptFailureTelemetry

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
	-- upvalues: withCsrfRetryModule (ref), httpClientModule (ref), acpProtocolModule (ref), t (ref), rpcDecoderModule (ref), signalsModule (ref), onTerminalModule (ref), appendSessionListEntries (ref), fFlagBuildAgentAdCampaignCardModule (ref), var1 (ref), createTurnHandleModule (ref), experimentOverrideModule (ref), fFlagBuildExperiencePromptFailureTelemetry (ref), classifyRequestFailureModule (ref), historyIngestModule (ref), sessionRegistryModule (ref), constantsModule (ref), ingestFrameHandlerModule (ref), fFlagBuildAgentAdCampaignToolCallStatusFallback (ref)
	p3 = p3 or {}
	local network = p3.network or withCsrfRetryModule(httpClientModule.createRequestInternalNetwork())
	local baseUrl = p3.baseUrl or acpProtocolModule.acpUrl()
	local logger = p3.logger or t
	
	local function _()
		-- upvalues: p3 (ref)
		return if p3.getAuthHeaders then p3.getAuthHeaders() else {}
	end
	
	local var2 = 0
	
	local _ = function()
		-- upvalues: p3 (ref), var2 (write)
		if p3.generateRequestId then
			return p3.generateRequestId()
		end
		var2 += 1
		
		return var2
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
		local var3 = if requestId == nil then nil else tostring(requestId)
		
		if var3 and t_2[var3] == p4 then
			t_2[var3] = nil
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
		-- upvalues: rpcCall (ref), p3 (ref), var2 (write)
		local var4
		if p3.generateRequestId then
			var4 = p3.generateRequestId()
		else
			var2 += 1
			var4 = var2
		end
		return rpcCall(var4, p5, p6, p7)
	end
	
	local function submitToolResult(p5)
		-- upvalues: p3 (ref), var2 (write), acpProtocolModule (copy), httpClientModule (copy), network (ref), baseUrl (ref), rpcDecoderModule (copy)
		local var4
		assert(typeof(p5.sessionId) == "string" and p5.sessionId ~= "", "sessionId is required")
		assert(typeof(p5.content) == "table" and typeof(p5.content.text) == "string", "content.text is required")
		
		if p5.turnId ~= nil then
			assert(typeof(p5.turnId) == "number" and p5.turnId > 0, "turnId must be a positive number")
		end
		if p5.referenceId ~= nil then
			assert(typeof(p5.referenceId) == "string" and p5.referenceId ~= "", "referenceId must be a string")
		end
		if p3.generateRequestId then
			var4 = p3.generateRequestId()
		else
			var2 += 1
			var4 = var2
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
			body = { jsonrpc = "2.0", id = var4, result = t },
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
	
	local var4, var5 = signalsModule.createSignal({})
	local var6, var7 = signalsModule.createSignal(nil)
	local pending, pending_1 = signalsModule.createSignal("pending")
	local var8, var9 = signalsModule.createSignal(nil)
	local var10 = nil
	local var11 = nil
	local var12 = 0
	local t_4 = {
		getSessions = var4,
		getNextPageToken = var6,
		getStatus = pending,
		getLoadMoreStatus = var8,
		refresh = function()
			-- upvalues: var10 (write), var12 (write), var11 (write), pending_1 (ref), var9 (ref), acpProtocolModule (copy), rpcCall (ref), p3 (ref), var2 (write), onTerminalModule (copy), var5 (ref), var7 (ref)
			if var10 ~= nil then
				if var10.state(false).status == "pending" then
					return var10
				end
				var10 = nil
			end
			local var13
			var12 += 1
			local var14 = var12
			var11 = nil
			pending_1("pending")
			var9(nil)
			local sessionList = acpProtocolModule.Methods.SessionList
			local t = {}
			
			if p3.generateRequestId then
				var13 = p3.generateRequestId()
			else
				var2 += 1
				var13 = var2
			end
			local var15 = rpcCall(var13, sessionList, t, nil)
			var10 = var15
			onTerminalModule(var15.state, function(p5)
				-- upvalues: var14 (ref), var12 (copy), var10 (copy), var5 (copy), var7 (copy), pending_1 (copy)
				if var14 ~= var12 then return end
				var10 = nil
				local sessions = p5.sessions or {}
				local nextPageToken = p5.nextPageToken
				local var16 = if typeof(nextPageToken) == "string" and nextPageToken ~= "" then nextPageToken else nil
				var5(sessions)
				var7(var16)
				pending_1("succeeded")
			end, function(_)
				-- upvalues: var14 (ref), var12 (copy), var10 (copy), pending_1 (copy)
				if var14 == var12 then
					var10 = nil
					pending_1("failed")
					
					return
				end
			end)
			
			return var15
		end,
		loadMore = function()
			-- upvalues: var6 (ref), var10 (write), var11 (write), pending (ref), var12 (write), var9 (ref), acpProtocolModule (copy), rpcCall (ref), p3 (ref), var2 (write), onTerminalModule (copy), appendSessionListEntries (copy), var4 (ref), var5 (ref), var7 (ref)
			local var13 = var6(false)
			
			if var13 == nil then
				return nil
			elseif var10 ~= nil then
				return nil
			elseif var11 ~= nil then
				return nil
			elseif pending(false) ~= "succeeded" then
				return nil
			end
			local var14
			var9("pending")
			local sessionList = acpProtocolModule.Methods.SessionList
			local var15 = { pageToken = var13 } or {}
			
			if p3.generateRequestId then
				var14 = p3.generateRequestId()
			else
				var2 += 1
				var14 = var2
			end
			local var16 = rpcCall(var14, sessionList, var15, nil)
			var11 = var16
			onTerminalModule(var16.state, function(p5)
				-- upvalues: var12 (ref), var12 (copy), var11 (copy), appendSessionListEntries (copy), var4 (copy), var5 (copy), var7 (copy), var9 (copy)
				if var12 ~= var12 then return end
				var11 = nil
				local sessions = p5.sessions or {}
				local nextPageToken = p5.nextPageToken
				local var17 = if typeof(nextPageToken) == "string" and nextPageToken ~= "" then nextPageToken else nil
				var5(appendSessionListEntries(var4(false), sessions))
				var7(var17)
				var9("succeeded")
			end, function(_)
				-- upvalues: var12 (ref), var12 (copy), var11 (copy), var9 (copy)
				if var12 == var12 then
					var11 = nil
					var9("failed")
					
					return
				end
			end)
			
			return var16
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
		-- upvalues: acpProtocolModule (copy), rpcCall (ref), p3 (ref), var2 (write), onTerminalModule (copy), t_1 (ref), t_3 (ref), t_2 (ref)
		local var13
		assert(typeof(p5) == "string" and p5 ~= "", "sessionId is required")
		local sessionCancel = acpProtocolModule.Methods.SessionCancel
		local t = { sessionId = p5 }
		
		if p3.generateRequestId then
			var13 = p3.generateRequestId()
		else
			var2 += 1
			var13 = var2
		end
		local var14 = rpcCall(var13, sessionCancel, t, nil)
		onTerminalModule(var14.state, function()
			-- upvalues: t_1 (copy), p5 (ref), t_3 (copy), t_2 (copy)
			local var15 = t_1[p5]
			
			if var15 then
				var15.markCancelled()
				
				for i, v in t_1 do
					if v == var15 then
						t_1[i] = nil
						t_3[i] = nil
						break
					end
				end
				local requestId = var15.requestId
				local var16 = if requestId == nil then nil else tostring(requestId)
				
				if var16 and t_2[var16] == var15 then
					t_2[var16] = nil
				end
			end
		end)
		
		return var14
	end
	
	local function sessionDelete(p6)
		-- upvalues: acpProtocolModule (copy), rpcCall (ref), p3 (ref), var2 (write), onTerminalModule (copy), t_1 (ref), t_3 (ref), t_2 (ref)
		local var15
		assert(typeof(p6) == "string" and p6 ~= "", "sessionId is required")
		local sessionDelete = acpProtocolModule.Methods.SessionDelete
		local t = { sessionId = p6 }
		
		if p3.generateRequestId then
			var15 = p3.generateRequestId()
		else
			var2 += 1
			var15 = var2
		end
		local var16 = rpcCall(var15, sessionDelete, t, nil)
		onTerminalModule(var16.state, function()
			-- upvalues: t_1 (copy), p6 (ref), acpProtocolModule (copy), t_3 (copy), t_2 (copy)
			local var17 = t_1[p6]
			
			if var17 then
				var17.fail("Session deleted before prompt response", acpProtocolModule.ErrorCodes.Gone)
				
				for i, v in t_1 do
					if v == var17 then
						t_1[i] = nil
						t_3[i] = nil
						break
					end
				end
				local requestId = var17.requestId
				local var18 = if requestId == nil then nil else tostring(requestId)
				
				if var18 and t_2[var18] == var17 then
					t_2[var18] = nil
				end
			end
		end)
		
		return var16
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
	
	local function adCampaignCreate(p7)
		-- upvalues: fFlagBuildAgentAdCampaignCardModule (copy), rpcCallSync (ref), acpProtocolModule (copy)
		assert(typeof(p7) == "table", "adCampaignCreate requires params")
		assert(typeof(p7.universeId) == "number" and p7.universeId > 0, "universeId must be a positive number")
		assert(typeof(p7.idempotencyKey) == "string" and p7.idempotencyKey ~= "", "idempotencyKey is required")
		local decodeAdCampaignCreateResultModule = require(script.Parent.decodeAdCampaignCreateResult)
		
		if fFlagBuildAgentAdCampaignCardModule and p7.toolCallId ~= nil then
			assert(typeof(p7.toolCallId) == "string" and p7.toolCallId ~= "", "toolCallId is required")
			
			return rpcCallSync(acpProtocolModule.Methods.AdCampaignCreate, p7, function(p8)
				-- upvalues: decodeAdCampaignCreateResultModule (ref), p7 (ref)
				local var17, var18 = decodeAdCampaignCreateResultModule(p8)
				
				if var17 == nil or var17.toolCallId == nil or var17.toolCallId == p7.toolCallId then
					return var17, var18
				end
				return nil, "Ad campaign create response does not match the requested tool call"
			end)
		end
		return rpcCallSync(acpProtocolModule.Methods.AdCampaignCreate, p7, decodeAdCampaignCreateResultModule)
	end
	
	local function adCampaignToolCallStatus(p7)
		-- upvalues: rpcCallSync (ref), acpProtocolModule (copy), var1 (copy)
		assert(typeof(p7) == "table", "adCampaignToolCallStatus requires params")
		assert(typeof(p7.toolCallId) == "string" and p7.toolCallId ~= "", "toolCallId is required")
		
		return rpcCallSync(acpProtocolModule.Methods.AdCampaignToolCallStatus, p7, var1)
	end
	
	local function adCampaignCheckFunds(p7)
		-- upvalues: rpcCallSync (ref), acpProtocolModule (copy)
		assert(typeof(p7) == "table", "adCampaignCheckFunds requires params")
		assert(if p7.campaignOption ~= "feedback" then p7.campaignOption == "plays" else true, "campaignOption must be feedback or plays")
		
		return rpcCallSync(acpProtocolModule.Methods.AdCampaignCheckFunds, p7, require(script.Parent.decodeAdCampaignCheckFundsResult))
	end
	
	local _ = function(p7, p8, p9, p10)
		-- upvalues: createTurnHandleModule (copy), acpProtocolModule (copy), rpcCall (ref), p3 (ref), var2 (write), onTerminalModule (copy), t_1 (ref), t_3 (ref), t_2 (ref)
		local var17, var18 = createTurnHandleModule(p7, p8, function()
			-- upvalues: p7 (ref), acpProtocolModule (copy), rpcCall (copy), p3 (copy), var2 (copy), onTerminalModule (copy), t_1 (copy), t_3 (copy), t_2 (copy)
			local var19
			assert(typeof(p7) == "string" and p7 ~= "", "sessionId is required")
			local sessionCancel = acpProtocolModule.Methods.SessionCancel
			local t = { sessionId = p7 }
			
			if p3.generateRequestId then
				var19 = p3.generateRequestId()
			else
				var2 += 1
				var19 = var2
			end
			onTerminalModule(rpcCall(var19, sessionCancel, t, nil).state, function()
				-- upvalues: t_1 (copy), p7 (ref), t_3 (copy), t_2 (copy)
				local var20 = t_1[p7]
				
				if var20 then
					var20.markCancelled()
					
					for i, v in t_1 do
						if v == var20 then
							t_1[i] = nil
							t_3[i] = nil
							break
						end
					end
					local requestId = var20.requestId
					local var21 = if requestId == nil then nil else tostring(requestId)
					
					if var21 and t_2[var21] == var20 then
						t_2[var21] = nil
					end
				end
			end)
		end, p9, p10)
		t_1[p7] = var18
		t_3[p7] = var17
		
		if p8 ~= nil then
			t_2[tostring(p8)] = var18
		end
		return var17
	end
	
	local function sessionPrompt(p11)
		-- upvalues: p3 (ref), var2 (write), createTurnHandleModule (copy), acpProtocolModule (copy), rpcCall (ref), onTerminalModule (copy), t_1 (ref), t_3 (ref), t_2 (ref), experimentOverrideModule (copy), fFlagBuildExperiencePromptFailureTelemetry (copy), classifyRequestFailureModule (copy)
		local var19
		assert(p11 and (typeof(p11.sessionId) == "string" and p11.sessionId ~= ""), "sessionId is required")
		assert(p11.prompt, "prompt is required")
		local sessionId = p11.sessionId
		
		if p3.generateRequestId then
			var19 = p3.generateRequestId()
		else
			var2 += 1
			var19 = var2
		end
		local var20, var21 = createTurnHandleModule(sessionId, var19, function()
			-- upvalues: sessionId (ref), acpProtocolModule (copy), rpcCall (copy), p3 (copy), var2 (copy), onTerminalModule (copy), t_1 (copy), t_3 (copy), t_2 (copy)
			local var22
			assert(typeof(sessionId) == "string" and sessionId ~= "", "sessionId is required")
			local sessionCancel = acpProtocolModule.Methods.SessionCancel
			local t = { sessionId = sessionId }
			
			if p3.generateRequestId then
				var22 = p3.generateRequestId()
			else
				var2 += 1
				var22 = var2
			end
			onTerminalModule(rpcCall(var22, sessionCancel, t, nil).state, function()
				-- upvalues: t_1 (copy), sessionId (ref), t_3 (copy), t_2 (copy)
				local var23 = t_1[sessionId]
				
				if var23 then
					var23.markCancelled()
					
					for i, v in t_1 do
						if v == var23 then
							t_1[i] = nil
							t_3[i] = nil
							break
						end
					end
					local requestId = var23.requestId
					local var24 = if requestId == nil then nil else tostring(requestId)
					
					if var24 and t_2[var24] == var23 then
						t_2[var24] = nil
					end
				end
			end)
		end, nil, nil)
		t_1[sessionId] = var21
		t_3[sessionId] = var20
		
		if var19 ~= nil then
			t_2[tostring(var19)] = var21
		end
		local var23 = t_1[sessionId]
		local buildSessionPromptWireParams = acpProtocolModule.buildSessionPromptWireParams
		local t = { sessionId = sessionId }
		local prompt = p11.prompt
		t.prompt = if typeof(prompt) == "string" then { { type = "text", text = prompt } } else prompt
		t.meta = p11._meta
		t.experiment = if experimentOverrideModule.isEnabled() then p11.experiment else nil
		t = rpcCall(var19, acpProtocolModule.Methods.SessionPrompt, buildSessionPromptWireParams(t))
		onTerminalModule(t.state, nil, function(p12, p13)
			-- upvalues: fFlagBuildExperiencePromptFailureTelemetry (copy), classifyRequestFailureModule (copy), t (ref), var23 (ref), t_1 (copy), t_3 (copy), t_2 (copy)
			local var24 = if fFlagBuildExperiencePromptFailureTelemetry then classifyRequestFailureModule(t.state(false)) else nil
			task.defer(function()
				-- upvalues: var23 (copy), p12 (ref), p13 (ref), var24 (ref), t_1 (copy), t_3 (copy), t_2 (copy)
				if var23.isDone() then return end
				var23.fail(p12, p13, var24)
				
				for i, v in t_1 do
					if v == var23 then
						t_1[i] = nil
						t_3[i] = nil
						break
					end
				end
				local requestId = var23.requestId
				local var25 = if requestId == nil then nil else tostring(requestId)
				
				if var25 and t_2[var25] == var23 then
					t_2[var25] = nil
				end
			end)
		end)
		
		return var20
	end
	
	local function resumeTurnFromHistory(p12, p13, p14)
		-- upvalues: t_3 (ref), createTurnHandleModule (copy), acpProtocolModule (copy), rpcCall (ref), p3 (ref), var2 (write), onTerminalModule (copy), t_1 (ref), t_2 (ref)
		assert(typeof(p12) == "string" and p12 ~= "", "sessionId is required")
		
		if p13.isDone then
			return nil
		end
		local var24 = t_3[p12]
		
		if var24 == nil then
			local var25, var26 = createTurnHandleModule(p12, nil, function()
				-- upvalues: p12 (ref), acpProtocolModule (copy), rpcCall (copy), p3 (copy), var2 (copy), onTerminalModule (copy), t_1 (copy), t_3 (copy), t_2 (copy)
				local var27
				assert(typeof(p12) == "string" and p12 ~= "", "sessionId is required")
				local sessionCancel = acpProtocolModule.Methods.SessionCancel
				local t = { sessionId = p12 }
				
				if p3.generateRequestId then
					var27 = p3.generateRequestId()
				else
					var2 += 1
					var27 = var2
				end
				onTerminalModule(rpcCall(var27, sessionCancel, t, nil).state, function()
					-- upvalues: t_1 (copy), p12 (ref), t_3 (copy), t_2 (copy)
					local var28 = t_1[p12]
					
					if var28 then
						var28.markCancelled()
						
						for i, v in t_1 do
							if v == var28 then
								t_1[i] = nil
								t_3[i] = nil
								break
							end
						end
						local requestId = var28.requestId
						local var29 = if requestId == nil then nil else tostring(requestId)
						
						if var29 and t_2[var29] == var28 then
							t_2[var29] = nil
						end
					end
				end)
			end, p13, p14)
			t_1[p12] = var26
			t_3[p12] = var25
			
			return var25
		end
		return var24
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
	
	local var27 = sessionRegistryModule.createSessionRegistry({
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
		adCampaignCheckFunds = adCampaignCheckFunds,
		adCampaignCreate = adCampaignCreate,
		adCampaignToolCallStatus = if fFlagBuildAgentAdCampaignToolCallStatusFallback then adCampaignToolCallStatus else nil,
		ingestSessionHistory = ingestSessionHistory,
		ingestFrame = function(p15, p16)
			-- upvalues: ingestFrameHandlerModule (copy), logger (ref), var27 (ref), t_1 (ref), t_2 (ref), unregisterHandle (ref)
			ingestFrameHandlerModule.ingestFrame({
				logger = logger,
				getSessionByCasSessionId = var27.getSessionByCasSessionId,
				getSessionForProject = var27.getSessionForProject,
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
		getSessionForProject = var27.getSessionForProject
	}
end