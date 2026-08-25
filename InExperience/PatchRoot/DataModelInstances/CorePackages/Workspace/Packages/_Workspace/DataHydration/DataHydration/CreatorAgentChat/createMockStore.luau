local httpService = game:GetService("HttpService")
local acpProtocolModule = require(script.Parent.Acp.AcpProtocol)
local _ = require(script.Parent.types)
local createCreatorAgentChatStoreModule = require(script.Parent.createCreatorAgentChatStore)

local function _()
	return DateTime.now():ToIsoDate()
end

local function jsonError(p0, p1, p2, p3)
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

local function jsonOk(p4, p5)
	-- upvalues: httpService (ref)
	return {
		statusCode = 200,
		responseBody = httpService:JSONEncode({ jsonrpc = "2.0", id = p4, result = p5 })
	}
end

local function streamWords(p6)
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

local function httpStatusForCode(p7)
	-- upvalues: acpProtocolModule (ref)
	return if p7 == acpProtocolModule.ErrorCodes.NotFound then 404 elseif p7 == acpProtocolModule.ErrorCodes.Gone then 410 elseif p7 == acpProtocolModule.ErrorCodes.Conflict then 409 elseif p7 == acpProtocolModule.ErrorCodes.UpstreamUnavailable then 502 elseif p7 == acpProtocolModule.ErrorCodes.Unauthorized then 401 elseif p7 == acpProtocolModule.ErrorCodes.Forbidden then 403 elseif p7 == acpProtocolModule.ErrorCodes.InternalError then 500 else 400
end

return function(p8)
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
	local function _()
		-- upvalues: var12 (write)
		var12 += 1
		
		return ("mock_%08d"):format(var12)
	end
	
	local var15 = nil
	
	local function emitNotification(p9, p10, p11)
		-- upvalues: var15 (write), acpProtocolModule (copy)
		var15.ingestFrame({
			kind = "notification",
			notification = {
				method = acpProtocolModule.Notifications.SessionUpdate,
				params = { sessionId = p9, update = p10 }
			}
		}, { sequenceNumber = p11 })
	end
	
	local function emitResponse(p12, p13)
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
	
	local function defaultResponder(p14)
		-- upvalues: streamWords (copy), chunkDelay (ref)
		for i, v in streamWords(("Sure! I'll work on \"%s\" for you."):format(p14.promptText:sub(1, 60))) do
			p14.emitText(v)
			p14.sleep(chunkDelay)
		end
		p14.finish("end_turn")
	end
	
	local _ = function(p15)
		-- upvalues: streamWords (copy), chunkDelay (ref)
		return function(p16)
			-- upvalues: streamWords (copy), p15 (ref), chunkDelay (copy)
			for i, v in streamWords(p15) do
				p16.emitText(v)
				p16.sleep(chunkDelay)
			end
			p16.finish("end_turn")
		end
	end
	
	local _ = function()
		-- upvalues: p8 (ref), defaultResponder (ref), streamWords (copy), chunkDelay (ref)
		local respond = p8.respond
		
		return if respond == nil then defaultResponder elseif typeof(respond) == "string" then function(p17)
			-- upvalues: streamWords (copy), respond (ref), chunkDelay (copy)
			for i, v in streamWords(respond) do
				p17.emitText(v)
				p17.sleep(chunkDelay)
			end
			p17.finish("end_turn")
		end else respond
	end
	
	local function runResponder(p18, p19, p20)
		-- upvalues: p8 (ref), emitNotification (ref), emitResponse (ref), t (ref), defaultResponder (ref), streamWords (copy), chunkDelay (ref), acpProtocolModule (copy)
		local var23 = tostring(p18)
		local var24 = `{var23}:user`
		local var25 = `{var23}:assistant`
		local var26 = ""
		
		for i, v in p20 do
			if v.type == "text" and typeof(v.text) == "string" then
				var26 = if var26 == "" then v.text else var26 .. "\n" .. v.text
			end
		end
		local var27 = 0
		
		local function _(p21)
			-- upvalues: p8 (copy), var27 (write), emitNotification (copy), p19 (ref)
			if p8.onSessionUpdate then
				p8.onSessionUpdate(p21, var27)
			end
			emitNotification(p19, p21, var27)
			var27 += 1
		end
		
		local var28 = false
		
		i = function(p22)
			-- upvalues: var28 (write), p8 (copy), var27 (write), emitNotification (copy), p19 (ref)
			if var28 then return end
			var28 = true
			local t = {
				sessionUpdate = "state_change",
				state = "idle",
				stop_reason = p22 or "end_turn"
			}
			
			if p8.onSessionUpdate then
				p8.onSessionUpdate(t, var27)
			end
			emitNotification(p19, t, var27)
			var27 += 1
		end
		
		local function failTurn(p23, p24)
			-- upvalues: var28 (write), emitResponse (copy), p18 (ref)
			if var28 then
				return
			end
			var28 = true
			emitResponse(p18, { error = { code = p23, message = p24 } })
		end
		
		local t_1 = {
			sessionUpdate = "user_message",
			messageId = var24,
			content = p20
		}
		
		if p8.onSessionUpdate then
			p8.onSessionUpdate(t_1, var27)
		end
		emitNotification(p19, t_1, var27)
		var27 += 1
		local t_2 = { sessionUpdate = "state_change", state = "running" }
		
		if p8.onSessionUpdate then
			p8.onSessionUpdate(t_2, var27)
		end
		emitNotification(p19, t_2, var27)
		var27 += 1
		local t_3 = {
			sessionId = p19,
			promptText = var26,
			promptBlocks = p20,
			sleep = task.wait,
			emitText = function(p25)
				-- upvalues: var25 (ref), p8 (copy), var27 (write), emitNotification (copy), p19 (ref)
				local t = {
					sessionUpdate = "agent_message_chunk",
					messageId = var25,
					content = { type = "text", text = p25 }
				}
				
				if p8.onSessionUpdate then
					p8.onSessionUpdate(t, var27)
				end
				emitNotification(p19, t, var27)
				var27 += 1
			end,
			emitToolCall = function(p26)
				-- upvalues: p8 (copy), var27 (write), emitNotification (copy), p19 (ref)
				local t = {
					sessionUpdate = "tool_call_update",
					toolCallId = p26.toolCallId,
					title = p26.title,
					kind = p26.kind,
					status = p26.status,
					rawInput = p26.rawInput
				}
				
				if p8.onSessionUpdate then
					p8.onSessionUpdate(t, var27)
				end
				emitNotification(p19, t, var27)
				var27 += 1
			end,
			updateToolCall = function(p27, p28)
				-- upvalues: p8 (copy), var27 (write), emitNotification (copy), p19 (ref)
				local t = {
					sessionUpdate = "tool_call_update",
					toolCallId = p27,
					status = p28.status,
					rawOutput = p28.rawOutput,
					content = p28.content
				}
				
				if p8.onSessionUpdate then
					p8.onSessionUpdate(t, var27)
				end
				emitNotification(p19, t, var27)
				var27 += 1
			end,
			setTitle = function(value)
				-- upvalues: t (copy), p19 (ref), p8 (copy), var27 (write), emitNotification (copy)
				local var37 = t[p19]
				
				if var37 then
					var37.title = value
					var37.updatedUtc = DateTime.now():ToIsoDate()
				end
				local t_1 = { sessionUpdate = "session_info_update", title = value }
				
				if p8.onSessionUpdate then
					p8.onSessionUpdate(t_1, var27)
				end
				emitNotification(p19, t_1, var27)
				var27 += 1
			end,
			finish = function(p29)
				-- upvalues: var28 (write), p8 (copy), var27 (write), emitNotification (copy), p19 (ref)
				if var28 then return end
				var28 = true
				local t = {
					sessionUpdate = "state_change",
					state = "idle",
					stop_reason = p29 or "end_turn"
				}
				
				if p8.onSessionUpdate then
					p8.onSessionUpdate(t, var27)
				end
				emitNotification(p19, t, var27)
				var27 += 1
			end,
			fail = function(p30, p31)
				-- upvalues: failTurn (ref)
				failTurn(p30, p31)
			end
		}
		task.spawn(function()
			-- upvalues: p8 (copy), defaultResponder (copy), streamWords (copy), chunkDelay (copy), t_3 (ref), failTurn (ref), acpProtocolModule (copy), var28 (write), var27 (write), emitNotification (copy), p19 (ref)
			local ok, status = pcall(function()
				-- upvalues: p8 (copy), defaultResponder (copy), streamWords (copy), chunkDelay (copy), t_3 (copy)
				local respond = p8.respond;
				(if respond == nil then defaultResponder elseif typeof(respond) == "string" then function(p32)
					-- upvalues: streamWords (copy), respond (ref), chunkDelay (copy)
					for i, v in streamWords(respond) do
						p32.emitText(v)
						p32.sleep(chunkDelay)
					end
					p32.finish("end_turn")
				end else respond)(t_3)
				
				return nil
			end)
			
			if not ok then
				failTurn(acpProtocolModule.ErrorCodes.InternalError, "Mock responder errored: " .. tostring(status))
				
				return
			elseif not var28 then
				if var28 then return end
				var28 = true
				local t = {
					sessionUpdate = "state_change",
					state = "idle",
					stop_reason = "end_turn"
				}
				
				if p8.onSessionUpdate then
					p8.onSessionUpdate(t, var27)
				end
				emitNotification(p19, t, var27)
				var27 += 1
			end
		end)
	end
	
	local _ = function(p33)
		-- upvalues: t (ref), acpProtocolModule (copy)
		local var41 = t[p33]
		
		if var41 == nil or var41.closedUtc ~= nil then
			return nil, {
				message = "session not found",
				code = acpProtocolModule.ErrorCodes.NotFound
			}
		end
		return var41, nil
	end
	
	local function sessionListEntry(p34)
		local t = {
			sessionId = p34.sessionId,
			title = p34.title,
			updatedAt = p34.updatedUtc
		}
		
		if p34.project ~= nil then
			t._meta = { _roblox = { universeId = p34.project.universeId } }
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
		[acpProtocolModule.Methods.SessionNew] = function(p35)
			-- upvalues: acpProtocolModule (copy), var12 (write), t (ref)
			local var43 = acpProtocolModule.extractSessionNewProject(p35)
			
			if var43 == nil then
				return nil, {
					message = "_meta._roblox universeId/placeId is required on session/new",
					code = acpProtocolModule.ErrorCodes.InvalidParams
				}
			end
			var12 += 1
			local var44 = ("mock_%08d"):format(var12)
			local var45 = DateTime.now():ToIsoDate()
			t[var44] = {
				title = nil,
				closedUtc = nil,
				sessionId = var44,
				createdUtc = var45,
				updatedUtc = var45,
				project = var43
			}
			
			return { sessionId = var44 }, nil
		end,
		[acpProtocolModule.Methods.SessionList] = function(_)
			-- upvalues: t (ref), sessionListEntry (ref)
			local t_1 = {}
			
			for i, v in t do
				if v.closedUtc == nil then
					table.insert(t_1, sessionListEntry(v))
				end
			end
			table.sort(t_1, function(p36, p37)
				return (p37.updatedAt or "") < (p36.updatedAt or "")
			end)
			
			return { sessions = t_1 }, nil
		end,
		[acpProtocolModule.Methods.SessionFindByUniverse] = function(p38)
			-- upvalues: acpProtocolModule (copy), t (ref), sessionListEntry (ref)
			if typeof(p38.universeId) ~= "number" or p38.universeId == 0 then
				return nil, {
					message = "universeId is required",
					code = acpProtocolModule.ErrorCodes.InvalidParams
				}
			end
			local t_1 = {}
			
			for i, v in t do
				if v.closedUtc == nil and v.project ~= nil and v.project.universeId == p38.universeId then
					table.insert(t_1, sessionListEntry(v))
				end
			end
			table.sort(t_1, function(p39, p40)
				return (p40.updatedAt or "") < (p39.updatedAt or "")
			end)
			
			return { sessions = t_1 }, nil
		end,
		[acpProtocolModule.Methods.SessionLoad] = function(p41)
			-- upvalues: t (ref), acpProtocolModule (copy)
			local var48, t_1
			local sessionId = t[p41.sessionId]
			
			if sessionId == nil or sessionId.closedUtc ~= nil then
				var48 = nil
				t_1 = {
					message = "session not found",
					code = acpProtocolModule.ErrorCodes.NotFound
				}
			else
				var48 = sessionId
				t_1 = nil
			end
			if t_1 then
				return nil, t_1
			end
			return {
				_meta = {
					_roblox = {
						universeId = if var48.project ~= nil then nil else var48.project.universeId
					}
				}
			}, nil
		end,
		[acpProtocolModule.Methods.SessionReadTasks] = function(p42)
			-- upvalues: t (ref), acpProtocolModule (copy)
			local var50, t_1
			local sessionId = t[p42.sessionId]
			
			if sessionId == nil or sessionId.closedUtc ~= nil then
				var50 = nil
				t_1 = {
					message = "session not found",
					code = acpProtocolModule.ErrorCodes.NotFound
				}
			else
				var50 = sessionId
				t_1 = nil
			end
			if t_1 then
				return nil, t_1
			end
			return { tasks = {} }, nil
		end,
		[acpProtocolModule.Methods.SessionCancel] = function(p43)
			-- upvalues: t (ref), acpProtocolModule (copy)
			local var52, t_1
			local sessionId = t[p43.sessionId]
			
			if sessionId == nil or sessionId.closedUtc ~= nil then
				var52 = nil
				t_1 = {
					message = "session not found",
					code = acpProtocolModule.ErrorCodes.NotFound
				}
			else
				var52 = sessionId
				t_1 = nil
			end
			if t_1 then
				return nil, t_1
			end
			return {}, nil
		end,
		[acpProtocolModule.Methods.SessionDelete] = function(p44)
			-- upvalues: t (ref), acpProtocolModule (copy)
			local sessionId = t[p44.sessionId]
			
			if sessionId == nil then
				return nil, {
					message = "session not found",
					code = acpProtocolModule.ErrorCodes.NotFound
				}
			end
			sessionId.closedUtc = DateTime.now():ToIsoDate()
			
			return {}, nil
		end,
		[acpProtocolModule.Methods.SessionUpdateInfo] = function(p45)
			-- upvalues: t (ref), acpProtocolModule (copy)
			local var54, t_1
			local sessionId = t[p45.sessionId]
			
			if sessionId == nil or sessionId.closedUtc ~= nil then
				var54 = nil
				t_1 = {
					message = "session not found",
					code = acpProtocolModule.ErrorCodes.NotFound
				}
			else
				var54 = sessionId
				t_1 = nil
			end
			if t_1 then
				return nil, t_1
			elseif p45.title ~= nil then
				var54.title = p45.title
				var54.updatedUtc = DateTime.now():ToIsoDate()
			end
			return {}, nil
		end,
		[acpProtocolModule.Methods.SessionSaveAndPublish] = function(_)
			return { status = "success", version = "1" }, nil
		end
	}
	
	local function dispatch(p46)
		-- upvalues: acpProtocolModule (copy), t (ref), jsonError (copy), httpStatusForCode (copy), runResponder (ref), jsonOk (copy), t_1 (ref)
		local var58
		if p46.method == acpProtocolModule.Methods.SessionPrompt then
			local var56, t_2
			var58 = t[p46.params.sessionId]
			
			if var58 == nil or var58.closedUtc ~= nil then
				var56 = nil
				t_2 = {
					message = "session not found",
					code = acpProtocolModule.ErrorCodes.NotFound
				}
			else
				var56 = var58
				t_2 = nil
			end
			if t_2 then
				return jsonError(p46.id, t_2.code, t_2.message, httpStatusForCode(t_2.code))
			end
			var56.updatedUtc = DateTime.now():ToIsoDate()
			runResponder(p46.id, p46.params.sessionId, p46.params.prompt or {})
			
			return jsonOk(p46.id, {})
		else
			local method = t_1[p46.method]
			
			if method == nil then
				return jsonError(p46.id, acpProtocolModule.ErrorCodes.MethodNotFound, "Method not found: " .. p46.method, 404)
			end
			ok, status, var58 = pcall(method, p46.params or {})
			
			return if ok then if var58 then jsonError(p46.id, var58.code, var58.message, httpStatusForCode(var58.code)) else jsonOk(p46.id, status) else jsonError(p46.id, acpProtocolModule.ErrorCodes.InternalError, tostring(status), 500)
		end
	end
	
	return createCreatorAgentChatStoreModule({
		baseUrl = "mock://my-stats/v2",
		network = {
			request = function(p47, p48)
				-- upvalues: httpService (copy), dispatch (ref)
				local var59 = httpService:JSONDecode(p47.body or "{}")
				
				if typeof(var59) == "table" and typeof(var59.result) == "table" and var59.result.tool_name == "ask_tool" then
					p48(true, {
						statusCode = 200,
						responseBody = "{\"jsonrpc\":\"2.0\",\"id\":1,\"result\":{}}"
					})
					
					return function() end
				end
				p48(true, dispatch(var59))
				
				return function() end
			end
		}
	})
end