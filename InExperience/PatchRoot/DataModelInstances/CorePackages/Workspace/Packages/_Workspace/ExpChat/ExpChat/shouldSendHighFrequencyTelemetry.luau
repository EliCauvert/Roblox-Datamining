local localPlayer = game:GetService("Players").LocalPlayer

return function(p1)
	-- upvalues: localPlayer (ref)
	return localPlayer and localPlayer.UserId % 10000 < p1
end