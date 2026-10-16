local ImmutableModule = require(script.Parent.Parent.Immutable)
local ConstantsModule = require(script.Parent.Parent.Constants)
local SetDevConsoleVisibilityModule = require(script.Parent.Parent.Actions.SetDevConsoleVisibility)
local SetDevConsoleMinimizedModule = require(script.Parent.Parent.Actions.SetDevConsoleMinimized)
local ChangeDevConsoleSizeModule = require(script.Parent.Parent.Actions.ChangeDevConsoleSize)
local SetDevConsolePositionModule = require(script.Parent.Parent.Actions.SetDevConsolePosition)
local SetActiveTabModule = require(script.Parent.Parent.Actions.SetActiveTab)

return function(p1, p2) --[[ Line: 19 ]]
	-- upvalues: ConstantsModule (copy), SetDevConsoleVisibilityModule (copy), ImmutableModule (copy), SetDevConsolePositionModule (copy), SetDevConsoleMinimizedModule (copy), ChangeDevConsoleSizeModule (copy), SetActiveTabModule (copy)
	local P0 = p1 or {
		isVisible = false,
		isMinimized = false,
		visibleStartTime = 0,
		formFactor = ConstantsModule.FormFactor.Large,
		position = ConstantsModule.MainWindowInit.Position,
		size = ConstantsModule.MainWindowInit.Size
	}
	
	if p2.type == SetDevConsoleVisibilityModule.name then
		local config = { isVisible = p2.isVisible }
		
		if config.isVisible then
			config.isMinimized = false
			config.visibleStartTime = tick()
		end
		return ImmutableModule.JoinDictionaries(P0, config)
	elseif p2.type == SetDevConsolePositionModule.name then
		return (ImmutableModule.Set(P0, "position", p2.position))
	elseif p2.type == SetDevConsoleMinimizedModule.name then
		return (ImmutableModule.Set(P0, "isMinimized", p2.isMinimized))
	elseif p2.type == ChangeDevConsoleSizeModule.name then
		if P0.formFactor == ConstantsModule.FormFactor.Large then
			return (ImmutableModule.Set(P0, "size", p2.newSize))
		end
	elseif p2.type == SetActiveTabModule.name then
		return (ImmutableModule.Set(P0, "isMinimized", false))
	end
	return P0
end