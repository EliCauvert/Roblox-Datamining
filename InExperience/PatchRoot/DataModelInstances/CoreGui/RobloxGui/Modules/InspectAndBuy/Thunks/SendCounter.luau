local parent = script.Parent.Parent
local thunkModule = require(parent.Thunk)
local analyticsModule = require(parent.Services.Analytics)
local list = { analyticsModule }

return function(p1)
	-- upvalues: thunkModule (ref), list (ref), analyticsModule (ref)
	return thunkModule.new(script.Name, list, function(_, p2)
		-- upvalues: analyticsModule (copy), p1 (ref)
		p2[analyticsModule].sendCounter(p1)
	end)
end