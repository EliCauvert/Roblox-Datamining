local Badges = script:FindFirstAncestor("Badges")
local Parent = Badges.Parent
local AppPage = require(Parent.RobloxAppEnums).AppPage
local SduiSharedUtilitiesModule = require(Parent.SduiSharedUtilities)
local SduiResponseType = SduiSharedUtilitiesModule.SduiResponseType
local GetSduiApiStoreFunction = SduiSharedUtilitiesModule.getSduiApiStore
local GetBadgesSeeAllUrlModule = require(Badges.BadgesSeeAllPage.getBadgesSeeAllUrl)
local GetBadgesSeeAllPageKeyModule = require(Badges.BadgesSeeAllPage.getBadgesSeeAllPageKey)
local FFlagSduiProtobufJsonDecode = require(Parent.SharedFlags).FFlagSduiProtobufJsonDecode
local FFlagSduiUniversalPageEntry = require(Parent.SharedFlags).FFlagSduiUniversalPageEntry

return function(p1, LoadTimer, p2)
	-- upvalues: GetBadgesSeeAllUrlModule (copy), GetBadgesSeeAllPageKeyModule (copy), Parent (copy), GetSduiApiStoreFunction (copy), FFlagSduiProtobufJsonDecode (copy), SduiResponseType (copy), AppPage (copy), FFlagSduiUniversalPageEntry (copy)
	local BadgesSeeAllUrlModule = GetBadgesSeeAllUrlModule(p1)
	local BadgesSeeAll = require(Parent.ServiceContractsProto).apppageplatform.badges.badges_see_all
	GetSduiApiStoreFunction().fetchIfNeeded({
		responseType = if FFlagSduiProtobufJsonDecode then SduiResponseType.Protobuf else nil,
		url = BadgesSeeAllUrlModule,
		surfaceKey = AppPage.BadgesSeeAll,
		configKey = GetBadgesSeeAllPageKeyModule(p1),
		loadTimer = LoadTimer,
		apiProto = if FFlagSduiUniversalPageEntry then BadgesSeeAll.BadgesSeeAllV2Response else BadgesSeeAll.BadgesSeeAllResponse,
		buildNextPageUrl = function(p3)
			-- upvalues: GetBadgesSeeAllUrlModule (upval), p1 (copy)
			local NextCursor = p3 and (p3.pagination and p3.pagination.next_cursor)
			
			return if NextCursor and NextCursor ~= "" then GetBadgesSeeAllUrlModule(p1, NextCursor) else nil
		end
	}, p2)
	
	return BadgesSeeAllUrlModule
end