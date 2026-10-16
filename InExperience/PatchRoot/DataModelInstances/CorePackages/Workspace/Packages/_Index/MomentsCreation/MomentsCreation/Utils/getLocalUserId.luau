return function(p1) --[[ Line: 2 | Named "getLocalUserId" ]]
	local LocalPlayer = p1.LocalPlayer
	
	return if LocalPlayer then tostring(LocalPlayer.UserId) else nil
end