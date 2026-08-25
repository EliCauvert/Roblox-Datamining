local parent = script.Parent.Parent.Parent.Parent
local parent_1 = parent.Parent
local roactModule = require(parent_1.Roact)
local object = require(parent_1.LuauPolyfill).Object
local useStyleModule = require(parent.Core.Style.useStyle)
local constantsModule = require(script.Parent.Constants)
local _ = require(script.Parent.Types)

return function(p0, p1)
	-- upvalues: useStyleModule (ref), roactModule (ref), constantsModule (ref), object (ref)
	local var3 = useStyleModule()
	
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = 1,
		Size = if p0.size then p0.size else UDim2.new(1, 0, 1, 0),
		AutomaticSize = p0.automaticSize
	}, {
		RoundedBackgroundWithTopAlignedToContent = if p0.showRoundedBackground then roactModule.createElement("Frame", {
			ZIndex = 1,
			Size = p0.roundedBackgroundSize or UDim2.new(1, 0, 1, 0),
			BackgroundTransparency = p0.roundedBackgroundTransparency or 1,
			BackgroundColor3 = p0.roundedBackgroundColor or var3.Theme.BackgroundUIDefault.Color,
			Position = p0.roundedBackgroundPosition or UDim2.fromOffset(0, 0)
		}, {
			Corner = roactModule.createElement("UICorner", { CornerRadius = UDim.new(0.5, 0) })
		}) else nil,
		Overlay = if p0.showOverlay then roactModule.createElement("Frame", {
			ZIndex = 3,
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundColor3 = var3.Theme.BackgroundUIDefault.Color,
			BackgroundTransparency = constantsModule.ICON_TAB_PRESSED_TRANSPARENCY
		}, {
			Corner = roactModule.createElement("UICorner", { CornerRadius = UDim.new(0.5, 0) })
		}) else nil,
		Content = roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			ZIndex = 2,
			Size = if p0.size then p0.size else UDim2.new(1, 0, 1, 0),
			AutomaticSize = p0.automaticSize
		}, object.assign({}, {
			Layout = roactModule.createElement("UIListLayout", object.assign({}, {
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, p0.spacing or 0)
			})),
			Padding = if p0.padding then roactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, p0.padding.left or 0),
				PaddingRight = UDim.new(0, p0.padding.right or 0),
				PaddingTop = UDim.new(0, p0.padding.top or 0),
				PaddingBottom = UDim.new(0, p0.padding.bottom or 0)
			}) else nil
		}, p1))
	})
end