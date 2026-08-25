local networkingUserSettings = require(script.Parent.Parent.dependencies).NetworkingUserSettings

return function()
	-- upvalues: networkingUserSettings (ref)
	return function(p0)
		-- upvalues: networkingUserSettings (copy)
		p0:dispatch(networkingUserSettings.GetUserSettingsMetadata.API())
	end
end