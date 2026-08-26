local var1 = nil

local function acquireRunnerThreadAndCallEventHandler(p1, ...)
	-- upvalues: var1 (write)
	var1 = nil
	p1(...)
	var1 = var1
end

local function runEventHandlerInFreeThread()
	-- upvalues: acquireRunnerThreadAndCallEventHandler (ref)
	while true do
		acquireRunnerThreadAndCallEventHandler(coroutine.yield())
	end
end

local t = {}
t.__index = t

function t.new(p1, p2)
	-- upvalues: t (ref)
	return setmetatable({ _connected = true, _next = false, _signal = p1, _fn = p2 }, t)
end

function t:Disconnect()
	self._connected = false
	
	if self._signal._handlerListHead == self then
		self._signal._handlerListHead = self._next
		
		return
	end
	local handlerListHead = self._signal._handlerListHead
	while handlerListHead and handlerListHead._next ~= self do
		handlerListHead = handlerListHead._next
	end
	if handlerListHead then
		handlerListHead._next = self._next
	end
end

setmetatable(t, {
	__index = function(_, p1)
		error(("Attempt to get Connection::%s (not a valid member)"):format(tostring(p1)), 2)
	end,
	__newindex = function(_, p1)
		error(("Attempt to set Connection::%s (not a valid member)"):format(tostring(p1)), 2)
	end
})
local t_1 = {}
t_1.__index = t_1

function t_1.new()
	-- upvalues: t_1 (ref)
	return setmetatable({ _handlerListHead = false }, t_1)
end

function t_1:Connect(p1)
	-- upvalues: t (ref)
	local var2 = t.new(self, p1)
	
	if self._handlerListHead then
		var2._next = self._handlerListHead
		self._handlerListHead = var2
		
		return var2
	end
	self._handlerListHead = var2
	
	return var2
end

function t_1:DisconnectAll()
	self._handlerListHead = false
end

function t_1:Fire(...)
	-- upvalues: var1 (write), runEventHandlerInFreeThread (ref)
	local handlerListHead = self._handlerListHead
	while handlerListHead do
		if handlerListHead._connected then
			if not var1 then
				var1 = coroutine.create(runEventHandlerInFreeThread)
				coroutine.resume(var1)
			end
			task.spawn(var1, handlerListHead._fn, ...)
		end
		handlerListHead = handlerListHead._next
	end
end

function t_1:Wait()
	local currentThread = coroutine.running()
	local var2 = nil
	var2 = self:Connect(function(...)
		-- upvalues: var2 (write), currentThread (ref)
		var2:Disconnect()
		task.spawn(currentThread, ...)
	end)
	
	return coroutine.yield()
end

function t_1:Once(p1)
	local var2 = nil
	
	return self:Connect(function(...)
		-- upvalues: var2 (write), p1 (ref)
		if var2._connected then
			var2:Disconnect()
		end
		p1(...)
	end)
end

setmetatable(t_1, {
	__index = function(_, p1)
		error(("Attempt to get Signal::%s (not a valid member)"):format(tostring(p1)), 2)
	end,
	__newindex = function(_, p1)
		error(("Attempt to set Signal::%s (not a valid member)"):format(tostring(p1)), 2)
	end
})

return t_1