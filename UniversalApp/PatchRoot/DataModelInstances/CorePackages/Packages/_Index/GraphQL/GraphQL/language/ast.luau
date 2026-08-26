local _ = require(script.Parent.Parent.Parent.LuauPolyfill)
local _ = require(script.Parent.source)
local _ = require(script.Parent.tokenKind)
local t = {}
t.__index = t

function t.new(p1, p2, p3)
	-- upvalues: t (ref)
	return setmetatable({
		start = p1.start,
		_end = p2._end,
		startToken = p1,
		endToken = p2,
		source = p3
	}, t)
end

function t:toJSON()
	return { start = self.start, _end = self._end }
end

local t_1 = {}
t_1.__index = t_1

function t_1.new(p1, p2, p3, p4, p5, p6, p7)
	-- upvalues: t_1 (ref)
	return setmetatable({
		kind = p1,
		start = p2,
		_end = p3,
		line = p4,
		column = p5,
		value = p7,
		prev = p6,
		next = nil
	}, t_1)
end

function t_1:toJSON()
	return {
		kind = self.kind,
		value = self.value,
		line = self.line,
		column = self.column
	}
end

return {
	Location = t,
	Token = t_1,
	isNode = function(p1)
		return typeof(p1) == "table" and typeof(p1.kind) == "string"
	end
}