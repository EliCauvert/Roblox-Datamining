local Parent = script.Parent.Parent
local ReactModule = require(Parent.Dev.React)
local ReactFocusNavigationModule = require(Parent.Dev.ReactFocusNavigation)
local NewResult = ReactFocusNavigationModule.FocusNavigationService.new(ReactFocusNavigationModule.EngineInterface.CoreGui)

return function(p1)
	-- upvalues: ReactModule (copy), ReactFocusNavigationModule (copy), NewResult (copy)
	return function(p2)
		-- upvalues: ReactModule (upval), ReactFocusNavigationModule (upval), NewResult (upval), p1 (copy)
		return ReactModule.createElement(ReactFocusNavigationModule.FocusNavigationContext.Provider, { value = NewResult }, ReactModule.createElement(p1, p2))
	end
end