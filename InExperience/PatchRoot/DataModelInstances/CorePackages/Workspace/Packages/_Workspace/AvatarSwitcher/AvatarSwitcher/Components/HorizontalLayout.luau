local parent = script:FindFirstAncestor("AvatarSwitcher").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local dividerOrientation = foundationModule.Enums.DividerOrientation
local fFlagAXAvatarTimeoutFlowIE = require(parent.AvatarExperienceFlags).FFlagAXAvatarTimeoutFlowIE

return function(p0) --[[ line: 24 | named "HorizontalLayout" ]]
	-- upvalues: reactModule (ref), foundationModule (ref), fFlagAXAvatarTimeoutFlowIE (ref), dividerOrientation (ref)
	return reactModule.createElement(foundationModule.View, { tag = "size-full-full" }, {
		LeftPanel = reactModule.createElement(foundationModule.View, {
			tag = if fFlagAXAvatarTimeoutFlowIE then "col" else nil,
			Size = UDim2.fromScale(0.67, 1)
		}, {
			Header = if fFlagAXAvatarTimeoutFlowIE then reactModule.createElement(foundationModule.View, {
				tag = "auto-y size-full-0 shrink-0 padding-bottom-small",
				LayoutOrder = 1
			}, { HeaderSlot = p0.headerSlot }) else p0.headerSlot,
			LeftItemContainer = reactModule.createElement(foundationModule.View, if fFlagAXAvatarTimeoutFlowIE then { tag = "size-full-0 fill", LayoutOrder = 2 } else {
				tag = "position-bottom-left anchor-bottom-left",
				Size = UDim2.new(1, 0, 1, -(p0.headerHeight or 0))
			}, { LeftItem = p0.leftItemSlot })
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