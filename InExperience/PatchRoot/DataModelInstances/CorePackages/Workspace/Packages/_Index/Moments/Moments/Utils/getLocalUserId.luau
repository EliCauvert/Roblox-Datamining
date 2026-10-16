local Players = game:GetService("Players")

return function() --[[ Line: 3 ]]
	-- upvalues: Players (copy)
	local LocalPlayer = Players.LocalPlayer
	
	return if LocalPlayer == nil then nil else LocalPlayer.UserId
end