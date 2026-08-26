local dependenciesModule = require(script:FindFirstAncestor("SocialLibraries").dependencies)
local llama = dependenciesModule.llama
local isEnumModule = require(script.Parent.Parent.Utils.isEnum)
local t = dependenciesModule.t
local formatKeyValidationErrorModule = require(script.Parent.formatKeyValidationError)
local var1 = require(script.Parent.formatErrorForIncorrectKey)(t.strictInterface({ name = t.any, counter = t.optional(t.any) }))

return function(p1)
	-- upvalues: llama (ref), isEnumModule (ref), formatKeyValidationErrorModule (ref), var1 (ref)
	llama.Dictionary.map(p1, function(p2, p3)
		-- upvalues: isEnumModule (copy), formatKeyValidationErrorModule (copy), var1 (copy)
		local var2 = if isEnumModule(p3) then p3.rawValue() else p3
		assert(type(p2.name) == "string", formatKeyValidationErrorModule("name", "a string", var2))
		assert(if type(p2.counter) ~= "number" then p2.counter == nil else true, formatKeyValidationErrorModule("counter", "nil or a number", var2))
		assert(var1(p2, var2))
	end)
	
	return true
end