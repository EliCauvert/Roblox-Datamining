local socialCarouselContextModule = require(script.Parent.SocialCarouselContext)
local reactModule = require(script:FindFirstAncestor("SocialCarousel").Parent.React)

return function() --[[ line: 6 ]]
	-- upvalues: reactModule (ref), socialCarouselContextModule (ref)
	return reactModule.useContext(socialCarouselContextModule)
end