local HttpService = game:GetService("HttpService")
local MemoryTrackerModule = require(script.Parent.Parent.Common.MemoryTracker)
local GarbageCollectorModule = require(script.Parent.Parent.Common.GarbageCollector)
local MemoryShellHost = game:DefineFastString("MemoryShellHost", "ws://localhost:5013")
local Module = {}
Module.__index = Module

local function _() --[[ Line: 23 | Named "getMemoryTracker" ]]
	-- upvalues: MemoryTrackerModule (copy)
	return MemoryTrackerModule()
end

local config = {
	getLuaHeap = function() --[[ Line: 28 ]]
		-- upvalues: GarbageCollectorModule (copy), MemoryTrackerModule (copy)
		GarbageCollectorModule.collect()
		local MemoryTrackerModuleResult = MemoryTrackerModule()
		
		return if MemoryTrackerModuleResult then MemoryTrackerModuleResult.getLuaHeapOnly() else { luaHeapMb = "-1" }
	end,
	getSnapshot = function() --[[ Line: 36 ]]
		-- upvalues: GarbageCollectorModule (copy), MemoryTrackerModule (copy)
		GarbageCollectorModule.collect()
		local MemoryTrackerModuleResult = MemoryTrackerModule()
		
		return if MemoryTrackerModuleResult then MemoryTrackerModuleResult.getSnapshot() else { luaHeapMb = "-1" }
	end,
	forceGC = function(): string --[[ Line: 44 ]]
		-- upvalues: GarbageCollectorModule (copy)
		GarbageCollectorModule.collect()
		
		return "ok"
	end
}

local function handleRequest(p1) --[[ Line: 50 ]]
	-- upvalues: config (copy)
	local config1 = {
		result = nil,
		error = nil,
		id = p1.id,
		jsonrpc = p1.jsonrpc
	}
	local Entry = config[p1.method]
	
	if Entry == nil then
		config1.error = {
			message = string.format("Unknown method \"%s\"", (tostring(p1.method)))
		}
		
		return config1
	end
	local Success, Result = xpcall(Entry, function(Err) --[[ Line: 62 ]]
		return debug.traceback(Err)
	end)
	
	if Success then
		config1.result = Result
		
		return config1
	else
		config1.error = { message = Result }
		
		return config1
	end
end

local function tryConnect(p1): boolean --[[ Line: 75 ]]
	-- upvalues: MemoryShellHost (copy), HttpService (copy), handleRequest (copy)
	if not p1._WebSocketService then
		return false
	elseif p1._connected then
		return true
	else
		local Client = nil
		
		if pcall(function() --[[ Line: 86 ]]
			-- upvalues: Client (ref), p1 (copy), MemoryShellHost (copy)
			Client = p1._WebSocketService:CreateClient(MemoryShellHost)
		end) and Client then
			p1._connected = true
			Client.Closed:Connect(function() --[[ Line: 95 ]]
				-- upvalues: p1 (copy)
				p1._connected = false
				p1:_connectWithRetry()
			end)
			Client.MessageReceived:Connect(function(Input) --[[ Line: 100 ]]
				-- upvalues: HttpService (upval), handleRequest (upval), Client (ref)
				xpcall(function() --[[ Line: 101 ]]
					-- upvalues: HttpService (upval), Input (copy), handleRequest (upval), Client (upval)
					Client:Send(HttpService:JSONEncode((handleRequest((HttpService:JSONDecode(Input))))))
				end, function() --[[ Line: 105 ]] end)
			end)
			
			return true
		else
			return false
		end
	end
end

function Module:_connectWithRetry() --[[ Line: 111 ]]
	-- upvalues: tryConnect (copy)
	if not self._retrying then
		task.spawn(function() --[[ Line: 115 ]]
			-- upvalues: self (copy), tryConnect (upval)
			self._retrying = true
			while not self._connected and not tryConnect(self) do
				task.wait(5)
			end
			self._retrying = false
		end)
		
		return
	end
end

function Module.new() --[[ Line: 127 ]]
	-- upvalues: Module (copy)
	return (setmetatable({
		_connected = false,
		_retrying = false,
		_WebSocketService = nil
	}, Module))
end

function Module:start() --[[ Line: 136 ]]
	if not self._WebSocketService then
		local WebSocketService = nil
		
		if not pcall(function() --[[ Line: 139 ]]
			-- upvalues: WebSocketService (ref)
			WebSocketService = game:GetService("WebSocketService")
		end) or not WebSocketService then return end
		self._WebSocketService = WebSocketService
	end
	self:_connectWithRetry()
end

function Module:reconnect() --[[ Line: 151 ]]
	self._connected = false
	self._retrying = false
	self:_connectWithRetry()
end

return Module.new()