local _, Result = xpcall(function()
	return game:DefineFastFlag("SignalsReactUseMutableSource", false)
end, function(): boolean
	return true
end)
local _, Result1 = xpcall(function()
	return game:DefineFastFlag("SignalsSchedulerResetStateAfterErrors", false)
end, function(): boolean
	return true
end)

return {
	SignalsReactUseMutableSource = Result,
	SignalsSchedulerResetStateAfterErrors = Result1
}