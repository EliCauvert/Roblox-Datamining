local Players = game:GetService("Players")

return function(UserId)
	-- upvalues: Players (copy)
	return Players:GetCharacterAppearanceInfoAsync(UserId)
end