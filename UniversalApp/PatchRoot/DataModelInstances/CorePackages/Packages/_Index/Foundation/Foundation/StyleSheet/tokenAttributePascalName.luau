local colorScopeKeepPrefixModule = require(script.Parent.colorScopeKeepPrefix)

local function kebabToPascal(p1)
	return p1:gsub("^%-?(.)", function(p2)
		return p2:upper()
	end):gsub("%-(.)", function(p2)
		return p2:upper()
	end)
end

return function(p1, p2)
	-- upvalues: kebabToPascal (ref), colorScopeKeepPrefixModule (ref)
	local var1 = kebabToPascal(p2)
	
	return if colorScopeKeepPrefixModule[p1] and string.sub(var1, 1, #p1) == p1 then string.sub(var1, #p1 + 1) else var1
end