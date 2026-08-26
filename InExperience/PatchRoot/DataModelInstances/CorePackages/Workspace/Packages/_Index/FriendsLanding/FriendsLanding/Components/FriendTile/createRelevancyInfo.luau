local friendsLanding = script:FindFirstAncestor("FriendsLanding")
local parent = friendsLanding.Parent
local dependenciesModule = require(friendsLanding.dependencies)
local UIBlox = dependenciesModule.UIBlox
local isUserInGameModule = require(friendsLanding.Friends.isUserInGame)
local getCorrectUserPresenceModule = require(friendsLanding.Friends.getCorrectUserPresence)
local notLocalizedStringsModule = require(friendsLanding.Enums.NotLocalizedStrings)
local images = UIBlox.App.ImageSet.Images
local presenceType = dependenciesModule.RoduxPresence.Enums.PresenceType
local fFlagFriendsPageAlwaysOpenPPV = require(parent.SharedFlags).FFlagFriendsPageAlwaysOpenPPV
local fFlagFriendsPageUnifiedOpenProfileLogic = require(parent.SharedFlags).FFlagFriendsPageUnifiedOpenProfileLogic
local uDim2 = UDim2.fromOffset(12, 12)

return function(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10)
	-- upvalues: getCorrectUserPresenceModule (ref), images (ref), presenceType (ref), uDim2 (ref), isUserInGameModule (ref), fFlagFriendsPageAlwaysOpenPPV (ref), fFlagFriendsPageUnifiedOpenProfileLogic (ref), notLocalizedStringsModule (ref)
	local t = { icon = if p3 then images[p3] else nil }
	
	if getCorrectUserPresenceModule(p1) == presenceType.Online then
		if not p10 then
			t.iconSize = uDim2
		end
		t.iconColor = p5.OnlineStatus.Color
		t.iconTransparency = p5.OnlineStatus.Transparency
	end
	if p1.isDeleted then
		t.text = p9
	elseif isUserInGameModule(p1) then
		t.text = p1.lastLocation
		t.onActivated = if fFlagFriendsPageAlwaysOpenPPV or fFlagFriendsPageUnifiedOpenProfileLogic then nil else p4(p1.universeId, p1.id, p6)
	elseif p1.userPresenceType ~= presenceType.InStudio then
		t.text = p2
	elseif p1.lastLocation and p1.lastLocation ~= "" then
		t.text = p1.lastLocation
	else
		t.text = p7 and notLocalizedStringsModule.StudioPresenceTextLuobu.rawValue() or notLocalizedStringsModule.StudioPresenceTextGlobal.rawValue()
	end
	if not p10 and p8 then
		t.fontStyle = if isUserInGameModule(p1) then p8.CaptionHeader else p8.CaptionBody
	end
	return t
end