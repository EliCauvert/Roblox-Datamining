local playersService = game:GetService("Players")

return function()
	-- upvalues: playersService (ref)
	local localPlayer = playersService.LocalPlayer
	
	return if localPlayer == nil then false else localPlayer:GetUnder13() == true
end