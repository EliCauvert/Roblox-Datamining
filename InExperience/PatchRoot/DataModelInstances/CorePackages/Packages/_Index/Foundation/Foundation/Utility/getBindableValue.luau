local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local _ = require(Parent.React)
local ReactIsModule = require(Parent.ReactIs)
local _ = require(Foundation.Components.Types)

return function(p1)
	-- upvalues: ReactIsModule (copy)
	return if ReactIsModule.isBinding(p1) then p1:getValue() else p1
end