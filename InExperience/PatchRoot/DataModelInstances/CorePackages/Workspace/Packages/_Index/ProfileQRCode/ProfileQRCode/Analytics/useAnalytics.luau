local ReactModule = require(script:FindFirstAncestor("ProfileQRCode").Parent.React)
local ProfileQRCodeAnalyticsModule = require(script.Parent.ProfileQRCodeAnalytics)

return function() --[[ Line: 8 ]]
	-- upvalues: ReactModule (copy), ProfileQRCodeAnalyticsModule (copy)
	return ReactModule.useContext(ProfileQRCodeAnalyticsModule)
end