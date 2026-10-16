local Players = game:GetService("Players")
game:DefineFastString("SelectInSceneReportMenuOverrideUserIds", "")

function isInSelectInSceneReportMenuOverrideList(): boolean --[[ Line: 5 ]]
	-- upvalues: Players (copy)
	local LocalPlayer = Players.LocalPlayer
	while not LocalPlayer do
		Players:GetPropertyChangedSignal("LocalPlayer"):Wait()
		LocalPlayer = Players.LocalPlayer
	end
	for i in game:GetFastString("SelectInSceneReportMenuOverrideUserIds"):gmatch("%d+") do
		if LocalPlayer and tonumber(i) == LocalPlayer.UserId then
			return true
		end
	end
	return false
end

return isInSelectInSceneReportMenuOverrideList