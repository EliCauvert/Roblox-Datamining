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
local uDim2 = UDim2.fromOffset(12, 12)

return function(p0, p1, p2, p3, p4, p5, p6, p7, p8, p9) --[[ line: 17 ]]
	-- upvalues: getCorrectUserPresenceModule (ref), images (ref), presenceType (ref), uDim2 (ref), isUserInGameModule (ref), fFlagFriendsPageAlwaysOpenPPV (ref), notLocalizedStringsModule (ref)
	local t = { icon = if p2 then images[p2] else nil }
	
	if getCorrectUserPresenceModule(p0) == presenceType.Online then
		if not p9 then
			t.iconSize = uDim2
		end
		t.iconColor = p4.OnlineStatus.Color
		t.iconTransparency = p4.OnlineStatus.Transparency
	end
	if p0.isDeleted then
		t.text = p8
	elseif isUserInGameModule(p0) then
		t.text = p0.lastLocation
		t.onActivated = if fFlagFriendsPageAlwaysOpenPPV then nil else p3(p0.universeId, p0.id, p5)
	elseif p0.userPresenceType ~= presenceType.InStudio then
		t.text = p1
	elseif p0.lastLocation and p0.lastLocation ~= "" then
		t.text = p0.lastLocation
	else
		t.text = p6 and notLocalizedStringsModule.StudioPresenceTextLuobu.rawValue() or notLocalizedStringsModule.StudioPresenceTextGlobal.rawValue()
	end
	if not p9 and p7 then
		t.fontStyle = if isUserInGameModule(p0) then p7.CaptionHeader else p7.CaptionBody
	end
	return t
end