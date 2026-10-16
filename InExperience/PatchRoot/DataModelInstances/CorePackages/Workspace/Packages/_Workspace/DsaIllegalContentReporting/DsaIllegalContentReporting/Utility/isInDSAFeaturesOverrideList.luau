local Players = game:GetService("Players")
game:DefineFastString("DSAReportingAndTransparencyOverrideUserIds", "")

function isInDSAFeaturesOverrideList(p1): boolean --[[ Line: 5 ]]
	-- upvalues: Players (copy)
	local UserId = 0
	
	if p1 == nil then
		local LocalPlayer = Players.LocalPlayer
		while not LocalPlayer do
			Players:GetPropertyChangedSignal("LocalPlayer"):Wait()
			LocalPlayer = Players.LocalPlayer
		end
		if LocalPlayer then
			UserId = LocalPlayer.UserId
		end
	else
		UserId = p1
	end
	for i in game:GetFastString("DSAReportingAndTransparencyOverrideUserIds"):gmatch("%d+") do
		if tonumber(i) == UserId then
			return true
		end
	end
	return false
end

return isInDSAFeaturesOverrideList