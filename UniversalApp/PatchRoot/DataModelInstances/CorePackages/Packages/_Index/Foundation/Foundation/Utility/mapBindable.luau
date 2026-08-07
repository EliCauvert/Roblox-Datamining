local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local _ = require(parent.React)
local reactIsModule = require(parent.ReactIs)
local _ = require(foundation.Components.Types)

return function(p0, p1) --[[ line: 10 | named "mapBindable" ]]
	-- upvalues: reactIsModule (ref)
	return if reactIsModule.isBinding(p0) then p0:map(p1) else p1(p0)
end