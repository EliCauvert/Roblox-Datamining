local Array = require(script.Parent.Parent.Parent.Parent.LuauPolyfill).Array

return {
	isNonEmptyArray = function(p1)
		-- upvalues: Array (copy)
		return (function()
			-- upvalues: Array (upval), p1 (copy)
			return if Array.isArray(p1) then #p1 > 0 else Array.isArray(p1)
		end)()
	end
}