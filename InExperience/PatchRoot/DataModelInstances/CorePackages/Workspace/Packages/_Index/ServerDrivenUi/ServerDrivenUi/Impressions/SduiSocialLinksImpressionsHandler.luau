local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local sendSocialLinksImpressionsEvent = require(parent.DiscoveryAnalytics).Events.sendSocialLinksImpressionsEvent
local sduiErrors = require(parent.SduiCoreSystem).SduiErrors
local t = {}

return function(p1, p2, p3, p4, _)
	-- upvalues: sduiErrors (ref), t (ref), sendSocialLinksImpressionsEvent (ref)
	if not p4 then
		p1.dependencies.logger.reportError(sduiErrors.SduiErrorType.FailedToLogSocialLinksImpressions, {
			name = "SduiSocialLinksImpressionsHandler",
			message = "Missing collectionAnalyticsData"
		}, p1.appPage)
		
		return
	elseif #p2 == 0 or #(p3 or t) == 0 then
		p1.dependencies.logger.reportError(sduiErrors.SduiErrorType.FailedToLogSocialLinksImpressions, {
			name = "SduiSocialLinksImpressionsHandler",
			message = `No entries to log: impressionIndexes={#p2}, itemAnalyticsDatas={#(p3 or t)}`
		}, p1.appPage)
		
		return
	end
	local t_1 = {}
	local t_2 = {}
	local t_3 = {}
	
	for i, v in p2 do
		local var1 = p3[v]
		
		if var1 then
			table.insert(t_1, v)
			table.insert(t_2, var1.socialLinkUrl or "")
			table.insert(t_3, var1.socialLinkType or "")
		end
	end
	if #t_1 == 0 then
		p1.dependencies.logger.reportError(sduiErrors.SduiErrorType.FailedToLogSocialLinksImpressions, {
			name = "SduiSocialLinksImpressionsHandler",
			message = "No valid items found for impression indexes"
		}, p1.appPage)
		
		return
	end
	sendSocialLinksImpressionsEvent({
		item_positions = table.concat(t_1, ","),
		social_link_urls = table.concat(t_2, ","),
		social_link_types = table.concat(t_3, ","),
		social_link_display_type = p4.socialLinkDisplayType,
		assignment_id = tonumber(p4.assignmentId),
		assignment_type = p4.assignmentType,
		page = p1.appPage
	})
end