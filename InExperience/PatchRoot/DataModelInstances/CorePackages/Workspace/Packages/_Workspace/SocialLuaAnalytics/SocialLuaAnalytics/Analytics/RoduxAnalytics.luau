local actionsModule = require(script.Actions)
local selectorsModule = require(script.Selectors)
local reducersModule = require(script.Reducers)
local _ = require(script.AnalyticsTypes)

return {
	config = function(p1)
		-- upvalues: reducersModule (ref), actionsModule (ref), selectorsModule (ref)
		return {
			installReducer = function()
				-- upvalues: reducersModule (copy), p1 (ref)
				return reducersModule(p1)
			end,
			Actions = actionsModule(p1),
			Selectors = selectorsModule(p1)
		}
	end
}