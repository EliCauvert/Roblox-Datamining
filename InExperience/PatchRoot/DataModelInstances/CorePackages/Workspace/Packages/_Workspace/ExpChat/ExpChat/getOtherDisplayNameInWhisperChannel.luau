local playersService = game:GetService("Players")

return function(p1, p2)
	-- upvalues: playersService (ref)
	for i, v in ipairs(p1:GetChildren()) do
		if v:IsA("TextSource") then
			local userIdPlayerByUserId = playersService:GetPlayerByUserId(v.UserId)
			
			if userIdPlayerByUserId and userIdPlayerByUserId ~= p2 then
				return userIdPlayerByUserId.DisplayName
			end
		end
	end
	return nil
end