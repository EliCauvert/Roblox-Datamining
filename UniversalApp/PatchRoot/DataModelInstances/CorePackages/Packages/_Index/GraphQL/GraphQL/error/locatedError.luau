local Parent = script.Parent
local Parent1 = Parent.Parent
local LuauPolyfillModule = require(Parent1.Parent.LuauPolyfill)
local Array = LuauPolyfillModule.Array
local Error = LuauPolyfillModule.Error
local InstanceofFunction = LuauPolyfillModule.instanceof
local InspectFunction = require(Parent1.jsutils.inspect).inspect
local _ = require(Parent1.language.ast)
local GraphQLError = require(Parent.GraphQLError).GraphQLError

return {
	locatedError = function(p1, p2, p3) --[[ Line: 30 ]]
		-- upvalues: InstanceofFunction (copy), Error (copy), InspectFunction (copy), Array (copy), GraphQLError (copy)
		local NewError = if InstanceofFunction(p1, Error) then p1 elseif typeof(p1) == "table" and typeof(p1.message) == "string" and p1.stack ~= nil then Error.new(p1.message) elseif typeof(p1) == "table" and typeof(p1.error) == "string" then Error.new("Unexpected error value: " .. InspectFunction(p1.error)) else Error.new("Unexpected error value: " .. InspectFunction(p1))
		
		return if Array.isArray(NewError.path) then NewError else GraphQLError.new(NewError.message, NewError.nodes or p2, NewError.source, NewError.positions, p3, NewError)
	end
}