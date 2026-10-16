local Players = game:GetService("Players")

return function(Object, Player) --[[ Line: 4 | Named "getOtherDisplayNameInWhisperChannel" ]]
	-- upvalues: Players (copy)
	local Player1 = nil
	for _, TextSource in ipairs(Object:GetChildren()) do
		if TextSource:IsA("TextSource") then
			Player1 = Players:GetPlayerByUserId(TextSource.UserId)
			
			if Player1 and Player1 ~= Player then
				return Player1.DisplayName
			end
		end
	end
	return nil
end