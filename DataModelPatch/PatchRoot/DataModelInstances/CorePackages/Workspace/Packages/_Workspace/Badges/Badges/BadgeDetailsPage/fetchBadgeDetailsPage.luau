local Players = game:GetService("Players")
local Badges = script:FindFirstAncestor("Badges")
local Parent = Badges.Parent
local AppPage = require(Parent.RobloxAppEnums).AppPage
local SduiSharedUtilitiesModule = require(Parent.SduiSharedUtilities)
local SduiResponseType = SduiSharedUtilitiesModule.SduiResponseType
local GetSduiApiStoreFunction = SduiSharedUtilitiesModule.getSduiApiStore
local GetBadgeDetailsUrlModule = require(Badges.BadgesSeeAllPage.getBadgeDetailsUrl)
local GetBadgeDetailsPageKeyModule = require(script.Parent.getBadgeDetailsPageKey)
local FFlagSduiUniversalPageEntry = require(Parent.SharedFlags).FFlagSduiUniversalPageEntry

local function _()
	-- upvalues: Players (copy)
	local LocalPlayer = Players.LocalPlayer
	
	if LocalPlayer then
		local UserId: number = LocalPlayer.UserId
		
		return if UserId <= 0 then nil else tostring(UserId)
	else
		return nil
	end
end

return function(p1, LoadTimer)
	-- upvalues: Players (copy), GetBadgeDetailsUrlModule (copy), Parent (copy), GetSduiApiStoreFunction (copy), SduiResponseType (copy), AppPage (copy), GetBadgeDetailsPageKeyModule (copy), FFlagSduiUniversalPageEntry (copy)
	local LocalPlayer = Players.LocalPlayer
	local v1 = nil
	
	if LocalPlayer then
		local UserId: number = LocalPlayer.UserId
		v1 = if UserId <= 0 then nil else tostring(UserId)
	else
		v1 = nil
	end
	local BadgeDetailsPage = require(Parent.ServiceContractsProto).apppageplatform.badges.badge_details_page
	GetSduiApiStoreFunction().fetchIfNeeded({
		responseType = SduiResponseType.Protobuf,
		url = GetBadgeDetailsUrlModule(p1, v1),
		surfaceKey = AppPage.BadgeDetails,
		configKey = GetBadgeDetailsPageKeyModule(p1),
		loadTimer = LoadTimer,
		apiProto = if FFlagSduiUniversalPageEntry then BadgeDetailsPage.BadgeDetailsPageV2Response else BadgeDetailsPage.BadgeDetailsPageResponse
	})
end