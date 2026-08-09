local parent = script:FindFirstAncestor("Moments").Parent
local httpClientModule = require(parent.HttpClient)
local text = require(parent.Http).Url.APIS_URL .. "content-captures-api/v1/moderate/report"

return function(p0, p1) --[[ line: 15 | named "reportMoment" ]]
	-- upvalues: httpClientModule (ref), text (ref)
	return httpClientModule.asPromise(httpClientModule.fetch({
		method = "POST",
		analyticsKey = "moments.report-moment",
		url = text,
		body = { momentId = p0 },
		network = p1,
		decode = function(_) --[[ line: 22 ]]
			return { ok = true }
		end
	}))
end