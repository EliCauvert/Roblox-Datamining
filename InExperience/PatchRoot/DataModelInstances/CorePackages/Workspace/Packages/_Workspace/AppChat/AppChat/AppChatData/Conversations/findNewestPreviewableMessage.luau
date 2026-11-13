local AppChat = script:FindFirstAncestor("AppChat")
local _ = require(AppChat.AppChatData.Types)
local GetMessageSentDateTimeModule = require(AppChat.Utils.getMessageSentDateTime)
local GetUnixTimestampSecondsModule = require(AppChat.Utils.getUnixTimestampSeconds)
local IsMessagePreviewableModule = require(AppChat.Utils.isMessagePreviewable)

return function(List, p1)
	-- upvalues: IsMessagePreviewableModule (copy), GetMessageSentDateTimeModule (copy), GetUnixTimestampSecondsModule (copy)
	local v1 = nil
	local v2 = p1
	
	for _, value in List do
		local v3: boolean = value == nil or not IsMessagePreviewableModule(value)
		local MessageSentDateTimeModule = nil
		local UnixTimestampSecondsModule = nil
		
		if not v3 then
			MessageSentDateTimeModule = GetMessageSentDateTimeModule(value)
			UnixTimestampSecondsModule = GetUnixTimestampSecondsModule(MessageSentDateTimeModule)
			v3 = UnixTimestampSecondsModule == nil or v2 >= UnixTimestampSecondsModule
		end
		if not v3 then
			v2 = UnixTimestampSecondsModule
			v1 = {
				messageId = value.id,
				sentDateTime = MessageSentDateTimeModule,
				sentUnixSeconds = UnixTimestampSecondsModule
			}
		end
	end
	return v1
end