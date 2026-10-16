local AppChat = script:FindFirstAncestor("AppChat")
local IsOverLengthModule = require(AppChat.Utils.isOverLength)
local FFlagAppChatUseGraphemeMessageLengthModule = require(AppChat.Flags.FFlagAppChatUseGraphemeMessageLength)

return function(p1, p2): boolean --[[ Line: 9 ]]
	-- upvalues: FFlagAppChatUseGraphemeMessageLengthModule (copy), IsOverLengthModule (copy)
	if FFlagAppChatUseGraphemeMessageLengthModule then
		if IsOverLengthModule(p1, p2, 300) then
			return false
		end
	elseif p2 < #p1 then
		return false
	end
	return not p1:match("^%s*$")
end