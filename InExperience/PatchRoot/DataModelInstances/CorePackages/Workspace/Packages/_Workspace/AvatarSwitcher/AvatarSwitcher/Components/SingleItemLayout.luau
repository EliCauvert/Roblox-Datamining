local parent = script:FindFirstAncestor("AvatarSwitcher").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)

return function(p0) --[[ line: 16 | named "SingleItemLayout" ]]
	-- upvalues: reactModule (ref), foundationModule (ref)
	return reactModule.createElement(foundationModule.View, { tag = "size-full-full col" }, {
		Header = reactModule.createElement(foundationModule.View, {
			tag = "auto-y size-full-0 shrink-0 padding-bottom-small",
			LayoutOrder = 1
		}, { HeaderSlot = p0.headerSlot }),
		Content = reactModule.createElement(foundationModule.View, { tag = "size-full-0 fill", LayoutOrder = 2 }, { ContentSlot = p0.contentSlot })
	})
end