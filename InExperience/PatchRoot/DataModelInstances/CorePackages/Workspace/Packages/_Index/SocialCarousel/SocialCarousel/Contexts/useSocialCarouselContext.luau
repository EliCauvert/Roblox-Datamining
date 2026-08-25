local socialCarouselContextModule = require(script.Parent.SocialCarouselContext)
local reactModule = require(script:FindFirstAncestor("SocialCarousel").Parent.React)

return function()
	-- upvalues: reactModule (ref), socialCarouselContextModule (ref)
	return reactModule.useContext(socialCarouselContextModule)
end