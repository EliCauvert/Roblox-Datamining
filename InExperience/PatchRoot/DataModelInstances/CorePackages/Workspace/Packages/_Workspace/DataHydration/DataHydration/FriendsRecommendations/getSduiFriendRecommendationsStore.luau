local Parent = script:FindFirstAncestor("DataHydration").Parent
local FFlagPymkCarouselExtendProps = require(Parent.SharedFlags).FFlagPymkCarouselExtendProps
local Computed = require(Parent.Signals).createComputed((require(script.Parent.createSduiFriendRecommendationsStore)))

return if FFlagPymkCarouselExtendProps then nil else function()
	-- upvalues: Computed (copy)
	return Computed(false)
end