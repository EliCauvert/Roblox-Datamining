local Parent = script:FindFirstAncestor("AvatarWorkshop").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)

return function(p1)
	-- upvalues: ReactModule (copy), FoundationModule (copy)
	return (ReactModule.createElement(FoundationModule.View, { tag = "col size-full-full" }, {
		Header = ReactModule.createElement(FoundationModule.View, { tag = "size-full-0 auto-y", LayoutOrder = 1 }, { HeaderSlot = p1.headerSlot }),
		Divider = ReactModule.createElement(FoundationModule.Divider, { LayoutOrder = 2, ZIndex = 2 }),
		Content = ReactModule.createElement(FoundationModule.View, { tag = "col fill size-full-0", LayoutOrder = 3 }, {
			TopItemContainer = ReactModule.createElement(FoundationModule.View, { Size = UDim2.fromScale(1, 0.5) }, { TopItem = p1.topItemSlot }),
			Divider = ReactModule.createElement(FoundationModule.Divider, { ZIndex = 2, Position = UDim2.fromScale(0, 0.5) }),
			BottomItemContainer = ReactModule.createElement(FoundationModule.View, {
				tag = "position-bottom-left anchor-bottom-left",
				Size = UDim2.fromScale(1, 0.5)
			}, { BottomItem = p1.bottomItemSlot })
		})
	}))
end