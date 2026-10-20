local Success, Result = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserIsChatTranslationEnabled2")
end)

return function()
	-- upvalues: Success (copy), Result (copy)
	return Success and Result
end