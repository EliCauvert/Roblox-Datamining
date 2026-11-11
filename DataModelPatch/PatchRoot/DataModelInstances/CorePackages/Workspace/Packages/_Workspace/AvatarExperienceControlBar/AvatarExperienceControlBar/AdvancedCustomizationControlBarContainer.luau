local AvatarExperienceControlBar = script:FindFirstAncestor("AvatarExperienceControlBar")
local ReactModule = require(AvatarExperienceControlBar.Parent.React)
local UseAdvancedCustomizationControlBarPropsModule = require(AvatarExperienceControlBar.useAdvancedCustomizationControlBarProps)
local BaseControlBarContainerModule = require(AvatarExperienceControlBar.BaseControlBarContainer)

return ReactModule.memo(function(Frame)
	-- upvalues: UseAdvancedCustomizationControlBarPropsModule (copy), ReactModule (copy), BaseControlBarContainerModule (copy)
	return ReactModule.createElement(BaseControlBarContainerModule, {
		config = UseAdvancedCustomizationControlBarPropsModule(Frame).config,
		onActiveMenuItemChanged = Frame.onActiveMenuItemChanged,
		LayoutOrder = Frame.LayoutOrder
	})
end)