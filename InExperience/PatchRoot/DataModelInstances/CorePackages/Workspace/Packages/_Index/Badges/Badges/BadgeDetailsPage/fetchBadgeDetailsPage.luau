local Players = game:GetService("Players")
local Badges = script:FindFirstAncestor("Badges")
local Parent = Badges.Parent
local AppPage = require(Parent.RobloxAppEnums).AppPage
local SduiSharedUtilitiesModule = require(Parent.SduiSharedUtilities)
local SduiResponseType = SduiSharedUtilitiesModule.SduiResponseType
local GetSduiApiStoreFunction = SduiSharedUtilitiesModule.getSduiApiStore
local GetBadgeDetailsUrlModule = require(Badges.BadgesSeeAllPage.getBadgeDetailsUrl)
local GetBadgeDetailsPageKeyModule = require(script.Parent.getBadgeDetailsPageKey)
local FFlagSduiExtendedCapabilitiesDiscovery = require(Parent.SharedFlags).FFlagSduiExtendedCapabilitiesDiscovery

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
	-- upvalues: Players (copy), FFlagSduiExtendedCapabilitiesDiscovery (copy), Parent (copy), Badges (copy), SduiSharedUtilitiesModule (copy), GetSduiApiStoreFunction (copy), SduiResponseType (copy), AppPage (copy), GetBadgeDetailsPageKeyModule (copy), GetBadgeDetailsUrlModule (copy)
	local LocalPlayer = Players.LocalPlayer
	local v1 = nil
	
	if LocalPlayer then
		local UserId: number = LocalPlayer.UserId
		v1 = if UserId <= 0 then nil else tostring(UserId)
	else
		v1 = nil
	end
	if FFlagSduiExtendedCapabilitiesDiscovery then
		local ServiceContractsProtoModule = require(Parent.ServiceContractsProto)
		local BadgeDetailsPage = ServiceContractsProtoModule.apppageplatform.badges.badge_details_page
		GetSduiApiStoreFunction().fetchIfNeeded({
			responseType = SduiResponseType.Protobuf,
			url = require(Badges.BadgesSeeAllPage.getBadgeDetailsPostUrl)(),
			surfaceKey = AppPage.BadgeDetails,
			configKey = GetBadgeDetailsPageKeyModule(p1),
			loadTimer = LoadTimer,
			apiProto = BadgeDetailsPage.BadgeDetailsPageV2Response,
			postConfig = {
				contentType = SduiSharedUtilitiesModule.SduiApiStorePostConfigContentType.Proto,
				protoMessage = BadgeDetailsPage.BadgeDetailsPageRequest,
				body = BadgeDetailsPage.BadgeDetailsPageRequest.new({
					badge_id = tonumber(p1),
					user_id = if v1 then tonumber(v1) else nil,
					page_entry_format = ServiceContractsProtoModule.apppageplatform.shared.page_entry_content.PageEntryFormat.toNumber("PAGE_ENTRY_FORMAT_UNIVERSAL"),
					client_capabilities = SduiSharedUtilitiesModule.SduiCapabilities.buildClientCapabilities()
				})
			}
		})
		
		return
	else
		GetSduiApiStoreFunction().fetchIfNeeded({
			responseType = SduiResponseType.Protobuf,
			url = GetBadgeDetailsUrlModule(p1, v1),
			surfaceKey = AppPage.BadgeDetails,
			configKey = GetBadgeDetailsPageKeyModule(p1),
			loadTimer = LoadTimer,
			apiProto = require(Parent.ServiceContractsProto).apppageplatform.badges.badge_details_page.BadgeDetailsPageV2Response
		})
	end
end