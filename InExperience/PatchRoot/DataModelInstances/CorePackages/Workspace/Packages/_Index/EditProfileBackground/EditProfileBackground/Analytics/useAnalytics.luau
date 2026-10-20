local EditProfileBackgroundAnalyticsContextModule = require(script.Parent.EditProfileBackgroundAnalyticsContext)
local ReactModule = require(script:FindFirstAncestor("EditProfileBackground").Parent.React)

return function()
	-- upvalues: ReactModule (copy), EditProfileBackgroundAnalyticsContextModule (copy)
	return ReactModule.useContext(EditProfileBackgroundAnalyticsContextModule)
end