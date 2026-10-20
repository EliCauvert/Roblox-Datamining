local Parent = script.Parent.Parent.Parent
local Boolean = require(Parent.Parent.LuauPolyfill).Boolean
local _ = require(Parent.core)
local _ = require(script.Parent.types)
local UseMutationFunction = require(script.Parent.Parent.hooks).useMutation

return {
	Mutation = function(p1)
		-- upvalues: UseMutationFunction (copy), Boolean (copy)
		local Unpacked, Unpacked2 = table.unpack(UseMutationFunction(p1.mutation, p1), 1, 2)
		
		return if Boolean.toJSBoolean(p1.children) then p1.children(Unpacked, Unpacked2) else nil
	end
}