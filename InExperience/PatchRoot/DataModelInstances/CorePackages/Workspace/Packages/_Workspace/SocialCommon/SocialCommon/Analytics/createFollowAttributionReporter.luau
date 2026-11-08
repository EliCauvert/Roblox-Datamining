local config = {
	eventName = "followSuccess",
	throttlingPercentage = 10000,
	description = "Fires after a user successfully follows another user",
	backends = { "EventIngest" },
	lastUpdated = { 2026, 11, 5 }
}

return function(Callback)
	-- upvalues: config (copy)
	return function(p1)
		-- upvalues: Callback (copy), config (upval)
		Callback(config, {
			eventContext = "SocialFollow",
			standardizedFields = { "addSessionInfo", "addSessionId", "addOSInfo" },
			customFields = { surface = p1.surface, source = p1.source or p1.surface }
		})
	end
end