local badges = script:FindFirstAncestor("Badges")
local parent = badges.Parent
local appPage = require(parent.RobloxAppEnums).AppPage
local sduiSharedUtilitiesModule = require(parent.SduiSharedUtilities)
local sduiResponseType = sduiSharedUtilitiesModule.SduiResponseType
local getSduiApiStore = sduiSharedUtilitiesModule.getSduiApiStore
local getBadgesSeeAllUrlModule = require(badges.BadgesSeeAllPage.getBadgesSeeAllUrl)
local getBadgesSeeAllPageKeyModule = require(badges.BadgesSeeAllPage.getBadgesSeeAllPageKey)
local fFlagSduiProtobufJsonDecode = require(parent.SharedFlags).FFlagSduiProtobufJsonDecode
local fFlagSduiUniversalPageEntry = require(parent.SharedFlags).FFlagSduiUniversalPageEntry

return function(p0, p1, p2)
	-- upvalues: getBadgesSeeAllUrlModule (ref), getBadgesSeeAllPageKeyModule (ref), parent (ref), getSduiApiStore (ref), fFlagSduiProtobufJsonDecode (ref), sduiResponseType (ref), appPage (ref), fFlagSduiUniversalPageEntry (ref)
	local var4 = getBadgesSeeAllUrlModule(p0)
	local badgesSeeAll = require(parent.ServiceContractsProto).apppageplatform.badges.badges_see_all
	getSduiApiStore().fetchIfNeeded({
		responseType = if fFlagSduiProtobufJsonDecode then sduiResponseType.Protobuf else nil,
		url = var4,
		surfaceKey = appPage.BadgesSeeAll,
		configKey = getBadgesSeeAllPageKeyModule(p0),
		loadTimer = p1,
		apiProto = if fFlagSduiUniversalPageEntry then badgesSeeAll.BadgesSeeAllV2Response else badgesSeeAll.BadgesSeeAllResponse,
		buildNextPageUrl = function(p3)
			-- upvalues: getBadgesSeeAllUrlModule (copy), p0 (ref)
			local nextCursor = p3 and (p3.pagination and p3.pagination.next_cursor)
			
			return if nextCursor and nextCursor ~= "" then getBadgesSeeAllUrlModule(p0, nextCursor) else nil
		end
	}, p2)
	
	return var4
end