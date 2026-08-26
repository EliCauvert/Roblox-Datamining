local parent = script:FindFirstAncestor("AvatarSwitcher").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)

return function(p1)
	-- upvalues: reactModule (ref), foundationModule (ref)
	return reactModule.createElement(foundationModule.View, { tag = "size-full-full col" }, {
		Header = reactModule.createElement(foundationModule.View, { tag = "auto-y size-full-0 shrink-0", LayoutOrder = 1 }, { HeaderSlot = p1.headerSlot }),
		Divider = reactModule.createElement(foundationModule.Divider, { LayoutOrder = 2, ZIndex = 2 }),
		Content = reactModule.createElement(foundationModule.View, { tag = "size-full-0 fill col", LayoutOrder = 3 }, {
			TopItemContainer = reactModule.createElement(foundationModule.View, { Size = UDim2.fromScale(1, 0.5) }, { TopItem = p1.topItemSlot }),
			Divider = reactModule.createElement(foundationModule.Divider, { ZIndex = 2, Position = UDim2.fromScale(0, 0.5) }),
			BottomItemContainer = reactModule.createElement(foundationModule.View, {
				tag = "position-bottom-left anchor-bottom-left",
				Size = UDim2.fromScale(1, 0.5)
			}, { BottomItem = p1.bottomItemSlot })
		})
	})
end