local dashModule = require(script:FindFirstAncestor("AvatarExperienceCommon").Parent.Dash)
local getTryOnItemReducerKeyModule = require(script.Parent.getTryOnItemReducerKey)

return function(a, b, p0) --[[ line: 8 | named "findItemInTryOnItems" ]]
	-- upvalues: getTryOnItemReducerKeyModule (ref), dashModule (ref)
	return if p0 then a[getTryOnItemReducerKeyModule(tostring(b), p0)] else dashModule.find(a, function(p1) --[[ line: 19 ]]
		-- upvalues: b (ref)
		return tostring(p1.itemId) == tostring(b)
	end)
end