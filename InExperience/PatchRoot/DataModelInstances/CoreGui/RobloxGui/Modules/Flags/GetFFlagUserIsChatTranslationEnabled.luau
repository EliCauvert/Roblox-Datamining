local ok, status = pcall(function() --[[ line: 1 ]]
	return UserSettings():IsUserFeatureEnabled("UserIsChatTranslationEnabled2")
end)

return function() --[[ line: 5 ]]
	-- upvalues: ok (ref), status (ref)
	return ok and status
end