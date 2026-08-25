local playersService = game:GetService("Players")

return function(p0)
	-- upvalues: playersService (ref)
	local localPlayer = (p0 or playersService).LocalPlayer
	
	return if localPlayer then tostring(localPlayer.UserId) else nil
end