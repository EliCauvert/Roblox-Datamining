local Players = game:GetService("Players")

return function() --[[ Line: 7 | Named "getCurrentUserId" ]]
	-- upvalues: Players (copy)
	local LocalPlayer = Players.LocalPlayer
	
	return if LocalPlayer == nil then nil else tostring(LocalPlayer.UserId)
end