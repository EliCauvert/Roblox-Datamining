game:SetFlagVersion("EnableParentalControlsScreentimeEnforcement", 3)
game:DefineFastFlag("EnableParentalControlsScreentimeEnforcement", false)

return function()
	return game:GetFastFlag("EnableParentalControlsScreentimeEnforcement")
end