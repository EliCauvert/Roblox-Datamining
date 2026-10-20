local Thread = nil

local function acquireRunnerThreadAndCallEventHandler(Callback: (any) -> (), ...)
	-- upvalues: Thread (ref)
	local Thread1 = Thread
	Thread = nil
	Callback(...)
	Thread = Thread1
end

local function runEventHandlerInFreeThread()
	-- upvalues: acquireRunnerThreadAndCallEventHandler (copy)
	while true do
		acquireRunnerThreadAndCallEventHandler(coroutine.yield())
	end
end

local Module = {}
Module.__index = Module

function Module.new(_signal, _fn)
	-- upvalues: Module (copy)
	return (setmetatable({
		_connected = true,
		_next = false,
		_signal = _signal,
		_fn = _fn
	}, Module))
end

function Module:Disconnect()
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
	__index = function(_, p1)
		error(("Attempt to get Connection::%s (not a valid member)"):format((tostring(p1))), 2)
	end,
	__newindex = function(_, p1)
		error(("Attempt to set Connection::%s (not a valid member)"):format((tostring(p1))), 2)
	end
})
local GoodSignalModule = {}
GoodSignalModule.__index = GoodSignalModule

function GoodSignalModule.new()
	-- upvalues: GoodSignalModule (copy)
	return (setmetatable({ _handlerListHead = false }, GoodSignalModule))
end

function GoodSignalModule:Connect(Fn)
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

function GoodSignalModule:DisconnectAll()
	self._handlerListHead = false
end

function GoodSignalModule:Fire(...)
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

function GoodSignalModule:Wait()
	local CurrentThread = coroutine.running()
	local Connection = nil
	Connection = self:Connect(function(...)
		-- upvalues: Connection (ref), CurrentThread (copy)
		Connection:Disconnect()
		task.spawn(CurrentThread, ...)
	end)
	
	return coroutine.yield()
end

function GoodSignalModule:Once(Callback)
	local Connection = nil
	Connection = self:Connect(function(...)
		-- upvalues: Connection (ref), Callback (copy)
		if Connection._connected then
			Connection:Disconnect()
		end
		Callback(...)
	end)
	
	return Connection
end

setmetatable(GoodSignalModule, {
	__index = function(_, p1)
		error(("Attempt to get Signal::%s (not a valid member)"):format((tostring(p1))), 2)
	end,
	__newindex = function(_, p1)
		error(("Attempt to set Signal::%s (not a valid member)"):format((tostring(p1))), 2)
	end
})

return GoodSignalModule