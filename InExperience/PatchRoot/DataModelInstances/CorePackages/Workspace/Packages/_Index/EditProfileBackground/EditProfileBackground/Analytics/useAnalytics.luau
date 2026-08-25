local editProfileBackgroundAnalyticsContextModule = require(script.Parent.EditProfileBackgroundAnalyticsContext)
local reactModule = require(script:FindFirstAncestor("EditProfileBackground").Parent.React)

return function()
	-- upvalues: reactModule (ref), editProfileBackgroundAnalyticsContextModule (ref)
	return reactModule.useContext(editProfileBackgroundAnalyticsContextModule)
end