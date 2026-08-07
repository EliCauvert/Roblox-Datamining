local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local _ = require(parent.React)
local reactIsModule = require(parent.ReactIs)
local _ = require(foundation.Components.Types)

return function(p0) --[[ line: 10 | named "getBindableValue" ]]
	-- upvalues: reactIsModule (ref)
	return if reactIsModule.isBinding(p0) then p0:getValue() else p0
end