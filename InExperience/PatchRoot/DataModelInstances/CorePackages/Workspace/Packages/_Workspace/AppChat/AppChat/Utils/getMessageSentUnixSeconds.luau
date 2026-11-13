local AppChat = script:FindFirstAncestor("AppChat")
local GetMessageSentDateTimeModule = require(AppChat.Utils.getMessageSentDateTime)
local GetUnixTimestampSecondsModule = require(AppChat.Utils.getUnixTimestampSeconds)

return function(p1)
	-- upvalues: GetUnixTimestampSecondsModule (copy), GetMessageSentDateTimeModule (copy)
	return GetUnixTimestampSecondsModule(GetMessageSentDateTimeModule(p1))
end