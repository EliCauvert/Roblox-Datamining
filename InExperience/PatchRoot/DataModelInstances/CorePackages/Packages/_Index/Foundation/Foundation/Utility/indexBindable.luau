local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local _ = require(parent.React)
local reactIsModule = require(parent.ReactIs)
local _ = require(foundation.Components.Types)

return function(p1, p2)
	-- upvalues: reactIsModule (ref)
	return if reactIsModule.isBinding(p1) then p1:map(function(p3)
		-- upvalues: p2 (ref)
		return p3[p2]
	end) else p1[p2]
end