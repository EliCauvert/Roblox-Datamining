local t = {}
local array = require(script.Parent.Parent.Parent.Parent.LuauPolyfill).Array

function t.isNonEmptyArray(p0)
	-- upvalues: array (ref)
	return (function()
		-- upvalues: array (copy), p0 (ref)
		return if array.isArray(p0) then #p0 > 0 else array.isArray(p0)
	end)()
end

return t