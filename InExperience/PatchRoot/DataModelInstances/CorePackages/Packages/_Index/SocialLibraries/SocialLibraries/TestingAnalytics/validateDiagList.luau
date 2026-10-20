local DependenciesModule = require(script:FindFirstAncestor("SocialLibraries").dependencies)
local Llama = DependenciesModule.llama
local IsEnumModule = require(script.Parent.Parent.Utils.isEnum)
local T = DependenciesModule.t
local FormatKeyValidationErrorModule = require(script.Parent.formatKeyValidationError)
local Callback = require(script.Parent.formatErrorForIncorrectKey)(T.strictInterface({ name = T.any, counter = T.optional(T.any) }))

return function(p1): boolean
	-- upvalues: Llama (copy), IsEnumModule (copy), FormatKeyValidationErrorModule (copy), Callback (copy)
	Llama.Dictionary.map(p1, function(p2, p3)
		-- upvalues: IsEnumModule (upval), FormatKeyValidationErrorModule (upval), Callback (upval)
		local RawValueResult = if IsEnumModule(p3) then p3.rawValue() else p3
		assert(type(p2.name) == "string", FormatKeyValidationErrorModule("name", "a string", RawValueResult))
		assert(type(p2.counter) == "number" or p2.counter == nil, FormatKeyValidationErrorModule("counter", "nil or a number", RawValueResult))
		assert(Callback(p2, RawValueResult))
	end)
	
	return true
end