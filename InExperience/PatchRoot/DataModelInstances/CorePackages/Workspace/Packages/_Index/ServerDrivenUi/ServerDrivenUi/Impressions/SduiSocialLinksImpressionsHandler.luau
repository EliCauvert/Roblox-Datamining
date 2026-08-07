local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local sendSocialLinksImpressionsEvent = require(parent.DiscoveryAnalytics).Events.sendSocialLinksImpressionsEvent
local sduiErrors = require(parent.SduiCoreSystem).SduiErrors
local t = {}

return function(p0, p1, p2, p3, _) --[[ line: 15 | named "SduiSocialLinksImpressionsHandler" ]]
	-- upvalues: sduiErrors (ref), t (ref), sendSocialLinksImpressionsEvent (ref)
	if not p3 then
		p0.dependencies.logger.reportError(sduiErrors.SduiErrorType.FailedToLogSocialLinksImpressions, {
			name = "SduiSocialLinksImpressionsHandler",
			message = "Missing collectionAnalyticsData"
		}, p0.appPage)
		
		return
	elseif #p1 == 0 or #(p2 or t) == 0 then
		p0.dependencies.logger.reportError(sduiErrors.SduiErrorType.FailedToLogSocialLinksImpressions, {
			name = "SduiSocialLinksImpressionsHandler",
			message = `No entries to log: impressionIndexes={#p1}, itemAnalyticsDatas={#(p2 or t)}`
		}, p0.appPage)
		
		return
	end
	local t_1 = {}
	local t_2 = {}
	local t_3 = {}
	
	for i, v in p1 do
		local var4 = p2[v]
		
		if var4 then
			table.insert(t_1, v)
			table.insert(t_2, var4.socialLinkUrl or "")
			table.insert(t_3, var4.socialLinkType or "")
		end
	end
	if #t_1 == 0 then
		p0.dependencies.logger.reportError(sduiErrors.SduiErrorType.FailedToLogSocialLinksImpressions, {
			name = "SduiSocialLinksImpressionsHandler",
			message = "No valid items found for impression indexes"
		}, p0.appPage)
		
		return
	end
	sendSocialLinksImpressionsEvent({
		item_positions = table.concat(t_1, ","),
		social_link_urls = table.concat(t_2, ","),
		social_link_types = table.concat(t_3, ","),
		social_link_display_type = p3.socialLinkDisplayType,
		assignment_id = tonumber(p3.assignmentId),
		assignment_type = p3.assignmentType,
		page = p0.appPage
	})
end