local playersService = game:GetService("Players")
game:DefineFastString("DSAReportingAndTransparencyOverrideUserIds", "")

function isInDSAFeaturesOverrideList(p1)
	-- upvalues: playersService (ref)
	local var1 = 0
	
	if p1 == nil then
		local localPlayer = playersService.LocalPlayer
		while not localPlayer do
			playersService:GetPropertyChangedSignal("LocalPlayer"):Wait()
			localPlayer = playersService.LocalPlayer
		end
		if localPlayer then
			var1 = localPlayer.UserId
		end
	else
		var1 = p1
	end
	for i in game:GetFastString("DSAReportingAndTransparencyOverrideUserIds"):gmatch("%d+") do
		if tonumber(i) == var1 then
			return true
		end
	end
	return false
end

return isInDSAFeaturesOverrideList