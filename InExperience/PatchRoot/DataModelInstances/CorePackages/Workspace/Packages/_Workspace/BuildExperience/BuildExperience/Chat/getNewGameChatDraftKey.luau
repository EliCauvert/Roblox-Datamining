local playersService = game:GetService("Players")

return function(p1)
	-- upvalues: playersService (ref)
	p1 = p1 or playersService.LocalPlayer
	
	return if p1 == nil or p1.UserId <= 0 then nil else "newGame:" .. tostring(p1.UserId)
end