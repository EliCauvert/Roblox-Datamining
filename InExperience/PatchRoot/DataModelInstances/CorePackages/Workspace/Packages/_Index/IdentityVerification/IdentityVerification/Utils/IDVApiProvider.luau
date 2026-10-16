local IdentityVerification = script:FindFirstAncestor("IdentityVerification")
local Parent = IdentityVerification.Parent
local HttpService = game:GetService("HttpService")
local UrlBuilder = require(Parent.UrlBuilder).UrlBuilder
local UrlBase = require(Parent.UrlBuilder).UrlBase
local FetchModule = require(Parent.Fetch)
local PromiseModule = require(Parent.Promise)
local FetchFunction = FetchModule.fetch
local Response = FetchModule.Response
local CryoModule = require(Parent.Cryo)
local UniversalFeatureRestrictionsModule = require(Parent.UniversalFeatureRestrictions)
local ShowFeatureRestrictionFunction = UniversalFeatureRestrictionsModule.showFeatureRestriction
local AbuseVector = UniversalFeatureRestrictionsModule.AbuseVector
local BuildAgeVerificationFeatureRestrictionOverridesModule = require(IdentityVerification.Utils.buildAgeVerificationFeatureRestrictionOverrides)
local FFlagEnableFeatureRestrictionOnAgeVerificationAttemptModule = require(IdentityVerification.Flags.FFlagEnableFeatureRestrictionOnAgeVerificationAttempt)
local NewUrlBuilder = UrlBuilder.new({
	path = "age-verification-service/v1/persona-id-verification/verified-status",
	base = UrlBase.APIS,
	query = { token = "{token}" }
})
local NewUrlBuilder1 = UrlBuilder.new({
	path = "age-verification-service/v1/persona-id-verification/start-verification",
	base = UrlBase.APIS
})
local v1 = UrlBuilder.new({
	path = "age-verification-service/v1/persona-id-verification/start-liveness-verification",
	base = UrlBase.APIS
})()

local function _(p1) --[[ Line: 46 | Named "getHttpStatusFromWrappedNetworkingError" ]]
	return if type(p1) == "table" then p1.StatusCode or (p1.responseCode or (p1.status or p1.statusCode)) else nil
end

local _ = function(p1) --[[ Line: 59 | Named "maybeShowAgeVerificationFeatureRestriction" ]]
	-- upvalues: FFlagEnableFeatureRestrictionOnAgeVerificationAttemptModule (copy), ShowFeatureRestrictionFunction (copy), AbuseVector (copy), BuildAgeVerificationFeatureRestrictionOverridesModule (copy)
	if FFlagEnableFeatureRestrictionOnAgeVerificationAttemptModule and p1 == 403 then
		ShowFeatureRestrictionFunction(AbuseVector.AgeVerification, BuildAgeVerificationFeatureRestrictionOverridesModule())
		
		return
	end
end

local function startVerification(p1, p2) --[[ Line: 152 ]]
	-- upvalues: NewUrlBuilder1 (copy), v1 (copy), FetchFunction (copy), PromiseModule (copy), HttpService (copy), CryoModule (copy), Response (copy), FFlagEnableFeatureRestrictionOnAgeVerificationAttemptModule (copy), ShowFeatureRestrictionFunction (copy), AbuseVector (copy), BuildAgeVerificationFeatureRestrictionOverridesModule (copy)
	local P6 = p2 or NewUrlBuilder1()
	local IsNotPMatch = P6 ~= v1
	
	return PromiseModule.new(function(Callback1: (any) -> (), Callback: (any) -> ()) --[[ Line: 157 ]]
		-- upvalues: FetchFunction (copy), P6 (copy), HttpService (upval), CryoModule (upval), p1 (copy), Response (upval), IsNotPMatch (copy), FFlagEnableFeatureRestrictionOnAgeVerificationAttemptModule (upval), ShowFeatureRestrictionFunction (upval), AbuseVector (upval), BuildAgeVerificationFeatureRestrictionOverridesModule (upval)
		local v2 = FetchFunction(P6, {
			method = "POST",
			body = HttpService:JSONEncode(CryoModule.Dictionary.join({ generatedLink = true }, p1 or {})),
			headers = {
				["Content-Type"] = "application/json",
				Accept = "application/json"
			}
		}):catch(function() --[[ Line: 166 ]]
			-- upvalues: Response (upval)
			return Response.error()
		end):expect()
		
		if v2.ok then
			local v3 = v2:json():catch(function() --[[ Line: 182 ]]
				return nil
			end):expect()
			
			if v3 then
				Callback1({
					emailSent = v3.emailSent,
					sessionIdentifier = v3.sessionIdentifier,
					daysUntilNextVerification = v3.daysUntilNextVerification,
					verificationLink = v3.verificationLink,
					sessionToken = v3.sessionToken
				})
				
				return
			else
				Callback("Failed to decode HTTP response as JSON for IDV Verification")
				
				return
			end
		else
			if IsNotPMatch then
				local Status = v2.status
				
				if FFlagEnableFeatureRestrictionOnAgeVerificationAttemptModule and Status == 403 then
					ShowFeatureRestrictionFunction(AbuseVector.AgeVerification, BuildAgeVerificationFeatureRestrictionOverridesModule())
				end
			end
			Callback(string.format("Got start-verification HTTP Response: %d", v2.status))
		end
	end)
end

return {
	startVerification = startVerification,
	startVerificationWithWrappedNetworking = function(Callback, p1) --[[ Line: 114 ]]
		-- upvalues: PromiseModule (copy), NewUrlBuilder1 (copy), CryoModule (copy), HttpService (copy), FFlagEnableFeatureRestrictionOnAgeVerificationAttemptModule (copy), ShowFeatureRestrictionFunction (copy), AbuseVector (copy), BuildAgeVerificationFeatureRestrictionOverridesModule (copy)
		return PromiseModule.new(function(Callback2, Callback1) --[[ Line: 115 ]]
			-- upvalues: NewUrlBuilder1 (upval), CryoModule (upval), p1 (copy), Callback (copy), HttpService (upval), FFlagEnableFeatureRestrictionOnAgeVerificationAttemptModule (upval), ShowFeatureRestrictionFunction (upval), AbuseVector (upval), BuildAgeVerificationFeatureRestrictionOverridesModule (upval)
			Callback(NewUrlBuilder1(), "POST", {
				postBody = HttpService:JSONEncode((CryoModule.Dictionary.join({ generatedLink = true }, p1 or {})))
			}):catch(function(Err) --[[ Line: 123 ]]
				-- upvalues: FFlagEnableFeatureRestrictionOnAgeVerificationAttemptModule (upval), ShowFeatureRestrictionFunction (upval), AbuseVector (upval), BuildAgeVerificationFeatureRestrictionOverridesModule (upval), Callback1 (copy)
				local StatusCode = if type(Err) == "table" then Err.StatusCode or (Err.responseCode or (Err.status or Err.statusCode)) else nil
				
				if FFlagEnableFeatureRestrictionOnAgeVerificationAttemptModule and StatusCode == 403 then
					ShowFeatureRestrictionFunction(AbuseVector.AgeVerification, BuildAgeVerificationFeatureRestrictionOverridesModule())
				end
				Callback1("Got error on start-verificatin")
			end):andThen(function(Entry) --[[ Line: 129 ]]
				-- upvalues: Callback1 (copy), Callback2 (copy)
				if not Entry or not Entry[1] then
					Callback1("Got start-verification HTTP with no valid response")
					
					return
				end
				local Entry1 = Entry[1]
				
				if Entry1 then
					Callback2({
						emailSent = Entry1.emailSent,
						sessionIdentifier = Entry1.sessionIdentifier,
						daysUntilNextVerification = Entry1.daysUntilNextVerification,
						verificationLink = Entry1.verificationLink,
						sessionToken = Entry1.sessionToken
					})
					
					return
				else
					Callback1("Failed to decode HTTP response as JSON for IDV Verification")
				end
			end)
		end)
	end,
	startLivenessVerification = function(p1) --[[ Line: 203 ]]
		-- upvalues: startVerification (copy), v1 (copy)
		return startVerification(p1, v1)
	end,
	getVerifiedStatus = function(Token) --[[ Line: 71 ]]
		-- upvalues: FetchFunction (copy), PromiseModule (copy), NewUrlBuilder (copy), Response (copy)
		return PromiseModule.new(function(Callback1: (any) -> (), Callback: (any) -> ()) --[[ Line: 73 ]]
			-- upvalues: NewUrlBuilder (upval), Token (copy), FetchFunction (copy), Response (upval)
			local v2 = FetchFunction(NewUrlBuilder({ token = Token }), { method = "GET" }):catch(function() --[[ Line: 76 ]]
				-- upvalues: Response (upval)
				return Response.error()
			end):expect()
			
			if not v2.ok then
				Callback(string.format("Got verified-status verification HTTP Response: %d", v2.status))
				
				return
			end
			local v3 = v2:json():catch(function() --[[ Line: 90 ]]
				return nil
			end):expect()
			
			if v3 then
				Callback1({
					isPending = v3.isPending,
					sessionStatus = v3.sessionStatus,
					sessionErrorCode = v3.sessionErrorCode,
					isVerified = v3.isVerified,
					ageEstimationNextStep = v3.ageEstimationNextStep
				})
				
				return
			else
				Callback("Failed to decode HTTP response as JSON for get IDV Verification status")
			end
		end)
	end
}