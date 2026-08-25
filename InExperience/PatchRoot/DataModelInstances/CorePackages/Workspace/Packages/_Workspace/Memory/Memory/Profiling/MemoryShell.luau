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
		local var8 = memoryTrackerModule()
		
		return if var8 then var8.getLuaHeapOnly() else { luaHeapMb = "-1" }
	end,
	getSnapshot = function()
		-- upvalues: garbageCollectorModule (ref), memoryTrackerModule (ref)
		garbageCollectorModule.collect()
		local var9 = memoryTrackerModule()
		
		return if var9 then var9.getSnapshot() else { luaHeapMb = "-1" }
	end,
	forceGC = function()
		-- upvalues: garbageCollectorModule (ref)
		garbageCollectorModule.collect()
		
		return "ok"
	end
}

local function handleRequest(p0)
	-- upvalues: t_1 (ref)
	local t = {
		result = nil,
		error = nil,
		id = p0.id,
		jsonrpc = p0.jsonrpc
	}
	local method = t_1[p0.method]
	
	if method == nil then
		t.error = {
			message = string.format("Unknown method \"%s\"", tostring(p0.method))
		}
		
		return t
	end
	local ok, status = xpcall(method, function(p1)
		return debug.traceback(p1)
	end)
	
	if ok then
		t.result = status
		
		return t
	end
	t.error = { message = status }
	
	return t
end

local function tryConnect(p2)
	-- upvalues: memoryShellHost (ref), httpService (ref), handleRequest (ref)
	if not p2._WebSocketService then
		return false
	elseif p2._connected then
		return true
	end
	local var11 = nil
	
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
		local var12 = nil
		
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