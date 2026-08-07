game:DefineFastInt("AccountRecoverySecondsBetweenResends", 30)

return function() --[[ line: 3 ]]
	return game:GetFastInt("AccountRecoverySecondsBetweenResends")
end