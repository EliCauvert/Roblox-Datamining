local Parent = script:FindFirstAncestor("AmpV2Wizard").Parent
local HttpService = game:GetService("HttpService")
local PromiseModule = require(Parent.Promise)
local NewResult = require(Parent.UrlBuilder).UrlBuilder.new({
	path = "child-requests-api/v1/odp-requests/start-odp-session",
	base = require(Parent.UrlBuilder).UrlBase.APIS
})
local ChallengeRequestWrapperResult = nil

local function getChallengeAwareRequest()
	-- upvalues: ChallengeRequestWrapperResult (ref), Parent (copy)
	if ChallengeRequestWrapperResult == nil then
		local HttpRequestModule = require(Parent.HttpRequest)
		ChallengeRequestWrapperResult = require(Parent.GenericChallenges).Middleware.ChallengeRequestWrapper(HttpRequestModule.config({
			requestFunction = function(p1, p2, p3)
				-- upvalues: HttpRequestModule (copy)
				return HttpRequestModule.requestFunctions.RequestInternal(p1, p2, p3)
			end
		}))
	end
	return ChallengeRequestWrapperResult
end

local function _(p1)
	return {
		requestType = p1.requestType,
		requestDetails = p1.requestDetails,
		isOdpInitiatedRequest = p1.isOdpInitiatedRequest == true,
		odpProfileId = p1.odpProfileId
	}
end

local function postForSession(p1, p2)
	-- upvalues: getChallengeAwareRequest (copy), HttpService (copy), PromiseModule (copy)
	return getChallengeAwareRequest()(p1, "POST", {
		postBody = HttpService:JSONEncode({
			requestType = p2.requestType,
			requestDetails = p2.requestDetails,
			isOdpInitiatedRequest = p2.isOdpInitiatedRequest == true,
			odpProfileId = p2.odpProfileId
		}),
		headers = { ["Content-Type"] = "application/json" }
	}):andThen(function(Result)
		-- upvalues: PromiseModule (upval)
		local ResponseBody = Result.responseBody
		
		return if ResponseBody and ResponseBody.odpSessionId ~= nil then { odpSessionId = ResponseBody.odpSessionId } else PromiseModule.reject("Failed to decode ODP session response")
	end)
end

return {
	startOdpSession = function(p1)
		-- upvalues: postForSession (copy), NewResult (copy)
		return postForSession(NewResult(), p1)
	end
}