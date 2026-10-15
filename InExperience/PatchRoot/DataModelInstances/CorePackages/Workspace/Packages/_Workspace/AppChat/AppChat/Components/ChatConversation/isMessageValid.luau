local appChat = script:FindFirstAncestor("AppChat")
local isOverLengthModule = require(appChat.Utils.isOverLength)
local fFlagAppChatUseGraphemeMessageLengthModule = require(appChat.Flags.FFlagAppChatUseGraphemeMessageLength)

return function(p1, p2)
	-- upvalues: fFlagAppChatUseGraphemeMessageLengthModule (ref), isOverLengthModule (ref)
	if fFlagAppChatUseGraphemeMessageLengthModule then
		if isOverLengthModule(p1, p2, 300) then
			return false
		end
	else
		return if p2 < #p1 then false else p1:match("^%s*$")
	end
end