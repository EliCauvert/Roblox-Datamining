local parent = script.Parent.Parent.Parent.Parent
local types = parent.Types
local _ = require(types.ReducerTypes)
local _ = require(types.ActionTypes)
local dashModule = require(parent.Parent.Dash)

return function(p1)
	-- upvalues: dashModule (ref)
	local t = {}
	dashModule.forEach(p1.responseBody.userContactIds, function(p2)
		-- upvalues: t (ref)
		t[p2] = {}
	end)
	
	return t
end