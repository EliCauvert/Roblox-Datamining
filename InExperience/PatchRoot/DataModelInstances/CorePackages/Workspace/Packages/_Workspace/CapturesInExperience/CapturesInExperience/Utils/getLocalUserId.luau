local playersService = game:GetService("Players")

return function(p1)
	-- upvalues: playersService (ref)
	local localPlayer = (p1 or playersService).LocalPlayer
	
	return if localPlayer then tostring(localPlayer.UserId) else nil
end