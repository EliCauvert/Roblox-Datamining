local Parent = script:FindFirstAncestor("ChatUIPrimitives").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)

return function(p1) --[[ Line: 14 ]]
	-- upvalues: ReactModule (copy), FoundationModule (copy)
	return ReactModule.createElement(FoundationModule.Text, {
		tag = "text-caption-medium text-wrap content-emphasis",
		AutomaticSize = Enum.AutomaticSize.XY,
		Size = UDim2.fromScale(0, 1),
		Text = p1.sideChipText or "",
		TextTransparency = p1.transparency or 1,
		Visible = (p1.sideChipText or "") ~= "" and p1.showSideChip ~= false,
		[ReactModule.Change.AbsoluteSize] = p1.onAbsoluteSizeChanged,
		onActivated = p1.onSideChipActivated
	})
end