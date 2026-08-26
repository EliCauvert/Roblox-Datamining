local avatarExperienceControlBar = script:FindFirstAncestor("AvatarExperienceControlBar")
local parent = avatarExperienceControlBar.Parent
local reactModule = require(parent.React)
local _ = require(avatarExperienceControlBar.ControlBarTypes)
local useUndoRedoBarViewModelModule = require(script.Parent.useUndoRedoBarViewModel)
local iconOnlyMenuModule = require(avatarExperienceControlBar.Components.IconOnlyMenu)
local baseControlBarContainerModule = require(avatarExperienceControlBar.BaseControlBarContainer)
local fFlagAXResetAvatarButton = require(parent.AvatarExperienceFlags).FFlagAXResetAvatarButton

return reactModule.memo(function(p1)
	-- upvalues: useUndoRedoBarViewModelModule (ref), fFlagAXResetAvatarButton (ref), reactModule (ref), baseControlBarContainerModule (ref), iconOnlyMenuModule (ref)
	local var1 = useUndoRedoBarViewModelModule()
	
	return if fFlagAXResetAvatarButton then reactModule.createElement(baseControlBarContainerModule, {
		config = var1.items,
		onActiveMenuItemChanged = function() end,
		LayoutOrder = p1.LayoutOrder
	}) else reactModule.createElement(iconOnlyMenuModule, {
		items = var1.items,
		direction = if p1.direction then p1.direction else "horizontal",
		LayoutOrder = p1.LayoutOrder
	})
end)