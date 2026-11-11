local ReactModule = require(script:FindFirstAncestor("ProfileQRCode").Parent.React)
local ProfileQRCodeAnalyticsModule = require(script.Parent.ProfileQRCodeAnalytics)

return function()
	-- upvalues: ReactModule (copy), ProfileQRCodeAnalyticsModule (copy)
	return ReactModule.useContext(ProfileQRCodeAnalyticsModule)
end