local Parent = script.Parent.Parent.Parent.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local Skeleton = FoundationModule.Skeleton
local View = FoundationModule.View
local Radius = FoundationModule.Enums.Radius

return function(Frame) --[[ Line: 16 | Named "CartPricingLoading" ]]
	-- upvalues: ReactModule (copy), View (copy), Skeleton (copy), Radius (copy)
	return if Frame.isLoading then ReactModule.createElement(View, {
		tag = "size-full-0 auto-y padding-xxsmall",
		LayoutOrder = Frame.LayoutOrder or 2
	}, {
		LoadingSkeleton = ReactModule.createElement(Skeleton, {
			Name = "CartPricingLoadingSkeleton",
			Size = UDim2.new(1, 0, 0, 44),
			radius = Radius.Circle
		})
	}) else nil
end