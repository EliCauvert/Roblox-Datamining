local avatarExperienceControlBar = script:FindFirstAncestor("AvatarExperienceControlBar")
local reactModule = require(avatarExperienceControlBar.Parent.React)
local useCustomizeControlBarPropsModule = require(avatarExperienceControlBar.useCustomizeControlBarProps)
local baseControlBarContainerModule = require(avatarExperienceControlBar.BaseControlBarContainer)

return reactModule.memo(function(p1)
	-- upvalues: useCustomizeControlBarPropsModule (ref), reactModule (ref), baseControlBarContainerModule (ref)
	return reactModule.createElement(baseControlBarContainerModule, {
		config = useCustomizeControlBarPropsModule(p1).config,
		onActiveMenuItemChanged = p1.onActiveMenuItemChanged,
		LayoutOrder = p1.LayoutOrder
	})
end)