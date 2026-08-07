local editProfileAnalyticsContextModule = require(script.Parent.EditProfileAnalyticsContext)
local reactModule = require(script:FindFirstAncestor("EditProfile").Parent.React)

return function() --[[ line: 8 ]]
	-- upvalues: reactModule (ref), editProfileAnalyticsContextModule (ref)
	return reactModule.useContext(editProfileAnalyticsContextModule)
end