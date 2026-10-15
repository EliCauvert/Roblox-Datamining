local parent = script:FindFirstAncestor("Moments").Parent
local httpClientModule = require(parent.HttpClient)
local text = require(parent.Http).Url.APIS_URL .. "post-moderation-api/v1/moderate/report-video"

return function(p1, p2)
	-- upvalues: httpClientModule (ref), text (ref)
	return httpClientModule.asPromise(httpClientModule.fetch({
		method = "POST",
		analyticsKey = "moments.report-video",
		url = text,
		body = {
			feedItemId = p1.data.targetIdStr,
			category = p1.data.category,
			comment = p1.data.comment
		},
		network = p2,
		decode = function(p3)
			return {
				ok = true,
				reportCode = if type(p3) == "table" then p3.reportCode else nil
			}
		end
	}))
end