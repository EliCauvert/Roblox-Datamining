local AvatarExperienceInspectAndBuy = script:FindFirstAncestor("AvatarExperienceInspectAndBuy")
local Parent = AvatarExperienceInspectAndBuy.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local Divider = FoundationModule.Divider
local DividerOrientation = FoundationModule.Enums.DividerOrientation
local _ = require(AvatarExperienceInspectAndBuy.Enums.ViewType)

return function(Frame) --[[ Line: 78 | Named "ResponsivePanelLayout" ]]
	-- upvalues: ReactModule (copy), FoundationModule (copy), Divider (copy), DividerOrientation (copy)
	local PanelConfig = Frame.panelConfig
	
	return ReactModule.createElement(FoundationModule.View, {
		ClipsDescendants = true,
		tag = PanelConfig.tag,
		LayoutOrder = Frame.LayoutOrder
	}, {
		FirstPanel = if Frame.renderFirstPanel then ReactModule.createElement(FoundationModule.View, {
			Size = if Frame.renderSecondPanel then PanelConfig.panelSizes.first else UDim2.new(1, 0, 1, 0),
			LayoutOrder = PanelConfig.layoutOrder.first
		}, {
			RightBorder = if PanelConfig.showRightBorder then ReactModule.createElement(Divider, {
				orientation = DividerOrientation.Vertical,
				Position = UDim2.new(1, -1, 0, 0)
			}) else nil,
			StartSlot = Frame.renderFirstPanel()
		}) else nil,
		SecondPanel = if Frame.renderSecondPanel then ReactModule.createElement(FoundationModule.View, {
			Size = if Frame.renderFirstPanel then PanelConfig.panelSizes.second else UDim2.new(1, 0, 1, 0),
			LayoutOrder = PanelConfig.layoutOrder.second
		}, { EndSlot = Frame.renderSecondPanel() }) else nil
	})
end