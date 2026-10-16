game:SetFlagVersion("EnableParentalControlsScreentimeEnforcement", 3)
game:DefineFastFlag("EnableParentalControlsScreentimeEnforcement", false)

return function() --[[ Line: 4 ]]
	return game:GetFastFlag("EnableParentalControlsScreentimeEnforcement")
end