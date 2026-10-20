local Parent = script:FindFirstAncestor("AvatarSwitcher").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)

return function(p1)
	-- upvalues: ReactModule (copy), FoundationModule (copy)
	return (ReactModule.createElement(FoundationModule.View, { tag = "size-full-full col" }, {
		Header = ReactModule.createElement(FoundationModule.View, {
			tag = "auto-y size-full-0 shrink-0 padding-bottom-small",
			LayoutOrder = 1
		}, { HeaderSlot = p1.headerSlot }),
		Content = ReactModule.createElement(FoundationModule.View, { tag = "size-full-0 fill", LayoutOrder = 2 }, { ContentSlot = p1.contentSlot })
	}))
end