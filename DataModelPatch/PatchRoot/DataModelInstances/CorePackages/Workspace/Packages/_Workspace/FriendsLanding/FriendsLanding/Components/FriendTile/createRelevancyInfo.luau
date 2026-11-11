local FriendsLanding = script:FindFirstAncestor("FriendsLanding")
local DependenciesModule = require(FriendsLanding.dependencies)
local IsUserInGameModule = require(FriendsLanding.Friends.isUserInGame)
local GetCorrectUserPresenceModule = require(FriendsLanding.Friends.getCorrectUserPresence)
local NotLocalizedStringsModule = require(FriendsLanding.Enums.NotLocalizedStrings)
local Images = DependenciesModule.UIBlox.App.ImageSet.Images
local PresenceType = DependenciesModule.RoduxPresence.Enums.PresenceType
local FFlagFriendsPageAlwaysOpenPPV = require(FriendsLanding.Parent.SharedFlags).FFlagFriendsPageAlwaysOpenPPV
local _UDim2 = UDim2.fromOffset(12, 12)

return function(p1, Text, p2, Callback, p3, p4, p5, p6, Text1, p7)
	-- upvalues: GetCorrectUserPresenceModule (copy), Images (copy), PresenceType (copy), _UDim2 (copy), IsUserInGameModule (copy), FFlagFriendsPageAlwaysOpenPPV (copy), NotLocalizedStringsModule (copy)
	local config = { icon = p2 and Images[p2] or nil }
	
	if GetCorrectUserPresenceModule(p1) == PresenceType.Online then
		if not p7 then
			config.iconSize = _UDim2
		end
		config.iconColor = p3.OnlineStatus.Color
		config.iconTransparency = p3.OnlineStatus.Transparency
	end
	if p1.isDeleted then
		config.text = Text1
	elseif IsUserInGameModule(p1) then
		config.text = p1.lastLocation
		config.onActivated = if FFlagFriendsPageAlwaysOpenPPV then nil else Callback(p1.universeId, p1.id, p4)
	elseif p1.userPresenceType == PresenceType.InStudio then
		if p1.lastLocation and p1.lastLocation ~= "" then
			config.text = p1.lastLocation
		else
			config.text = p5 and NotLocalizedStringsModule.StudioPresenceTextLuobu.rawValue() or NotLocalizedStringsModule.StudioPresenceTextGlobal.rawValue()
		end
	else
		config.text = Text
	end
	if not p7 and p6 then
		config.fontStyle = IsUserInGameModule(p1) and p6.CaptionHeader or p6.CaptionBody
	end
	return config
end