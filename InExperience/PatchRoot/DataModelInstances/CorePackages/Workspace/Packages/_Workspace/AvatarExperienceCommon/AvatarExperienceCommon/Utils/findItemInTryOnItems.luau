local dashModule = require(script:FindFirstAncestor("AvatarExperienceCommon").Parent.Dash)
local getTryOnItemReducerKeyModule = require(script.Parent.getTryOnItemReducerKey)

return function(a, b, p1)
	-- upvalues: getTryOnItemReducerKeyModule (ref), dashModule (ref)
	return if p1 then a[getTryOnItemReducerKeyModule(tostring(b), p1)] else dashModule.find(a, function(p2)
		-- upvalues: b (ref)
		return tostring(p2.itemId) == tostring(b)
	end)
end