local Parent = script:FindFirstAncestor("AvatarSwitcher").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local FFlagAXAvatarTimeoutFlowIE = require(Parent.AvatarExperienceFlags).FFlagAXAvatarTimeoutFlowIE

return function(p1)
	-- upvalues: ReactModule (copy), FoundationModule (copy), FFlagAXAvatarTimeoutFlowIE (copy)
	return (ReactModule.createElement(FoundationModule.View, {
		tag = if FFlagAXAvatarTimeoutFlowIE then "size-full-full col" else "size-full-full"
	}, {
		Header = if FFlagAXAvatarTimeoutFlowIE then ReactModule.createElement(FoundationModule.View, {
			tag = "auto-y size-full-0 shrink-0 padding-bottom-small",
			LayoutOrder = 1
		}, { HeaderSlot = p1.headerSlot }) else p1.headerSlot,
		Content = ReactModule.createElement(FoundationModule.View, if FFlagAXAvatarTimeoutFlowIE then { tag = "size-full-0 fill", LayoutOrder = 2 } else {
			Size = UDim2.new(1, 0, 1, -(p1.headerHeight or 0)),
			Position = UDim2.fromOffset(0, p1.headerHeight or 0)
		}, { ContentSlot = p1.contentSlot })
	}))
end