local httpService = game:GetService("HttpService")
local acpProtocolModule = require(script.Parent.Acp.AcpProtocol)
local _ = require(script.Parent.types)
local createCreatorAgentChatStoreModule = require(script.Parent.createCreatorAgentChatStore)

local function _() --[[ line: 72 | named "isoNow" ]]
	return DateTime.now():ToIsoDate()
end

local function jsonError(p0, p1, p2, p3) --[[ line: 76 ]]
	-- upvalues: httpService (ref)
	return {
		statusCode = p3,
		responseBody = httpService:JSONEncode({
			jsonrpc = "2.0",
			id = p0,
			error = { code = p1, message = p2 }
		})
	}
end

local function jsonOk(p4, p5) --[[ line: 87 ]]
	-- upvalues: httpService (ref)
	return {
		statusCode = 200,
		responseBody = httpService:JSONEncode({ jsonrpc = "2.0", id = p4, result = p5 })
	}
end

local function streamWords(p6) --[[ line: 94 ]]
	local t = {}
	local var8 = true
	
	for i in p6:gmatch("%S+") do
		if var8 then
			table.insert(t, i)
			var8 = false
		else
			table.insert(t, " " .. i)
		end
	end
	return t
end

local function httpStatusForCode(p7) --[[ line: 109 ]]
	-- upvalues: acpProtocolModule (ref)
	return if p7 == acpProtocolModule.ErrorCodes.NotFound then 404 elseif p7 == acpProtocolModule.ErrorCodes.Gone then 410 elseif p7 == acpProtocolModule.ErrorCodes.Conflict then 409 elseif p7 == acpProtocolModule.ErrorCodes.UpstreamUnavailable then 502 elseif p7 == acpProtocolModule.ErrorCodes.Unauthorized then 401 elseif p7 == acpProtocolModule.ErrorCodes.Forbidden then 403 elseif p7 == acpProtocolModule.ErrorCodes.InternalError then 500 else 400
end

return function(p8) --[[ line: 128 | named "createMockStore" ]]
	-- upvalues: acpProtocolModule (ref), streamWords (ref), jsonError (ref), httpStatusForCode (ref), jsonOk (ref), httpService (ref), createCreatorAgentChatStoreModule (ref)
	p8 = p8 or {}
	local chunkDelay = p8.chunkDelay or 0.04
	local t = {}
	local var12 = 0
	
	if p8.initialSessions then
		for i, v in p8.initialSessions do
			var12 += 1
			local sessionId = v.sessionId or ("mock_seed_%08d"):format(var12)
			local var14 = DateTime.now():ToIsoDate()
			t[sessionId] = {
				closedUtc = nil,
				sessionId = sessionId,
				title = v.title,
				createdUtc = var14,
				updatedUtc = var14
			}
		end
	end
	local function _() --[[ line: 150 | named "newSessionId" ]]
		-- upvalues: var12 (write)
		var12 += 1
		
		return ("mock_%08d"):format(var12)
	end
	
	local var15 = nil
	
	local function emitNotification(p9, p10, p11) --[[ line: 157 ]]
		-- upvalues: var15 (write), acpProtocolModule (copy)
		var15.ingestFrame({
			kind = "notification",
			notification = {
				method = acpProtocolModule.Notifications.SessionUpdate,
				params = { sessionId = p9, update = p10 }
			}
		}, { sequenceNumber = p11 })
	end
	
	local function emitResponse(p12, p13) --[[ line: 169 ]]
		-- upvalues: var15 (write)
		var15.ingestFrame({
			kind = "response",
			response = {
				jsonrpc = "2.0",
				id = p12,
				result = p13.result,
				error = p13.error
			}
		})
	end
	
	local function defaultResponder(p14) --[[ line: 181 ]]
		-- upvalues: streamWords (copy), chunkDelay (ref)
		p14.emitThought("Let me think about that...")
		p14.sleep(0.15)
		
		for i, v in streamWords(("Sure! I'll work on \"%s\" for you."):format(p14.promptText:sub(1, 60))) do
			p14.emitText(v)
			p14.sleep(chunkDelay)
		end
		p14.finish("end_turn")
	end
	
	local _ = function(p15) --[[ line: 192 | named "stringResponder" ]]
		-- upvalues: streamWords (copy), chunkDelay (ref)
		return function(p16) --[[ line: 193 ]]
			-- upvalues: streamWords (copy), p15 (ref), chunkDelay (copy)
			for i, v in streamWords(p15) do
				p16.emitText(v)
				p16.sleep(chunkDelay)
			end
			p16.finish("end_turn")
		end
	end
	
	local _ = function() --[[ line: 202 | named "pickResponder" ]]
		-- upvalues: p8 (ref), defaultResponder (ref), streamWords (copy), chunkDelay (ref)
		local respond = p8.respond
		
		return if respond == nil then defaultResponder elseif typeof(respond) == "string" then function(p17) --[[ line: 193 ]]
			-- upvalues: streamWords (copy), respond (ref), chunkDelay (copy)
			for i, v in streamWords(respond) do
				p17.emitText(v)
				p17.sleep(chunkDelay)
			end
			p17.finish("end_turn")
		end else respond
	end
	
	local function runResponder(p18, p19, p20) --[[ line: 212 ]]
		-- upvalues: emitNotification (ref), emitResponse (ref), t (ref), p8 (ref), defaultResponder (ref), streamWords (copy), chunkDelay (ref), acpProtocolModule (copy)
		local var23 = tostring(p18)
		local var24 = `{var23}:user`
		local var25 = `{var23}:assistant`
		local var26 = `{var23}:thought`
		local var27 = ""
		
		for i, v in p20 do
			if v.type == "text" and typeof(v.text) == "string" then
				var27 = if var27 == "" then v.text else var27 .. "\n" .. v.text
			end
		end
		local var28 = 0
		
		local function _(p21) --[[ line: 225 | named "emitSessionUpdate" ]]
			-- upvalues: emitNotification (copy), p19 (ref), var28 (write)
			emitNotification(p19, p21, var28)
			var28 += 1
		end
		
		local var29 = false
		
		i = function(p22) --[[ line: 231 | named "finishTurn" ]]
			-- upvalues: var29 (write), emitNotification (copy), p19 (ref), var28 (write)
			if var29 then
				return
			end
			var29 = true
			emitNotification(p19, {
				sessionUpdate = "state_change",
				state = "idle",
				stop_reason = p22 or "end_turn"
			}, var28)
			var28 += 1
		end
		
		local function failTurn(p23, p24) --[[ line: 243 ]]
			-- upvalues: var29 (write), emitResponse (copy), p18 (ref)
			if var29 then
				return
			end
			var29 = true
			emitResponse(p18, { error = { code = p23, message = p24 } })
		end
		
		emitNotification(p19, {
			sessionUpdate = "user_message",
			messageId = var24,
			content = p20
		}, var28)
		var28 += 1
		emitNotification(p19, { sessionUpdate = "state_change", state = "running" }, var28)
		var28 += 1
		local t_1 = {
			sessionId = p19,
			promptText = var27,
			promptBlocks = p20,
			sleep = task.wait,
			emitText = function(p25) --[[ line: 266 ]]
				-- upvalues: var25 (ref), emitNotification (copy), p19 (ref), var28 (write)
				emitNotification(p19, {
					sessionUpdate = "agent_message_chunk",
					messageId = var25,
					content = { type = "text", text = p25 }
				}, var28)
				var28 += 1
			end,
			emitThought = function(p26) --[[ line: 273 ]]
				-- upvalues: var26 (ref), emitNotification (copy), p19 (ref), var28 (write)
				emitNotification(p19, {
					sessionUpdate = "agent_thought_chunk",
					messageId = var26,
					content = { type = "text", text = p26 }
				}, var28)
				var28 += 1
			end,
			emitToolCall = function(p27) --[[ line: 280 ]]
				-- upvalues: emitNotification (copy), p19 (ref), var28 (write)
				emitNotification(p19, {
					sessionUpdate = "tool_call_update",
					toolCallId = p27.toolCallId,
					title = p27.title,
					kind = p27.kind,
					status = p27.status,
					rawInput = p27.rawInput
				}, var28)
				var28 += 1
			end,
			updateToolCall = function(p28, p29) --[[ line: 290 ]]
				-- upvalues: emitNotification (copy), p19 (ref), var28 (write)
				emitNotification(p19, {
					sessionUpdate = "tool_call_update",
					toolCallId = p28,
					status = p29.status,
					rawOutput = p29.rawOutput,
					content = p29.content
				}, var28)
				var28 += 1
			end,
			setTitle = function(value) --[[ line: 299 ]]
				-- upvalues: t (copy), p19 (ref), emitNotification (copy), var28 (write)
				local var32 = t[p19]
				
				if var32 then
					var32.title = value
					var32.updatedUtc = DateTime.now():ToIsoDate()
				end
				emitNotification(p19, { sessionUpdate = "session_info_update", title = value }, var28)
				var28 += 1
			end,
			finish = function(p30) --[[ line: 307 ]]
				-- upvalues: var29 (write), emitNotification (copy), p19 (ref), var28 (write)
				if var29 then
					return
				end
				var29 = true
				emitNotification(p19, {
					sessionUpdate = "state_change",
					state = "idle",
					stop_reason = p30 or "end_turn"
				}, var28)
				var28 += 1
			end,
			fail = function(p31, p32) --[[ line: 310 ]]
				-- upvalues: failTurn (ref)
				failTurn(p31, p32)
			end
		}
		task.spawn(function() --[[ line: 315 ]]
			-- upvalues: p8 (copy), defaultResponder (copy), streamWords (copy), chunkDelay (copy), t_1 (ref), failTurn (ref), acpProtocolModule (copy), var29 (write), emitNotification (copy), p19 (ref), var28 (write)
			local ok, status = pcall(function() --[[ line: 317 | named "callResponder" ]]
				-- upvalues: p8 (copy), defaultResponder (copy), streamWords (copy), chunkDelay (copy), t_1 (copy)
				local respond = p8.respond;
				(if respond == nil then defaultResponder elseif typeof(respond) == "string" then function(p33) --[[ line: 193 ]]
					-- upvalues: streamWords (copy), respond (ref), chunkDelay (copy)
					for i, v in streamWords(respond) do
						p33.emitText(v)
						p33.sleep(chunkDelay)
					end
					p33.finish("end_turn")
				end else respond)(t_1)
				
				return nil
			end)
			
			if not ok then
				failTurn(acpProtocolModule.ErrorCodes.InternalError, "Mock responder errored: " .. tostring(status))
				
				return
			elseif not var29 then
				if var29 then return end
				var29 = true
				emitNotification(p19, {
					sessionUpdate = "state_change",
					state = "idle",
					stop_reason = "end_turn"
				}, var28)
				var28 += 1
			end
		end)
	end
	
	local _ = function(p34) --[[ line: 330 | named "findSession" ]]
		-- upvalues: t (ref), acpProtocolModule (copy)
		local var33 = t[p34]
		
		if var33 == nil or var33.closedUtc ~= nil then
			return nil, {
				message = "session not found",
				code = acpProtocolModule.ErrorCodes.NotFound
			}
		end
		return var33, nil
	end
	
	local function sessionListEntry(p35) --[[ line: 338 ]]
		local t = {
			sessionId = p35.sessionId,
			title = p35.title,
			updatedAt = p35.updatedUtc
		}
		
		if p35.project ~= nil then
			t._meta = { _roblox = { universeId = p35.project.universeId } }
		end
		return t
	end
	
	local t_1 = {
		[acpProtocolModule.Methods.Initialize] = function() --[[ line: 357 ]]
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
		[acpProtocolModule.Methods.SessionNew] = function(p36) --[[ line: 372 ]]
			-- upvalues: acpProtocolModule (copy), var12 (write), t (ref)
			local var35 = acpProtocolModule.extractSessionNewProject(p36)
			
			if var35 == nil then
				return nil, {
					message = "_meta._roblox universeId/placeId is required on session/new",
					code = acpProtocolModule.ErrorCodes.InvalidParams
				}
			end
			var12 += 1
			local var36 = ("mock_%08d"):format(var12)
			local var37 = DateTime.now():ToIsoDate()
			t[var36] = {
				title = nil,
				closedUtc = nil,
				sessionId = var36,
				createdUtc = var37,
				updatedUtc = var37,
				project = var35
			}
			
			return { sessionId = var36 }, nil
		end,
		[acpProtocolModule.Methods.SessionList] = function(_) --[[ line: 393 ]]
			-- upvalues: t (ref), sessionListEntry (ref)
			local t_1 = {}
			
			for i, v in t do
				if v.closedUtc == nil then
					table.insert(t_1, sessionListEntry(v))
				end
			end
			table.sort(t_1, function(p37, p38) --[[ line: 400 ]]
				return (p38.updatedAt or "") < (p37.updatedAt or "")
			end)
			
			return { sessions = t_1 }, nil
		end,
		[acpProtocolModule.Methods.SessionFindByUniverse] = function(p39) --[[ line: 405 ]]
			-- upvalues: acpProtocolModule (copy), t (ref), sessionListEntry (ref)
			if typeof(p39.universeId) ~= "number" or p39.universeId == 0 then
				return nil, {
					message = "universeId is required",
					code = acpProtocolModule.ErrorCodes.InvalidParams
				}
			end
			local t_1 = {}
			
			for i, v in t do
				if v.closedUtc == nil and v.project ~= nil and v.project.universeId == p39.universeId then
					table.insert(t_1, sessionListEntry(v))
				end
			end
			table.sort(t_1, function(p40, p41) --[[ line: 423 ]]
				return (p41.updatedAt or "") < (p40.updatedAt or "")
			end)
			
			return { sessions = t_1 }, nil
		end,
		[acpProtocolModule.Methods.SessionLoad] = function(p42) --[[ line: 428 ]]
			-- upvalues: t (ref), acpProtocolModule (copy)
			local var40, t_1
			local sessionId = t[p42.sessionId]
			
			if sessionId == nil or sessionId.closedUtc ~= nil then
				var40 = nil
				t_1 = {
					message = "session not found",
					code = acpProtocolModule.ErrorCodes.NotFound
				}
			else
				var40 = sessionId
				t_1 = nil
			end
			if t_1 then
				return nil, t_1
			end
			return {
				_meta = {
					_roblox = {
						universeId = if var40.project ~= nil then nil else var40.project.universeId
					}
				}
			}, nil
		end,
		[acpProtocolModule.Methods.SessionReadTasks] = function(p43) --[[ line: 444 ]]
			-- upvalues: t (ref), acpProtocolModule (copy)
			local var42, t_1
			local sessionId = t[p43.sessionId]
			
			if sessionId == nil or sessionId.closedUtc ~= nil then
				var42 = nil
				t_1 = {
					message = "session not found",
					code = acpProtocolModule.ErrorCodes.NotFound
				}
			else
				var42 = sessionId
				t_1 = nil
			end
			if t_1 then
				return nil, t_1
			end
			return { tasks = {} }, nil
		end,
		[acpProtocolModule.Methods.SessionCancel] = function(p44) --[[ line: 451 ]]
			-- upvalues: t (ref), acpProtocolModule (copy)
			local var44, t_1
			local sessionId = t[p44.sessionId]
			
			if sessionId == nil or sessionId.closedUtc ~= nil then
				var44 = nil
				t_1 = {
					message = "session not found",
					code = acpProtocolModule.ErrorCodes.NotFound
				}
			else
				var44 = sessionId
				t_1 = nil
			end
			if t_1 then
				return nil, t_1
			end
			return {}, nil
		end,
		[acpProtocolModule.Methods.SessionDelete] = function(p45) --[[ line: 459 ]]
			-- upvalues: t (ref), acpProtocolModule (copy)
			local sessionId = t[p45.sessionId]
			
			if sessionId == nil then
				return nil, {
					message = "session not found",
					code = acpProtocolModule.ErrorCodes.NotFound
				}
			end
			sessionId.closedUtc = DateTime.now():ToIsoDate()
			
			return {}, nil
		end,
		[acpProtocolModule.Methods.SessionUpdateInfo] = function(p46) --[[ line: 467 ]]
			-- upvalues: t (ref), acpProtocolModule (copy)
			local var46, t_1
			local sessionId = t[p46.sessionId]
			
			if sessionId == nil or sessionId.closedUtc ~= nil then
				var46 = nil
				t_1 = {
					message = "session not found",
					code = acpProtocolModule.ErrorCodes.NotFound
				}
			else
				var46 = sessionId
				t_1 = nil
			end
			if t_1 then
				return nil, t_1
			elseif p46.title ~= nil then
				var46.title = p46.title
				var46.updatedUtc = DateTime.now():ToIsoDate()
			end
			return {}, nil
		end
	}
	
	local function dispatch(p47) --[[ line: 481 ]]
		-- upvalues: acpProtocolModule (copy), t (ref), jsonError (copy), httpStatusForCode (copy), runResponder (ref), jsonOk (copy), t_1 (ref)
		local var50
		if p47.method == acpProtocolModule.Methods.SessionPrompt then
			local var48, t_2
			var50 = t[p47.params.sessionId]
			
			if var50 == nil or var50.closedUtc ~= nil then
				var48 = nil
				t_2 = {
					message = "session not found",
					code = acpProtocolModule.ErrorCodes.NotFound
				}
			else
				var48 = var50
				t_2 = nil
			end
			if t_2 then
				return jsonError(p47.id, t_2.code, t_2.message, httpStatusForCode(t_2.code))
			end
			var48.updatedUtc = DateTime.now():ToIsoDate()
			runResponder(p47.id, p47.params.sessionId, p47.params.prompt or {})
			
			return jsonOk(p47.id, {})
		else
			local method = t_1[p47.method]
			
			if method == nil then
				return jsonError(p47.id, acpProtocolModule.ErrorCodes.MethodNotFound, "Method not found: " .. p47.method, 404)
			end
			ok, status, var50 = pcall(method, p47.params or {})
			
			return if ok then if var50 then jsonError(p47.id, var50.code, var50.message, httpStatusForCode(var50.code)) else jsonOk(p47.id, status) else jsonError(p47.id, acpProtocolModule.ErrorCodes.InternalError, tostring(status), 500)
		end
	end
	
	return createCreatorAgentChatStoreModule({
		baseUrl = "mock://my-stats/v2",
		network = {
			request = function(p48, p49) --[[ line: 510 ]]
				-- upvalues: httpService (copy), dispatch (ref)
				local var51 = httpService:JSONDecode(p48.body or "{}")
				
				if typeof(var51) == "table" and typeof(var51.result) == "table" and var51.result.tool_name == "ask_tool" then
					p49(true, {
						statusCode = 200,
						responseBody = "{\"jsonrpc\":\"2.0\",\"id\":1,\"result\":{}}"
					})
					
					return function() --[[ line: 518 ]] end
				end
				p49(true, dispatch(var51))
				
				return function() --[[ line: 521 ]] end
			end
		}
	})
end