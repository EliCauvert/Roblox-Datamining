local config = { week = true }

return function(Text: string): boolean --[[ Line: 7 | Named "isSupportedTrialPeriodType" ]]
	-- upvalues: config (copy)
	return Text ~= nil and config[string.lower(Text)] == true
end