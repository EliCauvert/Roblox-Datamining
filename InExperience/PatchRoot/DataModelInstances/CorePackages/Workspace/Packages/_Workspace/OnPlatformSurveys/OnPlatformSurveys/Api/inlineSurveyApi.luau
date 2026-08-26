local onPlatformSurveys = script:FindFirstAncestor("OnPlatformSurveys")
local httpService = game:GetService("HttpService")
local url = require(onPlatformSurveys.Parent.Http).Url
local _ = require(onPlatformSurveys.Types.InlineSurveyTypes)

return {
	fetchInlineSurvey = function(p1, p2)
		-- upvalues: url (ref), httpService (ref)
		return p1(string.format("%s%s?eventType=%s&surveyType=inline", url.APIS_URL, "v1/survey", httpService:UrlEncode(p2)), "GET"):andThen(function(p3)
			return p3.responseBody
		end)
	end,
	submitSurveyResponse = function(p1, p2)
		-- upvalues: url (ref), httpService (ref)
		return p1(url.APIS_URL .. "v1/survey/response", "POST", { postBody = httpService:JSONEncode(p2) }):andThen(function(p3)
			return p3.responseBody
		end)
	end
}