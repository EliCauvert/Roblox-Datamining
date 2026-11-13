local AppChat = script:FindFirstAncestor("AppChat")
local _ = require(AppChat.AppChatData.Types)
local GetMessageSentUnixSecondsModule = require(AppChat.Utils.getMessageSentUnixSeconds)

return function(List, p1, p2): boolean
	-- upvalues: GetMessageSentUnixSecondsModule (copy)
	for _, value in List do
		local MessageSentUnixSecondsModule = GetMessageSentUnixSecondsModule(value)
		local SenderUserId = value.sender_user_id or value.senderTargetId
		
		if MessageSentUnixSecondsModule ~= nil and p1 < MessageSentUnixSecondsModule and SenderUserId ~= nil and tostring(SenderUserId) ~= p2 and value.is_badgeable == true then
			return true
		end
	end
	return false
end