local Parent = script:FindFirstAncestor("FriendsChat").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local Radius = FoundationModule.Enums.Radius
local Skeleton = FoundationModule.Skeleton
local View = FoundationModule.View
local UseTokensFunction = FoundationModule.Hooks.useTokens

return function()
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), View (copy), Skeleton (copy), Radius (copy)
	local UseTokensResult = UseTokensFunction()
	
	return ReactModule.createElement(View, {
		tag = "row flex-x-between align-y-center gap-medium size-full-0 auto-y padding-y-medium padding-right-xsmall"
	}, {
		UserTile = ReactModule.createElement(View, {
			LayoutOrder = 1,
			tag = "row align-y-center fill gap-medium auto-y"
		}, {
			Avatar = ReactModule.createElement(Skeleton, {
				LayoutOrder = 1,
				Size = UDim2.fromOffset(UseTokensResult.Size.Size_1000, UseTokensResult.Size.Size_1000),
				radius = Radius.Circle
			}),
			TextLines = ReactModule.createElement(View, { LayoutOrder = 2, tag = "col fill gap-xsmall auto-y" }, {
				Title = ReactModule.createElement(Skeleton, {
					LayoutOrder = 1,
					Size = UDim2.new(0.5, 0, 0, UseTokensResult.Size.Size_300),
					radius = Radius.Small
				}),
				ContextualInfo = ReactModule.createElement(Skeleton, {
					LayoutOrder = 2,
					Size = UDim2.new(0.3, 0, 0, UseTokensResult.Size.Size_300),
					radius = Radius.Small
				})
			})
		}),
		Button = ReactModule.createElement(Skeleton, {
			LayoutOrder = 2,
			Size = UDim2.fromOffset(UseTokensResult.Size.Size_1600, UseTokensResult.Size.Size_800),
			radius = Radius.Medium
		})
	})
end