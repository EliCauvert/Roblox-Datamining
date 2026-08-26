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
	locatedError = function(p1, p2, p3)
		-- upvalues: instanceof (ref), error (ref), inspect (ref), array (ref), graphQLError (ref)
		local _ = nil
		local var1 = if instanceof(p1, error) then p1 elseif typeof(p1) == "table" and typeof(p1.message) == "string" and p1.stack ~= nil then error.new(p1.message) elseif typeof(p1) == "table" and typeof(p1.error) == "string" then error.new("Unexpected error value: " .. inspect(p1.error)) else error.new("Unexpected error value: " .. inspect(p1))
		
		return if array.isArray(var1.path) then var1 else graphQLError.new(var1.message, var1.nodes or p2, var1.source, var1.positions, p3, var1)
	end
}