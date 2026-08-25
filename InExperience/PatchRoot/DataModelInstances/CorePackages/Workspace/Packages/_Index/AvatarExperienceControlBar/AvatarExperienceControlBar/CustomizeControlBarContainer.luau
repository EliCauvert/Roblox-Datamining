local avatarExperienceControlBar = script:FindFirstAncestor("AvatarExperienceControlBar")
local reactModule = require(avatarExperienceControlBar.Parent.React)
local useCustomizeControlBarPropsModule = require(avatarExperienceControlBar.useCustomizeControlBarProps)
local baseControlBarContainerModule = require(avatarExperienceControlBar.BaseControlBarContainer)

return reactModule.memo(function(p0)
	-- upvalues: useCustomizeControlBarPropsModule (ref), reactModule (ref), baseControlBarContainerModule (ref)
	return reactModule.createElement(baseControlBarContainerModule, {
		config = useCustomizeControlBarPropsModule(p0).config,
		onActiveMenuItemChanged = p0.onActiveMenuItemChanged,
		LayoutOrder = p0.LayoutOrder
	})
end)