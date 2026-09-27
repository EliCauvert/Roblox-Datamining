local playersService = game:GetService("Players")
local badges = script:FindFirstAncestor("Badges")
local parent = badges.Parent
local appPage = require(parent.RobloxAppEnums).AppPage
local sduiSharedUtilitiesModule = require(parent.SduiSharedUtilities)
local sduiResponseType = sduiSharedUtilitiesModule.SduiResponseType
local getSduiApiStore = sduiSharedUtilitiesModule.getSduiApiStore
local getBadgeDetailsUrlModule = require(badges.BadgesSeeAllPage.getBadgeDetailsUrl)
local getBadgeDetailsPageKeyModule = require(script.Parent.getBadgeDetailsPageKey)
local fFlagSduiExtendedCapabilitiesDiscovery = require(parent.SharedFlags).FFlagSduiExtendedCapabilitiesDiscovery

local function _()
	-- upvalues: playersService (ref)
	local localPlayer = playersService.LocalPlayer
	
	if not localPlayer then
		return nil
	end
	local userId = localPlayer.UserId
	
	return if userId <= 0 then nil else tostring(userId)
end

return function(p1, p2)
	-- upvalues: playersService (ref), fFlagSduiExtendedCapabilitiesDiscovery (ref), parent (ref), badges (ref), sduiSharedUtilitiesModule (ref), getSduiApiStore (ref), sduiResponseType (ref), appPage (ref), getBadgeDetailsPageKeyModule (ref), getBadgeDetailsUrlModule (ref)
	local var1
	local localPlayer = playersService.LocalPlayer
	
	if localPlayer then
		local userId = localPlayer.UserId
		var1 = if userId <= 0 then nil else tostring(userId)
	else
		var1 = nil
	end
	if fFlagSduiExtendedCapabilitiesDiscovery then
		local serviceContractsProtoModule = require(parent.ServiceContractsProto)
		local badgeDetailsPage = serviceContractsProtoModule.apppageplatform.badges.badge_details_page
		getSduiApiStore().fetchIfNeeded({
			responseType = sduiResponseType.Protobuf,
			url = require(badges.BadgesSeeAllPage.getBadgeDetailsPostUrl)(),
			surfaceKey = appPage.BadgeDetails,
			configKey = getBadgeDetailsPageKeyModule(p1),
			loadTimer = p2,
			apiProto = badgeDetailsPage.BadgeDetailsPageV2Response,
			postConfig = {
				contentType = sduiSharedUtilitiesModule.SduiApiStorePostConfigContentType.Proto,
				protoMessage = badgeDetailsPage.BadgeDetailsPageRequest,
				body = badgeDetailsPage.BadgeDetailsPageRequest.new({
					badge_id = tonumber(p1),
					user_id = if var1 then tonumber(var1) else nil,
					page_entry_format = serviceContractsProtoModule.apppageplatform.shared.page_entry_content.PageEntryFormat.toNumber("PAGE_ENTRY_FORMAT_UNIVERSAL"),
					client_capabilities = sduiSharedUtilitiesModule.SduiCapabilities.buildClientCapabilities()
				})
			}
		})
		
		return
	end
	getSduiApiStore().fetchIfNeeded({
		responseType = sduiResponseType.Protobuf,
		url = getBadgeDetailsUrlModule(p1, var1),
		surfaceKey = appPage.BadgeDetails,
		configKey = getBadgeDetailsPageKeyModule(p1),
		loadTimer = p2,
		apiProto = require(parent.ServiceContractsProto).apppageplatform.badges.badge_details_page.BadgeDetailsPageV2Response
	})
end