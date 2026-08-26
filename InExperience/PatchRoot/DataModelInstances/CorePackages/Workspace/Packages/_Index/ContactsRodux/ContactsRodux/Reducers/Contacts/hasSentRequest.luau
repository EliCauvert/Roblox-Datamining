local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local types = parent.Types
local roduxModule = require(parent_1.Rodux)
local _ = require(types.ReducerTypes)
local _ = require(types.ActionTypes)
local requestSent = require(parent.Actions).RequestSent
local dashModule = require(parent_1.Dash)
local t = {}

return function(_)
	-- upvalues: roduxModule (ref), t (ref), requestSent (ref), dashModule (ref)
	return roduxModule.createReducer(t, {
		[requestSent.name] = function(p1, p2)
			-- upvalues: dashModule (copy)
			return dashModule.join(p1, { [p2.payload.id] = true })
		end
	})
end