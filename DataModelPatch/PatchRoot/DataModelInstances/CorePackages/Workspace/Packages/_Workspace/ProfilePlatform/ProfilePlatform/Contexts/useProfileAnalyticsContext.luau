local ProfileAnalyticsContextModule = require(script.Parent.ProfileAnalyticsContext)
local ReactModule = require(script:FindFirstAncestor("ProfilePlatform").Parent.React)

return function()
	-- upvalues: ReactModule (copy), ProfileAnalyticsContextModule (copy)
	return ReactModule.useContext(ProfileAnalyticsContextModule)
end