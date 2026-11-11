local OnPlatformSurveys = script:FindFirstAncestor("OnPlatformSurveys")
local HttpService = game:GetService("HttpService")
local Url = require(OnPlatformSurveys.Parent.Http).Url
local _ = require(OnPlatformSurveys.Types.InlineSurveyTypes)

return {
	fetchInlineSurvey = function(Callback, Input)
		-- upvalues: Url (copy), HttpService (copy)
		return Callback(string.format("%s%s?eventType=%s&surveyType=inline", Url.APIS_URL, "v1/survey", HttpService:UrlEncode(Input)), "GET"):andThen(function(Result)
			return Result.responseBody
		end)
	end,
	submitSurveyResponse = function(Callback, Input)
		-- upvalues: Url (copy), HttpService (copy)
		return Callback(Url.APIS_URL .. "v1/survey/response", "POST", { postBody = HttpService:JSONEncode(Input) }):andThen(function(Result)
			return Result.responseBody
		end)
	end
}