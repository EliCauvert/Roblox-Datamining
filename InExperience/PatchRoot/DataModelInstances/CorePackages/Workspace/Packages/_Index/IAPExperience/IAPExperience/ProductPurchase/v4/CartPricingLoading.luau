local parent = script.Parent.Parent.Parent.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local skeleton = foundationModule.Skeleton
local view = foundationModule.View
local radius = foundationModule.Enums.Radius

return function(p0)
	-- upvalues: reactModule (ref), view (ref), skeleton (ref), radius (ref)
	return if p0.isLoading then reactModule.createElement(view, {
		tag = "size-full-0 auto-y padding-xxsmall",
		LayoutOrder = p0.LayoutOrder or 2
	}, {
		LoadingSkeleton = reactModule.createElement(skeleton, {
			Name = "CartPricingLoadingSkeleton",
			Size = UDim2.new(1, 0, 0, 44),
			radius = radius.Circle
		})
	}) else nil
end