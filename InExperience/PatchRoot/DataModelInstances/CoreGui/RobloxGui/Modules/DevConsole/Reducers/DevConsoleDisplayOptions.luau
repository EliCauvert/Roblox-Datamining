local immutableModule = require(script.Parent.Parent.Immutable)
local constantsModule = require(script.Parent.Parent.Constants)
local setDevConsoleVisibilityModule = require(script.Parent.Parent.Actions.SetDevConsoleVisibility)
local setDevConsoleMinimizedModule = require(script.Parent.Parent.Actions.SetDevConsoleMinimized)
local changeDevConsoleSizeModule = require(script.Parent.Parent.Actions.ChangeDevConsoleSize)
local setDevConsolePositionModule = require(script.Parent.Parent.Actions.SetDevConsolePosition)
local setActiveTabModule = require(script.Parent.Parent.Actions.SetActiveTab)

return function(p1, p2)
	-- upvalues: constantsModule (ref), setDevConsoleVisibilityModule (ref), immutableModule (ref), setDevConsolePositionModule (ref), setDevConsoleMinimizedModule (ref), changeDevConsoleSizeModule (ref), setActiveTabModule (ref)
	p1 = p1 or {
		isVisible = false,
		isMinimized = false,
		visibleStartTime = 0,
		formFactor = constantsModule.FormFactor.Large,
		position = constantsModule.MainWindowInit.Position,
		size = constantsModule.MainWindowInit.Size
	}
	
	if p2.type == setDevConsoleVisibilityModule.name then
		local t = { isVisible = p2.isVisible }
		
		if t.isVisible then
			t.isMinimized = false
			t.visibleStartTime = tick()
		end
		return immutableModule.JoinDictionaries(p1, t)
	elseif p2.type == setDevConsolePositionModule.name then
		return immutableModule.Set(p1, "position", p2.position)
	elseif p2.type == setDevConsoleMinimizedModule.name then
		return immutableModule.Set(p1, "isMinimized", p2.isMinimized)
	elseif p2.type == changeDevConsoleSizeModule.name then
		if p1.formFactor == constantsModule.FormFactor.Large then
			return immutableModule.Set(p1, "size", p2.newSize)
		end
	else
		return if p2.type == setActiveTabModule.name then immutableModule.Set(p1, "isMinimized", false) else p1
	end
end