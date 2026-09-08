local parent = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor").Parent
local avatarScreen = require(parent.AvatarExperienceNavigation).Enums.AvatarScreen
local fFlagAXPPEReturnToEntrySurface = require(parent.SharedFlags).FFlagAXPPEReturnToEntrySurface

local function _(p1)
	if not p1.getParam then
		return nil, nil
	end
	local entryOrigin = p1.getParam("entryOrigin")
	
	if entryOrigin and entryOrigin.screenName then
		return entryOrigin.screenName, entryOrigin.screenParams
	end
	return p1.getParam("prevNavPage"), nil
end

return function(p1)
	-- upvalues: fFlagAXPPEReturnToEntrySurface (ref), avatarScreen (ref)
	local screenName, screenParams
	if not p1 then return end
	if p1.getParam then
		local entryOrigin = p1.getParam("entryOrigin")
		
		if entryOrigin and entryOrigin.screenName then
			screenName = entryOrigin.screenName
			screenParams = entryOrigin.screenParams
		else
			screenName = p1.getParam("prevNavPage")
			screenParams = nil
		end
	else
		screenName = nil
		screenParams = nil
	end
	if screenName and p1.navigate then
		if fFlagAXPPEReturnToEntrySurface then
			p1.navigate(if screenName == avatarScreen.AvatarExperienceLandingPage then avatarScreen.AvatarExperienceLandingPage else avatarScreen.Catalog)
		end
		if screenParams then
			p1.navigate(screenName, screenParams)
			
			return
		end
		p1.navigate(screenName)
		
		return
	elseif p1.goBack then
		p1.goBack()
		
		return
	elseif p1.pop then
		p1.pop()
	end
end