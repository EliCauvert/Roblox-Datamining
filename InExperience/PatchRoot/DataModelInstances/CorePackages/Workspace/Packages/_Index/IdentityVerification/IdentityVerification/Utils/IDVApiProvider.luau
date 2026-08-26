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
local var1 = urlBuilder.new({
	path = "age-verification-service/v1/persona-id-verification/verified-status",
	base = urlBase.APIS,
	query = { token = "{token}" }
})
local var2 = urlBuilder.new({
	path = "age-verification-service/v1/persona-id-verification/start-verification",
	base = urlBase.APIS
})
local var3 = urlBuilder.new({
	path = "age-verification-service/v1/persona-id-verification/start-liveness-verification",
	base = urlBase.APIS
})()

local function _(p1)
	return if type(p1) == "table" then p1.StatusCode or (p1.responseCode or (p1.status or p1.statusCode)) else nil
end

local _ = function(p1)
	-- upvalues: fFlagEnableFeatureRestrictionOnAgeVerificationAttemptModule (ref), showFeatureRestriction (ref), abuseVector (ref), buildAgeVerificationFeatureRestrictionOverridesModule (ref)
	if fFlagEnableFeatureRestrictionOnAgeVerificationAttemptModule and p1 == 403 then
		showFeatureRestriction(abuseVector.AgeVerification, buildAgeVerificationFeatureRestrictionOverridesModule())
		
		return
	end
end

local function startVerification(p1, p2)
	-- upvalues: var2 (ref), var3 (ref), fetch (ref), promiseModule (ref), httpService (ref), cryoModule (ref), response (ref), fFlagEnableFeatureRestrictionOnAgeVerificationAttemptModule (ref), showFeatureRestriction (ref), abuseVector (ref), buildAgeVerificationFeatureRestrictionOverridesModule (ref)
	p2 = p2 or var2()
	local var4 = p2 ~= var3
	
	return promiseModule.new(function(p3, p4)
		-- upvalues: fetch (ref), p2 (ref), httpService (copy), cryoModule (copy), p1 (ref), response (copy), var4 (ref), fFlagEnableFeatureRestrictionOnAgeVerificationAttemptModule (copy), showFeatureRestriction (copy), abuseVector (copy), buildAgeVerificationFeatureRestrictionOverridesModule (copy)
		local var5 = fetch(p2, {
			method = "POST",
			body = httpService:JSONEncode(cryoModule.Dictionary.join({ generatedLink = true }, p1 or {})),
			headers = {
				["Content-Type"] = "application/json",
				Accept = "application/json"
			}
		}):catch(function()
			-- upvalues: response (copy)
			return response.error()
		end):expect()
		
		if var5.ok then
			local var6 = var5:json():catch(function()
				return nil
			end):expect()
			
			if var6 then
				p3({
					emailSent = var6.emailSent,
					sessionIdentifier = var6.sessionIdentifier,
					daysUntilNextVerification = var6.daysUntilNextVerification,
					verificationLink = var6.verificationLink,
					sessionToken = var6.sessionToken
				})
				
				return
			end
			p4("Failed to decode HTTP response as JSON for IDV Verification")
			
			return
		elseif var4 then
			if fFlagEnableFeatureRestrictionOnAgeVerificationAttemptModule and var5.status == 403 then
				showFeatureRestriction(abuseVector.AgeVerification, buildAgeVerificationFeatureRestrictionOverridesModule())
			end
		end
		p4(string.format("Got start-verification HTTP Response: %d", var5.status))
	end)
end

return {
	startVerification = startVerification,
	startVerificationWithWrappedNetworking = function(p1, p2)
		-- upvalues: promiseModule (ref), var2 (ref), cryoModule (ref), httpService (ref), fFlagEnableFeatureRestrictionOnAgeVerificationAttemptModule (ref), showFeatureRestriction (ref), abuseVector (ref), buildAgeVerificationFeatureRestrictionOverridesModule (ref)
		return promiseModule.new(function(p3, p4)
			-- upvalues: var2 (copy), cryoModule (copy), p2 (ref), p1 (ref), httpService (copy), fFlagEnableFeatureRestrictionOnAgeVerificationAttemptModule (copy), showFeatureRestriction (copy), abuseVector (copy), buildAgeVerificationFeatureRestrictionOverridesModule (copy)
			p1(var2(), "POST", {
				postBody = httpService:JSONEncode(cryoModule.Dictionary.join({ generatedLink = true }, p2 or {}))
			}):catch(function(p5)
				-- upvalues: fFlagEnableFeatureRestrictionOnAgeVerificationAttemptModule (copy), showFeatureRestriction (copy), abuseVector (copy), buildAgeVerificationFeatureRestrictionOverridesModule (copy), p4 (ref)
				if fFlagEnableFeatureRestrictionOnAgeVerificationAttemptModule and (if type(p5) == "table" then p5.StatusCode or (p5.responseCode or (p5.status or p5.statusCode)) else nil) == 403 then
					showFeatureRestriction(abuseVector.AgeVerification, buildAgeVerificationFeatureRestrictionOverridesModule())
				end
				p4("Got error on start-verificatin")
			end):andThen(function(p5)
				-- upvalues: p4 (ref), p3 (ref)
				if not p5 or not p5[1] then
					p4("Got start-verification HTTP with no valid response")
					
					return
				end
				local var4 = p5[1]
				
				if var4 then
					p3({
						emailSent = var4.emailSent,
						sessionIdentifier = var4.sessionIdentifier,
						daysUntilNextVerification = var4.daysUntilNextVerification,
						verificationLink = var4.verificationLink,
						sessionToken = var4.sessionToken
					})
					
					return
				end
				p4("Failed to decode HTTP response as JSON for IDV Verification")
			end)
		end)
	end,
	startLivenessVerification = function(p1)
		-- upvalues: startVerification (ref), var3 (ref)
		return startVerification(p1, var3)
	end,
	getVerifiedStatus = function(p1)
		-- upvalues: fetch (ref), promiseModule (ref), var1 (ref), response (ref)
		return promiseModule.new(function(p2, p3)
			-- upvalues: var1 (copy), p1 (ref), fetch (ref), response (copy)
			local var4 = fetch(var1({ token = p1 }), { method = "GET" }):catch(function()
				-- upvalues: response (copy)
				return response.error()
			end):expect()
			
			if not var4.ok then
				p3(string.format("Got verified-status verification HTTP Response: %d", var4.status))
				
				return
			end
			local var5 = var4:json():catch(function()
				return nil
			end):expect()
			
			if var5 then
				p2({
					isPending = var5.isPending,
					sessionStatus = var5.sessionStatus,
					sessionErrorCode = var5.sessionErrorCode,
					isVerified = var5.isVerified,
					ageEstimationNextStep = var5.ageEstimationNextStep
				})
				
				return
			end
			p3("Failed to decode HTTP response as JSON for get IDV Verification status")
		end)
	end
}