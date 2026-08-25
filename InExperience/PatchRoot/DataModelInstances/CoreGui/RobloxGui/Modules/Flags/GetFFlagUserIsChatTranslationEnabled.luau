local ok, status = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserIsChatTranslationEnabled2")
end)

return function()
	-- upvalues: ok (ref), status (ref)
	return ok and status
end