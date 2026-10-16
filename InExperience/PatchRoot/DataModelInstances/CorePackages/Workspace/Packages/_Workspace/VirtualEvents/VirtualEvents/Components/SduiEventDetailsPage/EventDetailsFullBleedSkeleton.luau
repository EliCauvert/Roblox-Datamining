local Parent = script:FindFirstAncestor("VirtualEvents").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local Skeleton = FoundationModule.Skeleton
local Radius = FoundationModule.Enums.Radius
local UseTokensFunction = FoundationModule.Hooks.useTokens

return ReactModule.memo(function() --[[ Line: 15 | Named "EventDetailsFullBleedSkeleton" ]]
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), View (copy), Skeleton (copy), Radius (copy)
	return ReactModule.createElement(View, {
		ClipsDescendants = true,
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 1)
	}, {
		Skeleton = ReactModule.createElement(Skeleton, {
			Size = UDim2.new(1, 0, 1, UseTokensFunction().Radius.Large),
			radius = Radius.Large
		})
	})
end)