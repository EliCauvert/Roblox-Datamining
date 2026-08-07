local playersService = game:GetService("Players")
game:DefineFastString("SelectInSceneReportMenuOverrideUserIds", "")

function isInSelectInSceneReportMenuOverrideList() --[[ line: 5 ]]
	-- upvalues: playersService (ref)
	local localPlayer = playersService.LocalPlayer
	while not localPlayer do
		playersService:GetPropertyChangedSignal("LocalPlayer"):Wait()
		localPlayer = playersService.LocalPlayer
	end
	for i in game:GetFastString("SelectInSceneReportMenuOverrideUserIds"):gmatch("%d+") do
		if localPlayer and tonumber(i) == localPlayer.UserId then
			return true
		end
	end
	return false
end

return isInSelectInSceneReportMenuOverrideList