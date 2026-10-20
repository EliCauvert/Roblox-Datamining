local Players = game:GetService("Players")

return function(p1)
	-- upvalues: Players (copy)
	local LocalPlayer = (p1 or Players).LocalPlayer
	
	return if LocalPlayer then tostring(LocalPlayer.UserId) else nil
end