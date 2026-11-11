local Parent = script.Parent.Parent
local _ = require(Parent.util.Types)
local TryYieldModule = require(Parent.util.tryYield)

return function(p1, p2)
	-- upvalues: TryYieldModule (copy)
	TryYieldModule(p2)
	
	return pcall(p1)
end