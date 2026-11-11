local LocalPlayer = game:GetService("Players").LocalPlayer

return function(p1): boolean
	-- upvalues: LocalPlayer (copy)
	return LocalPlayer and LocalPlayer.UserId % 10000 < p1 or false
end