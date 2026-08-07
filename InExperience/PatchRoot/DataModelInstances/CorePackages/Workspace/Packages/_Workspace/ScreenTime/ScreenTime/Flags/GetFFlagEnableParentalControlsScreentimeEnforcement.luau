game:SetFlagVersion("EnableParentalControlsScreentimeEnforcement", 3)
game:DefineFastFlag("EnableParentalControlsScreentimeEnforcement", false)

return function() --[[ line: 4 ]]
	return game:GetFastFlag("EnableParentalControlsScreentimeEnforcement")
end