local dependenciesModule = require(script.Parent.Parent.Parent.Parent.dependencies)
local rodux = dependenciesModule.Rodux
local dash = dependenciesModule.Dash
local parent = script.Parent.Parent
local _ = require(parent.AnalyticsTypes)
local sessionIdUpdatedModule = require(parent.Actions.SessionIdUpdated)
local t = {}

return function(_)
	-- upvalues: rodux (ref), t (ref), sessionIdUpdatedModule (ref), dash (ref)
	return rodux.createReducer(t, {
		[sessionIdUpdatedModule.name] = function(p1, p2)
			-- upvalues: dash (copy), t (copy)
			return dash.join(p1 or t, { [p2.payload.sessionKey] = p2.payload.sessionId })
		end
	})
end