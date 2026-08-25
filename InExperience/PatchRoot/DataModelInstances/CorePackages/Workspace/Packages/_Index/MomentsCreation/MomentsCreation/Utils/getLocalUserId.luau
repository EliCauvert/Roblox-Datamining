return function(p0)
	local localPlayer = p0.LocalPlayer
	
	return if localPlayer then tostring(localPlayer.UserId) else nil
end