return function(p1) --[[ Line: 1 | Named "getLocalUserId" ]]
	return if p1.LocalPlayer then tostring(p1.LocalPlayer.UserId) else nil
end