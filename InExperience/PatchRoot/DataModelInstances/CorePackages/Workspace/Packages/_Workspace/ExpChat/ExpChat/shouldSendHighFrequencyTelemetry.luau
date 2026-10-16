local LocalPlayer = game:GetService("Players").LocalPlayer

return function(p1): boolean --[[ Line: 3 ]]
	-- upvalues: LocalPlayer (copy)
	return LocalPlayer and LocalPlayer.UserId % 10000 < p1 or false
end