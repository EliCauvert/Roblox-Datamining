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

return function(p1, p2, p3)
	-- upvalues: getBadgesSeeAllUrlModule (ref), getBadgesSeeAllPageKeyModule (ref), parent (ref), getSduiApiStore (ref), fFlagSduiProtobufJsonDecode (ref), sduiResponseType (ref), appPage (ref), fFlagSduiUniversalPageEntry (ref)
	local var1 = getBadgesSeeAllUrlModule(p1)
	local badgesSeeAll = require(parent.ServiceContractsProto).apppageplatform.badges.badges_see_all
	getSduiApiStore().fetchIfNeeded({
		responseType = if fFlagSduiProtobufJsonDecode then sduiResponseType.Protobuf else nil,
		url = var1,
		surfaceKey = appPage.BadgesSeeAll,
		configKey = getBadgesSeeAllPageKeyModule(p1),
		loadTimer = p2,
		apiProto = if fFlagSduiUniversalPageEntry then badgesSeeAll.BadgesSeeAllV2Response else badgesSeeAll.BadgesSeeAllResponse,
		buildNextPageUrl = function(p4)
			-- upvalues: getBadgesSeeAllUrlModule (copy), p1 (ref)
			local nextCursor = p4 and (p4.pagination and p4.pagination.next_cursor)
			
			return if nextCursor and nextCursor ~= "" then getBadgesSeeAllUrlModule(p1, nextCursor) else nil
		end
	}, p3)
	
	return var1
end