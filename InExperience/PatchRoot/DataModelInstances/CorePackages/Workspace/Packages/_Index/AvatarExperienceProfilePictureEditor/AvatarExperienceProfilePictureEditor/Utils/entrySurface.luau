local AvatarScreen = require(script:FindFirstAncestor("AvatarExperienceProfilePictureEditor").Parent.AvatarExperienceNavigation).Enums.AvatarScreen

return {
	resolve = function(p1)
		if not p1.getParam then
			return nil, nil
		end
		local EntryOriginParam = p1.getParam("entryOrigin")
		
		if EntryOriginParam and EntryOriginParam.screenName then
			return EntryOriginParam.screenName, EntryOriginParam.screenParams
		else
			return p1.getParam("prevNavPage"), nil
		end
	end,
	park = function(p1, AvatarExperienceLandingPage)
		-- upvalues: AvatarScreen (copy)
		if p1.navigate ~= nil then
			p1.navigate(if AvatarExperienceLandingPage == AvatarScreen.AvatarExperienceLandingPage then AvatarScreen.AvatarExperienceLandingPage else AvatarScreen.Catalog)
			
			return
		end
	end
}