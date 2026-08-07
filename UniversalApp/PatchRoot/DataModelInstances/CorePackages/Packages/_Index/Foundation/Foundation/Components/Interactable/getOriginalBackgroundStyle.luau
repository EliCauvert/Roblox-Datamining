local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local reactModule = require(parent.React)
local reactIsModule = require(parent.ReactIs)
local _ = require(foundation.Components.Types)

return function(value, p0) --[[ line: 11 | named "getOriginalBackgroundStyle" ]]
	-- upvalues: reactIsModule (ref), reactModule (ref)
	return if reactIsModule.isBinding(value) and reactIsModule.isBinding(p0) then reactModule.joinBindings({ Color3 = value, Transparency = p0 }) elseif reactIsModule.isBinding(value) then value:map(function(p2) --[[ line: 21 ]]
		-- upvalues: p0 (ref)
		return { Color3 = p2, Transparency = p0 }
	end) elseif reactIsModule.isBinding(p0) then p0:map(function(p1) --[[ line: 25 ]]
		-- upvalues: value (ref)
		return { Color3 = value, Transparency = p1 }
	end) else { Color3 = value, Transparency = p0 }
end