local Parent = script:FindFirstAncestor("Moments").Parent
local HttpClientModule = require(Parent.HttpClient)
local Text = require(Parent.Http).Url.APIS_URL .. "post-moderation-api/v1/moderate/report-video"

return function(p1, Network) --[[ Line: 23 | Named "reportEdpVideo" ]]
	-- upvalues: HttpClientModule (copy), Text (copy)
	return HttpClientModule.asPromise(HttpClientModule.fetch({
		method = "POST",
		analyticsKey = "moments.report-video",
		url = Text,
		body = {
			feedItemId = p1.data.targetIdStr,
			category = p1.data.category,
			comment = p1.data.comment
		},
		network = Network,
		decode = function(p2) --[[ Line: 34 ]]
			return {
				ok = true,
				reportCode = if type(p2) == "table" then p2.reportCode else nil
			}
		end
	}))
end