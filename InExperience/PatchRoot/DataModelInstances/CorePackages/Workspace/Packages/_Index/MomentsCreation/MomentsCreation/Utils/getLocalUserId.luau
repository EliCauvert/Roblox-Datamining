return function(p1)
	local LocalPlayer = p1.LocalPlayer
	
	return if LocalPlayer then tostring(LocalPlayer.UserId) else nil
end