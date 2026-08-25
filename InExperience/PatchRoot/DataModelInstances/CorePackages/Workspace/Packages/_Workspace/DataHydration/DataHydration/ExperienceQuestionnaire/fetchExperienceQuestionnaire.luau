local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local httpClientModule = require(parent.HttpClient)
local urlBase = require(parent.UrlBuilder).UrlBase
local withCsrfRetryModule = require(dataHydration.withCsrfRetry)
local _ = require(script.Parent.ExperienceQuestionnaireStoreTypes)
local fetch = httpClientModule.fetch
local asPromise = httpClientModule.asPromise

local function _(p0)
	-- upvalues: urlBase (ref)
	p0 = p0 or {}
	
	return p0.network, p0.baseUrl or urlBase.APIS
end

local _ = function(p1)
	-- upvalues: withCsrfRetryModule (ref), httpClientModule (ref)
	return (p1 or {}).network or withCsrfRetryModule(httpClientModule.createRequestInternalNetwork())
end

local function get(p2, p3, p4)
	-- upvalues: urlBase (ref), fetch (ref), asPromise (ref)
	p2 = p2 or {}
	
	return asPromise(fetch({
		method = "GET",
		network = p2.network,
		url = (p2.baseUrl or urlBase.APIS) .. "/experience-questionnaire/v1" .. p3,
		analyticsKey = p4,
		decode = function(p5)
			return p5
		end
	}))
end

local function post(p6, p7, p8, p9)
	-- upvalues: urlBase (ref), fetch (ref), withCsrfRetryModule (ref), httpClientModule (ref), asPromise (ref)
	p6 = p6 or {}
	local _ = p6.network
	
	return asPromise(fetch({
		method = "POST",
		network = (p6 or {}).network or withCsrfRetryModule(httpClientModule.createRequestInternalNetwork()),
		url = (p6.baseUrl or urlBase.APIS) .. "/experience-questionnaire/v1" .. p7,
		body = p8,
		analyticsKey = p9,
		decode = function(p10)
			return p10
		end
	}))
end

return {
	fetchEligibility = function(p11, p12)
		-- upvalues: get (ref)
		return get(p12, ("/eligibility/%d"):format(p11), "experience-questionnaire.get-eligibility")
	end,
	fetchMetadataStatus = function(p13, p14)
		-- upvalues: get (ref)
		return get(p14, ("/metadata/%d/status"):format(p13), "experience-questionnaire.get-metadata-status")
	end,
	fetchActiveResponse = function(p15, p16)
		-- upvalues: get (ref)
		return get(p16, ("/responses/%d"):format(p15), "experience-questionnaire.get-active-response")
	end,
	fetchLatestQuestionnaire = function(p17, p18)
		-- upvalues: get (ref)
		return get(p18, ("/questionnaires/%d/latest"):format(p17), "experience-questionnaire.get-latest-questionnaire")
	end,
	fetchQuestionnaireById = function(p19, p20)
		-- upvalues: get (ref)
		return get(p20, "/questionnaires/" .. p19, "experience-questionnaire.get-questionnaire-by-id")
	end,
	fetchLatestSubmission = function(p21, p22)
		-- upvalues: get (ref)
		return get(p22, ("/responses/%d/submissions/latest"):format(p21), "experience-questionnaire.get-latest-submission")
	end,
	saveSubmission = function(p23, p24, p25)
		-- upvalues: post (ref)
		return post(p25, ("/responses/%d/submissions"):format(p23), p24, "experience-questionnaire.save-submission")
	end,
	validateResponses = function(p26, p27)
		-- upvalues: post (ref)
		return post(p27, "/responses/validate", p26, "experience-questionnaire.validate-responses")
	end,
	previewSubmission = function(p28, p29)
		-- upvalues: post (ref)
		return post(p29, "/responses/preview", p28, "experience-questionnaire.preview-submission")
	end
}