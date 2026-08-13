local playersService = game:GetService("Players")

return function(p0, p1) --[[ line: 4 | named "getOtherDisplayNameInWhisperChannel" ]]
	-- upvalues: playersService (ref)
	for i, v in ipairs(p0:GetChildren()) do
		if v:IsA("TextSource") then
			local userIdPlayerByUserId = playersService:GetPlayerByUserId(v.UserId)
			
			if userIdPlayerByUserId and userIdPlayerByUserId ~= p1 then
				return userIdPlayerByUserId.DisplayName
			end
		end
	end
	return nil
end