local var0 = nil

local function acquireRunnerThreadAndCallEventHandler(p0, ...) --[[ line: 35 ]]
	-- upvalues: var0 (write)
	var0 = nil
	p0(...)
	var0 = var0
end

local function runEventHandlerInFreeThread() --[[ line: 46 ]]
	-- upvalues: acquireRunnerThreadAndCallEventHandler (ref)
	while true do
		acquireRunnerThreadAndCallEventHandler(coroutine.yield())
	end
end

local t = {}
t.__index = t

function t.new(p1, p2) --[[ line: 61 ]]
	-- upvalues: t (ref)
	return setmetatable({ _connected = true, _next = false, _signal = p1, _fn = p2 }, t)
end

function t:Disconnect() --[[ line: 70 ]]
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
	__index = function(_, p3) --[[ line: 92 ]]
		error(("Attempt to get Connection::%s (not a valid member)"):format(tostring(p3)), 2)
	end,
	__newindex = function(_, p4) --[[ line: 95 ]]
		error(("Attempt to set Connection::%s (not a valid member)"):format(tostring(p4)), 2)
	end
})
local t_1 = {}
t_1.__index = t_1

function t_1.new() --[[ line: 115 ]]
	-- upvalues: t_1 (ref)
	return setmetatable({ _handlerListHead = false }, t_1)
end

function t_1:Connect(p5) --[[ line: 121 ]]
	-- upvalues: t (ref)
	local var5 = t.new(self, p5)
	
	if self._handlerListHead then
		var5._next = self._handlerListHead
		self._handlerListHead = var5
		
		return var5
	end
	self._handlerListHead = var5
	
	return var5
end

function t_1:DisconnectAll() --[[ line: 134 ]]
	self._handlerListHead = false
end

function t_1:Fire(...) --[[ line: 142 ]]
	-- upvalues: var0 (write), runEventHandlerInFreeThread (ref)
	local handlerListHead = self._handlerListHead
	while handlerListHead do
		if handlerListHead._connected then
			if not var0 then
				var0 = coroutine.create(runEventHandlerInFreeThread)
				coroutine.resume(var0)
			end
			task.spawn(var0, handlerListHead._fn, ...)
		end
		handlerListHead = handlerListHead._next
	end
end

function t_1:Wait() --[[ line: 159 ]]
	local currentThread = coroutine.running()
	local var7 = nil
	var7 = self:Connect(function(...) --[[ line: 162 ]]
		-- upvalues: var7 (write), currentThread (ref)
		var7:Disconnect()
		task.spawn(currentThread, ...)
	end)
	
	return coroutine.yield()
end

function t_1:Once(p6) --[[ line: 171 ]]
	local var8 = nil
	
	return self:Connect(function(...) --[[ line: 173 ]]
		-- upvalues: var8 (write), p6 (ref)
		if var8._connected then
			var8:Disconnect()
		end
		p6(...)
	end)
end

setmetatable(t_1, {
	__index = function(_, p7) --[[ line: 184 ]]
		error(("Attempt to get Signal::%s (not a valid member)"):format(tostring(p7)), 2)
	end,
	__newindex = function(_, p8) --[[ line: 187 ]]
		error(("Attempt to set Signal::%s (not a valid member)"):format(tostring(p8)), 2)
	end
})

return t_1