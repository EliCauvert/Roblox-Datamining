local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local Types = Parent.Types
local RoduxModule = require(Parent1.Rodux)
local _ = require(Types.ReducerTypes)
local _ = require(Types.ActionTypes)
local RequestSent = require(Parent.Actions).RequestSent
local DashModule = require(Parent1.Dash)
local t = {}

return function(_)
	-- upvalues: RoduxModule (copy), t (copy), RequestSent (copy), DashModule (copy)
	return RoduxModule.createReducer(t, {
		[RequestSent.name] = function(p1, p2)
			-- upvalues: DashModule (upval)
			return DashModule.join(p1, { [p2.payload.id] = true })
		end
	})
end