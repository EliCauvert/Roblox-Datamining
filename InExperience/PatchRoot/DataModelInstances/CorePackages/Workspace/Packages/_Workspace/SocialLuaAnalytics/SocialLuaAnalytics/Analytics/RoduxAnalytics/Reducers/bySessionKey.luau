local dependenciesModule = require(script.Parent.Parent.Parent.Parent.dependencies)
local rodux = dependenciesModule.Rodux
local dash = dependenciesModule.Dash
local parent = script.Parent.Parent
local _ = require(parent.AnalyticsTypes)
local sessionIdUpdatedModule = require(parent.Actions.SessionIdUpdated)
local t = {}

return function(_) --[[ line: 12 ]]
	-- upvalues: rodux (ref), t (ref), sessionIdUpdatedModule (ref), dash (ref)
	return rodux.createReducer(t, {
		[sessionIdUpdatedModule.name] = function(p0, p1) --[[ line: 14 ]]
			-- upvalues: dash (copy), t (copy)
			return dash.join(p0 or t, { [p1.payload.sessionKey] = p1.payload.sessionId })
		end
	})
end