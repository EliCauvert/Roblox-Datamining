local Parent = script.Parent.Parent
local _ = require(Parent.FocusNavigation)
local FocusBehaviorsModule = require(Parent.FocusBehaviors)
local ReactModule = require(Parent.React)
local DefaultFunction = FocusBehaviorsModule.default
local MostRecent = FocusBehaviorsModule.mostRecent
local MostRecentOrDefaultFunction = FocusBehaviorsModule.mostRecentOrDefault
local UseContainerFocusBehaviorModule = require(script.Parent.useContainerFocusBehavior)

return {
	useDefaultFocusBehavior = function(p1) --[[ Line: 15 ]]
		-- upvalues: ReactModule (copy), DefaultFunction (copy), UseContainerFocusBehaviorModule (copy)
		local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
		
		return UseStateResult2, (UseContainerFocusBehaviorModule(ReactModule.useMemo(function() --[[ Line: 20 ]]
			-- upvalues: DefaultFunction (upval), UseStateResult (copy)
			return DefaultFunction(UseStateResult)
		end, { UseStateResult }), p1))
	end,
	useMostRecentFocusBehavior = function(p1) --[[ Line: 29 ]]
		-- upvalues: ReactModule (copy), MostRecent (copy), UseContainerFocusBehaviorModule (copy)
		return UseContainerFocusBehaviorModule(ReactModule.useMemo(MostRecent, {}), p1)
	end,
	useMostRecentOrDefaultFocusBehavior = function(p1) --[[ Line: 35 ]]
		-- upvalues: ReactModule (copy), MostRecentOrDefaultFunction (copy), UseContainerFocusBehaviorModule (copy)
		local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
		
		return UseStateResult2, (UseContainerFocusBehaviorModule(ReactModule.useMemo(function() --[[ Line: 40 ]]
			-- upvalues: MostRecentOrDefaultFunction (upval), UseStateResult (copy)
			return MostRecentOrDefaultFunction(UseStateResult)
		end, { UseStateResult }), p1))
	end
}