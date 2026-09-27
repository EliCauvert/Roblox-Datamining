local parent = script:FindFirstAncestor("Groups").Parent
local foundationModule = require(parent.Foundation)
local _ = require(parent.Navigation)
local reactModule = require(parent.React)
local scrollBarVisibility = foundationModule.Enums.ScrollBarVisibility
local scrollView = foundationModule.ScrollView
local view = foundationModule.View
local frozen = table.freeze({
	AutomaticCanvasSize = Enum.AutomaticSize.Y,
	CanvasSize = UDim2.fromScale(1, 0),
	ScrollingDirection = Enum.ScrollingDirection.Y,
	scrollBarVisibility = scrollBarVisibility.Auto
})

return function(_)
	-- upvalues: reactModule (ref), scrollView (ref), frozen (ref), view (ref)
	return reactModule.createElement(scrollView, {
		testId = "GroupDetailPane",
		tag = "size-full clip bg-surface-0",
		scroll = frozen
	}, {
		Content = reactModule.createElement(view, { tag = "col size-full-0 auto-y" })
	})
end