local immutableModule = require(script.Parent.Parent.Immutable)
local constantsModule = require(script.Parent.Parent.Constants)
local setDevConsoleVisibilityModule = require(script.Parent.Parent.Actions.SetDevConsoleVisibility)
local setDevConsoleMinimizedModule = require(script.Parent.Parent.Actions.SetDevConsoleMinimized)
local changeDevConsoleSizeModule = require(script.Parent.Parent.Actions.ChangeDevConsoleSize)
local setDevConsolePositionModule = require(script.Parent.Parent.Actions.SetDevConsolePosition)
local setActiveTabModule = require(script.Parent.Parent.Actions.SetActiveTab)

return function(p0, p1)
	-- upvalues: constantsModule (ref), setDevConsoleVisibilityModule (ref), immutableModule (ref), setDevConsolePositionModule (ref), setDevConsoleMinimizedModule (ref), changeDevConsoleSizeModule (ref), setActiveTabModule (ref)
	p0 = p0 or {
		isVisible = false,
		isMinimized = false,
		visibleStartTime = 0,
		formFactor = constantsModule.FormFactor.Large,
		position = constantsModule.MainWindowInit.Position,
		size = constantsModule.MainWindowInit.Size
	}
	
	if p1.type == setDevConsoleVisibilityModule.name then
		local t = { isVisible = p1.isVisible }
		
		if t.isVisible then
			t.isMinimized = false
			t.visibleStartTime = tick()
		end
		return immutableModule.JoinDictionaries(p0, t)
	elseif p1.type == setDevConsolePositionModule.name then
		return immutableModule.Set(p0, "position", p1.position)
	elseif p1.type == setDevConsoleMinimizedModule.name then
		return immutableModule.Set(p0, "isMinimized", p1.isMinimized)
	elseif p1.type == changeDevConsoleSizeModule.name then
		if p0.formFactor == constantsModule.FormFactor.Large then
			return immutableModule.Set(p0, "size", p1.newSize)
		end
	else
		return if p1.type == setActiveTabModule.name then immutableModule.Set(p0, "isMinimized", false) else p0
	end
end