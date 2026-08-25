local colorScopeKeepPrefixModule = require(script.Parent.colorScopeKeepPrefix)

local function kebabToPascal(p0)
	return p0:gsub("^%-?(.)", function(p2)
		return p2:upper()
	end):gsub("%-(.)", function(p1)
		return p1:upper()
	end)
end

return function(p3, p4)
	-- upvalues: kebabToPascal (ref), colorScopeKeepPrefixModule (ref)
	local var2 = kebabToPascal(p4)
	
	return if colorScopeKeepPrefixModule[p3] and string.sub(var2, 1, #p3) == p3 then string.sub(var2, #p3 + 1) else var2
end