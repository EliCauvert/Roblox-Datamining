local parent = script:FindFirstAncestor("Moments").Parent
local httpModule = require(parent.Http)
local httpClientModule = require(parent.HttpClient)
local sharedFlagsModule = require(parent.SharedFlags)
local text = httpModule.Url.APIS_URL .. "content-captures-api/v1/moderate/report"
local fFlagMomentsIPReporting = sharedFlagsModule.FFlagMomentsIPReporting
local fFlagMomentsReportWithFeedId = sharedFlagsModule.FFlagMomentsReportWithFeedId

return function(p1, p2, p3)
	-- upvalues: httpClientModule (ref), text (ref), fFlagMomentsReportWithFeedId (ref), fFlagMomentsIPReporting (ref)
	return httpClientModule.asPromise(httpClientModule.fetch({
		method = "POST",
		analyticsKey = "moments.report-moment",
		url = text,
		body = {
			feedItemId = if fFlagMomentsReportWithFeedId then p1 else nil,
			momentId = if not fFlagMomentsReportWithFeedId then p1 else nil,
			reportType = if fFlagMomentsIPReporting then p2 else nil
		},
		network = p3,
		decode = function(p4)
			-- upvalues: fFlagMomentsIPReporting (copy)
			return {
				ok = true,
				reportCode = if fFlagMomentsIPReporting then p4.reportCode else nil
			}
		end
	}))
end