local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local reactModule = require(parent.React)
local reactIsModule = require(parent.ReactIs)
local _ = require(foundation.Components.Types)

return function(p0)
	-- upvalues: reactModule (ref), reactIsModule (ref)
	local var3, var4 = reactModule.useBinding(nil)
	
	if reactIsModule.isBinding(p0) then
		return p0
	end
	var4(p0)
	
	return var3
end