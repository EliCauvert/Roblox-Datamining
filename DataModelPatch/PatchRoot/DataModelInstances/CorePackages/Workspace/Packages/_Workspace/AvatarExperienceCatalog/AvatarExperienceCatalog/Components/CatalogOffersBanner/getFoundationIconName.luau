local IconName = require(script:FindFirstAncestor("AvatarExperienceCatalog").Parent.Foundation).Enums.IconName

return function(p1)
	-- upvalues: IconName (copy)
	if p1 then
		local IconNameEntry = IconName[p1]
		
		if IconNameEntry then
			return IconNameEntry
		end
	end
	return IconName.TagSparkle
end