local parent = script:FindFirstAncestor("Moments").Parent
local httpClientModule = require(parent.HttpClient)
local text = require(parent.Http).Url.APIS_URL .. "content-captures-api/v1/moderate/report"
local fFlagMomentsIPReporting = require(parent.SharedFlags).FFlagMomentsIPReporting

return function(p1, p2, p3)
	-- upvalues: httpClientModule (ref), text (ref), fFlagMomentsIPReporting (ref)
	return httpClientModule.asPromise(httpClientModule.fetch({
		method = "POST",
		analyticsKey = "moments.report-moment",
		url = text,
		body = {
			feedItemId = p1,
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