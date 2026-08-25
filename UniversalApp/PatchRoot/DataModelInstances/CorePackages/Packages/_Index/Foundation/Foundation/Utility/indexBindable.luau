local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local _ = require(parent.React)
local reactIsModule = require(parent.ReactIs)
local _ = require(foundation.Components.Types)

return function(p0, p1)
	-- upvalues: reactIsModule (ref)
	return if reactIsModule.isBinding(p0) then p0:map(function(p2)
		-- upvalues: p1 (ref)
		return p2[p1]
	end) else p0[p1]
end