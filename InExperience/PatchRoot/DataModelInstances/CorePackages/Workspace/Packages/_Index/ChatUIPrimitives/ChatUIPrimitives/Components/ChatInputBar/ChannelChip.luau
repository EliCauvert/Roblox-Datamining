local parent = script:FindFirstAncestor("ChatUIPrimitives").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)

return function(p1)
	-- upvalues: reactModule (ref), foundationModule (ref)
	return reactModule.createElement(foundationModule.Text, {
		tag = "text-caption-medium text-wrap content-emphasis",
		AutomaticSize = Enum.AutomaticSize.XY,
		Size = UDim2.fromScale(0, 1),
		Text = p1.sideChipText or "",
		TextTransparency = p1.transparency or 1,
		Visible = (p1.sideChipText or "") ~= "" and p1.showSideChip ~= false,
		[reactModule.Change.AbsoluteSize] = p1.onAbsoluteSizeChanged,
		onActivated = p1.onSideChipActivated
	})
end