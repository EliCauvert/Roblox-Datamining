local Parent = script:FindFirstAncestor("Groups").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local Skeleton = FoundationModule.Skeleton
local Radius = FoundationModule.Enums.Radius
local UseTokensFunction = FoundationModule.Hooks.useTokens

return function(p1) --[[ Line: 19 | Named "GroupListItemSkeleton" ]]
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), View (copy), Skeleton (copy), Radius (copy)
	local UseTokensResult = UseTokensFunction()
	
	return ReactModule.createElement(View, {
		tag = "row gap-large align-y-center padding-small radius-medium",
		Size = UDim2.new(1, 0, 0, 54),
		LayoutOrder = p1.layoutOrder
	}, {
		ThumbnailContainer = ReactModule.createElement(View, { LayoutOrder = 1, Size = UDim2.fromOffset(38, 38) }, {
			ThumbnailSkeleton = ReactModule.createElement(Skeleton, { Size = UDim2.fromScale(1, 1), radius = Radius.Medium })
		}),
		Details = ReactModule.createElement(View, {
			LayoutOrder = 2,
			tag = "col size-full-0 auto-y fill gap-small"
		}, {
			NameSkeleton = ReactModule.createElement(Skeleton, {
				LayoutOrder = 1,
				Size = UDim2.new(0.7, 0, 0, UseTokensResult.Size.Size_350),
				radius = Radius.Small
			}),
			MetaSkeleton = ReactModule.createElement(Skeleton, {
				LayoutOrder = 2,
				Size = UDim2.new(0.5, 0, 0, UseTokensResult.Size.Size_250),
				radius = Radius.Small
			})
		})
	})
end