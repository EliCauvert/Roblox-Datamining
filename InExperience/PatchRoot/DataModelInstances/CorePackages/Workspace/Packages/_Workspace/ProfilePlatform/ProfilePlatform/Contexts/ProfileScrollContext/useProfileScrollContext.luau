local ReactModule = require(script:FindFirstAncestor("ProfilePlatform").Parent.React)
local ProfileScrollContextModule = require(script.Parent.ProfileScrollContext)

return function() --[[ Line: 7 ]]
	-- upvalues: ReactModule (copy), ProfileScrollContextModule (copy)
	return ReactModule.useContext(ProfileScrollContextModule)
end