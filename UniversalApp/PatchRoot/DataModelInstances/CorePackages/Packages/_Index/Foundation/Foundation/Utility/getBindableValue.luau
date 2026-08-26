local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local _ = require(parent.React)
local reactIsModule = require(parent.ReactIs)
local _ = require(foundation.Components.Types)

return function(p1)
	-- upvalues: reactIsModule (ref)
	return if reactIsModule.isBinding(p1) then p1:getValue() else p1
end