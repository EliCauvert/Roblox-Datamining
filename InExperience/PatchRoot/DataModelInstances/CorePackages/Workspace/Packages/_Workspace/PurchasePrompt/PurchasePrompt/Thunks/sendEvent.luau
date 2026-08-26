local parent = script.Parent.Parent
local analyticsModule = require(parent.Services.Analytics)
local thunkModule = require(parent.Thunk)
local list = { analyticsModule }

return function(p1, p2)
	-- upvalues: thunkModule (ref), list (ref), analyticsModule (ref)
	return thunkModule.new(script.Name, list, function(_, p3)
		-- upvalues: analyticsModule (copy), p1 (ref), p2 (ref)
		p3[analyticsModule].signalEvent(p1, p2)
	end)
end