local ByteFunction = string.byte
local AsciiMatcherModule = {}
AsciiMatcherModule.__index = AsciiMatcherModule
local Module = {}
Module.__index = Module

function AsciiMatcherModule.new(p1)
	-- upvalues: AsciiMatcherModule (copy)
	return (setmetatable({ _set = p1._set }, AsciiMatcherModule))
end

function AsciiMatcherModule:matches(p1): boolean
	return self._set[p1] == true
end

function AsciiMatcherModule:newBuilder()
	-- upvalues: Module (copy)
	return Module.new(table.clone(self._set))
end

function AsciiMatcherModule.builder()
	-- upvalues: Module (copy)
	return Module.new({})
end

function AsciiMatcherModule:builderMatcher()
	-- upvalues: Module (copy)
	return Module.new(table.clone(self._set))
end

function Module.new(_set)
	-- upvalues: Module (copy)
	return (setmetatable({ _set = _set }, Module))
end

function Module:c(p1: number)
	if p1 > 127 then
		error("Can only match ASCII characters")
	end
	self._set[p1] = true
	
	return self
end

function Module:anyOf(p1)
	-- upvalues: ByteFunction (copy)
	for i = 0, #p1 - 1 do
		self:c(ByteFunction(p1, i + 1))
	end
	return self
end

function Module:anyOfSet(List)
	for i in List do
		self:c(i)
	end
	return self
end

function Module:range(p2, p3)
	for i = p2, p3 do
		self:c(i)
	end
	return self
end

function Module.build(p4)
	-- upvalues: AsciiMatcherModule (copy)
	return AsciiMatcherModule.new(p4)
end

AsciiMatcherModule.Builder = Module

return AsciiMatcherModule