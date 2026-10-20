local ProfileWrapperContextModule = require(script.Parent.ProfileWrapperContext)
local ReactModule = require(script:FindFirstAncestor("ProfilePlatform").Parent.React)

return function()
	-- upvalues: ReactModule (copy), ProfileWrapperContextModule (copy)
	return ReactModule.useContext(ProfileWrapperContextModule)
end