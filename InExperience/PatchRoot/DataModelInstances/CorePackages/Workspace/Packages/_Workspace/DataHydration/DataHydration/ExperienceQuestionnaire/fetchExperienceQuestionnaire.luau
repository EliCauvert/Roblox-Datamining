local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local httpClientModule = require(parent.HttpClient)
local urlBase = require(parent.UrlBuilder).UrlBase
local withCsrfRetryModule = require(dataHydration.withCsrfRetry)
local _ = require(script.Parent.ExperienceQuestionnaireStoreTypes)
local fetch = httpClientModule.fetch
local asPromise = httpClientModule.asPromise

local function _(p1)
	-- upvalues: urlBase (ref)
	p1 = p1 or {}
	
	return p1.network, p1.baseUrl or urlBase.APIS
end

local _ = function(p1)
	-- upvalues: withCsrfRetryModule (ref), httpClientModule (ref)
	return (p1 or {}).network or withCsrfRetryModule(httpClientModule.createRequestInternalNetwork())
end

local function get(p1, p2, p3)
	-- upvalues: urlBase (ref), fetch (ref), asPromise (ref)
	p1 = p1 or {}
	
	return asPromise(fetch({
		method = "GET",
		network = p1.network,
		url = (p1.baseUrl or urlBase.APIS) .. "/experience-questionnaire/v1" .. p3,
		analyticsKey = p3,
		decode = function(p4)
			return p4
		end
	}))
end

local function post(p1, p2, p3, p4)
	-- upvalues: urlBase (ref), fetch (ref), withCsrfRetryModule (ref), httpClientModule (ref), asPromise (ref)
	p1 = p1 or {}
	local _ = p1.network
	
	return asPromise(fetch({
		method = "POST",
		network = (p1 or {}).network or withCsrfRetryModule(httpClientModule.createRequestInternalNetwork()),
		url = (p1.baseUrl or urlBase.APIS) .. "/experience-questionnaire/v1" .. p7,
		body = p3,
		analyticsKey = p4,
		decode = function(p5)
			return p5
		end
	}))
end

return {
	fetchEligibility = function(p1, p2)
		-- upvalues: get (ref)
		return get(p2, ("/eligibility/%d"):format(p1), "experience-questionnaire.get-eligibility")
	end,
	fetchMetadataStatus = function(p1, p2)
		-- upvalues: get (ref)
		return get(p2, ("/metadata/%d/status"):format(p1), "experience-questionnaire.get-metadata-status")
	end,
	fetchActiveResponse = function(p1, p2)
		-- upvalues: get (ref)
		return get(p2, ("/responses/%d"):format(p1), "experience-questionnaire.get-active-response")
	end,
	fetchLatestQuestionnaire = function(p1, p2)
		-- upvalues: get (ref)
		return get(p2, ("/questionnaires/%d/latest"):format(p1), "experience-questionnaire.get-latest-questionnaire")
	end,
	fetchQuestionnaireById = function(p1, p2)
		-- upvalues: get (ref)
		return get(p2, "/questionnaires/" .. p19, "experience-questionnaire.get-questionnaire-by-id")
	end,
	fetchLatestSubmission = function(p1, p2)
		-- upvalues: get (ref)
		return get(p2, ("/responses/%d/submissions/latest"):format(p1), "experience-questionnaire.get-latest-submission")
	end,
	saveSubmission = function(p1, p2, p3)
		-- upvalues: post (ref)
		return post(p3, ("/responses/%d/submissions"):format(p1), p2, "experience-questionnaire.save-submission")
	end,
	validateResponses = function(p1, p2)
		-- upvalues: post (ref)
		return post(p2, "/responses/validate", p1, "experience-questionnaire.validate-responses")
	end,
	previewSubmission = function(p1, p2)
		-- upvalues: post (ref)
		return post(p2, "/responses/preview", p1, "experience-questionnaire.preview-submission")
	end
}