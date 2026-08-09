local parent = script:FindFirstAncestor("AvatarSwitcher").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local fFlagAXAvatarTimeoutFlowIE = require(parent.AvatarExperienceFlags).FFlagAXAvatarTimeoutFlowIE

return function(p0) --[[ line: 21 | named "VerticalLayout" ]]
	-- upvalues: reactModule (ref), foundationModule (ref), fFlagAXAvatarTimeoutFlowIE (ref)
	return reactModule.createElement(foundationModule.View, {
		tag = if fFlagAXAvatarTimeoutFlowIE then "size-full-full col" else "size-full-full"
	}, {
		Header = if fFlagAXAvatarTimeoutFlowIE then reactModule.createElement(foundationModule.View, { tag = "auto-y size-full-0 shrink-0", LayoutOrder = 1 }, { HeaderSlot = p0.headerSlot }) else p0.headerSlot,
		Divider = reactModule.createElement(foundationModule.Divider, {
			ZIndex = 2,
			Position = if fFlagAXAvatarTimeoutFlowIE then nil else UDim2.fromOffset(0, p0.headerHeight or 0),
			LayoutOrder = if fFlagAXAvatarTimeoutFlowIE then 2 else nil
		}),
		Content = reactModule.createElement(foundationModule.View, if fFlagAXAvatarTimeoutFlowIE then { tag = "size-full-0 fill col", LayoutOrder = 3 } else {
			Size = UDim2.new(1, 0, 1, -(p0.headerHeight or 0)),
			Position = UDim2.fromOffset(0, p0.headerHeight or 0)
		}, {
			TopItemContainer = reactModule.createElement(foundationModule.View, { Size = UDim2.fromScale(1, 0.5) }, { TopItem = p0.topItemSlot }),
			Divider = reactModule.createElement(foundationModule.Divider, { ZIndex = 2, Position = UDim2.fromScale(0, 0.5) }),
			BottomItemContainer = reactModule.createElement(foundationModule.View, {
				tag = "position-bottom-left anchor-bottom-left",
				Size = UDim2.fromScale(1, 0.5)
			}, { BottomItem = p0.bottomItemSlot })
		})
	})
end