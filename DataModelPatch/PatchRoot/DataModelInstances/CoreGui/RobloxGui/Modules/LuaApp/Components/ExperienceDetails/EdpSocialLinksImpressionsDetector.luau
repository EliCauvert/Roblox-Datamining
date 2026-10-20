local TelemetryService = game:GetService("TelemetryService")
local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local _ = require(CorePackages.Workspace.Packages.AppCommonLib)
local ScreenSizeImpressionsTracker = require(CorePackages.Workspace.Packages.Impressions).ScreenSizeImpressionsTracker
local SendSocialLinksImpressionsEventFunction = require(CorePackages.Workspace.Packages.DiscoveryAnalytics).Events.sendSocialLinksImpressionsEvent
local FFlagLuaAppMoveSocialLinksImpressions = game:DefineFastFlag("FFlagLuaAppMoveSocialLinksImpressions", false)
local SocialLinksImpressionsEventHundredthsPercent = if FFlagLuaAppMoveSocialLinksImpressions then nil else game:DefineFastInt("SocialLinksImpressionsEventHundredthsPercent", 10000)
local Config = if FFlagLuaAppMoveSocialLinksImpressions then nil else {
	eventName = "EdpSocialLinksImpressions",
	description = "Impressions for social links on EDP",
	lastUpdated = { 25, 12, 10 },
	backends = { "EventIngest" },
	throttlingPercentage = SocialLinksImpressionsEventHundredthsPercent
}

return function(p1)
	-- upvalues: ReactModule (copy), FFlagLuaAppMoveSocialLinksImpressions (copy), SendSocialLinksImpressionsEventFunction (copy), TelemetryService (copy), Config (copy), ScreenSizeImpressionsTracker (copy)
	return ReactModule.createElement(ScreenSizeImpressionsTracker, {
		parentRef = p1.parentRef,
		pageContext = p1.pageContext,
		impressionsTag = p1.impressionsTag,
		scrollViewPositionChangedSignal = p1.scrollViewPositionChangedSignal,
		sendImpressions = ReactModule.useCallback(function(p2)
			-- upvalues: p1 (copy), FFlagLuaAppMoveSocialLinksImpressions (upval), SendSocialLinksImpressionsEventFunction (upval), TelemetryService (upval), Config (upval)
			if #p2 == 0 or p1.socialLinks == nil then return end
			local List = {}
			local List1 = {}
			local List2 = {}
			
			for i = 1, #p2 do
				local SocialLink = p1.socialLinks[i]
				
				if SocialLink then
					table.insert(List, i)
					table.insert(List1, SocialLink.url or "")
					table.insert(List2, SocialLink.type or "")
				end
			end
			local CustomFields = {
				social_link_display_type = "badge",
				assignment_type = "game",
				item_positions = table.concat(List, ","),
				social_link_urls = table.concat(List1, ","),
				social_link_types = table.concat(List2, ","),
				assignment_id = tonumber(p1.universeId),
				page = p1.pageContext
			}
			
			if FFlagLuaAppMoveSocialLinksImpressions then
				SendSocialLinksImpressionsEventFunction(CustomFields)
				
				return
			else
				TelemetryService:LogEvent(Config, {
					customFields = CustomFields,
					standardizedFields = { "addSessionInfo" }
				})
			end
		end, { p1.socialLinks, p1.universeId, p1.pageContext })
	})
end