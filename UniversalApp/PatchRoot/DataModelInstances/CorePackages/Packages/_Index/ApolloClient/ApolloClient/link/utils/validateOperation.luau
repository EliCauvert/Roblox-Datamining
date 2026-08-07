local t = {}
local parent = script.Parent.Parent.Parent
local luauPolyfillModule = require(parent.Parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local object = luauPolyfillModule.Object
local invariantError = require(parent.jsutils.invariant).InvariantError
local _ = require(script.Parent.Parent.core.types)

function t.validateOperation(p0) --[[ line: 19 ]]
	-- upvalues: object (ref), array (ref), invariantError (ref)
	local list = {
		"query",
		"operationName",
		"variables",
		"extensions",
		"context"
	}
	
	for i, v in ipairs(object.keys(p0)) do
		if array.indexOf(list, v) < 0 then
			error(invariantError.new(("illegal argument: %s"):format(v)))
		end
	end
	return p0
end

return t