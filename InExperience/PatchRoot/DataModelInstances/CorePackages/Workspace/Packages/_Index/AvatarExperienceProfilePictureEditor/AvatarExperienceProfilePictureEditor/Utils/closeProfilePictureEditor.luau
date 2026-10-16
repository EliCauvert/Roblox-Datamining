local Parent = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor").Parent
local AvatarScreen = require(Parent.AvatarExperienceNavigation).Enums.AvatarScreen
local FFlagAXPPEReturnToEntrySurface = require(Parent.SharedFlags).FFlagAXPPEReturnToEntrySurface

local function _(p1) --[[ Line: 18 | Named "resolveEntrySurface" ]]
	if not p1.getParam then
		return nil, nil
	end
	local EntryOriginParam = p1.getParam("entryOrigin")
	
	if EntryOriginParam and EntryOriginParam.screenName then
		return EntryOriginParam.screenName, EntryOriginParam.screenParams
	else
		return p1.getParam("prevNavPage"), nil
	end
end

return function(p1) --[[ Line: 31 | Named "closeProfilePictureEditor" ]]
	-- upvalues: FFlagAXPPEReturnToEntrySurface (copy), AvatarScreen (copy)
	if not p1 then return end
	local PrevNavPageParam = nil
	local ScreenParams = nil
	if p1.getParam then
		local EntryOriginParam = p1.getParam("entryOrigin")
		
		if EntryOriginParam and EntryOriginParam.screenName then
			PrevNavPageParam = EntryOriginParam.screenName
			ScreenParams = EntryOriginParam.screenParams
		else
			PrevNavPageParam = p1.getParam("prevNavPage")
			ScreenParams = nil
		end
	else
		PrevNavPageParam = nil
		ScreenParams = nil
	end
	if PrevNavPageParam and p1.navigate then
		if FFlagAXPPEReturnToEntrySurface then
			p1.navigate(if PrevNavPageParam == AvatarScreen.AvatarExperienceLandingPage then AvatarScreen.AvatarExperienceLandingPage else AvatarScreen.Catalog)
		end
		if ScreenParams then
			p1.navigate(PrevNavPageParam, ScreenParams)
			
			return
		else
			p1.navigate(PrevNavPageParam)
			
			return
		end
	elseif p1.goBack then
		p1.goBack()
		
		return
	else
		if p1.pop then
			p1.pop()
		end
	end
end