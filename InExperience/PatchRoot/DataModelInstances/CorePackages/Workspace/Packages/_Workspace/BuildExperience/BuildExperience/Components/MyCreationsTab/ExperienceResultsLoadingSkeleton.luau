local parent = script:FindFirstAncestor("BuildExperience").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local skeleton = foundationModule.Skeleton
local view = foundationModule.View
local radius = foundationModule.Enums.Radius
local useTokens = foundationModule.Hooks.useTokens

return function(p1)
	-- upvalues: useTokens (ref), reactModule (ref), view (ref), skeleton (ref), radius (ref)
	local var1 = useTokens()
	
	return reactModule.createElement(view, {
		tag = "row align-y-center gap-medium",
		LayoutOrder = p1.LayoutOrder,
		Size = UDim2.new(1, 0, 0, var1.Size.Size_2000),
		testId = `{p1.testIdPrefix}.LoadingSkeleton.{p1.index}`
	}, {
		ThumbnailContainer = reactModule.createElement(view, {
			LayoutOrder = 1,
			Size = UDim2.fromOffset(var1.Size.Size_1400, var1.Size.Size_1400)
		}, {
			Thumbnail = reactModule.createElement(skeleton, { Size = UDim2.fromScale(1, 1), radius = radius.Medium })
		}),
		Details = reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = "col fill gap-small size-full-0 auto-y"
		}, {
			Title = reactModule.createElement(skeleton, {
				LayoutOrder = 1,
				Size = UDim2.new(0.72, 0, 0, var1.Size.Size_400),
				radius = radius.Small
			}),
			Description = reactModule.createElement(skeleton, {
				LayoutOrder = 2,
				Size = UDim2.new(0.44, 0, 0, var1.Size.Size_250),
				radius = radius.Small
			})
		})
	})
end