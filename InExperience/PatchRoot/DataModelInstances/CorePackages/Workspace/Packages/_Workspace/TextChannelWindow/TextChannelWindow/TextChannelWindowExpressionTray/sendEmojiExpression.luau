local TextChannelWindow = script:FindFirstAncestor("TextChannelWindow")
local LoggerModule = require(TextChannelWindow.Logger)
local FFlagExpChatTextChannelWindowExpressionTrayEmojiModule = require(TextChannelWindow.Flags.FFlagExpChatTextChannelWindowExpressionTrayEmoji)
local SendTextToChannelModule = require(TextChannelWindow.sendTextToChannel)

return function(p1, p2, p3)
	-- upvalues: FFlagExpChatTextChannelWindowExpressionTrayEmojiModule (copy), LoggerModule (copy), SendTextToChannelModule (copy)
	if not FFlagExpChatTextChannelWindowExpressionTrayEmojiModule or not p3 or p1 == nil or p1 == "" then
		return false
	elseif p2 == nil then
		LoggerModule:warning("Emoji not sent: no target channel")
		
		return false
	else
		return SendTextToChannelModule(p2, p1)
	end
end