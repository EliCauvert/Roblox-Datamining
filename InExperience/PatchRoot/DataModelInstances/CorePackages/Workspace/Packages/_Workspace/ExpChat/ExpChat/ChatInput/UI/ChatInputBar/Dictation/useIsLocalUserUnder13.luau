local Players = game:GetService("Players")

return function(): boolean --[[ Line: 15 | Named "useIsLocalUserUnder13" ]]
	-- upvalues: Players (copy)
	local LocalPlayer = Players.LocalPlayer
	
	return LocalPlayer ~= nil and LocalPlayer:GetUnder13() == true
end