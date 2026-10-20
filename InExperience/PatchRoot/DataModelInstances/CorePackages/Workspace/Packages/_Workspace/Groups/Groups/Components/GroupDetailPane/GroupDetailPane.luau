local Parent = script:FindFirstAncestor("Groups").Parent
local FoundationModule = require(Parent.Foundation)
local _ = require(Parent.Navigation)
local ReactModule = require(Parent.React)
local ScrollView = FoundationModule.ScrollView
local View = FoundationModule.View
local Frozen = table.freeze({
	AutomaticCanvasSize = Enum.AutomaticSize.Y,
	CanvasSize = UDim2.fromScale(1, 0),
	ScrollingDirection = Enum.ScrollingDirection.Y,
	scrollBarVisibility = FoundationModule.Enums.ScrollBarVisibility.Auto
})

return function(_)
	-- upvalues: ReactModule (copy), ScrollView (copy), Frozen (copy), View (copy)
	return ReactModule.createElement(ScrollView, {
		testId = "GroupDetailPane",
		tag = "size-full clip bg-surface-0",
		scroll = Frozen
	}, {
		Content = ReactModule.createElement(View, { tag = "col size-full-0 auto-y" })
	})
end