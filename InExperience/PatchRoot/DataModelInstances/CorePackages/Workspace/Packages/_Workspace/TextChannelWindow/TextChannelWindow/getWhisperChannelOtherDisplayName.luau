local Players = game:GetService("Players")

return function(Object, p1)
	-- upvalues: Players (copy)
	local Player = nil
	for _, TextSource in Object:GetChildren() do
		if TextSource:IsA("TextSource") and tostring(TextSource.UserId) ~= p1 then
			Player = Players:GetPlayerByUserId(TextSource.UserId)
			
			if Player then
				return Player.DisplayName
			end
		end
	end
	return nil
end