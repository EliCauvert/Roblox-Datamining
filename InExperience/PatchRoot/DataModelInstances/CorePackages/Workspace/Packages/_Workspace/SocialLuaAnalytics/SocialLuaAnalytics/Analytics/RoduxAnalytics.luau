local ActionsModule = require(script.Actions)
local SelectorsModule = require(script.Selectors)
local ReducersModule = require(script.Reducers)
local _ = require(script.AnalyticsTypes)

return {
	config = function(p1)
		-- upvalues: ReducersModule (copy), ActionsModule (copy), SelectorsModule (copy)
		return {
			installReducer = function()
				-- upvalues: ReducersModule (upval), p1 (copy)
				return ReducersModule(p1)
			end,
			Actions = ActionsModule(p1),
			Selectors = SelectorsModule(p1)
		}
	end
}