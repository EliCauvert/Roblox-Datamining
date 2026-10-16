local Success, Result = pcall(function() --[[ Line: 1 ]]
	return UserSettings():IsUserFeatureEnabled("UserIsChatTranslationEnabled2")
end)

return function() --[[ Line: 5 ]]
	-- upvalues: Success (copy), Result (copy)
	return Success and Result
end