local parent = script:FindFirstAncestor("Groups").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local view = foundationModule.View
local skeleton = foundationModule.Skeleton
local radius = foundationModule.Enums.Radius
local useTokens = foundationModule.Hooks.useTokens

return function(p1)
	-- upvalues: useTokens (ref), reactModule (ref), view (ref), skeleton (ref), radius (ref)
	local var1 = useTokens()
	
	return reactModule.createElement(view, {
		tag = "row gap-large align-y-center padding-small radius-medium",
		Size = UDim2.new(1, 0, 0, 54),
		LayoutOrder = p1.layoutOrder
	}, {
		ThumbnailContainer = reactModule.createElement(view, { LayoutOrder = 1, Size = UDim2.fromOffset(38, 38) }, {
			ThumbnailSkeleton = reactModule.createElement(skeleton, { Size = UDim2.fromScale(1, 1), radius = radius.Medium })
		}),
		Details = reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = "col size-full-0 auto-y fill gap-small"
		}, {
			NameSkeleton = reactModule.createElement(skeleton, {
				LayoutOrder = 1,
				Size = UDim2.new(0.7, 0, 0, var1.Size.Size_350),
				radius = radius.Small
			}),
			MetaSkeleton = reactModule.createElement(skeleton, {
				LayoutOrder = 2,
				Size = UDim2.new(0.5, 0, 0, var1.Size.Size_250),
				radius = radius.Small
			})
		})
	})
end