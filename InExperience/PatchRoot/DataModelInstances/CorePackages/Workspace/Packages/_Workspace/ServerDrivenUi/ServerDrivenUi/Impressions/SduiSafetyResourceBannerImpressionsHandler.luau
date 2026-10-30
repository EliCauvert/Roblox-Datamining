local Parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local DiscoveryAnalyticsModule = require(Parent.DiscoveryAnalytics)
local SafetyResourceBannerAction = DiscoveryAnalyticsModule.Constants.SafetyResourceBannerAction
local SendSafetyResourceBannerEventFunction = DiscoveryAnalyticsModule.Events.sendSafetyResourceBannerEvent
local _ = require(Parent.SduiCoreSystem)

return function(_, List, p1, _, _)
	-- upvalues: SendSafetyResourceBannerEventFunction (copy), SafetyResourceBannerAction (copy)
	for _, value in List do
		local v1 = p1 and p1[value] or {}
		SendSafetyResourceBannerEventFunction({
			action = SafetyResourceBannerAction.Impression,
			moderationCategory = v1.moderationCategory,
			url = v1.url,
			surface = v1.surface,
			textFilterRequestId = v1.textFilterRequestId
		})
	end
end