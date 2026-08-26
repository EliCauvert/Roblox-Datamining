return function(p1)
	local localPlayer = p1.LocalPlayer
	
	return if localPlayer then tostring(localPlayer.UserId) else nil
end