return function(p0) --[[ line: 1 | named "getLocalUserId" ]]
	return if p0.LocalPlayer then tostring(p0.LocalPlayer.UserId) else nil
end