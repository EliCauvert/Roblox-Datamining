local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local reactModule = require(parent.React)
local reactIsModule = require(parent.ReactIs)
local _ = require(foundation.Components.Types)

return function(value, p1)
	-- upvalues: reactIsModule (ref), reactModule (ref)
	return if reactIsModule.isBinding(value) and reactIsModule.isBinding(p1) then reactModule.joinBindings({ Color3 = value, Transparency = p1 }) elseif reactIsModule.isBinding(value) then value:map(function(p2)
		-- upvalues: p1 (ref)
		return { Color3 = p2, Transparency = p1 }
	end) elseif reactIsModule.isBinding(p1) then p1:map(function(p2)
		-- upvalues: value (ref)
		return { Color3 = value, Transparency = p2 }
	end) else { Color3 = value, Transparency = p1 }
end