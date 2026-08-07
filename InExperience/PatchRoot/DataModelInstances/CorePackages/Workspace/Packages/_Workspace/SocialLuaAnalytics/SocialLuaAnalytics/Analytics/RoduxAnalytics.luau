local actionsModule = require(script.Actions)
local selectorsModule = require(script.Selectors)
local reducersModule = require(script.Reducers)
local _ = require(script.AnalyticsTypes)

return {
	config = function(p0) --[[ line: 7 ]]
		-- upvalues: reducersModule (ref), actionsModule (ref), selectorsModule (ref)
		return {
			installReducer = function() --[[ line: 9 ]]
				-- upvalues: reducersModule (copy), p0 (ref)
				return reducersModule(p0)
			end,
			Actions = actionsModule(p0),
			Selectors = selectorsModule(p0)
		}
	end
}