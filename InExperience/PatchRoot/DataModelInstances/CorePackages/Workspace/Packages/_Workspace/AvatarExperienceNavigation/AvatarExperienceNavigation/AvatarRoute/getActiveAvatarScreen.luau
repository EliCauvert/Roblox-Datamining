local avatarScreenPropertiesModule = require(script:FindFirstAncestor("AvatarExperienceNavigation").AvatarRoute.AvatarScreenProperties)

return function(p0)
	-- upvalues: avatarScreenPropertiesModule (ref)
	if not p0 then
		return nil
	end
	local var1 = p0
	while var1 and var1.routes do
		local index = var1.routes[var1.index]
		
		if index == nil or not avatarScreenPropertiesModule[index.routeName] then break end
		var1 = index
	end
	return var1
end