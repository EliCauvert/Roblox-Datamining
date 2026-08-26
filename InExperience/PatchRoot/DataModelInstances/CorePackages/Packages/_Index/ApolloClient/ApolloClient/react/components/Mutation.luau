local t = {}
local parent = script.Parent.Parent.Parent
local boolean = require(parent.Parent.LuauPolyfill).Boolean
local _ = require(parent.core)
local _ = require(script.Parent.types)
local useMutation = require(script.Parent.Parent.hooks).useMutation

function t.Mutation(p1)
	-- upvalues: useMutation (ref), boolean (ref)
	local unpacked, unpacked_1 = table.unpack(useMutation(p1.mutation, p1), 1, 2)
	
	return if boolean.toJSBoolean(p1.children) then p1.children(unpacked, unpacked_1) else nil
end

return t