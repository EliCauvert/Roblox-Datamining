local iconName = require(script:FindFirstAncestor("AvatarExperienceCatalog").Parent.Foundation).Enums.IconName

return function(p0) --[[ line: 8 | named "getFoundationIconName" ]]
	-- upvalues: iconName (ref)
	if p0 then
		local var0 = iconName[p0]
		
		return var0 or iconName.TagSparkle
	end
end