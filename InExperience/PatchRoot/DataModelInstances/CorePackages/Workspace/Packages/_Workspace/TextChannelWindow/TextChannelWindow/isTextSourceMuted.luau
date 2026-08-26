local chatMuteModule = require(script:FindFirstAncestor("TextChannelWindow").Parent.ChatMute)

return function(p1)
	-- upvalues: chatMuteModule (ref)
	if chatMuteModule.isUserIdMuted(tostring(p1.UserId)) then
		return true
	end
	local userIdPlayerByUserId = game:GetService("Players"):GetPlayerByUserId(p1.UserId)
	
	return userIdPlayerByUserId ~= nil and (chatMuteModule.isUsernameMuted(userIdPlayerByUserId.Name) or chatMuteModule.isDisplayNameMuted(userIdPlayerByUserId.DisplayName))
end