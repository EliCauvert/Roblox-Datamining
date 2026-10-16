local Thread = nil

local function acquireRunnerThreadAndCallEventHandler(Callback: (any) -> (), ...) --[[ Line: 35 ]]
	-- upvalues: Thread (ref)
	local Thread1 = Thread
	Thread = nil
	Callback(...)
	Thread = Thread1
end

local function runEventHandlerInFreeThread() --[[ Line: 46 ]]
	-- upvalues: acquireRunnerThreadAndCallEventHandler (copy)
	while true do
		acquireRunnerThreadAndCallEventHandler(coroutine.yield())
	end
end

local Module = {}
Module.__index = Module

function Module.new(_signal, _fn) --[[ Line: 61 ]]
	-- upvalues: Module (copy)
	return (setmetatable({
		_connected = true,
		_next = false,
		_signal = _signal,
		_fn = _fn
	}, Module))
end

function Module:Disconnect() --[[ Line: 70 ]]
	self._connected = false
	
	if self._signal._handlerListHead == self then
		self._signal._handlerListHead = self._next
		
		return
	end
	local HandlerListHead1 = self._signal._handlerListHead
	while HandlerListHead1 and HandlerListHead1._next ~= self do
		HandlerListHead1 = HandlerListHead1._next
	end
	if HandlerListHead1 then
		HandlerListHead1._next = self._next
	end
end

setmetatable(Module, {
	__index = function(_, p1) --[[ Line: 92 ]]
		error(("Attempt to get Connection::%s (not a valid member)"):format((tostring(p1))), 2)
	end,
	__newindex = function(_, p1) --[[ Line: 95 ]]
		error(("Attempt to set Connection::%s (not a valid member)"):format((tostring(p1))), 2)
	end
})
local GoodSignalModule = {}
GoodSignalModule.__index = GoodSignalModule

function GoodSignalModule.new() --[[ Line: 115 ]]
	-- upvalues: GoodSignalModule (copy)
	return (setmetatable({ _handlerListHead = false }, GoodSignalModule))
end

function GoodSignalModule:Connect(Fn) --[[ Line: 121 ]]
	-- upvalues: Module (copy)
	local NewModule = Module.new(self, Fn)
	
	if self._handlerListHead then
		NewModule._next = self._handlerListHead
		self._handlerListHead = NewModule
		
		return NewModule
	else
		self._handlerListHead = NewModule
		
		return NewModule
	end
end

function GoodSignalModule:DisconnectAll() --[[ Line: 134 ]]
	self._handlerListHead = false
end

function GoodSignalModule:Fire(...) --[[ Line: 142 ]]
	-- upvalues: Thread (ref), runEventHandlerInFreeThread (copy)
	local HandlerListHead = self._handlerListHead
	while HandlerListHead do
		if HandlerListHead._connected then
			if not Thread then
				Thread = coroutine.create(runEventHandlerInFreeThread)
				coroutine.resume(Thread)
			end
			task.spawn(Thread, HandlerListHead._fn, ...)
		end
		HandlerListHead = HandlerListHead._next
	end
end

function GoodSignalModule:Wait() --[[ Line: 159 ]]
	local CurrentThread = coroutine.running()
	local Connection = nil
	Connection = self:Connect(function(...) --[[ Line: 162 ]]
		-- upvalues: Connection (ref), CurrentThread (copy)
		Connection:Disconnect()
		task.spawn(CurrentThread, ...)
	end)
	
	return coroutine.yield()
end

function GoodSignalModule:Once(Callback) --[[ Line: 171 ]]
	local Connection = nil
	Connection = self:Connect(function(...) --[[ Line: 173 ]]
		-- upvalues: Connection (ref), Callback (copy)
		if Connection._connected then
			Connection:Disconnect()
		end
		Callback(...)
	end)
	
	return Connection
end

setmetatable(GoodSignalModule, {
	__index = function(_, p1) --[[ Line: 184 ]]
		error(("Attempt to get Signal::%s (not a valid member)"):format((tostring(p1))), 2)
	end,
	__newindex = function(_, p1) --[[ Line: 187 ]]
		error(("Attempt to set Signal::%s (not a valid member)"):format((tostring(p1))), 2)
	end
})

return GoodSignalModule