local badges = script:FindFirstAncestor("Badges")
local parent = badges.Parent
local appPage = require(parent.RobloxAppEnums).AppPage
local sduiSharedUtilitiesModule = require(parent.SduiSharedUtilities)
local sduiResponseType = sduiSharedUtilitiesModule.SduiResponseType
local getSduiApiStore = sduiSharedUtilitiesModule.getSduiApiStore
local getBadgesSeeAllUrlModule = require(badges.BadgesSeeAllPage.getBadgesSeeAllUrl)
local getBadgesSeeAllPageKeyModule = require(badges.BadgesSeeAllPage.getBadgesSeeAllPageKey)
local fFlagSduiProtobufJsonDecode = require(parent.SharedFlags).FFlagSduiProtobufJsonDecode
local fFlagSduiExtendedCapabilitiesDiscovery = require(parent.SharedFlags).FFlagSduiExtendedCapabilitiesDiscovery

return function(p1, p2, p3)
	-- upvalues: fFlagSduiExtendedCapabilitiesDiscovery (ref), getBadgesSeeAllPageKeyModule (ref), parent (ref), badges (ref), sduiSharedUtilitiesModule (ref), getSduiApiStore (ref), fFlagSduiProtobufJsonDecode (ref), sduiResponseType (ref), appPage (ref), getBadgesSeeAllUrlModule (ref)
	if fFlagSduiExtendedCapabilitiesDiscovery then
		local var1 = getBadgesSeeAllPageKeyModule(p1)
		local serviceContractsProtoModule = require(parent.ServiceContractsProto)
		local badgesSeeAll = serviceContractsProtoModule.apppageplatform.badges.badges_see_all
		local getBadgesSeeAllPostUrlModule = require(badges.BadgesSeeAllPage.getBadgesSeeAllPostUrl)
		local badgesSeeAllPageConstantsModule = require(badges.BadgesSeeAllPage.BadgesSeeAllPageConstants)
		local sduiApiStorePostConfigContentType = sduiSharedUtilitiesModule.SduiApiStorePostConfigContentType
		local sduiCapabilities = sduiSharedUtilitiesModule.SduiCapabilities
		local var2 = getBadgesSeeAllPostUrlModule()
		local pageEntryFormat = serviceContractsProtoModule.apppageplatform.shared.page_entry_content.PageEntryFormat
		
		local function buildBody(p4)
			-- upvalues: badgesSeeAll (ref), p1 (ref), badgesSeeAllPageConstantsModule (ref), pageEntryFormat (ref), sduiCapabilities (ref)
			return badgesSeeAll.BadgesSeeAllRequest.new({
				universe_id = tonumber(p1),
				cursor = if p4 and p4 ~= "" then p4 else nil,
				page_size = badgesSeeAllPageConstantsModule.RequestPageSize,
				page_entry_format = pageEntryFormat.toNumber("PAGE_ENTRY_FORMAT_UNIVERSAL"),
				client_capabilities = sduiCapabilities.buildClientCapabilities()
			})
		end
		
		local function _(p4)
			local nextCursor = p4 and (p4.pagination and p4.pagination.next_cursor)
			
			return if nextCursor and nextCursor ~= "" then nextCursor else nil
		end
		
		getSduiApiStore().fetchIfNeeded({
			responseType = if fFlagSduiProtobufJsonDecode then sduiResponseType.Protobuf else nil,
			url = var2,
			surfaceKey = appPage.BadgesSeeAll,
			configKey = var1,
			loadTimer = p2,
			apiProto = badgesSeeAll.BadgesSeeAllV2Response,
			postConfig = {
				contentType = sduiApiStorePostConfigContentType.Proto,
				protoMessage = badgesSeeAll.BadgesSeeAllRequest,
				body = buildBody(nil)
			},
			buildNextPageUrl = function(p4)
				-- upvalues: var2 (ref)
				local nextCursor = p4 and (p4.pagination and p4.pagination.next_cursor)
				
				return if if nextCursor and nextCursor ~= "" then nextCursor else nil then var2 else nil
			end,
			buildNextPagePostBody = function(p4)
				-- upvalues: buildBody (ref)
				local nextCursor = p4 and (p4.pagination and p4.pagination.next_cursor)
				local var3 = if nextCursor and nextCursor ~= "" then nextCursor else nil
				
				return if var3 then buildBody(var3) else nil
			end
		}, p3)
		
		return var2
	end
	local var3 = getBadgesSeeAllUrlModule(p1)
	getSduiApiStore().fetchIfNeeded({
		responseType = if fFlagSduiProtobufJsonDecode then sduiResponseType.Protobuf else nil,
		url = var3,
		surfaceKey = appPage.BadgesSeeAll,
		configKey = getBadgesSeeAllPageKeyModule(p1),
		loadTimer = p2,
		apiProto = require(parent.ServiceContractsProto).apppageplatform.badges.badges_see_all.BadgesSeeAllV2Response,
		buildNextPageUrl = function(p4)
			-- upvalues: getBadgesSeeAllUrlModule (copy), p1 (ref)
			local nextCursor = p4 and (p4.pagination and p4.pagination.next_cursor)
			
			return if nextCursor and nextCursor ~= "" then getBadgesSeeAllUrlModule(p1, nextCursor) else nil
		end
	}, p3)
	
	return var3
end