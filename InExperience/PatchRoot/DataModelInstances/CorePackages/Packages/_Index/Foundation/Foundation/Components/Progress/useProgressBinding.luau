local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local _ = require(parent.React)
local reactIsModule = require(parent.ReactIs)
local _ = require(foundation.Components.Types)

return function(p0) --[[ line: 10 | named "useProgressBinding" ]]
	-- upvalues: reactIsModule (ref)
	if reactIsModule.isBinding(p0) then
		return p0:map(function(p1) --[[ line: 15 ]]
			return math.clamp(p1 / 100, 0, 1)
		end), p0 == nil
	end
	return if p0 ~= nil then nil else math.clamp(p0 / 100, 0, 1), p0 == nil
end