local profileAnalyticsContextModule = require(script.Parent.ProfileAnalyticsContext)
local reactModule = require(script:FindFirstAncestor("ProfilePlatform").Parent.React)

return function()
	-- upvalues: reactModule (ref), profileAnalyticsContextModule (ref)
	return reactModule.useContext(profileAnalyticsContextModule)
end