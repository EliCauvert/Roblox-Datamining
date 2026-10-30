return function()
	require(script.Parent.registerInExperienceComponents)()
	require(script.Parent.registerInExperienceActions)()
	require(script.Parent.registerInExperienceTelemetryHandlers)()
end