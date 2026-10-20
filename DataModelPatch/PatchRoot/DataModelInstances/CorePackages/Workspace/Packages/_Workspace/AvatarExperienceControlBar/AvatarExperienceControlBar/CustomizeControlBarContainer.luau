local AvatarExperienceControlBar = script:FindFirstAncestor("AvatarExperienceControlBar")
local ReactModule = require(AvatarExperienceControlBar.Parent.React)
local UseCustomizeControlBarPropsModule = require(AvatarExperienceControlBar.useCustomizeControlBarProps)
local BaseControlBarContainerModule = require(AvatarExperienceControlBar.BaseControlBarContainer)

return ReactModule.memo(function(Frame)
	-- upvalues: UseCustomizeControlBarPropsModule (copy), ReactModule (copy), BaseControlBarContainerModule (copy)
	return ReactModule.createElement(BaseControlBarContainerModule, {
		config = UseCustomizeControlBarPropsModule(Frame).config,
		onActiveMenuItemChanged = Frame.onActiveMenuItemChanged,
		LayoutOrder = Frame.LayoutOrder
	})
end)