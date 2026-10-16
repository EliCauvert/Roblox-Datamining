local _ = require(script.Parent.Parent.Parent.LuauPolyfill)
local _ = require(script.Parent.source)
local _ = require(script.Parent.tokenKind)
local Module = {}
Module.__index = Module

function Module.new(StartToken, EndToken, Source) --[[ Line: 50 ]]
	-- upvalues: Module (copy)
	return (setmetatable({
		start = StartToken.start,
		_end = EndToken._end,
		startToken = StartToken,
		endToken = EndToken,
		source = Source
	}, Module))
end

function Module:toJSON() --[[ Line: 62 ]]
	return { start = self.start, _end = self._end }
end

local Module1 = {}
Module1.__index = Module1

function Module1.new(Kind, Start, _end, Line, Column, Prev, Value) --[[ Line: 138 ]]
	-- upvalues: Module1 (copy)
	return (setmetatable({
		kind = Kind,
		start = Start,
		_end = _end,
		line = Line,
		column = Column,
		value = Value,
		prev = Prev,
		next = nil
	}, Module1))
end

function Module1:toJSON() --[[ Line: 161 ]]
	return {
		kind = self.kind,
		value = self.value,
		line = self.line,
		column = self.column
	}
end

return {
	Location = Module,
	Token = Module1,
	isNode = function(p1): boolean --[[ Line: 181 ]]
		return typeof(p1) == "table" and typeof(p1.kind) == "string"
	end
}