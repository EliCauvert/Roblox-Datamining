local parent = script:FindFirstAncestor("VirtualEvents").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local view = foundationModule.View
local skeleton = foundationModule.Skeleton
local radius = foundationModule.Enums.Radius
local useTokens = foundationModule.Hooks.useTokens

return reactModule.memo(function() --[[ line: 15 | named "EventDetailsFullBleedSkeleton" ]]
	-- upvalues: useTokens (ref), reactModule (ref), view (ref), skeleton (ref), radius (ref)
	return reactModule.createElement(view, {
		ClipsDescendants = true,
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 1)
	}, {
		Skeleton = reactModule.createElement(skeleton, {
			Size = UDim2.new(1, 0, 1, useTokens().Radius.Large),
			radius = radius.Large
		})
	})
end)