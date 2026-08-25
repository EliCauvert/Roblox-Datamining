local avatarExperienceInspectAndBuy = script:FindFirstAncestor("AvatarExperienceInspectAndBuy")
local parent = avatarExperienceInspectAndBuy.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local divider = foundationModule.Divider
local dividerOrientation = foundationModule.Enums.DividerOrientation
local _ = require(avatarExperienceInspectAndBuy.Enums.ViewType)

return function(p0)
	-- upvalues: reactModule (ref), foundationModule (ref), divider (ref), dividerOrientation (ref)
	local panelConfig = p0.panelConfig
	
	return reactModule.createElement(foundationModule.View, {
		ClipsDescendants = true,
		tag = panelConfig.tag,
		LayoutOrder = p0.LayoutOrder
	}, {
		FirstPanel = if p0.renderFirstPanel then reactModule.createElement(foundationModule.View, {
			Size = if p0.renderSecondPanel then panelConfig.panelSizes.first else UDim2.new(1, 0, 1, 0),
			LayoutOrder = panelConfig.layoutOrder.first
		}, {
			RightBorder = if panelConfig.showRightBorder then reactModule.createElement(divider, {
				orientation = dividerOrientation.Vertical,
				Position = UDim2.new(1, -1, 0, 0)
			}) else nil,
			StartSlot = p0.renderFirstPanel()
		}) else nil,
		SecondPanel = if p0.renderSecondPanel then reactModule.createElement(foundationModule.View, {
			Size = if p0.renderFirstPanel then panelConfig.panelSizes.second else UDim2.new(1, 0, 1, 0),
			LayoutOrder = panelConfig.layoutOrder.second
		}, { EndSlot = p0.renderSecondPanel() }) else nil
	})
end