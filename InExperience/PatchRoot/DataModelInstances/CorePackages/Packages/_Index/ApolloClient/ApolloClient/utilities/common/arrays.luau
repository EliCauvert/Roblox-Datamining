local t = {}
local array = require(script.Parent.Parent.Parent.Parent.LuauPolyfill).Array

function t.isNonEmptyArray(p1)
	-- upvalues: array (ref)
	return (function()
		-- upvalues: array (copy), p1 (ref)
		return if array.isArray(p1) then #p1 > 0 else array.isArray(p1)
	end)()
end

return t