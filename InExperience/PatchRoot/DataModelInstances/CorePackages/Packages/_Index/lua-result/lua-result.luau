local t = {}
t.__index = t
local var1 = newproxy(true)

function t.new(p0, p1) --[[ line: 6 ]]
	-- upvalues: var1 (ref), t (ref)
	assert(typeof(p0) == "boolean")
	local t_1 = {
		_source = debug.traceback(),
		[var1] = true,
		_status = p0,
		_value = p1
	}
	setmetatable(t_1, t)
	
	return t_1
end

function t.success(p2) --[[ line: 27 ]]
	-- upvalues: t (ref)
	return t.new(true, p2)
end

function t.error(p3) --[[ line: 31 ]]
	-- upvalues: t (ref)
	return t.new(false, p3)
end

function t:is() --[[ line: 38 ]]
	-- upvalues: var1 (ref)
	return typeof(self) == "table" and self[var1]
end

function t:match(p4, p5) --[[ line: 51 ]]
	-- upvalues: t (ref)
	assert(if typeof(p4) ~= "function" then typeof(p4) == "nil" else true, string.format("Result:match expects successHandler to be a function or nil, got %s", typeof(p4)))
	assert(if typeof(p5) ~= "function" then typeof(p5) == "nil" else true, string.format("Result:match expects errorHandler to be a function or nil, got %s", typeof(p5)))
	local var3 = nil
	
	if self._status then
		if p4 == nil then
			return self
		end
		var3 = p4(self._value)
	elseif p5 == nil then
		return self
	end
	var3 = p5(self._value)
	return if t.is(var3) then var3 else t.success(var3)
end

function t:matchSuccess(p6) --[[ line: 83 ]]
	return self:match(p6, nil)
end

function t:matchError(p7) --[[ line: 92 ]]
	return self:match(nil, p7)
end

function t:unwrap() --[[ line: 96 ]]
	return self._status, self._value
end

return t