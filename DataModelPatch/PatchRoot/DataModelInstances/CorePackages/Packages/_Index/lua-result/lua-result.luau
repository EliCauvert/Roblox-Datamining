local Module = {}
Module.__index = Module
local Proxy = newproxy(true)

function Module.new(_status, _value)
	-- upvalues: Proxy (copy), Module (copy)
	assert(typeof(_status) == "boolean")
	local config = {
		_source = debug.traceback(),
		[Proxy] = true,
		_status = _status,
		_value = _value
	}
	setmetatable(config, Module)
	
	return config
end

function Module.success(p1)
	-- upvalues: Module (copy)
	return Module.new(true, p1)
end

function Module.error(p1)
	-- upvalues: Module (copy)
	return Module.new(false, p1)
end

function Module:is()
	-- upvalues: Proxy (copy)
	return typeof(self) == "table" and self[Proxy]
end

function Module:match(Callback, Callback1)
	-- upvalues: Module (copy)
	assert(typeof(Callback) == "function" or typeof(Callback) == "nil", string.format("Result:match expects successHandler to be a function or nil, got %s", (typeof(Callback))))
	assert(typeof(Callback1) == "function" or typeof(Callback1) == "nil", string.format("Result:match expects errorHandler to be a function or nil, got %s", (typeof(Callback1))))
	local v1 = nil
	
	if self._status then
		if Callback == nil then
			return self
		end
		v1 = Callback(self._value)
	else
		if Callback1 == nil then
			return self
		end
		v1 = Callback1(self._value)
	end
	return if Module.is(v1) then v1 else Module.success(v1)
end

function Module:matchSuccess(p1)
	return self:match(p1, nil)
end

function Module:matchError(p1)
	return self:match(nil, p1)
end

function Module:unwrap()
	return self._status, self._value
end

return Module