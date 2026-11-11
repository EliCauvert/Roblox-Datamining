local ReactModule = require(script:FindFirstAncestor("AvatarExperienceCommon").Parent.React)
local AdaptiveScrollingContextModule = require(script.Parent.AdaptiveScrollingContext)

return function()
	-- upvalues: ReactModule (copy), AdaptiveScrollingContextModule (copy)
	return ReactModule.useContext(AdaptiveScrollingContextModule)
end