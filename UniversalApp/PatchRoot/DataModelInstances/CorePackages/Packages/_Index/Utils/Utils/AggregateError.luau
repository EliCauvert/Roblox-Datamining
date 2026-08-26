local luauPolyfillModule = require(script.Parent.Parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local object = luauPolyfillModule.Object
local error = luauPolyfillModule.Error
local t = {}
local _ = nil
local _ = nil
local tbl = setmetatable({}, { __index = error })
tbl.__index = tbl

function tbl.new(p1, p2)
	-- upvalues: error (ref), tbl (write)
	local aggregateError = setmetatable(error.new(if p2 ~= nil then "" else p2), tbl)
	aggregateError.errors = p1
	aggregateError.name = "AggregateError"
	error.captureStackTrace(aggregateError, tbl.new)
	
	return aggregateError
end

t.AggregateError = setmetatable(tbl, {
	__call = function(_, p1, p2)
		-- upvalues: tbl (write)
		return tbl.new(p1, p2)
	end
})

function t.isAggregateError(p1)
	-- upvalues: array (ref), object (ref)
	return array.indexOf(object.keys(p1), "errors") ~= -1 and array.isArray(p1.errors)
end

return t