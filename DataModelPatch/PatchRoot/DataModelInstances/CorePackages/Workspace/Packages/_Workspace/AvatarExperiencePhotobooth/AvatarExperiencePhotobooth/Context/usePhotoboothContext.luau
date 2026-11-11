local ReactModule = require(script:FindFirstAncestor("AvatarExperiencePhotobooth").Parent.React)
local PhotoboothContextModule = require(script.Parent.PhotoboothContext)

return function()
	-- upvalues: ReactModule (copy), PhotoboothContextModule (copy)
	return (ReactModule.useContext(PhotoboothContextModule))
end