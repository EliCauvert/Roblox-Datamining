local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local _ = require(parent.React)
local reactIsModule = require(parent.ReactIs)
local _ = require(foundation.Components.Types)

return function(p1)
	-- upvalues: reactIsModule (ref)
	if reactIsModule.isBinding(p1) then
		return p1:map(function(p2)
			return math.clamp(p2 / 100, 0, 1)
		end), p1 == nil
	end
	return if p1 ~= nil then nil else math.clamp(p1 / 100, 0, 1), p1 == nil
end