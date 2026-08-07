-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:28 2026 Pacific Standard Time.

local colorScopeKeepPrefixModule = require(script.Parent.colorScopeKeepPrefix)

local function kebabToPascal(p0) --[[ line: 3 ]]
	return p0:gsub("^%-?(.)", function(p2) --[[ line: 4 ]]
		return p2:upper()
	end):gsub("%-(.)", function(p1) --[[ line: 7 ]]
		return p1:upper()
	end)
end

return function(p3, p4) --[[ line: 15 | named "tokenAttributePascalName" ]]
	-- upvalues: kebabToPascal (ref), colorScopeKeepPrefixModule (ref)
	local var2 = kebabToPascal(p4)
	
	return if colorScopeKeepPrefixModule[p3] and string.sub(var2, 1, #p3) == p3 then string.sub(var2, #p3 + 1) else var2
end