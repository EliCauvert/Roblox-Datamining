local AvatarExperienceControlBar = script:FindFirstAncestor("AvatarExperienceControlBar")
local Parent = AvatarExperienceControlBar.Parent
local ReactModule = require(Parent.React)
local _ = require(AvatarExperienceControlBar.ControlBarTypes)
local UseUndoRedoBarViewModelModule = require(script.Parent.useUndoRedoBarViewModel)
local IconOnlyMenuModule = require(AvatarExperienceControlBar.Components.IconOnlyMenu)
local BaseControlBarContainerModule = require(AvatarExperienceControlBar.BaseControlBarContainer)
local FFlagAXResetAvatarButton = require(Parent.AvatarExperienceFlags).FFlagAXResetAvatarButton

return ReactModule.memo(function(Frame: Frame)
	-- upvalues: UseUndoRedoBarViewModelModule (copy), FFlagAXResetAvatarButton (copy), ReactModule (copy), BaseControlBarContainerModule (copy), IconOnlyMenuModule (copy)
	local UseUndoRedoBarViewModelModuleResult = UseUndoRedoBarViewModelModule()
	
	return if FFlagAXResetAvatarButton then ReactModule.createElement(BaseControlBarContainerModule, {
		config = UseUndoRedoBarViewModelModuleResult.items,
		onActiveMenuItemChanged = function() end,
		LayoutOrder = Frame.LayoutOrder
	}) else ReactModule.createElement(IconOnlyMenuModule, {
		items = UseUndoRedoBarViewModelModuleResult.items,
		direction = if Frame.direction then Frame.direction else "horizontal",
		LayoutOrder = Frame.LayoutOrder
	})
end)