local Players = game:GetService("Players")

return function() --[[ Line: 9 | Named "getDefaultAuthHeaders" ]]
	-- upvalues: Players (copy)
	local LocalPlayer = Players.LocalPlayer
	
	if LocalPlayer == nil then
		return {}
	else
		local Text = tostring(LocalPlayer.UserId)
		
		return {
			["X-Roblox-User-Id"] = Text,
			["Robloxctx-authenticated-userid"] = Text
		}
	end
end