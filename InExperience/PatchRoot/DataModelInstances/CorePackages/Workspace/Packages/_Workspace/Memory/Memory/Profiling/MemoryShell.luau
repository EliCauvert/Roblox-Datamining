local HttpService = game:GetService("HttpService")
local MemoryTrackerModule = require(script.Parent.Parent.Common.MemoryTracker)
local GarbageCollectorModule = require(script.Parent.Parent.Common.GarbageCollector)
local MemoryShellHost = game:DefineFastString("MemoryShellHost", "ws://localhost:5013")
local Module = {}
Module.__index = Module

local function _()
	-- upvalues: MemoryTrackerModule (copy)
	return MemoryTrackerModule()
end

local config = {
	getLuaHeap = function()
		-- upvalues: GarbageCollectorModule (copy), MemoryTrackerModule (copy)
		GarbageCollectorModule.collect()
		local MemoryTrackerModuleResult = MemoryTrackerModule()
		
		return if MemoryTrackerModuleResult then MemoryTrackerModuleResult.getLuaHeapOnly() else { luaHeapMb = "-1" }
	end,
	getSnapshot = function()
		-- upvalues: GarbageCollectorModule (copy), MemoryTrackerModule (copy)
		GarbageCollectorModule.collect()
		local MemoryTrackerModuleResult = MemoryTrackerModule()
		
		return if MemoryTrackerModuleResult then MemoryTrackerModuleResult.getSnapshot() else { luaHeapMb = "-1" }
	end,
	forceGC = function(): string
		-- upvalues: GarbageCollectorModule (copy)
		GarbageCollectorModule.collect()
		
		return "ok"
	end
}

local function handleRequest(p1)
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
	local Success, Result = xpcall(Entry, function(Err)
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

local function tryConnect(p1): boolean
	-- upvalues: MemoryShellHost (copy), HttpService (copy), handleRequest (copy)
	if not p1._WebSocketService then
		return false
	elseif p1._connected then
		return true
	else
		local Client = nil
		
		if pcall(function()
			-- upvalues: Client (ref), p1 (copy), MemoryShellHost (copy)
			Client = p1._WebSocketService:CreateClient(MemoryShellHost)
		end) and Client then
			p1._connected = true
			Client.Closed:Connect(function()
				-- upvalues: p1 (copy)
				p1._connected = false
				p1:_connectWithRetry()
			end)
			Client.MessageReceived:Connect(function(Input)
				-- upvalues: HttpService (upval), handleRequest (upval), Client (ref)
				xpcall(function()
					-- upvalues: HttpService (upval), Input (copy), handleRequest (upval), Client (upval)
					Client:Send(HttpService:JSONEncode((handleRequest((HttpService:JSONDecode(Input))))))
				end, function() end)
			end)
			
			return true
		else
			return false
		end
	end
end

function Module:_connectWithRetry()
	-- upvalues: tryConnect (copy)
	if not self._retrying then
		task.spawn(function()
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

function Module.new()
	-- upvalues: Module (copy)
	return (setmetatable({
		_connected = false,
		_retrying = false,
		_WebSocketService = nil
	}, Module))
end

function Module:start()
	if not self._WebSocketService then
		local WebSocketService = nil
		
		if not pcall(function()
			-- upvalues: WebSocketService (ref)
			WebSocketService = game:GetService("WebSocketService")
		end) or not WebSocketService then return end
		self._WebSocketService = WebSocketService
	end
	self:_connectWithRetry()
end

function Module:reconnect()
	self._connected = false
	self._retrying = false
	self:_connectWithRetry()
end

return Module.new()