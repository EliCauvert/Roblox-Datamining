local Parent = script.Parent.Parent.Parent.Parent
local Types = Parent.Types
local _ = require(Types.ReducerTypes)
local _ = require(Types.ActionTypes)
local DashModule = require(Parent.Parent.Dash)

return function(p1)
	-- upvalues: DashModule (copy)
	local t = {}
	DashModule.forEach(p1.responseBody.userContactIds, function(Key)
		-- upvalues: t (copy)
		t[Key] = {}
	end)
	
	return t
end