local playersService = game:GetService("Players")

return function(p0) --[[ line: 3 | named "getLocalUserId" ]]
	-- upvalues: playersService (ref)
	local localPlayer = (p0 or playersService).LocalPlayer
	
	return if localPlayer then tostring(localPlayer.UserId) else nil
end