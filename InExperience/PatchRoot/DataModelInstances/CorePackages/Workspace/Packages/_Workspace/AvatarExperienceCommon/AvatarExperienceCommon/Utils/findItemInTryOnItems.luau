local DashModule = require(script:FindFirstAncestor("AvatarExperienceCommon").Parent.Dash)
local GetTryOnItemReducerKeyModule = require(script.Parent.getTryOnItemReducerKey)

return function(p1, p2, p3)
	-- upvalues: GetTryOnItemReducerKeyModule (copy), DashModule (copy)
	return if p3 then p1[GetTryOnItemReducerKeyModule(tostring(p2), p3)] else DashModule.find(p1, function(p4): boolean
		-- upvalues: p2 (copy)
		return tostring(p4.itemId) == tostring(p2)
	end)
end