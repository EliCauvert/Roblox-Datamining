local appChat = script:FindFirstAncestor("AppChat")
local countCharsModule = require(appChat.Utils.countChars)
local countUtf16UnitsModule = require(appChat.Utils.countUtf16Units)

return function(p1, p2, p3)
	-- upvalues: countUtf16UnitsModule (ref), countCharsModule (ref)
	return if #p1 <= math.min(p2, p3) then false elseif p3 >= countUtf16UnitsModule(p1) then p2 < countCharsModule(p1) else true
end