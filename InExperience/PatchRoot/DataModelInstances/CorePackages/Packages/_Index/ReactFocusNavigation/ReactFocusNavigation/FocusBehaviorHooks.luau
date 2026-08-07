local parent = script.Parent.Parent
local _ = require(parent.FocusNavigation)
local focusBehaviorsModule = require(parent.FocusBehaviors)
local reactModule = require(parent.React)
local default = focusBehaviorsModule.default
local mostRecent = focusBehaviorsModule.mostRecent
local mostRecentOrDefault = focusBehaviorsModule.mostRecentOrDefault
local useContainerFocusBehaviorModule = require(script.Parent.useContainerFocusBehavior)

return {
	useDefaultFocusBehavior = function(p0) --[[ line: 15 ]]
		-- upvalues: reactModule (ref), default (ref), useContainerFocusBehaviorModule (ref)
		local var3, var4 = reactModule.useState(nil)
		
		return var4, useContainerFocusBehaviorModule(reactModule.useMemo(function() --[[ line: 20 ]]
			-- upvalues: default (copy), var3 (ref)
			return default(var3)
		end, { var3 }), p0)
	end,
	useMostRecentFocusBehavior = function(p1) --[[ line: 29 ]]
		-- upvalues: reactModule (ref), mostRecent (ref), useContainerFocusBehaviorModule (ref)
		return useContainerFocusBehaviorModule(reactModule.useMemo(mostRecent, {}), p1)
	end,
	useMostRecentOrDefaultFocusBehavior = function(p2) --[[ line: 35 ]]
		-- upvalues: reactModule (ref), mostRecentOrDefault (ref), useContainerFocusBehaviorModule (ref)
		local var5, var6 = reactModule.useState(nil)
		
		return var6, useContainerFocusBehaviorModule(reactModule.useMemo(function() --[[ line: 40 ]]
			-- upvalues: mostRecentOrDefault (copy), var5 (ref)
			return mostRecentOrDefault(var5)
		end, { var5 }), p2)
	end
}