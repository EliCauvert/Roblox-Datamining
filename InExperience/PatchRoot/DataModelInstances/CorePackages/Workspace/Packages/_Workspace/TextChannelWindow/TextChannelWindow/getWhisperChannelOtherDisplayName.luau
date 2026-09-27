local playersService = game:GetService("Players")

return function(p1, p2)
	-- upvalues: playersService (ref)
	for i, v in p1:GetChildren() do
		if v:IsA("TextSource") and tostring(v.UserId) ~= p2 then
			local userIdPlayerByUserId = playersService:GetPlayerByUserId(v.UserId)
			
			if userIdPlayerByUserId then
				return userIdPlayerByUserId.DisplayName
			end
		end
	end
	return nil
end