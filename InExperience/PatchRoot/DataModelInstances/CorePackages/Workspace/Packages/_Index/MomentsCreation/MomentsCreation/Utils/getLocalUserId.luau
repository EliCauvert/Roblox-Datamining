return function(p0) --[[ line: 2 | named "getLocalUserId" ]]
	local localPlayer = p0.LocalPlayer
	
	return if localPlayer then tostring(localPlayer.UserId) else nil
end