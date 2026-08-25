local parent = script.Parent.Parent
local analyticsModule = require(parent.Services.Analytics)
local thunkModule = require(parent.Thunk)
local list = { analyticsModule }

return function(p0, p1)
	-- upvalues: thunkModule (ref), list (ref), analyticsModule (ref)
	return thunkModule.new(script.Name, list, function(_, p2)
		-- upvalues: analyticsModule (copy), p0 (ref), p1 (ref)
		p2[analyticsModule].signalEvent(p0, p1)
	end)
end