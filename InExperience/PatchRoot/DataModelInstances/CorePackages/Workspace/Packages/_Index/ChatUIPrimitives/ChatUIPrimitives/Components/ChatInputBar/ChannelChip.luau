local parent = script:FindFirstAncestor("ChatUIPrimitives").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)

return function(p0)
	-- upvalues: reactModule (ref), foundationModule (ref)
	return reactModule.createElement(foundationModule.Text, {
		tag = "text-caption-medium text-wrap content-emphasis",
		AutomaticSize = Enum.AutomaticSize.XY,
		Size = UDim2.fromScale(0, 1),
		Text = p0.sideChipText or "",
		TextTransparency = p0.transparency or 1,
		Visible = (p0.sideChipText or "") ~= "" and p0.showSideChip ~= false,
		[reactModule.Change.AbsoluteSize] = p0.onAbsoluteSizeChanged,
		onActivated = p0.onSideChipActivated
	})
end