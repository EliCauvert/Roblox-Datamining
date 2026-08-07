local playersService = game:GetService("Players")

return function() --[[ line: 9 | named "getDefaultAuthHeaders" ]]
	-- upvalues: playersService (ref)
	local localPlayer = playersService.LocalPlayer
	
	if localPlayer == nil then
		return {}
	end
	local var1 = tostring(localPlayer.UserId)
	
	return {
		["X-Roblox-User-Id"] = var1,
		["Robloxctx-authenticated-userid"] = var1
	}
end