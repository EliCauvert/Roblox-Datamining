local avatarExperienceControlBar = script:FindFirstAncestor("AvatarExperienceControlBar")
local reactModule = require(avatarExperienceControlBar.Parent.React)
local useAdvancedCustomizationControlBarPropsModule = require(avatarExperienceControlBar.useAdvancedCustomizationControlBarProps)
local baseControlBarContainerModule = require(avatarExperienceControlBar.BaseControlBarContainer)

return reactModule.memo(function(p0)
	-- upvalues: useAdvancedCustomizationControlBarPropsModule (ref), reactModule (ref), baseControlBarContainerModule (ref)
	return reactModule.createElement(baseControlBarContainerModule, {
		config = useAdvancedCustomizationControlBarPropsModule(p0).config,
		onActiveMenuItemChanged = p0.onActiveMenuItemChanged,
		LayoutOrder = p0.LayoutOrder
	})
end)