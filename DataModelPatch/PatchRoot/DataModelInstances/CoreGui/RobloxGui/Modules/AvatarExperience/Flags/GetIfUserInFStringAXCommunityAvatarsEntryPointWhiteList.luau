local Players = game:GetService("Players")
game:DefineFastString("AXCommunityAvatarsEntryPointWhiteList", "")

return function(): boolean
	-- upvalues: Players (copy)
	return table.find(string.split(game:GetFastString("AXCommunityAvatarsEntryPointWhiteList") or "", ",") or {}, (tostring(Players.LocalPlayer and Players.LocalPlayer.UserId or 0))) ~= nil
end