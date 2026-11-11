game:DefineFastInt("AccountRecoverySecondsBetweenResends", 30)

return function()
	return game:GetFastInt("AccountRecoverySecondsBetweenResends")
end