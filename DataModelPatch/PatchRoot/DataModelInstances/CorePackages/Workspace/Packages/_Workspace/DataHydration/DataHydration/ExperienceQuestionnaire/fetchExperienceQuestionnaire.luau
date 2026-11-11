local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local HttpClientModule = require(Parent.HttpClient)
local UrlBase = require(Parent.UrlBuilder).UrlBase
local WithCsrfRetryModule = require(DataHydration.withCsrfRetry)
local _ = require(script.Parent.ExperienceQuestionnaireStoreTypes)
local FetchFunction = HttpClientModule.fetch
local AsPromiseFunction = HttpClientModule.asPromise

local function _(p1)
	-- upvalues: UrlBase (copy)
	local P0 = p1 or {}
	
	return P0.network, P0.baseUrl or UrlBase.APIS
end

local _ = function(p1)
	-- upvalues: WithCsrfRetryModule (copy), HttpClientModule (copy)
	return (p1 or {}).network or WithCsrfRetryModule(HttpClientModule.createRequestInternalNetwork())
end

local function get(p1, EligibilityName, AnalyticsKey)
	-- upvalues: UrlBase (copy), FetchFunction (copy), AsPromiseFunction (copy)
	local P2 = p1 or {}
	
	return AsPromiseFunction((FetchFunction({
		method = "GET",
		network = P2.network,
		url = (P2.baseUrl or UrlBase.APIS) .. "/experience-questionnaire/v1" .. EligibilityName,
		analyticsKey = AnalyticsKey,
		decode = function(p2)
			return p2
		end
	})))
end

local function post(p1, SubmissionsName, Body, AnalyticsKey)
	-- upvalues: UrlBase (copy), FetchFunction (copy), WithCsrfRetryModule (copy), HttpClientModule (copy), AsPromiseFunction (copy)
	local P6 = p1 or {}
	local _ = P6.network
	
	return AsPromiseFunction((FetchFunction({
		method = "POST",
		network = (p1 or {}).network or WithCsrfRetryModule(HttpClientModule.createRequestInternalNetwork()),
		url = (P6.baseUrl or UrlBase.APIS) .. "/experience-questionnaire/v1" .. SubmissionsName,
		body = Body,
		analyticsKey = AnalyticsKey,
		decode = function(p2)
			return p2
		end
	})))
end

return {
	fetchEligibility = function(p1, p2)
		-- upvalues: get (copy)
		return get(p2, ("/eligibility/%d"):format(p1), "experience-questionnaire.get-eligibility")
	end,
	fetchMetadataStatus = function(p1, p2)
		-- upvalues: get (copy)
		return get(p2, ("/metadata/%d/status"):format(p1), "experience-questionnaire.get-metadata-status")
	end,
	fetchActiveResponse = function(p1, p2)
		-- upvalues: get (copy)
		return get(p2, ("/responses/%d"):format(p1), "experience-questionnaire.get-active-response")
	end,
	fetchLatestQuestionnaire = function(p1, p2)
		-- upvalues: get (copy)
		return get(p2, ("/questionnaires/%d/latest"):format(p1), "experience-questionnaire.get-latest-questionnaire")
	end,
	fetchQuestionnaireById = function(Text, p1)
		-- upvalues: get (copy)
		return get(p1, "/questionnaires/" .. Text, "experience-questionnaire.get-questionnaire-by-id")
	end,
	fetchLatestSubmission = function(p1, p2)
		-- upvalues: get (copy)
		return get(p2, ("/responses/%d/submissions/latest"):format(p1), "experience-questionnaire.get-latest-submission")
	end,
	saveSubmission = function(p1, Body, p2)
		-- upvalues: post (copy)
		return post(p2, ("/responses/%d/submissions"):format(p1), Body, "experience-questionnaire.save-submission")
	end,
	validateResponses = function(Body, p1)
		-- upvalues: post (copy)
		return post(p1, "/responses/validate", Body, "experience-questionnaire.validate-responses")
	end,
	previewSubmission = function(Body, p1)
		-- upvalues: post (copy)
		return post(p1, "/responses/preview", Body, "experience-questionnaire.preview-submission")
	end
}