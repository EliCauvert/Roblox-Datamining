local HttpService = game:GetService("HttpService")

local function toError(Err)
	if typeof(Err) ~= "table" or typeof(Err.message) ~= "string" then
		return { message = debug.traceback((tostring(Err))) }
	end
	local t = {}
	
	for i, value in Err do
		if typeof(i) == "string" then
			t[i] = value
		end
	end
	return t
end

return function(p1)
	-- upvalues: HttpService (copy), toError (copy)
	local ReconnectInterval = p1.reconnectInterval or 2
	local WebSocketService = p1.webSocketService
	local t = {}
	local t1 = {}
	local List = {}
	local v1 = nil
	local Flag = false
	local Flag1 = false
	
	local function _()
		-- upvalues: t (copy)
		local List = {}
		
		for i in t do
			table.insert(List, i)
		end
		table.sort(List)
		
		return List
	end
	
	local config = {
		hello = function()
			-- upvalues: List (copy), t (copy)
			local config = { contexts = table.clone(List) }
			local List1 = {}
			
			for i in t do
				table.insert(List1, i)
			end
			table.sort(List1)
			config.methods = List1
			
			return config
		end
	}
	
	local _ = function()
		-- upvalues: v1 (ref), HttpService (upval), config (copy)
		local v2 = v1
		
		if v2 ~= nil then
			pcall(function()
				-- upvalues: v2 (copy), HttpService (upval), config (upval)
				v2:Send(HttpService:JSONEncode({
					jsonrpc = "2.0",
					method = "shell.hello",
					params = config.hello()
				}))
			end)
			
			return
		end
	end
	
	t["shell.methods"] = function()
		-- upvalues: config (copy)
		return config.hello()
	end
	
	function config.registerMethods(Text: string, List)
		-- upvalues: t1 (copy), t (copy), v1 (ref), HttpService (upval), config (copy)
		if Text == "" or string.find(Text, ".", 1, true) then
			error(`DevShell: namespace "{Text}" must be non-empty and contain no "."`, 2)
		end
		if Text == "shell" then
			error("DevShell: namespace \"shell\" is reserved", 2)
		end
		local Entry = t1[Text] and t1[Text][List]
		
		if Entry then
			return Entry
		end
		local t2 = {}
		
		for i, value in List do
			local Text1: string = `{Text}.{i}`
			
			if t[Text1] ~= nil then
				error(`DevShell: method "{Text1}" is already registered`, 2)
			end
			t2[Text1] = value
		end
		for i1, value1 in t2 do
			t[i1] = value1
		end
		local v2 = v1
		
		if v2 ~= nil then
			pcall(function()
				-- upvalues: v2 (copy), HttpService (upval), config (upval)
				v2:Send(HttpService:JSONEncode({
					jsonrpc = "2.0",
					method = "shell.hello",
					params = config.hello()
				}))
			end)
		end
		local function unregister()
			-- upvalues: t2 (ref), t (upval), t1 (upval), Text (copy), List (copy), unregister (copy), v1 (upval), HttpService (upval), config (upval)
			for i, value in t2 do
				if t[i] == value then
					t[i] = nil
				end
			end
			t2 = {}
			local Entry = t1[Text]
			
			if Entry and Entry[List] == unregister then
				Entry[List] = nil
			end
			local v3 = v1
			
			if v3 ~= nil then
				pcall(function()
					-- upvalues: v3 (copy), HttpService (upval), config (upval)
					v3:Send(HttpService:JSONEncode({
						jsonrpc = "2.0",
						method = "shell.hello",
						params = config.hello()
					}))
				end)
				
				return
			end
		end
		
		t1[Text] = t1[Text] or {}
		t1[Text][List] = unregister
		
		return unregister
	end
	
	function config.handleRequest(p2)
		-- upvalues: t (copy), toError (upval)
		local IsTable = typeof(p2) == "table"
		local config = {
			result = nil,
			error = nil,
			id = if IsTable then p2.id else nil,
			jsonrpc = if IsTable then p2.jsonrpc else nil
		}
		
		if not IsTable or typeof(p2.method) ~= "string" then
			config.error = { message = "Invalid JSON-RPC request" }
			
			return config
		end
		local Entry = t[p2.method]
		
		if Entry == nil and not string.find(p2.method, ".", 1, true) then
			Entry = t[`memory.{p2.method}`]
		end
		if Entry == nil then
			config.error = {
				message = string.format("Unknown method \"%s\"", p2.method)
			}
			
			return config
		end
		local Success, Result = xpcall(function()
			-- upvalues: Entry (ref), p2 (copy)
			return Entry(p2.params)
		end, toError)
		
		if Success then
			config.result = Result
		else
			config.error = Result
		end
		return config
	end
	
	function config.isConnected(): boolean
		-- upvalues: v1 (ref)
		return v1 ~= nil
	end
	
	local ConnectWithRetry = nil
	
	local function tryConnect(): boolean
		-- upvalues: v1 (ref), WebSocketService (ref), p1 (copy), Flag (ref), ReconnectInterval (copy), ConnectWithRetry (ref), HttpService (upval), config (copy)
		if v1 ~= nil then
			return true
		end
		local WebSocketService1 = WebSocketService
		
		if WebSocketService1 == nil then
			return false
		end
		local Success, Result = pcall(function()
			-- upvalues: WebSocketService1 (copy), p1 (upval)
			return WebSocketService1:CreateClient(p1.host)
		end)
		
		if not Success or not Result then
			return false
		end
		v1 = Result
		Result.Closed:Connect(function()
			-- upvalues: v1 (upval), Result (copy), Flag (upval), ReconnectInterval (upval), ConnectWithRetry (upval)
			if v1 ~= Result then return end
			v1 = nil
			
			if Flag then
				task.delay(ReconnectInterval, ConnectWithRetry)
				
				return
			end
		end)
		Result.MessageReceived:Connect(function(Input)
			-- upvalues: HttpService (upval), Result (copy), config (upval)
			pcall(function()
				-- upvalues: HttpService (upval), Input (copy), Result (upval), config (upval)
				local Data = HttpService:JSONDecode(Input)
				
				if typeof(Data) ~= "table" or Data.id ~= nil then
					Result:Send(HttpService:JSONEncode(config.handleRequest(Data)))
					
					return
				end
			end)
		end)
		local v3 = v1
		
		if v3 ~= nil then
			pcall(function()
				-- upvalues: v3 (copy), HttpService (upval), config (upval)
				v3:Send(HttpService:JSONEncode({
					jsonrpc = "2.0",
					method = "shell.hello",
					params = config.hello()
				}))
			end)
		end
		return true
	end
	
	ConnectWithRetry = function()
		-- upvalues: Flag1 (ref), Flag (ref), v1 (ref), tryConnect (copy), ReconnectInterval (copy)
		if not Flag1 and Flag then
			Flag1 = true
			task.spawn(function()
				-- upvalues: Flag (upval), v1 (upval), tryConnect (upval), ReconnectInterval (upval), Flag1 (upval)
				while Flag and v1 == nil and not tryConnect() do
					task.wait(ReconnectInterval)
				end
				Flag1 = false
			end)
			
			return
		end
	end
	
	function config.start(p2)
		-- upvalues: List (copy), v1 (ref), HttpService (upval), config (copy), Flag (ref), p1 (copy), WebSocketService (ref), ConnectWithRetry (ref)
		if not table.find(List, p2.context) then
			table.insert(List, p2.context)
			local v3 = v1
			
			if v3 ~= nil then
				pcall(function()
					-- upvalues: v3 (copy), HttpService (upval), config (upval)
					v3:Send(HttpService:JSONEncode({
						jsonrpc = "2.0",
						method = "shell.hello",
						params = config.hello()
					}))
				end)
			end
		end
		if Flag or not p1.enabled then return end
		if WebSocketService == nil then
			local Success, Result = pcall(function()
				return game:GetService("WebSocketService")
			end)
			
			if not Success or Result == nil then return end
			WebSocketService = Result
		end
		Flag = true
		ConnectWithRetry()
	end
	
	function config.stop()
		-- upvalues: Flag (ref), v1 (ref)
		Flag = false
		local v3 = v1
		v1 = nil
		
		if v3 then
			pcall(function()
				-- upvalues: v3 (copy)
				v3:Close()
			end)
		end
	end
	
	return config
end