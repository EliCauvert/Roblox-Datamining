local Players = game:GetService("Players")

return function()
	-- upvalues: Players (copy)
	local LocalPlayer = Players.LocalPlayer
	
	return if LocalPlayer == nil then nil else LocalPlayer.UserId
end