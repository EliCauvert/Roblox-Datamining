local parent = script:FindFirstAncestor("Moments").Parent
local httpModule = require(parent.Http)
local httpClientModule = require(parent.HttpClient)
local sharedFlagsModule = require(parent.SharedFlags)
local text = httpModule.Url.APIS_URL .. "content-captures-api/v1/moderate/report"
local fFlagMomentsIPReporting = sharedFlagsModule.FFlagMomentsIPReporting
local fFlagMomentsReportWithFeedId = sharedFlagsModule.FFlagMomentsReportWithFeedId

return function(p0, p1, p2)
	-- upvalues: httpClientModule (ref), text (ref), fFlagMomentsReportWithFeedId (ref), fFlagMomentsIPReporting (ref)
	return httpClientModule.asPromise(httpClientModule.fetch({
		method = "POST",
		analyticsKey = "moments.report-moment",
		url = text,
		body = {
			feedItemId = if fFlagMomentsReportWithFeedId then p0 else nil,
			momentId = if not fFlagMomentsReportWithFeedId then p0 else nil,
			reportType = if fFlagMomentsIPReporting then p1 else nil
		},
		network = p2,
		decode = function(p3)
			-- upvalues: fFlagMomentsIPReporting (copy)
			return {
				ok = true,
				reportCode = if fFlagMomentsIPReporting then p3.reportCode else nil
			}
		end
	}))
end