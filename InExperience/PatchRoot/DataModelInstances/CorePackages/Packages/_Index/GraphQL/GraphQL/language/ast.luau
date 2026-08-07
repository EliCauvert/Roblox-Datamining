local _ = require(script.Parent.Parent.Parent.LuauPolyfill)
local _ = require(script.Parent.source)
local _ = require(script.Parent.tokenKind)
local t = {}
t.__index = t

function t.new(p0, p1, p2) --[[ line: 50 ]]
	-- upvalues: t (ref)
	return setmetatable({
		start = p0.start,
		_end = p1._end,
		startToken = p0,
		endToken = p1,
		source = p2
	}, t)
end

function t:toJSON() --[[ line: 62 ]]
	return { start = self.start, _end = self._end }
end

local t_1 = {}
t_1.__index = t_1

function t_1.new(p3, p4, p5, p6, p7, p8, p9) --[[ line: 138 ]]
	-- upvalues: t_1 (ref)
	return setmetatable({
		kind = p3,
		start = p4,
		_end = p5,
		line = p6,
		column = p7,
		value = p9,
		prev = p8,
		next = nil
	}, t_1)
end

function t_1:toJSON() --[[ line: 161 ]]
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
	isNode = function(p10) --[[ line: 181 ]]
		return typeof(p10) == "table" and typeof(p10.kind) == "string"
	end
}