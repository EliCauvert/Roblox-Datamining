local avatarExperienceControlBar = script:FindFirstAncestor("AvatarExperienceControlBar")
local reactModule = require(avatarExperienceControlBar.Parent.React)
local useAdvancedCustomizationControlBarPropsModule = require(avatarExperienceControlBar.useAdvancedCustomizationControlBarProps)
local baseControlBarContainerModule = require(avatarExperienceControlBar.BaseControlBarContainer)

return reactModule.memo(function(p1)
	-- upvalues: useAdvancedCustomizationControlBarPropsModule (ref), reactModule (ref), baseControlBarContainerModule (ref)
	return reactModule.createElement(baseControlBarContainerModule, {
		config = useAdvancedCustomizationControlBarPropsModule(p1).config,
		onActiveMenuItemChanged = p1.onActiveMenuItemChanged,
		LayoutOrder = p1.LayoutOrder
	})
end)