local localPlayer = game:GetService("Players").LocalPlayer

return function(p0)
	-- upvalues: localPlayer (ref)
	return localPlayer and localPlayer.UserId % 10000 < p0
end