local identityVerification = script:FindFirstAncestor("IdentityVerification")
local parent = identityVerification.Parent
local httpService = game:GetService("HttpService")
local urlBuilder = require(parent.UrlBuilder).UrlBuilder
local urlBase = require(parent.UrlBuilder).UrlBase
local fetchModule = require(parent.Fetch)
local promiseModule = require(parent.Promise)
local fetch = fetchModule.fetch
local response = fetchModule.Response
local cryoModule = require(parent.Cryo)
local universalFeatureRestrictionsModule = require(parent.UniversalFeatureRestrictions)
local showFeatureRestriction = universalFeatureRestrictionsModule.showFeatureRestriction
local abuseVector = universalFeatureRestrictionsModule.AbuseVector
local buildAgeVerificationFeatureRestrictionOverridesModule = require(identityVerification.Utils.buildAgeVerificationFeatureRestrictionOverrides)
local fFlagEnableFeatureRestrictionOnAgeVerificationAttemptModule = require(identityVerification.Flags.FFlagEnableFeatureRestrictionOnAgeVerificationAttempt)
local var8 = urlBuilder.new({
	path = "age-verification-service/v1/persona-id-verification/verified-status",
	base = urlBase.APIS,
	query = { token = "{token}" }
})
local var9 = urlBuilder.new({
	path = "age-verification-service/v1/persona-id-verification/start-verification",
	base = urlBase.APIS
})
local var10 = urlBuilder.new({
	path = "age-verification-service/v1/persona-id-verification/start-liveness-verification",
	base = urlBase.APIS
})()

local function _(p0) --[[ line: 46 | named "getHttpStatusFromWrappedNetworkingError" ]]
	return if type(p0) == "table" then p0.StatusCode or (p0.responseCode or (p0.status or p0.statusCode)) else nil
end

local _ = function(p1) --[[ line: 59 | named "maybeShowAgeVerificationFeatureRestriction" ]]
	-- upvalues: fFlagEnableFeatureRestrictionOnAgeVerificationAttemptModule (ref), showFeatureRestriction (ref), abuseVector (ref), buildAgeVerificationFeatureRestrictionOverridesModule (ref)
	if fFlagEnableFeatureRestrictionOnAgeVerificationAttemptModule and p1 == 403 then
		showFeatureRestriction(abuseVector.AgeVerification, buildAgeVerificationFeatureRestrictionOverridesModule())
		
		return
	end
end

local function startVerification(p2, p3) --[[ line: 152 ]]
	-- upvalues: var9 (ref), var10 (ref), fetch (ref), promiseModule (ref), httpService (ref), cryoModule (ref), response (ref), fFlagEnableFeatureRestrictionOnAgeVerificationAttemptModule (ref), showFeatureRestriction (ref), abuseVector (ref), buildAgeVerificationFeatureRestrictionOverridesModule (ref)
	p3 = p3 or var9()
	local var13 = p3 ~= var10
	
	return promiseModule.new(function(p4, p5) --[[ line: 157 ]]
		-- upvalues: fetch (ref), p3 (ref), httpService (copy), cryoModule (copy), p2 (ref), response (copy), var13 (ref), fFlagEnableFeatureRestrictionOnAgeVerificationAttemptModule (copy), showFeatureRestriction (copy), abuseVector (copy), buildAgeVerificationFeatureRestrictionOverridesModule (copy)
		local var14 = fetch(p3, {
			method = "POST",
			body = httpService:JSONEncode(cryoModule.Dictionary.join({ generatedLink = true }, p2 or {})),
			headers = {
				["Content-Type"] = "application/json",
				Accept = "application/json"
			}
		}):catch(function() --[[ line: 166 ]]
			-- upvalues: response (copy)
			return response.error()
		end):expect()
		
		if var14.ok then
			local var15 = var14:json():catch(function() --[[ line: 182 ]]
				return nil
			end):expect()
			
			if var15 then
				p4({
					emailSent = var15.emailSent,
					sessionIdentifier = var15.sessionIdentifier,
					daysUntilNextVerification = var15.daysUntilNextVerification,
					verificationLink = var15.verificationLink,
					sessionToken = var15.sessionToken
				})
				
				return
			end
			p5("Failed to decode HTTP response as JSON for IDV Verification")
			
			return
		elseif var13 then
			if fFlagEnableFeatureRestrictionOnAgeVerificationAttemptModule and var14.status == 403 then
				showFeatureRestriction(abuseVector.AgeVerification, buildAgeVerificationFeatureRestrictionOverridesModule())
			end
		end
		p5(string.format("Got start-verification HTTP Response: %d", var14.status))
	end)
end

return {
	startVerification = startVerification,
	startVerificationWithWrappedNetworking = function(p6, p7) --[[ line: 114 ]]
		-- upvalues: promiseModule (ref), var9 (ref), cryoModule (ref), httpService (ref), fFlagEnableFeatureRestrictionOnAgeVerificationAttemptModule (ref), showFeatureRestriction (ref), abuseVector (ref), buildAgeVerificationFeatureRestrictionOverridesModule (ref)
		return promiseModule.new(function(p8, p9) --[[ line: 115 ]]
			-- upvalues: var9 (copy), cryoModule (copy), p7 (ref), p6 (ref), httpService (copy), fFlagEnableFeatureRestrictionOnAgeVerificationAttemptModule (copy), showFeatureRestriction (copy), abuseVector (copy), buildAgeVerificationFeatureRestrictionOverridesModule (copy)
			p6(var9(), "POST", {
				postBody = httpService:JSONEncode(cryoModule.Dictionary.join({ generatedLink = true }, p7 or {}))
			}):catch(function(p11) --[[ line: 123 ]]
				-- upvalues: fFlagEnableFeatureRestrictionOnAgeVerificationAttemptModule (copy), showFeatureRestriction (copy), abuseVector (copy), buildAgeVerificationFeatureRestrictionOverridesModule (copy), p9 (ref)
				if fFlagEnableFeatureRestrictionOnAgeVerificationAttemptModule and (if type(p11) == "table" then p11.StatusCode or (p11.responseCode or (p11.status or p11.statusCode)) else nil) == 403 then
					showFeatureRestriction(abuseVector.AgeVerification, buildAgeVerificationFeatureRestrictionOverridesModule())
				end
				p9("Got error on start-verificatin")
			end):andThen(function(p10) --[[ line: 129 ]]
				-- upvalues: p9 (ref), p8 (ref)
				if not p10 or not p10[1] then
					p9("Got start-verification HTTP with no valid response")
					
					return
				end
				local var16 = p10[1]
				
				if var16 then
					p8({
						emailSent = var16.emailSent,
						sessionIdentifier = var16.sessionIdentifier,
						daysUntilNextVerification = var16.daysUntilNextVerification,
						verificationLink = var16.verificationLink,
						sessionToken = var16.sessionToken
					})
					
					return
				end
				p9("Failed to decode HTTP response as JSON for IDV Verification")
			end)
		end)
	end,
	startLivenessVerification = function(p12) --[[ line: 203 ]]
		-- upvalues: startVerification (ref), var10 (ref)
		return startVerification(p12, var10)
	end,
	getVerifiedStatus = function(p13) --[[ line: 71 ]]
		-- upvalues: fetch (ref), promiseModule (ref), var8 (ref), response (ref)
		return promiseModule.new(function(p14, p15) --[[ line: 73 ]]
			-- upvalues: var8 (copy), p13 (ref), fetch (ref), response (copy)
			local var17 = fetch(var8({ token = p13 }), { method = "GET" }):catch(function() --[[ line: 76 ]]
				-- upvalues: response (copy)
				return response.error()
			end):expect()
			
			if not var17.ok then
				p15(string.format("Got verified-status verification HTTP Response: %d", var17.status))
				
				return
			end
			local var18 = var17:json():catch(function() --[[ line: 90 ]]
				return nil
			end):expect()
			
			if var18 then
				p14({
					isPending = var18.isPending,
					sessionStatus = var18.sessionStatus,
					sessionErrorCode = var18.sessionErrorCode,
					isVerified = var18.isVerified,
					ageEstimationNextStep = var18.ageEstimationNextStep
				})
				
				return
			end
			p15("Failed to decode HTTP response as JSON for get IDV Verification status")
		end)
	end
}