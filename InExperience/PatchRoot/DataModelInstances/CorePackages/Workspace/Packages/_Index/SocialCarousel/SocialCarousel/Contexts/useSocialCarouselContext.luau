local SocialCarouselContextModule = require(script.Parent.SocialCarouselContext)
local ReactModule = require(script:FindFirstAncestor("SocialCarousel").Parent.React)

return function() --[[ Line: 6 ]]
	-- upvalues: ReactModule (copy), SocialCarouselContextModule (copy)
	return ReactModule.useContext(SocialCarouselContextModule)
end