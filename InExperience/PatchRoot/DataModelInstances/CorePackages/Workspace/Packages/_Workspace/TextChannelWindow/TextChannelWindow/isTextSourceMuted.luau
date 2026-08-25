local chatMuteModule = require(script:FindFirstAncestor("TextChannelWindow").Parent.ChatMute)

return function(p0)
	-- upvalues: chatMuteModule (ref)
	if chatMuteModule.isUserIdMuted(tostring(p0.UserId)) then
		return true
	end
	local userIdPlayerByUserId = game:GetService("Players"):GetPlayerByUserId(p0.UserId)
	
	return userIdPlayerByUserId ~= nil and (chatMuteModule.isUsernameMuted(userIdPlayerByUserId.Name) or chatMuteModule.isDisplayNameMuted(userIdPlayerByUserId.DisplayName))
end