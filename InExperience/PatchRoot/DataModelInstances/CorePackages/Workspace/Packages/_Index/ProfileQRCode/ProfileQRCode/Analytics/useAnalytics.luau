local reactModule = require(script:FindFirstAncestor("ProfileQRCode").Parent.React)
local profileQRCodeAnalyticsModule = require(script.Parent.ProfileQRCodeAnalytics)

return function() --[[ line: 8 ]]
	-- upvalues: reactModule (ref), profileQRCodeAnalyticsModule (ref)
	return reactModule.useContext(profileQRCodeAnalyticsModule)
end