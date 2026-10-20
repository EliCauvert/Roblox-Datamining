local SocialCarouselContextModule = require(script.Parent.SocialCarouselContext)
local ReactModule = require(script:FindFirstAncestor("SocialCarousel").Parent.React)

return function()
	-- upvalues: ReactModule (copy), SocialCarouselContextModule (copy)
	return ReactModule.useContext(SocialCarouselContextModule)
end