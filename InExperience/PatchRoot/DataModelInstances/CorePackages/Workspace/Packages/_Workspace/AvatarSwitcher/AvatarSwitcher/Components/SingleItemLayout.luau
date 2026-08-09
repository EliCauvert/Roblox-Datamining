local parent = script:FindFirstAncestor("AvatarSwitcher").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local fFlagAXAvatarTimeoutFlowIE = require(parent.AvatarExperienceFlags).FFlagAXAvatarTimeoutFlowIE

return function(p0) --[[ line: 19 | named "SingleItemLayout" ]]
	-- upvalues: reactModule (ref), foundationModule (ref), fFlagAXAvatarTimeoutFlowIE (ref)
	return reactModule.createElement(foundationModule.View, {
		tag = if fFlagAXAvatarTimeoutFlowIE then "size-full-full col" else "size-full-full"
	}, {
		Header = if fFlagAXAvatarTimeoutFlowIE then reactModule.createElement(foundationModule.View, {
			tag = "auto-y size-full-0 shrink-0 padding-bottom-small",
			LayoutOrder = 1
		}, { HeaderSlot = p0.headerSlot }) else p0.headerSlot,
		Content = reactModule.createElement(foundationModule.View, if fFlagAXAvatarTimeoutFlowIE then { tag = "size-full-0 fill", LayoutOrder = 2 } else {
			Size = UDim2.new(1, 0, 1, -(p0.headerHeight or 0)),
			Position = UDim2.fromOffset(0, p0.headerHeight or 0)
		}, { ContentSlot = p0.contentSlot })
	})
end