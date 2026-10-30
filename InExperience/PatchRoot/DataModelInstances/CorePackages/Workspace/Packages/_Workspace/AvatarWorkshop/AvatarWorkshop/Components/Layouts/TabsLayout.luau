local Parent = script:FindFirstAncestor("AvatarWorkshop").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)

return function(p1)
	-- upvalues: ReactModule (copy), FoundationModule (copy)
	return ReactModule.createElement(FoundationModule.View, { tag = "col size-full" }, {
		Tabs = ReactModule.createElement(FoundationModule.Tabs, {
			LayoutOrder = 1,
			tabs = p1.tabs,
			activeTabId = p1.activeTabId,
			onActivated = p1.onTabActivated,
			testId = p1.testId
		}),
		ContentContainer = ReactModule.createElement(FoundationModule.View, { tag = "grow size-full-0", LayoutOrder = 2 }, { p1.children })
	})
end