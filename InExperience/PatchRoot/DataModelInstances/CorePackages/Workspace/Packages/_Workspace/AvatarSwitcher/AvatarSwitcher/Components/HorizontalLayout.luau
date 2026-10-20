local Parent = script:FindFirstAncestor("AvatarSwitcher").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local DividerOrientation = FoundationModule.Enums.DividerOrientation

return function(p1)
	-- upvalues: ReactModule (copy), FoundationModule (copy), DividerOrientation (copy)
	return (ReactModule.createElement(FoundationModule.View, { tag = "size-full-full" }, {
		LeftPanel = ReactModule.createElement(FoundationModule.View, { tag = "col", Size = UDim2.fromScale(0.67, 1) }, {
			Header = ReactModule.createElement(FoundationModule.View, {
				tag = "auto-y size-full-0 shrink-0 padding-bottom-small",
				LayoutOrder = 1
			}, { HeaderSlot = p1.headerSlot }),
			LeftItemContainer = ReactModule.createElement(FoundationModule.View, { tag = "size-full-0 fill", LayoutOrder = 2 }, { LeftItem = p1.leftItemSlot })
		}),
		RightPanel = ReactModule.createElement(FoundationModule.View, {
			tag = "position-top-right anchor-top-right",
			Size = UDim2.fromScale(0.32999999999999996, 1)
		}, { RightItem = p1.rightItemSlot }),
		Divider = ReactModule.createElement(FoundationModule.Divider, {
			ZIndex = 2,
			Position = UDim2.fromScale(0.67, 0),
			orientation = DividerOrientation.Vertical
		})
	}))
end