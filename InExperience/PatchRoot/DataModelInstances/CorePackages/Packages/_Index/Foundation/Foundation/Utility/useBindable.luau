local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local reactModule = require(parent.React)
local reactIsModule = require(parent.ReactIs)
local _ = require(foundation.Components.Types)

return function(p1)
	-- upvalues: reactModule (ref), reactIsModule (ref)
	local var1, var2 = reactModule.useBinding(nil)
	
	if reactIsModule.isBinding(p1) then
		return p1
	end
	var2(p1)
	
	return var1
end