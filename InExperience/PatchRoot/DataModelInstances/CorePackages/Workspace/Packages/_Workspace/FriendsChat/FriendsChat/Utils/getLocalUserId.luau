local Players = game:GetService("Players")

return function() --[[ Line: 14 | Named "getLocalUserId" ]]
	-- upvalues: Players (copy)
	local LocalPlayer = Players.LocalPlayer
	
	return if LocalPlayer == nil then nil else LocalPlayer.UserId
end