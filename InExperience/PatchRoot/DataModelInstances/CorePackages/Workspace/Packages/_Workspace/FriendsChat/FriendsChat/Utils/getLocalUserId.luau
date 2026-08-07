local playersService = game:GetService("Players")

return function() --[[ line: 14 | named "getLocalUserId" ]]
	-- upvalues: playersService (ref)
	local localPlayer = playersService.LocalPlayer
	
	return if localPlayer == nil then nil else localPlayer.UserId
end