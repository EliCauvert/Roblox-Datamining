local parent = script:FindFirstAncestor("AvatarSwitcher").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local dividerOrientation = foundationModule.Enums.DividerOrientation

return function(p0)
	-- upvalues: reactModule (ref), foundationModule (ref), dividerOrientation (ref)
	return reactModule.createElement(foundationModule.View, { tag = "size-full-full" }, {
		LeftPanel = reactModule.createElement(foundationModule.View, { tag = "col", Size = UDim2.fromScale(0.67, 1) }, {
			Header = reactModule.createElement(foundationModule.View, {
				tag = "auto-y size-full-0 shrink-0 padding-bottom-small",
				LayoutOrder = 1
			}, { HeaderSlot = p0.headerSlot }),
			LeftItemContainer = reactModule.createElement(foundationModule.View, { tag = "size-full-0 fill", LayoutOrder = 2 }, { LeftItem = p0.leftItemSlot })
		}),
		RightPanel = reactModule.createElement(foundationModule.View, {
			tag = "position-top-right anchor-top-right",
			Size = UDim2.fromScale(0.33, 1)
		}, { RightItem = p0.rightItemSlot }),
		Divider = reactModule.createElement(foundationModule.Divider, {
			ZIndex = 2,
			Position = UDim2.fromScale(0.67, 0),
			orientation = dividerOrientation.Vertical
		})
	})
end