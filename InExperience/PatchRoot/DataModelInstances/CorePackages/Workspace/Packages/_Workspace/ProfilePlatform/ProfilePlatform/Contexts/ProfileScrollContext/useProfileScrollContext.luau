local reactModule = require(script:FindFirstAncestor("ProfilePlatform").Parent.React)
local profileScrollContextModule = require(script.Parent.ProfileScrollContext)

return function()
	-- upvalues: reactModule (ref), profileScrollContextModule (ref)
	return reactModule.useContext(profileScrollContextModule)
end