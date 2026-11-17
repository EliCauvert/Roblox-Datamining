local config = {
	ExitModalPage = true,
	LeaveGamePage = true,
	LeaveGameToHomePage = true,
	LeaveGameUpsellPage = true,
	ResetCharacter = true
}

return function(p1): boolean
	-- upvalues: config (copy)
	return p1 ~= nil and config[p1] == true
end