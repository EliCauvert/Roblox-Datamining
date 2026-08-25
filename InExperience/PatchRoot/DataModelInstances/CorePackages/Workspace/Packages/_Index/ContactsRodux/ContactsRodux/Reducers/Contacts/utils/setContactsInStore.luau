local parent = script.Parent.Parent.Parent.Parent
local types = parent.Types
local _ = require(types.ReducerTypes)
local _ = require(types.ActionTypes)
local dashModule = require(parent.Parent.Dash)

return function(p0)
	-- upvalues: dashModule (ref)
	local t = {}
	dashModule.forEach(p0.responseBody.userContactIds, function(p1)
		-- upvalues: t (ref)
		t[p1] = {}
	end)
	
	return t
end