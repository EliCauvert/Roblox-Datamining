local Array = require(script.Parent.Parent.Parent.Parent.LuauPolyfill).Array

return {
	isNonEmptyArray = function(p1) --[[ Line: 14 ]]
		-- upvalues: Array (copy)
		return (function() --[[ Line: 15 ]]
			-- upvalues: Array (upval), p1 (copy)
			return if Array.isArray(p1) then #p1 > 0 else Array.isArray(p1)
		end)()
	end
}