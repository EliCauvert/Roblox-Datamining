local httpService = game:GetService("HttpService")
local memoryTrackerModule = require(script.Parent.Parent.Common.MemoryTracker)
local garbageCollectorModule = require(script.Parent.Parent.Common.GarbageCollector)
local memoryShellHost = game:DefineFastString("MemoryShellHost", "ws://localhost:5013")
local t = {}
t.__index = t

local function _()
	-- upvalues: memoryTrackerModule (ref)
	return memoryTrackerModule()
end

local t_1 = {
	getLuaHeap = function()
		-- upvalues: garbageCollectorModule (ref), memoryTrackerModule (ref)
		garbageCollectorModule.collect()
		local var1 = memoryTrackerModule()
		
		return if var1 then var1.getLuaHeapOnly() else { luaHeapMb = "-1" }
	end,
	getSnapshot = function()
		-- upvalues: garbageCollectorModule (ref), memoryTrackerModule (ref)
		garbageCollectorModule.collect()
		local var1 = memoryTrackerModule()
		
		return if var1 then var1.getSnapshot() else { luaHeapMb = "-1" }
	end,
	forceGC = function()
		-- upvalues: garbageCollectorModule (ref)
		garbageCollectorModule.collect()
		
		return "ok"
	end
}

local function handleRequest(p1)
	-- upvalues: t_1 (ref)
	local t = {
		result = nil,
		error = nil,
		id = p1.id,
		jsonrpc = p1.jsonrpc
	}
	local method = t_1[p1.method]
	
	if method == nil then
		t.error = {
			message = string.format("Unknown method \"%s\"", tostring(p1.method))
		}
		
		return t
	end
	local ok, status = xpcall(method, function(p2)
		return debug.traceback(p2)
	end)
	
	if ok then
		t.result = status
		
		return t
	end
	t.error = { message = status }
	
	return t
end

local function tryConnect(p1)
	-- upvalues: memoryShellHost (ref), httpService (ref), handleRequest (ref)
	if not p1._WebSocketService then
		return false
	elseif p1._connected then
		return true
	end
	local var1 = nil
	
	return false
end

function t:_connectWithRetry()
	-- upvalues: tryConnect (ref)
	if self._retrying then
		return
	end
	task.spawn(function()
		-- upvalues: self (ref), tryConnect (copy)
		self._retrying = true
		while not self._connected and not tryConnect(self) do
			task.wait(5)
		end
		self._retrying = false
	end)
end

function t.new()
	-- upvalues: t (ref)
	return setmetatable({
		_connected = false,
		_retrying = false,
		_WebSocketService = nil
	}, t)
end

function t:start()
	if not self._WebSocketService then
		local var1 = nil
		
		return
	end
	self:_connectWithRetry()
end

function t:reconnect()
	self._connected = false
	self._retrying = false
	self:_connectWithRetry()
end

return t.new()