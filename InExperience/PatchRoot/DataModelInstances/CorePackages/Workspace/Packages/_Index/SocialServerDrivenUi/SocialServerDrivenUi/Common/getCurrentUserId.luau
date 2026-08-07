local playersService = game:GetService("Players")

return function() --[[ line: 7 | named "getCurrentUserId" ]]
	-- upvalues: playersService (ref)
	local localPlayer = playersService.LocalPlayer
	
	return if localPlayer == nil then nil else tostring(localPlayer.UserId)
end