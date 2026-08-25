local guiService = game:GetService("GuiService")
local userInputService = game:GetService("UserInputService")
local mockableWarn = require(script.Parent.Parent.FocusNavigationUtils).mockableWarn
local _ = require(script.Parent.types)
local ok, status = pcall(function()
	-- upvalues: guiService (ref)
	return guiService:GetPropertyChangedSignal("SelectedCoreObject")
end)
local ok_1, status_1 = pcall(function()
	return game:GetService("CoreGui")
end)

return {
	CoreGui = {
		getSelection = function()
			-- upvalues: guiService (ref)
			return guiService.SelectedCoreObject
		end,
		setSelection = function(value)
			-- upvalues: ok_1 (ref), status_1 (ref), mockableWarn (ref), guiService (ref)
			if _G.__DEV__ and ok_1 and (value ~= nil and not value:IsDescendantOf(status_1)) then
				mockableWarn(string.format("Attempting to focus non-CoreGui descendant '%s' from a CoreGui FocusNavigationService instance. Consider creating this FocusNavigationService with `FocusNavigation.EnginInterface.PlayerGui` instead", value:GetFullName()))
			end
			if value and not value.Selectable then
				guiService:Select(value)
				
				return
			end
			guiService.SelectedCoreObject = value
		end,
		SelectionChanged = if ok then status else {
			Connect = function()
				error("Could not access SelectedCoreObject signal; you may not have the correct permissions")
			end
		},
		InputBegan = userInputService.InputBegan,
		InputChanged = userInputService.InputChanged,
		InputEnded = userInputService.InputEnded,
		LastInputTypeChanged = userInputService.LastInputTypeChanged
	},
	PlayerGui = {
		getSelection = function()
			-- upvalues: guiService (ref)
			return guiService.SelectedObject
		end,
		setSelection = function(value)
			-- upvalues: ok_1 (ref), status_1 (ref), mockableWarn (ref), guiService (ref)
			if _G.__DEV__ and ok_1 and (value ~= nil and value:IsDescendantOf(status_1)) then
				mockableWarn(string.format("Attempting to focus CoreGui descendant '%s' from a non-CoreGui FocusNavigationService instance.Consider creating this FocusNavigationService with `FocusNavigation.EnginInterface.CoreGui` instead", value:GetFullName()))
			end
			if value and not value.Selectable then
				guiService:Select(value)
				
				return
			end
			guiService.SelectedObject = value
		end,
		SelectionChanged = guiService:GetPropertyChangedSignal("SelectedObject"),
		InputBegan = userInputService.InputBegan,
		InputChanged = userInputService.InputChanged,
		InputEnded = userInputService.InputEnded,
		LastInputTypeChanged = userInputService.LastInputTypeChanged
	}
}