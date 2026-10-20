local Parent = script:FindFirstAncestor("BuildExperience").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local Skeleton = FoundationModule.Skeleton
local View = FoundationModule.View
local Radius = FoundationModule.Enums.Radius
local UseTokensFunction = FoundationModule.Hooks.useTokens

return function(Frame)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), View (copy), Skeleton (copy), Radius (copy)
	local UseTokensResult = UseTokensFunction()
	
	return ReactModule.createElement(View, {
		tag = "row align-y-center gap-medium",
		LayoutOrder = Frame.LayoutOrder,
		Size = UDim2.new(1, 0, 0, UseTokensResult.Size.Size_2000),
		testId = `{Frame.testIdPrefix}.LoadingSkeleton.{Frame.index}`
	}, {
		ThumbnailContainer = ReactModule.createElement(View, {
			LayoutOrder = 1,
			Size = UDim2.fromOffset(UseTokensResult.Size.Size_1400, UseTokensResult.Size.Size_1400)
		}, {
			Thumbnail = ReactModule.createElement(Skeleton, { Size = UDim2.fromScale(1, 1), radius = Radius.Medium })
		}),
		Details = ReactModule.createElement(View, {
			LayoutOrder = 2,
			tag = "col fill gap-small size-full-0 auto-y"
		}, {
			Title = ReactModule.createElement(Skeleton, {
				LayoutOrder = 1,
				Size = UDim2.new(0.72, 0, 0, UseTokensResult.Size.Size_400),
				radius = Radius.Small
			}),
			Description = ReactModule.createElement(Skeleton, {
				LayoutOrder = 2,
				Size = UDim2.new(0.44, 0, 0, UseTokensResult.Size.Size_250),
				radius = Radius.Small
			})
		})
	})
end