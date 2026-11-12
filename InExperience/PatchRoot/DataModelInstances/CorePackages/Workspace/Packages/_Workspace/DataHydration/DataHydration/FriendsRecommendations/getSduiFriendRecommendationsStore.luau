local Parent = script:FindFirstAncestor("DataHydration").Parent
local Computed = require(Parent.Signals).createComputed((require(script.Parent.createSduiFriendRecommendationsStore)))

return if require(Parent.SharedFlags).FFlagPymkCarouselExtendProps then nil else function()
	-- upvalues: Computed (copy)
	return Computed(false)
end