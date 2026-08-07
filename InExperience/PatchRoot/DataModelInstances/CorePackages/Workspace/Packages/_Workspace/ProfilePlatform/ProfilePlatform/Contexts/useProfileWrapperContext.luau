local profileWrapperContextModule = require(script.Parent.ProfileWrapperContext)
local reactModule = require(script:FindFirstAncestor("ProfilePlatform").Parent.React)

return function() --[[ line: 6 ]]
	-- upvalues: reactModule (ref), profileWrapperContextModule (ref)
	return reactModule.useContext(profileWrapperContextModule)
end