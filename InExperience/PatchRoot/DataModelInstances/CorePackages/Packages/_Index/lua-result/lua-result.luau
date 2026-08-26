local t = {}
t.__index = t
local var1 = newproxy(true)

function t.new(p1, p2)
	-- upvalues: var1 (ref), t (ref)
	assert(typeof(p1) == "boolean")
	local t_1 = {
		_source = debug.traceback(),
		[var1] = true,
		_status = p1,
		_value = p2
	}
	setmetatable(t_1, t)
	
	return t_1
end

function t.success(p1)
	-- upvalues: t (ref)
	return t.new(true, p1)
end

function t.error(p1)
	-- upvalues: t (ref)
	return t.new(false, p1)
end

function t:is()
	-- upvalues: var1 (ref)
	return typeof(self) == "table" and self[var1]
end

function t:match(p1, p2)
	-- upvalues: t (ref)
	assert(if typeof(p1) ~= "function" then typeof(p1) == "nil" else true, string.format("Result:match expects successHandler to be a function or nil, got %s", typeof(p1)))
	assert(if typeof(p2) ~= "function" then typeof(p2) == "nil" else true, string.format("Result:match expects errorHandler to be a function or nil, got %s", typeof(p2)))
	local var2 = nil
	
	if self._status then
		if p1 == nil then
			return self
		end
		var2 = p1(self._value)
	elseif p2 == nil then
		return self
	end
	var2 = p2(self._value)
	return if t.is(var2) then var2 else t.success(var2)
end

function t:matchSuccess(p1)
	return self:match(p1, nil)
end

function t:matchError(p1)
	return self:match(nil, p1)
end

function t:unwrap()
	return self._status, self._value
end

return t