local ChatMuteModule = require(script:FindFirstAncestor("TextChannelWindow").Parent.ChatMute)

return function(Player: Player) --[[ Line: 8 ]]
	-- upvalues: ChatMuteModule (copy)
	if ChatMuteModule.isUserIdMuted((tostring(Player.UserId))) then
		return true
	else
		local Player1 = game:GetService("Players"):GetPlayerByUserId(Player.UserId)
		
		return Player1 ~= nil and (ChatMuteModule.isUsernameMuted(Player1.Name) or ChatMuteModule.isDisplayNameMuted(Player1.DisplayName))
	end
end