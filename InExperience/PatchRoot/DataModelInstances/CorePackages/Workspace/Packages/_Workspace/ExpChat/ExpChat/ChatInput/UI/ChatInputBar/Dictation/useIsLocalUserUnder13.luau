local Players = game:GetService("Players")

return function(): boolean
	-- upvalues: Players (copy)
	local LocalPlayer = Players.LocalPlayer
	
	return LocalPlayer ~= nil and LocalPlayer:GetUnder13() == true
end