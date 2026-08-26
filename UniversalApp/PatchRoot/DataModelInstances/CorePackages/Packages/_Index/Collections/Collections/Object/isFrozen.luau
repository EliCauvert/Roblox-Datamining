local dEV = _G.__DEV__
local _ = require(script.Parent.Parent.Parent.ES7Types)

return function(p1)
	-- upvalues: dEV (ref)
	if dEV then
		print("Luau now has a direct table.isfrozen call that can save the overhead of this library function call")
	end
	return table.isfrozen(p1)
end