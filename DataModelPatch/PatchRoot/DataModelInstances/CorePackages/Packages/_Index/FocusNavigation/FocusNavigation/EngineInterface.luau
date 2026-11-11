local GuiService = game:GetService("GuiService")
local UserInputService = game:GetService("UserInputService")
local MockableWarnFunction = require(script.Parent.Parent.FocusNavigationUtils).mockableWarn
local _ = require(script.Parent.types)
local Success, Result = pcall(function()
	-- upvalues: GuiService (copy)
	return GuiService:GetPropertyChangedSignal("SelectedCoreObject")
end)
local Success1, Result1 = pcall(function()
	return game:GetService("CoreGui")
end)
local config = {
	Connect = function()
		error("Could not access SelectedCoreObject signal; you may not have the correct permissions")
	end
}

return {
	CoreGui = {
		getSelection = function()
			-- upvalues: GuiService (copy)
			return GuiService.SelectedCoreObject
		end,
		setSelection = function(Object)
			-- upvalues: Success1 (copy), Result1 (copy), MockableWarnFunction (copy), GuiService (copy)
			if _G.__DEV__ and Success1 and Object ~= nil and not Object:IsDescendantOf(Result1) then
				MockableWarnFunction(string.format("Attempting to focus non-CoreGui descendant '%s' from a CoreGui FocusNavigationService instance. Consider creating this FocusNavigationService with `FocusNavigation.EnginInterface.PlayerGui` instead", Object:GetFullName()))
			end
			if Object and not Object.Selectable then
				GuiService:Select(Object)
				
				return
			else
				GuiService.SelectedCoreObject = Object
			end
		end,
		SelectionChanged = if Success then Result else config,
		InputBegan = UserInputService.InputBegan,
		InputChanged = UserInputService.InputChanged,
		InputEnded = UserInputService.InputEnded,
		LastInputTypeChanged = UserInputService.LastInputTypeChanged
	},
	PlayerGui = {
		getSelection = function()
			-- upvalues: GuiService (copy)
			return GuiService.SelectedObject
		end,
		setSelection = function(Object)
			-- upvalues: Success1 (copy), Result1 (copy), MockableWarnFunction (copy), GuiService (copy)
			if _G.__DEV__ and Success1 and Object ~= nil and Object:IsDescendantOf(Result1) then
				MockableWarnFunction(string.format("Attempting to focus CoreGui descendant '%s' from a non-CoreGui FocusNavigationService instance.Consider creating this FocusNavigationService with `FocusNavigation.EnginInterface.CoreGui` instead", Object:GetFullName()))
			end
			if Object and not Object.Selectable then
				GuiService:Select(Object)
				
				return
			else
				GuiService.SelectedObject = Object
			end
		end,
		SelectionChanged = GuiService:GetPropertyChangedSignal("SelectedObject"),
		InputBegan = UserInputService.InputBegan,
		InputChanged = UserInputService.InputChanged,
		InputEnded = UserInputService.InputEnded,
		LastInputTypeChanged = UserInputService.LastInputTypeChanged
	}
}