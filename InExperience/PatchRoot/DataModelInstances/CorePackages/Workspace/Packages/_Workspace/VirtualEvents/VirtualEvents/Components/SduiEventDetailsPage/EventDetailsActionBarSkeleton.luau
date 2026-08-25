local parent = script:FindFirstAncestor("VirtualEvents").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local view = foundationModule.View
local skeleton = foundationModule.Skeleton
local radius = foundationModule.Enums.Radius
local useTokens = foundationModule.Hooks.useTokens

return reactModule.memo(function()
	-- upvalues: useTokens (ref), reactModule (ref), view (ref), skeleton (ref), radius (ref)
	local size1000 = useTokens().Size.Size_1000
	
	return reactModule.createElement(view, {
		tag = "row align-y-center gap-small size-full-0 auto-y",
		testId = "--event-details-action-bar-skeleton"
	}, {
		JoinButton = reactModule.createElement(view, { tag = "grow auto-y", LayoutOrder = 1 }, {
			Skeleton = reactModule.createElement(skeleton, {
				Size = UDim2.new(1, 0, 0, size1000),
				radius = radius.Medium
			})
		}),
		ShareButton = reactModule.createElement(skeleton, {
			LayoutOrder = 2,
			Size = UDim2.fromOffset(size1000, size1000),
			radius = radius.Medium
		})
	})
end)