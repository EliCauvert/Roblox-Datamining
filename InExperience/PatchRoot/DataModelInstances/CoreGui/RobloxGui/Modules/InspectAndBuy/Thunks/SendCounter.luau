local parent = script.Parent.Parent
local thunkModule = require(parent.Thunk)
local analyticsModule = require(parent.Services.Analytics)
local list = { analyticsModule }

return function(p0)
	-- upvalues: thunkModule (ref), list (ref), analyticsModule (ref)
	return thunkModule.new(script.Name, list, function(_, p1)
		-- upvalues: analyticsModule (copy), p0 (ref)
		p1[analyticsModule].sendCounter(p0)
	end)
end