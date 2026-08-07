local profileAnalyticsContextModule = require(script.Parent.ProfileAnalyticsContext)
local reactModule = require(script:FindFirstAncestor("ProfilePlatform").Parent.React)

return function() --[[ line: 6 ]]
	-- upvalues: reactModule (ref), profileAnalyticsContextModule (ref)
	return reactModule.useContext(profileAnalyticsContextModule)
end