local playersService = game:GetService("Players")

return function()
	-- upvalues: playersService (ref)
	local localPlayer = playersService.LocalPlayer
	
	return if localPlayer == nil then nil else localPlayer.UserId
end