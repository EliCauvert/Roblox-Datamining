local parent = script.Parent
local parent_1 = parent.Parent
local luauPolyfillModule = require(parent_1.Parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local error = luauPolyfillModule.Error
local instanceof = luauPolyfillModule.instanceof
local inspect = require(parent_1.jsutils.inspect).inspect
local _ = require(parent_1.language.ast)
local graphQLError = require(parent.GraphQLError).GraphQLError

return {
	locatedError = function(p0, p1, p2) --[[ line: 30 ]]
		-- upvalues: instanceof (ref), error (ref), inspect (ref), array (ref), graphQLError (ref)
		local _ = nil
		local var1 = if instanceof(p0, error) then p0 elseif typeof(p0) == "table" and typeof(p0.message) == "string" and p0.stack ~= nil then error.new(p0.message) elseif typeof(p0) == "table" and typeof(p0.error) == "string" then error.new("Unexpected error value: " .. inspect(p0.error)) else error.new("Unexpected error value: " .. inspect(p0))
		
		return if array.isArray(var1.path) then var1 else graphQLError.new(var1.message, var1.nodes or p1, var1.source, var1.positions, p2, var1)
	end
}