local iconName = require(script:FindFirstAncestor("AvatarExperienceCatalog").Parent.Foundation).Enums.IconName

return function(p1)
	-- upvalues: iconName (ref)
	if p1 then
		local var1 = iconName[p1]
		
		return var1 or iconName.TagSparkle
	end
end