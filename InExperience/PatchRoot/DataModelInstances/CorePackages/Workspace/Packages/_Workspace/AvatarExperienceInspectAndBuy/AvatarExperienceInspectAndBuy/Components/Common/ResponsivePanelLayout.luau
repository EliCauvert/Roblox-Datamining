local avatarExperienceInspectAndBuy = script:FindFirstAncestor("AvatarExperienceInspectAndBuy")
local parent = avatarExperienceInspectAndBuy.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local divider = foundationModule.Divider
local dividerOrientation = foundationModule.Enums.DividerOrientation
local _ = require(avatarExperienceInspectAndBuy.Enums.ViewType)

return function(p1)
	-- upvalues: reactModule (ref), foundationModule (ref), divider (ref), dividerOrientation (ref)
	local panelConfig = p1.panelConfig
	
	return reactModule.createElement(foundationModule.View, {
		ClipsDescendants = true,
		tag = panelConfig.tag,
		LayoutOrder = p1.LayoutOrder
	}, {
		FirstPanel = if p1.renderFirstPanel then reactModule.createElement(foundationModule.View, {
			Size = if p1.renderSecondPanel then panelConfig.panelSizes.first else UDim2.new(1, 0, 1, 0),
			LayoutOrder = panelConfig.layoutOrder.first
		}, {
			RightBorder = if panelConfig.showRightBorder then reactModule.createElement(divider, {
				orientation = dividerOrientation.Vertical,
				Position = UDim2.new(1, -1, 0, 0)
			}) else nil,
			StartSlot = p1.renderFirstPanel()
		}) else nil,
		SecondPanel = if p1.renderSecondPanel then reactModule.createElement(foundationModule.View, {
			Size = if p1.renderFirstPanel then panelConfig.panelSizes.second else UDim2.new(1, 0, 1, 0),
			LayoutOrder = panelConfig.layoutOrder.second
		}, { EndSlot = p1.renderSecondPanel() }) else nil
	})
end