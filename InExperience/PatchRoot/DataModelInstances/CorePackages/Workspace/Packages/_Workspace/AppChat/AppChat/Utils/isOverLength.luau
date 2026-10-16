local AppChat = script:FindFirstAncestor("AppChat")
local CountCharsModule = require(AppChat.Utils.countChars)
local CountUtf16UnitsModule = require(AppChat.Utils.countUtf16Units)

return function(p1, p2: number, p3: number): boolean --[[ Line: 6 | Named "isOverLength" ]]
	-- upvalues: CountUtf16UnitsModule (copy), CountCharsModule (copy)
	return #p1 > math.min(p2, p3) and (p3 < CountUtf16UnitsModule(p1) or p2 < CountCharsModule(p1))
end