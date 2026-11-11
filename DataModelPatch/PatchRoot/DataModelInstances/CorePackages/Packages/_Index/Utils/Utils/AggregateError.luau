local LuauPolyfillModule = require(script.Parent.Parent.LuauPolyfill)
local Array = LuauPolyfillModule.Array
local Object = LuauPolyfillModule.Object
local Error = LuauPolyfillModule.Error
local self = nil
self = setmetatable({}, { __index = Error })
self.__index = self

function self.new(Errors, p1)
	-- upvalues: Error (copy), self (ref)
	local self1 = setmetatable(Error.new(if p1 == nil then "" else p1), self)
	self1.errors = Errors
	self1.name = "AggregateError"
	Error.captureStackTrace(self1, self.new)
	
	return self1
end

return {
	AggregateError = setmetatable(self, {
		__call = function(_, Errors, p1)
			-- upvalues: self (ref)
			return self.new(Errors, p1)
		end
	}),
	isAggregateError = function(p1)
		-- upvalues: Array (copy), Object (copy)
		return Array.indexOf(Object.keys(p1), "errors") ~= -1 and Array.isArray(p1.errors)
	end
}