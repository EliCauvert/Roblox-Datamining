local networkingUserSettings = require(script.Parent.Parent.dependencies).NetworkingUserSettings

return function() --[[ line: 5 ]]
	-- upvalues: networkingUserSettings (ref)
	return function(p0) --[[ line: 6 ]]
		-- upvalues: networkingUserSettings (copy)
		p0:dispatch(networkingUserSettings.GetUserSettingsMetadata.API())
	end
end