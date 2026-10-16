local NetworkingUserSettings = require(script.Parent.Parent.dependencies).NetworkingUserSettings

return function() --[[ Line: 5 ]]
	-- upvalues: NetworkingUserSettings (copy)
	return function(p1) --[[ Line: 6 ]]
		-- upvalues: NetworkingUserSettings (upval)
		p1:dispatch(NetworkingUserSettings.GetUserSettingsMetadata.API())
	end
end