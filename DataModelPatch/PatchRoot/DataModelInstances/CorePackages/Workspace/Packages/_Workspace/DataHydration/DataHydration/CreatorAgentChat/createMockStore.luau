local HttpService = game:GetService("HttpService")
local AcpProtocolModule = require(script.Parent.Acp.AcpProtocol)
local _ = require(script.Parent.types)
local CreateCreatorAgentChatStoreModule = require(script.Parent.createCreatorAgentChatStore)

local function _()
	return DateTime.now():ToIsoDate()
end

local function jsonError(Id, Code, Message, StatusCode)
	-- upvalues: HttpService (copy)
	return {
		statusCode = StatusCode,
		responseBody = HttpService:JSONEncode({
			jsonrpc = "2.0",
			id = Id,
			error = { code = Code, message = Message }
		})
	}
end

local function jsonOk(Id, Result)
	-- upvalues: HttpService (copy)
	return {
		statusCode = 200,
		responseBody = HttpService:JSONEncode({ jsonrpc = "2.0", id = Id, result = Result })
	}
end

local function streamWords(Text: string)
	local List = {}
	local Flag = true
	
	for i in Text:gmatch("%S+") do
		if Flag then
			table.insert(List, i)
			Flag = false
		else
			table.insert(List, " " .. i)
		end
	end
	return List
end

local function httpStatusForCode(Code): number
	-- upvalues: AcpProtocolModule (copy)
	return if Code == AcpProtocolModule.ErrorCodes.NotFound then 404 elseif Code == AcpProtocolModule.ErrorCodes.Gone then 410 elseif Code == AcpProtocolModule.ErrorCodes.Conflict then 409 elseif Code == AcpProtocolModule.ErrorCodes.UpstreamUnavailable then 502 elseif Code == AcpProtocolModule.ErrorCodes.Unauthorized then 401 elseif Code == AcpProtocolModule.ErrorCodes.Forbidden then 403 elseif Code == AcpProtocolModule.ErrorCodes.InternalError then 500 else 400
end

return function(p1)
	-- upvalues: AcpProtocolModule (copy), streamWords (copy), jsonError (copy), httpStatusForCode (copy), jsonOk (copy), HttpService (copy), CreateCreatorAgentChatStoreModule (copy)
	local P8 = p1 or {}
	local ChunkDelay = P8.chunkDelay or 0.04
	local t = {}
	local Count = 0
	
	if P8.initialSessions then
		for _, initialSession in P8.initialSessions do
			Count += 1
			local SessionId = initialSession.sessionId or ("mock_seed_%08d"):format(Count)
			local IsoDate = DateTime.now():ToIsoDate()
			t[SessionId] = {
				closedUtc = nil,
				sessionId = SessionId,
				title = initialSession.title,
				createdUtc = IsoDate,
				updatedUtc = IsoDate
			}
		end
	end
	local function _(): string
		-- upvalues: Count (ref)
		Count += 1
		
		return ("mock_%08d"):format(Count)
	end
	
	local v1 = nil
	
	local function emitNotification(SessionId, Update, Count)
		-- upvalues: v1 (ref), AcpProtocolModule (upval)
		v1.ingestFrame({
			kind = "notification",
			notification = {
				method = AcpProtocolModule.Notifications.SessionUpdate,
				params = { sessionId = SessionId, update = Update }
			}
		}, { sequenceNumber = Count })
	end
	
	local function emitResponse(Id, p2)
		-- upvalues: v1 (ref)
		v1.ingestFrame({
			kind = "response",
			response = {
				jsonrpc = "2.0",
				id = Id,
				result = p2.result,
				error = p2.error
			}
		})
	end
	
	local function defaultResponder(p2)
		-- upvalues: streamWords (upval), ChunkDelay (copy)
		for _, value in streamWords((("Sure! I'll work on \"%s\" for you."):format(p2.promptText:sub(1, 60)))) do
			p2.emitText(value)
			p2.sleep(ChunkDelay)
		end
		p2.finish("end_turn")
	end
	
	local _ = function(p3)
		-- upvalues: streamWords (upval), ChunkDelay (copy)
		return function(p4)
			-- upvalues: streamWords (upval), p3 (copy), ChunkDelay (upval)
			for _, value in streamWords(p3) do
				p4.emitText(value)
				p4.sleep(ChunkDelay)
			end
			p4.finish("end_turn")
		end
	end
	
	local _ = function()
		-- upvalues: P8 (copy), defaultResponder (copy), streamWords (upval), ChunkDelay (copy)
		local Respond = P8.respond
		
		return if Respond == nil then defaultResponder elseif typeof(Respond) == "string" then function(p4)
			-- upvalues: streamWords (upval), Respond (copy), ChunkDelay (upval)
			for _, value in streamWords(Respond) do
				p4.emitText(value)
				p4.sleep(ChunkDelay)
			end
			p4.finish("end_turn")
		end else Respond
	end
	
	local function runResponder(Id, SessionId, Content)
		-- upvalues: P8 (copy), emitNotification (copy), emitResponse (copy), t (copy), defaultResponder (copy), streamWords (upval), ChunkDelay (copy), AcpProtocolModule (upval)
		local Text = tostring(Id)
		local UserName: string = `{Text}:user`
		local AssistantName: string = `{Text}:assistant`
		local Text1 = ""
		
		for _, value in Content do
			if value.type == "text" and typeof(value.text) == "string" then
				if Text1 == "" then
					Text1 = value.text
				else
					Text1 ..= "\n" .. value.text
				end
			end
		end
		local Count = 0
		
		local function _(Update)
			-- upvalues: P8 (upval), Count (ref), emitNotification (upval), SessionId (copy)
			if P8.onSessionUpdate then
				P8.onSessionUpdate(Update, Count)
			end
			emitNotification(SessionId, Update, Count)
			Count += 1
		end
		
		local Flag = false
		
		local _ = function(p4)
			-- upvalues: Flag (ref), P8 (upval), Count (ref), emitNotification (upval), SessionId (copy)
			if Flag then return end
			Flag = true
			local config = {
				sessionUpdate = "state_change",
				state = "idle",
				stop_reason = p4 or "end_turn"
			}
			
			if P8.onSessionUpdate then
				P8.onSessionUpdate(config, Count)
			end
			emitNotification(SessionId, config, Count)
			Count += 1
		end
		
		local function failTurn(Code, Message)
			-- upvalues: Flag (ref), emitResponse (upval), Id (copy)
			if not Flag then
				Flag = true
				emitResponse(Id, { error = { code = Code, message = Message } })
				
				return
			end
		end
		
		local config = {
			sessionUpdate = "user_message",
			messageId = UserName,
			content = Content
		}
		
		if P8.onSessionUpdate then
			P8.onSessionUpdate(config, Count)
		end
		emitNotification(SessionId, config, Count)
		Count += 1
		local config1 = { sessionUpdate = "state_change", state = "running" }
		
		if P8.onSessionUpdate then
			P8.onSessionUpdate(config1, Count)
		end
		emitNotification(SessionId, config1, Count)
		Count += 1
		local config2 = {
			sessionId = SessionId,
			promptText = Text1,
			promptBlocks = Content,
			sleep = task.wait,
			emitText = function(Text)
				-- upvalues: AssistantName (copy), P8 (upval), Count (ref), emitNotification (upval), SessionId (copy)
				local config = {
					sessionUpdate = "agent_message_chunk",
					messageId = AssistantName,
					content = { type = "text", text = Text }
				}
				
				if P8.onSessionUpdate then
					P8.onSessionUpdate(config, Count)
				end
				emitNotification(SessionId, config, Count)
				Count += 1
			end,
			emitToolCall = function(Update)
				-- upvalues: P8 (upval), Count (ref), emitNotification (upval), SessionId (copy)
				local config = {
					sessionUpdate = "tool_call_update",
					toolCallId = Update.toolCallId,
					title = Update.title,
					kind = Update.kind,
					status = Update.status,
					rawInput = Update.rawInput
				}
				
				if P8.onSessionUpdate then
					P8.onSessionUpdate(config, Count)
				end
				emitNotification(SessionId, config, Count)
				Count += 1
			end,
			updateToolCall = function(ToolCallId, Update)
				-- upvalues: P8 (upval), Count (ref), emitNotification (upval), SessionId (copy)
				local config = {
					sessionUpdate = "tool_call_update",
					toolCallId = ToolCallId,
					status = Update.status,
					rawOutput = Update.rawOutput,
					content = Update.content
				}
				
				if P8.onSessionUpdate then
					P8.onSessionUpdate(config, Count)
				end
				emitNotification(SessionId, config, Count)
				Count += 1
			end,
			setTitle = function(Title)
				-- upvalues: t (upval), SessionId (copy), P8 (upval), Count (ref), emitNotification (upval)
				local Entry = t[SessionId]
				
				if Entry then
					Entry.title = Title
					Entry.updatedUtc = DateTime.now():ToIsoDate()
				end
				local config = { sessionUpdate = "session_info_update", title = Title }
				
				if P8.onSessionUpdate then
					P8.onSessionUpdate(config, Count)
				end
				emitNotification(SessionId, config, Count)
				Count += 1
			end,
			finish = function(p4)
				-- upvalues: Flag (ref), P8 (upval), Count (ref), emitNotification (upval), SessionId (copy)
				if Flag then return end
				Flag = true
				local config = {
					sessionUpdate = "state_change",
					state = "idle",
					stop_reason = p4 or "end_turn"
				}
				
				if P8.onSessionUpdate then
					P8.onSessionUpdate(config, Count)
				end
				emitNotification(SessionId, config, Count)
				Count += 1
			end,
			fail = function(Code, Message)
				-- upvalues: failTurn (copy)
				failTurn(Code, Message)
			end
		}
		task.spawn(function()
			-- upvalues: P8 (upval), defaultResponder (upval), streamWords (upval), ChunkDelay (upval), config2 (copy), failTurn (copy), AcpProtocolModule (upval), Flag (ref), Count (ref), emitNotification (upval), SessionId (copy)
			local Success, Result = pcall(function()
				-- upvalues: P8 (upval), defaultResponder (upval), streamWords (upval), ChunkDelay (upval), config2 (upval)
				local Respond = P8.respond;
				(if Respond == nil then defaultResponder elseif typeof(Respond) == "string" then function(p4)
					-- upvalues: streamWords (upval), Respond (copy), ChunkDelay (upval)
					for _, value in streamWords(Respond) do
						p4.emitText(value)
						p4.sleep(ChunkDelay)
					end
					p4.finish("end_turn")
				end else Respond)(config2)
				
				return nil
			end)
			
			if not Success then
				failTurn(AcpProtocolModule.ErrorCodes.InternalError, "Mock responder errored: " .. tostring(Result))
				
				return
			end
			if not Flag then
				if Flag then return end
				Flag = true
				local config1 = {
					sessionUpdate = "state_change",
					state = "idle",
					stop_reason = "end_turn"
				}
				
				if P8.onSessionUpdate then
					P8.onSessionUpdate(config1, Count)
				end
				emitNotification(SessionId, config1, Count)
				Count += 1
			end
		end)
	end
	
	local _ = function(p4)
		-- upvalues: t (copy), AcpProtocolModule (upval)
		local Entry = t[p4]
		
		if Entry == nil or Entry.closedUtc ~= nil then
			return nil, {
				message = "session not found",
				code = AcpProtocolModule.ErrorCodes.NotFound
			}
		else
			return Entry, nil
		end
	end
	
	local function sessionListEntry(p4)
		local config = {
			sessionId = p4.sessionId,
			title = p4.title,
			updatedAt = p4.updatedUtc
		}
		
		if p4.project ~= nil then
			config._meta = { _roblox = { universeId = p4.project.universeId } }
		end
		return config
	end
	
	local config = {
		[AcpProtocolModule.Methods.Initialize] = function()
			-- upvalues: AcpProtocolModule (upval)
			return {
				protocolVersion = AcpProtocolModule.ProtocolVersion,
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
		[AcpProtocolModule.Methods.SessionNew] = function(p4)
			-- upvalues: AcpProtocolModule (upval), Count (ref), t (copy)
			local ExtractSessionNewProjectResult = AcpProtocolModule.extractSessionNewProject(p4)
			
			if ExtractSessionNewProjectResult == nil then
				return nil, {
					message = "_meta._roblox universeId/placeId is required on session/new",
					code = AcpProtocolModule.ErrorCodes.InvalidParams
				}
			else
				Count += 1
				local MockName: string = ("mock_%08d"):format(Count)
				local IsoDate = DateTime.now():ToIsoDate()
				t[MockName] = {
					title = nil,
					closedUtc = nil,
					sessionId = MockName,
					createdUtc = IsoDate,
					updatedUtc = IsoDate,
					project = ExtractSessionNewProjectResult
				}
				
				return { sessionId = MockName }, nil
			end
		end,
		[AcpProtocolModule.Methods.SessionList] = function(_)
			-- upvalues: t (copy), sessionListEntry (copy)
			local List = {}
			
			for _, value in t do
				if value.closedUtc == nil then
					table.insert(List, (sessionListEntry(value)))
				end
			end
			table.sort(List, function(A, B): boolean
				return (B.updatedAt or "") < (A.updatedAt or "")
			end)
			
			return { sessions = List }, nil
		end,
		[AcpProtocolModule.Methods.SessionFindByUniverse] = function(p4)
			-- upvalues: AcpProtocolModule (upval), t (copy), sessionListEntry (copy)
			if typeof(p4.universeId) ~= "number" or p4.universeId == 0 then
				return nil, {
					message = "universeId is required",
					code = AcpProtocolModule.ErrorCodes.InvalidParams
				}
			end
			local List = {}
			
			for _, value in t do
				if value.closedUtc == nil and value.project ~= nil and value.project.universeId == p4.universeId then
					table.insert(List, (sessionListEntry(value)))
				end
			end
			table.sort(List, function(A, B): boolean
				return (B.updatedAt or "") < (A.updatedAt or "")
			end)
			
			return { sessions = List }, nil
		end,
		[AcpProtocolModule.Methods.SessionLoad] = function(p5)
			-- upvalues: t (copy), AcpProtocolModule (upval)
			local Entry = t[p5.sessionId]
			local v2 = nil
			local config = nil
			
			if Entry == nil or Entry.closedUtc ~= nil then
				v2 = nil
				config = {
					message = "session not found",
					code = AcpProtocolModule.ErrorCodes.NotFound
				}
			else
				v2 = Entry
				config = nil
			end
			if config then
				return nil, config
			else
				return {
					_meta = {
						_roblox = {
							universeId = if v2.project == nil then nil else v2.project.universeId
						}
					}
				}, nil
			end
		end,
		[AcpProtocolModule.Methods.SessionReadTasks] = function(p5)
			-- upvalues: t (copy), AcpProtocolModule (upval)
			local Entry = t[p5.sessionId]
			local Config = if Entry == nil or Entry.closedUtc ~= nil then {
				message = "session not found",
				code = AcpProtocolModule.ErrorCodes.NotFound
			} else nil
			
			if Config then
				return nil, Config
			else
				return { tasks = {} }, nil
			end
		end,
		[AcpProtocolModule.Methods.SessionCancel] = function(p5)
			-- upvalues: t (copy), AcpProtocolModule (upval)
			local Entry = t[p5.sessionId]
			local Config = if Entry == nil or Entry.closedUtc ~= nil then {
				message = "session not found",
				code = AcpProtocolModule.ErrorCodes.NotFound
			} else nil
			
			if Config then
				return nil, Config
			else
				return {}, nil
			end
		end,
		[AcpProtocolModule.Methods.SessionDelete] = function(p5)
			-- upvalues: t (copy), AcpProtocolModule (upval)
			local Entry = t[p5.sessionId]
			
			if Entry == nil then
				return nil, {
					message = "session not found",
					code = AcpProtocolModule.ErrorCodes.NotFound
				}
			else
				Entry.closedUtc = DateTime.now():ToIsoDate()
				
				return {}, nil
			end
		end,
		[AcpProtocolModule.Methods.SessionUpdateInfo] = function(p5)
			-- upvalues: t (copy), AcpProtocolModule (upval)
			local Entry = t[p5.sessionId]
			local v2 = nil
			local config = nil
			
			if Entry == nil or Entry.closedUtc ~= nil then
				v2 = nil
				config = {
					message = "session not found",
					code = AcpProtocolModule.ErrorCodes.NotFound
				}
			else
				v2 = Entry
				config = nil
			end
			if config then
				return nil, config
			end
			if p5.title ~= nil then
				v2.title = p5.title
				v2.updatedUtc = DateTime.now():ToIsoDate()
			end
			return {}, nil
		end
	}
	
	local function dispatch(p5)
		-- upvalues: AcpProtocolModule (upval), t (copy), jsonError (upval), httpStatusForCode (upval), runResponder (copy), jsonOk (upval), config (copy)
		if p5.method == AcpProtocolModule.Methods.SessionPrompt then
			local Entry = t[p5.params.sessionId]
			local v2 = nil
			local config1 = nil
			
			if Entry == nil or Entry.closedUtc ~= nil then
				v2 = nil
				config1 = {
					message = "session not found",
					code = AcpProtocolModule.ErrorCodes.NotFound
				}
			else
				v2 = Entry
				config1 = nil
			end
			if config1 then
				return (jsonError(p5.id, config1.code, config1.message, (httpStatusForCode(config1.code))))
			else
				v2.updatedUtc = DateTime.now():ToIsoDate()
				runResponder(p5.id, p5.params.sessionId, p5.params.prompt or {})
				
				return (jsonOk(p5.id, {}))
			end
		else
			local Entry1 = config[p5.method]
			
			if Entry1 == nil then
				return (jsonError(p5.id, AcpProtocolModule.ErrorCodes.MethodNotFound, "Method not found: " .. p5.method, 404))
			else
				local Success, Result, Result3 = pcall(Entry1, p5.params or {})
				
				return if Success then if Result3 then jsonError(p5.id, Result3.code, Result3.message, (httpStatusForCode(Result3.code))) else jsonOk(p5.id, Result) else jsonError(p5.id, AcpProtocolModule.ErrorCodes.InternalError, tostring(Result), 500)
			end
		end
	end
	
	v1 = CreateCreatorAgentChatStoreModule({
		baseUrl = "mock://my-stats/v2",
		network = {
			request = function(p5, Callback: (any, any) -> ())
				-- upvalues: HttpService (upval), dispatch (copy)
				local Data = HttpService:JSONDecode(p5.body or "{}")
				
				if typeof(Data) == "table" and typeof(Data.result) == "table" and Data.result.tool_name == "ask_tool" then
					Callback(true, {
						statusCode = 200,
						responseBody = "{\"jsonrpc\":\"2.0\",\"id\":1,\"result\":{}}"
					})
					
					return function() end
				else
					Callback(true, (dispatch(Data)))
					
					return function() end
				end
			end
		}
	})
	
	return v1
end