local Players = game:GetService("Players")

return function()
	-- upvalues: Players (copy)
	local LocalPlayer = Players.LocalPlayer
	
	return if LocalPlayer == nil then nil else tostring(LocalPlayer.UserId)
end