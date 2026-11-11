local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local _ = require(Parent.React)
local ReactIsModule = require(Parent.ReactIs)
local _ = require(Foundation.Components.Types)

return function(p1, p2)
	-- upvalues: ReactIsModule (copy)
	return if ReactIsModule.isBinding(p1) then p1:map(function(p3)
		-- upvalues: p2 (copy)
		return p3[p2]
	end) else p1[p2]
end