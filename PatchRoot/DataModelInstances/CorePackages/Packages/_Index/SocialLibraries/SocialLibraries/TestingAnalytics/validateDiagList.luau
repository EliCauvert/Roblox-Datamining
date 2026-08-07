-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:25 2026 Pacific Standard Time.

local dependenciesModule = require(script:FindFirstAncestor("SocialLibraries").dependencies)
local llama = dependenciesModule.llama
local isEnumModule = require(script.Parent.Parent.Utils.isEnum)
local t = dependenciesModule.t
local formatKeyValidationErrorModule = require(script.Parent.formatKeyValidationError)
local var3 = require(script.Parent.formatErrorForIncorrectKey)(t.strictInterface({ name = t.any, counter = t.optional(t.any) }))

return function(p0) --[[ line: 14 ]]
	-- upvalues: llama (ref), isEnumModule (ref), formatKeyValidationErrorModule (ref), var3 (ref)
	llama.Dictionary.map(p0, function(p1, p2) --[[ line: 15 ]]
		-- upvalues: isEnumModule (copy), formatKeyValidationErrorModule (copy), var3 (copy)
		local var4 = if isEnumModule(p2) then p2.rawValue() else p2
		assert(type(p1.name) == "string", formatKeyValidationErrorModule("name", "a string", var4))
		assert(if type(p1.counter) ~= "number" then p1.counter == nil else true, formatKeyValidationErrorModule("counter", "nil or a number", var4))
		assert(var3(p1, var4))
	end)
	
	return true
end