local Parent = script:FindFirstAncestor("AvatarSwitcher").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local FFlagAXAvatarTimeoutFlowIE = require(Parent.AvatarExperienceFlags).FFlagAXAvatarTimeoutFlowIE

return function(p1)
	-- upvalues: ReactModule (copy), FoundationModule (copy), FFlagAXAvatarTimeoutFlowIE (copy)
	return (ReactModule.createElement(FoundationModule.View, {
		tag = if FFlagAXAvatarTimeoutFlowIE then "size-full-full col" else "size-full-full"
	}, {
		Header = if FFlagAXAvatarTimeoutFlowIE then ReactModule.createElement(FoundationModule.View, { tag = "auto-y size-full-0 shrink-0", LayoutOrder = 1 }, { HeaderSlot = p1.headerSlot }) else p1.headerSlot,
		Divider = ReactModule.createElement(FoundationModule.Divider, {
			ZIndex = 2,
			Position = if FFlagAXAvatarTimeoutFlowIE then nil else UDim2.fromOffset(0, p1.headerHeight or 0),
			LayoutOrder = if FFlagAXAvatarTimeoutFlowIE then 2 else nil
		}),
		Content = ReactModule.createElement(FoundationModule.View, if FFlagAXAvatarTimeoutFlowIE then { tag = "size-full-0 fill col", LayoutOrder = 3 } else {
			Size = UDim2.new(1, 0, 1, -(p1.headerHeight or 0)),
			Position = UDim2.fromOffset(0, p1.headerHeight or 0)
		}, {
			TopItemContainer = ReactModule.createElement(FoundationModule.View, { Size = UDim2.fromScale(1, 0.5) }, { TopItem = p1.topItemSlot }),
			Divider = ReactModule.createElement(FoundationModule.Divider, { ZIndex = 2, Position = UDim2.fromScale(0, 0.5) }),
			BottomItemContainer = ReactModule.createElement(FoundationModule.View, {
				tag = "position-bottom-left anchor-bottom-left",
				Size = UDim2.fromScale(1, 0.5)
			}, { BottomItem = p1.bottomItemSlot })
		})
	}))
end