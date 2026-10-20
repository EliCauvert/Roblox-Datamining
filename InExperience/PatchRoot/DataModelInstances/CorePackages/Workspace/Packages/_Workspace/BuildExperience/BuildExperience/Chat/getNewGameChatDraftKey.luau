local Players = game:GetService("Players")

return function(p1)
	-- upvalues: Players (copy)
	local P0 = p1 or Players.LocalPlayer
	
	return if P0 == nil or P0.UserId <= 0 then nil else "newGame:" .. tostring(P0.UserId)
end