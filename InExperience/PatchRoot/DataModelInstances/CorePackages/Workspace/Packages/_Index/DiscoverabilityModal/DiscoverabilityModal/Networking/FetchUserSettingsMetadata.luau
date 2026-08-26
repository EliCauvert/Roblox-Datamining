local networkingUserSettings = require(script.Parent.Parent.dependencies).NetworkingUserSettings

return function()
	-- upvalues: networkingUserSettings (ref)
	return function(p1)
		-- upvalues: networkingUserSettings (copy)
		p1:dispatch(networkingUserSettings.GetUserSettingsMetadata.API())
	end
end