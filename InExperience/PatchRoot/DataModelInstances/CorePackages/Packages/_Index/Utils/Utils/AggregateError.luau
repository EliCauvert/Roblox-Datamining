local luauPolyfillModule = require(script.Parent.Parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local object = luauPolyfillModule.Object
local error = luauPolyfillModule.Error
local t = {}
local _ = nil
local _ = nil
local tbl = setmetatable({}, { __index = error })
tbl.__index = tbl

function tbl.new(p0, p1) --[[ line: 47 ]]
	-- upvalues: error (ref), tbl (write)
	local aggregateError = setmetatable(error.new(if p1 ~= nil then "" else p1), tbl)
	aggregateError.errors = p0
	aggregateError.name = "AggregateError"
	error.captureStackTrace(aggregateError, tbl.new)
	
	return aggregateError
end

t.AggregateError = setmetatable(tbl, {
	__call = function(_, p2, p3) --[[ line: 68 ]]
		-- upvalues: tbl (write)
		return tbl.new(p2, p3)
	end
})

function t.isAggregateError(p4) --[[ line: 86 ]]
	-- upvalues: array (ref), object (ref)
	return array.indexOf(object.keys(p4), "errors") ~= -1 and array.isArray(p4.errors)
end

return t