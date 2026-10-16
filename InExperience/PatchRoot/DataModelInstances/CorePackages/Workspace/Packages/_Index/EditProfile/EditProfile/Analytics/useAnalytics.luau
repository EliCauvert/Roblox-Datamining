local EditProfileAnalyticsContextModule = require(script.Parent.EditProfileAnalyticsContext)
local ReactModule = require(script:FindFirstAncestor("EditProfile").Parent.React)

return function() --[[ Line: 8 ]]
	-- upvalues: ReactModule (copy), EditProfileAnalyticsContextModule (copy)
	return ReactModule.useContext(EditProfileAnalyticsContextModule)
end