local Parent = script.Parent.Parent.Parent.Parent
local Parent1 = Parent.Parent
local RoactModule = require(Parent1.Roact)
local Object = require(Parent1.LuauPolyfill).Object
local UseStyleModule = require(Parent.Core.Style.useStyle)
local ConstantsModule = require(script.Parent.Constants)
local _ = require(script.Parent.Types)

return function(p1, p2)
	-- upvalues: UseStyleModule (copy), RoactModule (copy), ConstantsModule (copy), Object (copy)
	local UseStyleModuleResult = UseStyleModule()
	
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = 1,
		Size = if p1.size then p1.size else UDim2.new(1, 0, 1, 0),
		AutomaticSize = p1.automaticSize
	}, {
		RoundedBackgroundWithTopAlignedToContent = if p1.showRoundedBackground then RoactModule.createElement("Frame", {
			ZIndex = 1,
			Size = p1.roundedBackgroundSize or UDim2.new(1, 0, 1, 0),
			BackgroundTransparency = p1.roundedBackgroundTransparency or 1,
			BackgroundColor3 = p1.roundedBackgroundColor or UseStyleModuleResult.Theme.BackgroundUIDefault.Color,
			Position = p1.roundedBackgroundPosition or UDim2.fromOffset(0, 0)
		}, {
			Corner = RoactModule.createElement("UICorner", { CornerRadius = UDim.new(0.5, 0) })
		}) else nil,
		Overlay = if p1.showOverlay then RoactModule.createElement("Frame", {
			ZIndex = 3,
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundColor3 = UseStyleModuleResult.Theme.BackgroundUIDefault.Color,
			BackgroundTransparency = ConstantsModule.ICON_TAB_PRESSED_TRANSPARENCY
		}, {
			Corner = RoactModule.createElement("UICorner", { CornerRadius = UDim.new(0.5, 0) })
		}) else nil,
		Content = RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			ZIndex = 2,
			Size = if p1.size then p1.size else UDim2.new(1, 0, 1, 0),
			AutomaticSize = p1.automaticSize
		}, Object.assign({}, {
			Layout = RoactModule.createElement("UIListLayout", Object.assign({}, {
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, p1.spacing or 0)
			})),
			Padding = if p1.padding then RoactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, p1.padding.left or 0),
				PaddingRight = UDim.new(0, p1.padding.right or 0),
				PaddingTop = UDim.new(0, p1.padding.top or 0),
				PaddingBottom = UDim.new(0, p1.padding.bottom or 0)
			}) else nil
		}, p2))
	})
end