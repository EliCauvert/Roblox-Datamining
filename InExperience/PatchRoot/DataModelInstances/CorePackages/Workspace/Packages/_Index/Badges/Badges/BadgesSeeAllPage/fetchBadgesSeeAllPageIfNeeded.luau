local Badges = script:FindFirstAncestor("Badges")
local Parent = Badges.Parent
local AppPage = require(Parent.RobloxAppEnums).AppPage
local SduiSharedUtilitiesModule = require(Parent.SduiSharedUtilities)
local SduiResponseType = SduiSharedUtilitiesModule.SduiResponseType
local GetSduiApiStoreFunction = SduiSharedUtilitiesModule.getSduiApiStore
local GetBadgesSeeAllPageKeyModule = require(Badges.BadgesSeeAllPage.getBadgesSeeAllPageKey)

return function(p1, LoadTimer, p2)
	-- upvalues: GetBadgesSeeAllPageKeyModule (copy), Parent (copy), Badges (copy), SduiSharedUtilitiesModule (copy), GetSduiApiStoreFunction (copy), SduiResponseType (copy), AppPage (copy)
	local ServiceContractsProtoModule = require(Parent.ServiceContractsProto)
	local BadgesSeeAll = ServiceContractsProtoModule.apppageplatform.badges.badges_see_all
	local BadgesSeeAllPageConstantsModule = require(Badges.BadgesSeeAllPage.BadgesSeeAllPageConstants)
	local SduiCapabilities = SduiSharedUtilitiesModule.SduiCapabilities
	local Url = require(Badges.BadgesSeeAllPage.getBadgesSeeAllPostUrl)()
	local PageEntryFormat = ServiceContractsProtoModule.apppageplatform.shared.page_entry_content.PageEntryFormat
	
	local function buildBody(p3)
		-- upvalues: BadgesSeeAll (copy), p1 (copy), BadgesSeeAllPageConstantsModule (copy), PageEntryFormat (copy), SduiCapabilities (copy)
		return (BadgesSeeAll.BadgesSeeAllRequest.new({
			universe_id = tonumber(p1),
			cursor = if p3 and p3 ~= "" then p3 else nil,
			page_size = BadgesSeeAllPageConstantsModule.RequestPageSize,
			page_entry_format = PageEntryFormat.toNumber("PAGE_ENTRY_FORMAT_UNIVERSAL"),
			client_capabilities = SduiCapabilities.buildClientCapabilities()
		}))
	end
	
	local function _(p3)
		local NextCursor = p3 and (p3.pagination and p3.pagination.next_cursor)
		
		return if NextCursor and NextCursor ~= "" then NextCursor else nil
	end
	
	GetSduiApiStoreFunction().fetchIfNeeded({
		responseType = SduiResponseType.Protobuf,
		url = Url,
		surfaceKey = AppPage.BadgesSeeAll,
		configKey = GetBadgesSeeAllPageKeyModule(p1),
		loadTimer = LoadTimer,
		apiProto = BadgesSeeAll.BadgesSeeAllV2Response,
		postConfig = {
			contentType = SduiSharedUtilitiesModule.SduiApiStorePostConfigContentType.Proto,
			protoMessage = BadgesSeeAll.BadgesSeeAllRequest,
			body = buildBody(nil)
		},
		buildNextPageUrl = function(p3)
			-- upvalues: Url (copy)
			local NextCursor = p3 and (p3.pagination and p3.pagination.next_cursor)
			local NextCursor1 = if NextCursor and NextCursor ~= "" then NextCursor else nil
			
			return if NextCursor1 then Url else nil
		end,
		buildNextPagePostBody = function(p3)
			-- upvalues: buildBody (copy)
			local NextCursor = p3 and (p3.pagination and p3.pagination.next_cursor)
			local NextCursor1 = if NextCursor and NextCursor ~= "" then NextCursor else nil
			
			return if NextCursor1 then buildBody(NextCursor1) else nil
		end
	}, p2)
	
	return Url
end