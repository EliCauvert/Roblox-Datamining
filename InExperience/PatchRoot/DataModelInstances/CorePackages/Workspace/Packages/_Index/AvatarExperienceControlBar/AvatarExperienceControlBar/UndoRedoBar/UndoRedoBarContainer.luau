local avatarExperienceControlBar = script:FindFirstAncestor("AvatarExperienceControlBar")
local parent = avatarExperienceControlBar.Parent
local reactModule = require(parent.React)
local _ = require(avatarExperienceControlBar.ControlBarTypes)
local useUndoRedoBarViewModelModule = require(script.Parent.useUndoRedoBarViewModel)
local iconOnlyMenuModule = require(avatarExperienceControlBar.Components.IconOnlyMenu)
local baseControlBarContainerModule = require(avatarExperienceControlBar.BaseControlBarContainer)
local fFlagAXResetAvatarButton = require(parent.AvatarExperienceFlags).FFlagAXResetAvatarButton

return reactModule.memo(function(p0) --[[ line: 19 | named "UndoRedoBarContainer" ]]
	-- upvalues: useUndoRedoBarViewModelModule (ref), fFlagAXResetAvatarButton (ref), reactModule (ref), baseControlBarContainerModule (ref), iconOnlyMenuModule (ref)
	local var5 = useUndoRedoBarViewModelModule()
	
	return if fFlagAXResetAvatarButton then reactModule.createElement(baseControlBarContainerModule, {
		config = var5.items,
		onActiveMenuItemChanged = function() --[[ line: 24 ]] end,
		LayoutOrder = p0.LayoutOrder
	}) else reactModule.createElement(iconOnlyMenuModule, {
		items = var5.items,
		direction = if p0.direction then p0.direction else "horizontal",
		LayoutOrder = p0.LayoutOrder
	})
end)