local NetworkingUserSettings = require(script.Parent.Parent.dependencies).NetworkingUserSettings

return function()
	-- upvalues: NetworkingUserSettings (copy)
	return function(p1)
		-- upvalues: NetworkingUserSettings (upval)
		p1:dispatch(NetworkingUserSettings.GetUserSettingsMetadata.API())
	end
end