local reactModule = require(script:FindFirstAncestor("AvatarExperienceCommon").Parent.React)
local adaptiveScrollingContextModule = require(script.Parent.AdaptiveScrollingContext)

return function()
	-- upvalues: reactModule (ref), adaptiveScrollingContextModule (ref)
	return reactModule.useContext(adaptiveScrollingContextModule)
end