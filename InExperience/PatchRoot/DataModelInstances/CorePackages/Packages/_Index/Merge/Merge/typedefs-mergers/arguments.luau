local Parent = script.Parent.Parent.Parent
local LuauPolyfillModule = require(Parent.LuauPolyfill)
local Array = LuauPolyfillModule.Array
local Boolean = LuauPolyfillModule.Boolean
local _ = require(Parent.GraphQL)
local _ = require(script.Parent["merge-typedefs_types"])
local UtilsModule = require(Parent.Utils)
local CompareNodes = UtilsModule.compareNodes
local IsSome = UtilsModule.isSome
local Callback = nil
local ArgumentsModule = {
	mergeArguments = function(p1, p2, p3) --[[ Line: 30 ]]
		-- upvalues: Callback (ref), Array (copy), IsSome (copy), CompareNodes (copy)
		local CallbackResult = Callback(Array.filter(Array.concat({}, p2, p1), IsSome))
		
		if p3 and p3.sort then
			Array.sort(CallbackResult, CompareNodes)
		end
		return CallbackResult
	end
}

Callback = function(FilterResult) --[[ Line: 52 | Named "deduplicateArguments" ]]
	-- upvalues: Array (copy), Boolean (copy)
	return Array.reduce(FilterResult, function(p1, p2) --[[ Line: 56 ]]
		-- upvalues: Array (upval), Boolean (upval)
		return if Boolean.toJSBoolean((Array.find(p1, function(p3): boolean --[[ Line: 57 ]]
			-- upvalues: p2 (copy)
			return p3.name.value == p2.name.value
		end))) then p1 else Array.concat(p1, { p2 })
	end, {})
end

return ArgumentsModule