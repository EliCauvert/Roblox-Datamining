local AppChat = script:FindFirstAncestor("AppChat")
local _ = require(AppChat.AppChatData.Types)
local GetMessageSentDateTimeModule = require(AppChat.Utils.getMessageSentDateTime)
local GetUnixTimestampMillisModule = require(AppChat.Utils.getUnixTimestampMillis)
local IsMessagePreviewableModule = require(AppChat.Utils.isMessagePreviewable)

return function(List, p1): boolean
	-- upvalues: IsMessagePreviewableModule (copy), GetUnixTimestampMillisModule (copy), GetMessageSentDateTimeModule (copy)
	for _, value in List do
		if value ~= nil and IsMessagePreviewableModule(value) and p1 < (GetUnixTimestampMillisModule(GetMessageSentDateTimeModule(value)) or 0) then
			return true
		end
	end
	return false
end