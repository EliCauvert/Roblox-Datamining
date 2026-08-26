local t = {}
local parent = script.Parent.Parent.Parent.Parent
local parent_1 = parent.Parent
local error = require(parent_1.LuauPolyfill).Error
local _ = require(parent_1.GraphQL)
local _ = require(parent.utilities.graphql.types)
local tbl = setmetatable({}, { __index = error })
tbl.__index = tbl

function tbl.new(p1, p2, p3, p4)
	-- upvalues: error (ref), tbl (ref)
	local var1 = error.new(p1)
	var1.message = p1
	var1.path = p2
	var1.query = p3
	var1.variables = p4
	
	return setmetatable(var1, tbl)
end

t.MissingFieldError = tbl

return t