local Parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local SendSocialLinksImpressionsEventFunction = require(Parent.DiscoveryAnalytics).Events.sendSocialLinksImpressionsEvent
local SduiErrors = require(Parent.SduiCoreSystem).SduiErrors
local t = {}

return function(p1, List, p2, p3, _) --[[ Line: 15 | Named "SduiSocialLinksImpressionsHandler" ]]
	-- upvalues: SduiErrors (copy), t (copy), SendSocialLinksImpressionsEventFunction (copy)
	if not p3 then
		p1.dependencies.logger.reportError(SduiErrors.SduiErrorType.FailedToLogSocialLinksImpressions, {
			name = "SduiSocialLinksImpressionsHandler",
			message = "Missing collectionAnalyticsData"
		}, p1.appPage)
		
		return
	end
	if #List == 0 or #(p2 or t) == 0 then
		p1.dependencies.logger.reportError(SduiErrors.SduiErrorType.FailedToLogSocialLinksImpressions, {
			name = "SduiSocialLinksImpressionsHandler",
			message = `No entries to log: impressionIndexes={#List}, itemAnalyticsDatas={#(p2 or t)}`
		}, p1.appPage)
		
		return
	end
	local List1 = {}
	local List2 = {}
	local List3 = {}
	
	for _, value in List do
		local v1 = p2[value]
		
		if v1 then
			table.insert(List1, value)
			table.insert(List2, v1.socialLinkUrl or "")
			table.insert(List3, v1.socialLinkType or "")
		end
	end
	if #List1 == 0 then
		p1.dependencies.logger.reportError(SduiErrors.SduiErrorType.FailedToLogSocialLinksImpressions, {
			name = "SduiSocialLinksImpressionsHandler",
			message = "No valid items found for impression indexes"
		}, p1.appPage)
		
		return
	else
		SendSocialLinksImpressionsEventFunction({
			item_positions = table.concat(List1, ","),
			social_link_urls = table.concat(List2, ","),
			social_link_types = table.concat(List3, ","),
			social_link_display_type = p3.socialLinkDisplayType,
			assignment_id = tonumber(p3.assignmentId),
			assignment_type = p3.assignmentType,
			page = p1.appPage
		})
	end
end