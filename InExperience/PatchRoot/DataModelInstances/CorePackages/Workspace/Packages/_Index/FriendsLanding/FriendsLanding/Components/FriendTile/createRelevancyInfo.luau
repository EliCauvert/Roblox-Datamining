local friendsLanding = script:FindFirstAncestor("FriendsLanding")
local dependenciesModule = require(friendsLanding.dependencies)
local UIBlox = dependenciesModule.UIBlox
local isUserInGameModule = require(friendsLanding.Friends.isUserInGame)
local getCorrectUserPresenceModule = require(friendsLanding.Friends.getCorrectUserPresence)
local notLocalizedStringsModule = require(friendsLanding.Enums.NotLocalizedStrings)
local images = UIBlox.App.ImageSet.Images
local presenceType = dependenciesModule.RoduxPresence.Enums.PresenceType
local uDim2 = UDim2.fromOffset(12, 12)

return function(p1, p2, p3, _, p4, _, p5, p6, p7, p8)
	-- upvalues: getCorrectUserPresenceModule (ref), images (ref), presenceType (ref), uDim2 (ref), isUserInGameModule (ref), notLocalizedStringsModule (ref)
	local t = { icon = if p3 then images[p3] else nil }
	
	if getCorrectUserPresenceModule(p1) == presenceType.Online then
		if not p8 then
			t.iconSize = uDim2
		end
		t.iconColor = p4.OnlineStatus.Color
		t.iconTransparency = p4.OnlineStatus.Transparency
	end
	if p1.isDeleted then
		t.text = p7
	elseif isUserInGameModule(p1) then
		t.text = p1.lastLocation
	elseif p1.userPresenceType ~= presenceType.InStudio then
		t.text = p2
	elseif p1.lastLocation and p1.lastLocation ~= "" then
		t.text = p1.lastLocation
	else
		t.text = p5 and notLocalizedStringsModule.StudioPresenceTextLuobu.rawValue() or notLocalizedStringsModule.StudioPresenceTextGlobal.rawValue()
	end
	if not p8 and p6 then
		t.fontStyle = if isUserInGameModule(p1) then p6.CaptionHeader else p6.CaptionBody
	end
	return t
end