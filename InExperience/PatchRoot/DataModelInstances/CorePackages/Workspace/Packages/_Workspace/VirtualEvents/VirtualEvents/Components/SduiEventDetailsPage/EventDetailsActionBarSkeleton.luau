local Parent = script:FindFirstAncestor("VirtualEvents").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local Skeleton = FoundationModule.Skeleton
local Radius = FoundationModule.Enums.Radius
local UseTokensFunction = FoundationModule.Hooks.useTokens

return ReactModule.memo(function() --[[ Line: 14 | Named "EventDetailsActionBarSkeleton" ]]
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), View (copy), Skeleton (copy), Radius (copy)
	local Size1000 = UseTokensFunction().Size.Size_1000
	
	return ReactModule.createElement(View, {
		tag = "row align-y-center gap-small size-full-0 auto-y",
		testId = "--event-details-action-bar-skeleton"
	}, {
		JoinButton = ReactModule.createElement(View, { tag = "grow auto-y", LayoutOrder = 1 }, {
			Skeleton = ReactModule.createElement(Skeleton, {
				Size = UDim2.new(1, 0, 0, Size1000),
				radius = Radius.Medium
			})
		}),
		ShareButton = ReactModule.createElement(Skeleton, {
			LayoutOrder = 2,
			Size = UDim2.fromOffset(Size1000, Size1000),
			radius = Radius.Medium
		})
	})
end)