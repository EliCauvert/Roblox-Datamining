local AvatarScreenPropertiesModule = require(script:FindFirstAncestor("AvatarExperienceNavigation").AvatarRoute.AvatarScreenProperties)

return function(p1) --[[ Line: 15 | Named "getActiveAvatarScreen" ]]
	-- upvalues: AvatarScreenPropertiesModule (copy)
	if not p1 then
		return nil
	end
	local v1 = p1
	while v1 and v1.routes do
		local Route = v1.routes[v1.index]
		
		if Route == nil or not AvatarScreenPropertiesModule[Route.routeName] then break end
		v1 = Route
	end
	return v1
end