local playersService = game:GetService("Players")
local badges = script:FindFirstAncestor("Badges")
local parent = badges.Parent
local appPage = require(parent.RobloxAppEnums).AppPage
local sduiSharedUtilitiesModule = require(parent.SduiSharedUtilities)
local sduiResponseType = sduiSharedUtilitiesModule.SduiResponseType
local getSduiApiStore = sduiSharedUtilitiesModule.getSduiApiStore
local getBadgeDetailsUrlModule = require(badges.BadgesSeeAllPage.getBadgeDetailsUrl)
local getBadgeDetailsPageKeyModule = require(script.Parent.getBadgeDetailsPageKey)
local fFlagSduiUniversalPageEntry = require(parent.SharedFlags).FFlagSduiUniversalPageEntry

local function _()
	-- upvalues: playersService (ref)
	local localPlayer = playersService.LocalPlayer
	
	if not localPlayer then
		return nil
	end
	local userId = localPlayer.UserId
	
	return if userId <= 0 then nil else tostring(userId)
end

return function(p0, p1)
	-- upvalues: playersService (ref), getBadgeDetailsUrlModule (ref), parent (ref), getSduiApiStore (ref), sduiResponseType (ref), appPage (ref), getBadgeDetailsPageKeyModule (ref), fFlagSduiUniversalPageEntry (ref)
	local var5
	local localPlayer = playersService.LocalPlayer
	
	if localPlayer then
		local userId = localPlayer.UserId
		var5 = if userId <= 0 then nil else tostring(userId)
	else
		var5 = nil
	end
	local badgeDetailsPage = require(parent.ServiceContractsProto).apppageplatform.badges.badge_details_page
	getSduiApiStore().fetchIfNeeded({
		responseType = sduiResponseType.Protobuf,
		url = getBadgeDetailsUrlModule(p0, var5),
		surfaceKey = appPage.BadgeDetails,
		configKey = getBadgeDetailsPageKeyModule(p0),
		loadTimer = p1,
		apiProto = if fFlagSduiUniversalPageEntry then badgeDetailsPage.BadgeDetailsPageV2Response else badgeDetailsPage.BadgeDetailsPageResponse
	})
end