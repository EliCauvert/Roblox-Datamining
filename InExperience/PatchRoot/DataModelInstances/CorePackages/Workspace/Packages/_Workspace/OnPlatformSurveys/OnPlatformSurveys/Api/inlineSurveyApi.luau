local onPlatformSurveys = script:FindFirstAncestor("OnPlatformSurveys")
local httpService = game:GetService("HttpService")
local url = require(onPlatformSurveys.Parent.Http).Url
local _ = require(onPlatformSurveys.Types.InlineSurveyTypes)

return {
	fetchInlineSurvey = function(p0, p1) --[[ line: 43 ]]
		-- upvalues: url (ref), httpService (ref)
		return p0(string.format("%s%s?eventType=%s&surveyType=inline", url.APIS_URL, "v1/survey", httpService:UrlEncode(p1)), "GET"):andThen(function(p2) --[[ line: 50 ]]
			return p2.responseBody
		end)
	end,
	submitSurveyResponse = function(p3, p4) --[[ line: 81 ]]
		-- upvalues: url (ref), httpService (ref)
		return p3(url.APIS_URL .. "v1/survey/response", "POST", { postBody = httpService:JSONEncode(p4) }):andThen(function(p5) --[[ line: 84 ]]
			return p5.responseBody
		end)
	end
}