local DependenciesModule = require(script.Parent.Parent.Parent.Parent.dependencies)
local Rodux = DependenciesModule.Rodux
local Dash = DependenciesModule.Dash
local Parent = script.Parent.Parent
local _ = require(Parent.AnalyticsTypes)
local SessionIdUpdatedModule = require(Parent.Actions.SessionIdUpdated)
local t = {}

return function(_)
	-- upvalues: Rodux (copy), t (copy), SessionIdUpdatedModule (copy), Dash (copy)
	return Rodux.createReducer(t, {
		[SessionIdUpdatedModule.name] = function(p1, p2)
			-- upvalues: Dash (upval), t (upval)
			return Dash.join(p1 or t, { [p2.payload.sessionKey] = p2.payload.sessionId })
		end
	})
end