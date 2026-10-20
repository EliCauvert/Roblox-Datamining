local Error1 = require(script.Parent.Parent.LuauPolyfill).Error
local Module = {}
Module.__index = Module

function Module.new()
	-- upvalues: Module (copy), Error1 (copy)
	local t = {}
	setmetatable(t, Module)
	t.aborted = false
	t.reason = Error1.new("Undefined Error")
	t._signal = Instance.new("BindableEvent")
	
	return t
end

function Module.abort(p1)
	-- upvalues: Module (copy), Error1 (copy)
	local NewModule = Module.new()
	NewModule.reason = p1 or Error1.new("Signal Aborted")
	
	return NewModule
end

function Module.timeout(p1: number)
	-- upvalues: Module (copy), Error1 (copy)
	local NewModule = Module.new()
	NewModule.reason = Error1.new("TimeoutError")
	task.delay(p1 / 1000, function()
		-- upvalues: NewModule (copy)
		NewModule:fire()
	end)
	
	return NewModule
end

function Module:throwIfAborted()
	if self.aborted then
		error(self.reason)
	end
end

function Module:connect(Callback)
	return self._signal.Event:Connect(Callback)
end

function Module:fire()
	self.aborted = true
	self._signal:Fire()
end

return { AbortSignal = Module }