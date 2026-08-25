local error = require(script.Parent.Parent.LuauPolyfill).Error
local t = {}
t.__index = t

function t.new()
	-- upvalues: t (ref), error (ref)
	local t_1 = {}
	setmetatable(t_1, t)
	t_1.aborted = false
	t_1.reason = error.new("Undefined Error")
	t_1._signal = Instance.new("BindableEvent")
	
	return t_1
end

function t.abort(p0)
	-- upvalues: t (ref), error (ref)
	local var2 = t.new()
	var2.reason = p0 or error.new("Signal Aborted")
	
	return var2
end

function t.timeout(p1)
	-- upvalues: t (ref), error (ref)
	local var3 = t.new()
	var3.reason = error.new("TimeoutError")
	task.delay(p1 / 1000, function()
		-- upvalues: var3 (ref)
		var3:fire()
	end)
	
	return var3
end

function t:throwIfAborted()
	if self.aborted then
		error(self.reason)
	end
end

function t:connect(p2)
	return self._signal.Event:Connect(p2)
end

function t:fire()
	self.aborted = true
	self._signal:Fire()
end

return { AbortSignal = t }