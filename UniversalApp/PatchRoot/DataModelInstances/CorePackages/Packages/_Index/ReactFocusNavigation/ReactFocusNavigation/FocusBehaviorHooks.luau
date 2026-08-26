local parent = script.Parent.Parent
local _ = require(parent.FocusNavigation)
local focusBehaviorsModule = require(parent.FocusBehaviors)
local reactModule = require(parent.React)
local default = focusBehaviorsModule.default
local mostRecent = focusBehaviorsModule.mostRecent
local mostRecentOrDefault = focusBehaviorsModule.mostRecentOrDefault
local useContainerFocusBehaviorModule = require(script.Parent.useContainerFocusBehavior)

return {
	useDefaultFocusBehavior = function(p1)
		-- upvalues: reactModule (ref), default (ref), useContainerFocusBehaviorModule (ref)
		local var1, var2 = reactModule.useState(nil)
		
		return var2, useContainerFocusBehaviorModule(reactModule.useMemo(function()
			-- upvalues: default (copy), var1 (ref)
			return default(var1)
		end, { var1 }), p1)
	end,
	useMostRecentFocusBehavior = function(p1)
		-- upvalues: reactModule (ref), mostRecent (ref), useContainerFocusBehaviorModule (ref)
		return useContainerFocusBehaviorModule(reactModule.useMemo(mostRecent, {}), p1)
	end,
	useMostRecentOrDefaultFocusBehavior = function(p1)
		-- upvalues: reactModule (ref), mostRecentOrDefault (ref), useContainerFocusBehaviorModule (ref)
		local var1, var2 = reactModule.useState(nil)
		
		return var2, useContainerFocusBehaviorModule(reactModule.useMemo(function()
			-- upvalues: mostRecentOrDefault (copy), var1 (ref)
			return mostRecentOrDefault(var1)
		end, { var1 }), p1)
	end
}