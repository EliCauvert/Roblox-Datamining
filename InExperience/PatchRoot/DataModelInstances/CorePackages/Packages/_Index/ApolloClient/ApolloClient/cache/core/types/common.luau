local t = {}
local parent = script.Parent.Parent.Parent.Parent
local parent_1 = parent.Parent
local error = require(parent_1.LuauPolyfill).Error
local _ = require(parent_1.GraphQL)
local _ = require(parent.utilities.graphql.types)
local tbl = setmetatable({}, { __index = error })
tbl.__index = tbl

function tbl.new(p0, p1, p2, p3)
	-- upvalues: error (ref), tbl (ref)
	local var2 = error.new(p0)
	var2.message = p0
	var2.path = p1
	var2.query = p2
	var2.variables = p3
	
	return setmetatable(var2, tbl)
end

t.MissingFieldError = tbl

return t