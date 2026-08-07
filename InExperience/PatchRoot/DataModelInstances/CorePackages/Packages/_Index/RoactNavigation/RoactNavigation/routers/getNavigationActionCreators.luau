local navigationActionsModule = require(script.Parent.Parent.NavigationActions)
local invariantModule = require(script.Parent.Parent.utils.invariant)

return function(p0) --[[ line: 4 ]]
	-- upvalues: invariantModule (ref), navigationActionsModule (ref)
	return {
		goBack = function(p1) --[[ line: 8 ]]
			-- upvalues: p0 (ref), invariantModule (copy), navigationActionsModule (copy)
			if p1 == nil and p0.key then
				invariantModule(type(p0.key) == "string", ".goBack(): key should be a string")
				p1 = p0.key
			end
			return navigationActionsModule.back({ key = p1 })
		end,
		navigate = function(p2, p3, p4) --[[ line: 19 ]]
			-- upvalues: navigationActionsModule (copy), invariantModule (copy)
			if type(p2) == "string" then
				return navigationActionsModule.navigate({ routeName = p2, params = p3, action = p4 })
			end
			invariantModule(type(p2) == "table", ".navigate(): navigateTo must be a string or table")
			invariantModule(p3 == nil, ".navigate(): params can only be provided with a string navigateTo value")
			invariantModule(p4 == nil, ".navigate(): child action can only be provided with a string navigateTo value")
			
			return navigationActionsModule.navigate(p2)
		end,
		setParams = function(value) --[[ line: 36 ]]
			-- upvalues: invariantModule (copy), p0 (ref), navigationActionsModule (copy)
			invariantModule(type(p0.key) == "string", ".setParams(): cannot be called by the root navigator")
			
			return navigationActionsModule.setParams({ params = value, key = p0.key })
		end
	}
end