local httpService = game:GetService("HttpService")
local acpProtocolModule = require(script.Parent.Acp.AcpProtocol)
local _ = require(script.Parent.types)
local createCreatorAgentChatStoreModule = require(script.Parent.createCreatorAgentChatStore)

local function _()
	return DateTime.now():ToIsoDate()
end

local function jsonError(p1, p2, p3, p4)
	-- upvalues: httpService (ref)
	return {
		statusCode = p4,
		responseBody = httpService:JSONEncode({
			jsonrpc = "2.0",
			id = p1,
			error = { code = p2, message = p3 }
		})
	}
end

local function jsonOk(p1, p2)
	-- upvalues: httpService (ref)
	return {
		statusCode = 200,
		responseBody = httpService:JSONEncode({ jsonrpc = "2.0", id = p1, result = p2 })
	}
end

local function streamWords(p1)
	local t = {}
	local var1 = true
	
	for i in p1:gmatch("%S+") do
		if var1 then
			table.insert(t, i)
			var1 = false
		else
			table.insert(t, " " .. i)
		end
	end
	return t
end

local function httpStatusForCode(p2)
	-- upvalues: acpProtocolModule (ref)
	return if p2 == acpProtocolModule.ErrorCodes.NotFound then 404 elseif p2 == acpProtocolModule.ErrorCodes.Gone then 410 elseif p2 == acpProtocolModule.ErrorCodes.Conflict then 409 elseif p2 == acpProtocolModule.ErrorCodes.UpstreamUnavailable then 502 elseif p2 == acpProtocolModule.ErrorCodes.Unauthorized then 401 elseif p2 == acpProtocolModule.ErrorCodes.Forbidden then 403 elseif p2 == acpProtocolModule.ErrorCodes.InternalError then 500 else 400
end

return function(p2)
	-- upvalues: acpProtocolModule (ref), streamWords (ref), jsonError (ref), httpStatusForCode (ref), jsonOk (ref), httpService (ref), createCreatorAgentChatStoreModule (ref)
	p2 = p2 or {}
	local chunkDelay = p2.chunkDelay or 0.04
	local t = {}
	local var2 = 0
	
	if p2.initialSessions then
		for i, v in p2.initialSessions do
			var2 += 1
			local sessionId = v.sessionId or ("mock_seed_%08d"):format(var2)
			local var3 = DateTime.now():ToIsoDate()
			t[sessionId] = {
				closedUtc = nil,
				sessionId = sessionId,
				title = v.title,
				createdUtc = var3,
				updatedUtc = var3
			}
		end
	end
	local function _()
		-- upvalues: var2 (write)
		var2 += 1
		
		return ("mock_%08d"):format(var2)
	end
	
	local var4 = nil
	
	local function emitNotification(p3, p4, p5)
		-- upvalues: var4 (write), acpProtocolModule (copy)
		var4.ingestFrame({
			kind = "notification",
			notification = {
				method = acpProtocolModule.Notifications.SessionUpdate,
				params = { sessionId = p3, update = p4 }
			}
		}, { sequenceNumber = p5 })
	end
	
	local function emitResponse(p3, p4)
		-- upvalues: var4 (write)
		var4.ingestFrame({
			kind = "response",
			response = {
				jsonrpc = "2.0",
				id = p3,
				result = p4.result,
				error = p4.error
			}
		})
	end
	
	local function defaultResponder(p3)
		-- upvalues: streamWords (copy), chunkDelay (ref)
		for i, v in streamWords(("Sure! I'll work on \"%s\" for you."):format(p3.promptText:sub(1, 60))) do
			p3.emitText(v)
			p3.sleep(chunkDelay)
		end
		p3.finish("end_turn")
	end
	
	local _ = function(p4)
		-- upvalues: streamWords (copy), chunkDelay (ref)
		return function(p5)
			-- upvalues: streamWords (copy), p4 (ref), chunkDelay (copy)
			for i, v in streamWords(p4) do
				p5.emitText(v)
				p5.sleep(chunkDelay)
			end
			p5.finish("end_turn")
		end
	end
	
	local _ = function()
		-- upvalues: p2 (ref), defaultResponder (ref), streamWords (copy), chunkDelay (ref)
		local respond = p2.respond
		
		return if respond == nil then defaultResponder elseif typeof(respond) == "string" then function(p5)
			-- upvalues: streamWords (copy), respond (ref), chunkDelay (copy)
			for i, v in streamWords(respond) do
				p5.emitText(v)
				p5.sleep(chunkDelay)
			end
			p5.finish("end_turn")
		end else respond
	end
	
	local function runResponder(p5, p6, p7)
		-- upvalues: p2 (ref), emitNotification (ref), emitResponse (ref), t (ref), defaultResponder (ref), streamWords (copy), chunkDelay (ref), acpProtocolModule (copy)
		local var5 = tostring(p5)
		local var6 = `{var5}:user`
		local var7 = `{var5}:assistant`
		local var8 = ""
		
		for i, v in p7 do
			if v.type == "text" and typeof(v.text) == "string" then
				var8 = if var8 == "" then v.text else var8 .. "\n" .. v.text
			end
		end
		local var9 = 0
		
		local function _(p8)
			-- upvalues: p2 (copy), var9 (write), emitNotification (copy), p6 (ref)
			if p2.onSessionUpdate then
				p2.onSessionUpdate(p8, var9)
			end
			emitNotification(p6, p8, var9)
			var9 += 1
		end
		
		local var10 = false
		
		i = function(p8)
			-- upvalues: var10 (write), p2 (copy), var9 (write), emitNotification (copy), p6 (ref)
			if var10 then return end
			var10 = true
			local t = {
				sessionUpdate = "state_change",
				state = "idle",
				stop_reason = p8 or "end_turn"
			}
			
			if p2.onSessionUpdate then
				p2.onSessionUpdate(t, var9)
			end
			emitNotification(p6, t, var9)
			var9 += 1
		end
		
		local function failTurn(p8, p9)
			-- upvalues: var10 (write), emitResponse (copy), p5 (ref)
			if var10 then
				return
			end
			var10 = true
			emitResponse(p5, { error = { code = p8, message = p9 } })
		end
		
		local t_1 = {
			sessionUpdate = "user_message",
			messageId = var6,
			content = p7
		}
		
		if p2.onSessionUpdate then
			p2.onSessionUpdate(t_1, var9)
		end
		emitNotification(p6, t_1, var9)
		var9 += 1
		local t_2 = { sessionUpdate = "state_change", state = "running" }
		
		if p2.onSessionUpdate then
			p2.onSessionUpdate(t_2, var9)
		end
		emitNotification(p6, t_2, var9)
		var9 += 1
		local t_3 = {
			sessionId = p6,
			promptText = var8,
			promptBlocks = p7,
			sleep = task.wait,
			emitText = function(p8)
				-- upvalues: var7 (ref), p2 (copy), var9 (write), emitNotification (copy), p6 (ref)
				local t = {
					sessionUpdate = "agent_message_chunk",
					messageId = var7,
					content = { type = "text", text = p8 }
				}
				
				if p2.onSessionUpdate then
					p2.onSessionUpdate(t, var9)
				end
				emitNotification(p6, t, var9)
				var9 += 1
			end,
			emitToolCall = function(p8)
				-- upvalues: p2 (copy), var9 (write), emitNotification (copy), p6 (ref)
				local t = {
					sessionUpdate = "tool_call_update",
					toolCallId = p8.toolCallId,
					title = p8.title,
					kind = p8.kind,
					status = p8.status,
					rawInput = p8.rawInput
				}
				
				if p2.onSessionUpdate then
					p2.onSessionUpdate(t, var9)
				end
				emitNotification(p6, t, var9)
				var9 += 1
			end,
			updateToolCall = function(p8, p9)
				-- upvalues: p2 (copy), var9 (write), emitNotification (copy), p6 (ref)
				local t = {
					sessionUpdate = "tool_call_update",
					toolCallId = p8,
					status = p9.status,
					rawOutput = p9.rawOutput,
					content = p9.content
				}
				
				if p2.onSessionUpdate then
					p2.onSessionUpdate(t, var9)
				end
				emitNotification(p6, t, var9)
				var9 += 1
			end,
			setTitle = function(value)
				-- upvalues: t (copy), p6 (ref), p2 (copy), var9 (write), emitNotification (copy)
				local var11 = t[p6]
				
				if var11 then
					var11.title = value
					var11.updatedUtc = DateTime.now():ToIsoDate()
				end
				local t_1 = { sessionUpdate = "session_info_update", title = value }
				
				if p2.onSessionUpdate then
					p2.onSessionUpdate(t_1, var9)
				end
				emitNotification(p6, t_1, var9)
				var9 += 1
			end,
			finish = function(p8)
				-- upvalues: var10 (write), p2 (copy), var9 (write), emitNotification (copy), p6 (ref)
				if var10 then return end
				var10 = true
				local t = {
					sessionUpdate = "state_change",
					state = "idle",
					stop_reason = p8 or "end_turn"
				}
				
				if p2.onSessionUpdate then
					p2.onSessionUpdate(t, var9)
				end
				emitNotification(p6, t, var9)
				var9 += 1
			end,
			fail = function(p8, p9)
				-- upvalues: failTurn (ref)
				failTurn(p8, p9)
			end
		}
		task.spawn(function()
			-- upvalues: p2 (copy), defaultResponder (copy), streamWords (copy), chunkDelay (copy), t_3 (ref), failTurn (ref), acpProtocolModule (copy), var10 (write), var9 (write), emitNotification (copy), p6 (ref)
			local ok, status = pcall(function()
				-- upvalues: p2 (copy), defaultResponder (copy), streamWords (copy), chunkDelay (copy), t_3 (copy)
				local respond = p2.respond;
				(if respond == nil then defaultResponder elseif typeof(respond) == "string" then function(p8)
					-- upvalues: streamWords (copy), respond (ref), chunkDelay (copy)
					for i, v in streamWords(respond) do
						p8.emitText(v)
						p8.sleep(chunkDelay)
					end
					p8.finish("end_turn")
				end else respond)(t_3)
				
				return nil
			end)
			
			if not ok then
				failTurn(acpProtocolModule.ErrorCodes.InternalError, "Mock responder errored: " .. tostring(status))
				
				return
			elseif not var10 then
				if var10 then return end
				var10 = true
				local t = {
					sessionUpdate = "state_change",
					state = "idle",
					stop_reason = "end_turn"
				}
				
				if p2.onSessionUpdate then
					p2.onSessionUpdate(t, var9)
				end
				emitNotification(p6, t, var9)
				var9 += 1
			end
		end)
	end
	
	local _ = function(p8)
		-- upvalues: t (ref), acpProtocolModule (copy)
		local var11 = t[p8]
		
		if var11 == nil or var11.closedUtc ~= nil then
			return nil, {
				message = "session not found",
				code = acpProtocolModule.ErrorCodes.NotFound
			}
		end
		return var11, nil
	end
	
	local function sessionListEntry(p8)
		local t = {
			sessionId = p8.sessionId,
			title = p8.title,
			updatedAt = p8.updatedUtc
		}
		
		if p8.project ~= nil then
			t._meta = { _roblox = { universeId = p8.project.universeId } }
		end
		return t
	end
	
	local t_1 = {
		[acpProtocolModule.Methods.Initialize] = function()
			-- upvalues: acpProtocolModule (copy)
			return {
				protocolVersion = acpProtocolModule.ProtocolVersion,
				capabilities = {
					session = {
						load = {},
						prompt = { image = true, audio = false, embeddedContext = true },
						mcp = { http = {} }
					},
					_meta = { _roblox = { localToolExecution = true } }
				},
				agentInfo = { name = "mock-my-stats-service", version = "0.0.1-mock" }
			}, nil
		end,
		[acpProtocolModule.Methods.SessionNew] = function(p8)
			-- upvalues: acpProtocolModule (copy), var2 (write), t (ref)
			local var11 = acpProtocolModule.extractSessionNewProject(p8)
			
			if var11 == nil then
				return nil, {
					message = "_meta._roblox universeId/placeId is required on session/new",
					code = acpProtocolModule.ErrorCodes.InvalidParams
				}
			end
			var2 += 1
			local var12 = ("mock_%08d"):format(var2)
			local var13 = DateTime.now():ToIsoDate()
			t[var12] = {
				title = nil,
				closedUtc = nil,
				sessionId = var12,
				createdUtc = var13,
				updatedUtc = var13,
				project = var11
			}
			
			return { sessionId = var12 }, nil
		end,
		[acpProtocolModule.Methods.SessionList] = function(_)
			-- upvalues: t (ref), sessionListEntry (ref)
			local t_1 = {}
			
			for i, v in t do
				if v.closedUtc == nil then
					table.insert(t_1, sessionListEntry(v))
				end
			end
			table.sort(t_1, function(p8, p9)
				return (p9.updatedAt or "") < (p8.updatedAt or "")
			end)
			
			return { sessions = t_1 }, nil
		end,
		[acpProtocolModule.Methods.SessionFindByUniverse] = function(p8)
			-- upvalues: acpProtocolModule (copy), t (ref), sessionListEntry (ref)
			if typeof(p8.universeId) ~= "number" or p8.universeId == 0 then
				return nil, {
					message = "universeId is required",
					code = acpProtocolModule.ErrorCodes.InvalidParams
				}
			end
			local t_1 = {}
			
			for i, v in t do
				if v.closedUtc == nil and v.project ~= nil and v.project.universeId == p8.universeId then
					table.insert(t_1, sessionListEntry(v))
				end
			end
			table.sort(t_1, function(p9, p10)
				return (p10.updatedAt or "") < (p9.updatedAt or "")
			end)
			
			return { sessions = t_1 }, nil
		end,
		[acpProtocolModule.Methods.SessionLoad] = function(p9)
			-- upvalues: t (ref), acpProtocolModule (copy)
			local var11, t_1
			local sessionId = t[p9.sessionId]
			
			if sessionId == nil or sessionId.closedUtc ~= nil then
				var11 = nil
				t_1 = {
					message = "session not found",
					code = acpProtocolModule.ErrorCodes.NotFound
				}
			else
				var11 = sessionId
				t_1 = nil
			end
			if t_1 then
				return nil, t_1
			end
			return {
				_meta = {
					_roblox = {
						universeId = if var11.project ~= nil then nil else var11.project.universeId
					}
				}
			}, nil
		end,
		[acpProtocolModule.Methods.SessionReadTasks] = function(p9)
			-- upvalues: t (ref), acpProtocolModule (copy)
			local var11, t_1
			local sessionId = t[p9.sessionId]
			
			if sessionId == nil or sessionId.closedUtc ~= nil then
				var11 = nil
				t_1 = {
					message = "session not found",
					code = acpProtocolModule.ErrorCodes.NotFound
				}
			else
				var11 = sessionId
				t_1 = nil
			end
			if t_1 then
				return nil, t_1
			end
			return { tasks = {} }, nil
		end,
		[acpProtocolModule.Methods.SessionCancel] = function(p9)
			-- upvalues: t (ref), acpProtocolModule (copy)
			local var11, t_1
			local sessionId = t[p9.sessionId]
			
			if sessionId == nil or sessionId.closedUtc ~= nil then
				var11 = nil
				t_1 = {
					message = "session not found",
					code = acpProtocolModule.ErrorCodes.NotFound
				}
			else
				var11 = sessionId
				t_1 = nil
			end
			if t_1 then
				return nil, t_1
			end
			return {}, nil
		end,
		[acpProtocolModule.Methods.SessionDelete] = function(p9)
			-- upvalues: t (ref), acpProtocolModule (copy)
			local sessionId = t[p9.sessionId]
			
			if sessionId == nil then
				return nil, {
					message = "session not found",
					code = acpProtocolModule.ErrorCodes.NotFound
				}
			end
			sessionId.closedUtc = DateTime.now():ToIsoDate()
			
			return {}, nil
		end,
		[acpProtocolModule.Methods.SessionUpdateInfo] = function(p9)
			-- upvalues: t (ref), acpProtocolModule (copy)
			local var11, t_1
			local sessionId = t[p9.sessionId]
			
			if sessionId == nil or sessionId.closedUtc ~= nil then
				var11 = nil
				t_1 = {
					message = "session not found",
					code = acpProtocolModule.ErrorCodes.NotFound
				}
			else
				var11 = sessionId
				t_1 = nil
			end
			if t_1 then
				return nil, t_1
			elseif p9.title ~= nil then
				var11.title = p9.title
				var11.updatedUtc = DateTime.now():ToIsoDate()
			end
			return {}, nil
		end,
		[acpProtocolModule.Methods.SessionSaveAndPublish] = function(_)
			return { status = "success", version = "1" }, nil
		end,
		[acpProtocolModule.Methods.AdCampaignEligibility] = function(p9)
			-- upvalues: acpProtocolModule (copy)
			if typeof(p9.universeId) == "number" and p9.universeId > 0 then
				return {
					schemaVersion = 1,
					userEligible = true,
					universeEligible = true,
					freeCreditsRemaining = 1,
					cardType = "promote_free",
					ineligibleReasons = {},
					offer = { displayAmountRobux = 0, durationDays = 3 }
				}, nil
			end
			return nil, {
				message = "universeId is required",
				code = acpProtocolModule.ErrorCodes.InvalidParams
			}
		end,
		[acpProtocolModule.Methods.AdCampaignCreate] = function(p9)
			-- upvalues: acpProtocolModule (copy)
			if typeof(p9.universeId) ~= "number" or p9.universeId <= 0 then
				return nil, {
					message = "universeId is required",
					code = acpProtocolModule.ErrorCodes.InvalidParams
				}
			elseif typeof(p9.idempotencyKey) == "string" and p9.idempotencyKey ~= "" then
				return {
					campaignId = "mock_campaign_0001",
					status = "in_review",
					toolCallId = p9.toolCallId
				}, nil
			end
			return nil, {
				message = "idempotencyKey is required",
				code = acpProtocolModule.ErrorCodes.InvalidParams
			}
		end
	}
	
	local function dispatch(p9)
		-- upvalues: acpProtocolModule (copy), t (ref), jsonError (copy), httpStatusForCode (copy), runResponder (ref), jsonOk (copy), t_1 (ref)
		local var11
		if p9.method == acpProtocolModule.Methods.SessionPrompt then
			local var12, t_2
			var11 = t[p9.params.sessionId]
			
			if var11 == nil or var11.closedUtc ~= nil then
				var12 = nil
				t_2 = {
					message = "session not found",
					code = acpProtocolModule.ErrorCodes.NotFound
				}
			else
				var12 = var11
				t_2 = nil
			end
			if t_2 then
				return jsonError(p9.id, t_2.code, t_2.message, httpStatusForCode(t_2.code))
			end
			var12.updatedUtc = DateTime.now():ToIsoDate()
			runResponder(p9.id, p9.params.sessionId, p9.params.prompt or {})
			
			return jsonOk(p9.id, {})
		else
			local method = t_1[p9.method]
			
			if method == nil then
				return jsonError(p9.id, acpProtocolModule.ErrorCodes.MethodNotFound, "Method not found: " .. p48.method, 404)
			end
			ok, status, var58 = pcall(method, p9.params or {})
			
			return if ok then if var11 then jsonError(p9.id, var11.code, var11.message, httpStatusForCode(var11.code)) else jsonOk(p9.id, status) else jsonError(p9.id, acpProtocolModule.ErrorCodes.InternalError, tostring(status), 500)
		end
	end
	
	return createCreatorAgentChatStoreModule({
		baseUrl = "mock://my-stats/v2",
		network = {
			request = function(p9, p10)
				-- upvalues: httpService (copy), dispatch (ref)
				local var11 = httpService:JSONDecode(p9.body or "{}")
				
				if typeof(var11) == "table" and typeof(var11.result) == "table" and var11.result.tool_name == "ask_tool" then
					p10(true, {
						statusCode = 200,
						responseBody = "{\"jsonrpc\":\"2.0\",\"id\":1,\"result\":{}}"
					})
					
					return function() end
				end
				p10(true, dispatch(var11))
				
				return function() end
			end
		}
	})
end