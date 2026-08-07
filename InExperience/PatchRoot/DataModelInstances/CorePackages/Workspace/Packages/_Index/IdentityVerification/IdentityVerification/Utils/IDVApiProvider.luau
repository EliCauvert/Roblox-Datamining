local parent = script:FindFirstAncestor("IdentityVerification").Parent
local httpService = game:GetService("HttpService")
local urlBuilder = require(parent.UrlBuilder).UrlBuilder
local urlBase = require(parent.UrlBuilder).UrlBase
local fetchModule = require(parent.Fetch)
local promiseModule = require(parent.Promise)
local fetch = fetchModule.fetch
local response = fetchModule.Response
local cryoModule = require(parent.Cryo)
local var4 = urlBuilder.new({
	path = "age-verification-service/v1/persona-id-verification/verified-status",
	base = urlBase.APIS,
	query = { token = "{token}" }
})
local var5 = urlBuilder.new({
	path = "age-verification-service/v1/persona-id-verification/start-verification",
	base = urlBase.APIS
})
local var6 = urlBuilder.new({
	path = "age-verification-service/v1/persona-id-verification/start-liveness-verification",
	base = urlBase.APIS
})

local function startVerification(p0, p1) --[[ line: 113 ]]
	-- upvalues: fetch (ref), promiseModule (ref), var5 (ref), httpService (ref), cryoModule (ref), response (ref)
	return promiseModule.new(function(p2, p3) --[[ line: 115 ]]
		-- upvalues: p1 (ref), var5 (copy), fetch (ref), httpService (copy), cryoModule (copy), p0 (ref), response (copy)
		local var8 = fetch(p1 or var5(), {
			method = "POST",
			body = httpService:JSONEncode(cryoModule.Dictionary.join({ generatedLink = true }, p0 or {})),
			headers = {
				["Content-Type"] = "application/json",
				Accept = "application/json"
			}
		}):catch(function() --[[ line: 125 ]]
			-- upvalues: response (copy)
			return response.error()
		end):expect()
		
		if not var8.ok then
			p3(string.format("Got start-verification HTTP Response: %d", var8.status))
			
			return
		end
		local var9 = var8:json():catch(function() --[[ line: 137 ]]
			return nil
		end):expect()
		
		if var9 then
			p2({
				emailSent = var9.emailSent,
				sessionIdentifier = var9.sessionIdentifier,
				daysUntilNextVerification = var9.daysUntilNextVerification,
				verificationLink = var9.verificationLink,
				sessionToken = var9.sessionToken
			})
			
			return
		end
		p3("Failed to decode HTTP response as JSON for IDV Verification")
	end)
end

return {
	startVerification = startVerification,
	startVerificationWithWrappedNetworking = function(p4, p5) --[[ line: 77 ]]
		-- upvalues: promiseModule (ref), var5 (ref), cryoModule (ref), httpService (ref)
		return promiseModule.new(function(p6, p7) --[[ line: 78 ]]
			-- upvalues: var5 (copy), cryoModule (copy), p5 (ref), p4 (ref), httpService (copy)
			p4(var5(), "POST", {
				postBody = httpService:JSONEncode(cryoModule.Dictionary.join({ generatedLink = true }, p5 or {}))
			}):catch(function(_) --[[ line: 86 ]]
				-- upvalues: p7 (ref)
				p7("Got error on start-verificatin")
			end):andThen(function(p8) --[[ line: 90 ]]
				-- upvalues: p7 (ref), p6 (ref)
				if not p8 or not p8[1] then
					p7("Got start-verification HTTP with no valid response")
					
					return
				end
				local var10 = p8[1]
				
				if var10 then
					p6({
						emailSent = var10.emailSent,
						sessionIdentifier = var10.sessionIdentifier,
						daysUntilNextVerification = var10.daysUntilNextVerification,
						verificationLink = var10.verificationLink,
						sessionToken = var10.sessionToken
					})
					
					return
				end
				p7("Failed to decode HTTP response as JSON for IDV Verification")
			end)
		end)
	end,
	startLivenessVerification = function(p9) --[[ line: 158 ]]
		-- upvalues: startVerification (ref), var6 (ref)
		return startVerification(p9, var6())
	end,
	getVerifiedStatus = function(p10) --[[ line: 34 ]]
		-- upvalues: fetch (ref), promiseModule (ref), var4 (ref), response (ref)
		return promiseModule.new(function(p11, p12) --[[ line: 36 ]]
			-- upvalues: var4 (copy), p10 (ref), fetch (ref), response (copy)
			local var11 = fetch(var4({ token = p10 }), { method = "GET" }):catch(function() --[[ line: 39 ]]
				-- upvalues: response (copy)
				return response.error()
			end):expect()
			
			if not var11.ok then
				p12(string.format("Got verified-status verification HTTP Response: %d", var11.status))
				
				return
			end
			local var12 = var11:json():catch(function() --[[ line: 53 ]]
				return nil
			end):expect()
			
			if var12 then
				p11({
					isPending = var12.isPending,
					sessionStatus = var12.sessionStatus,
					sessionErrorCode = var12.sessionErrorCode,
					isVerified = var12.isVerified,
					ageEstimationNextStep = var12.ageEstimationNextStep
				})
				
				return
			end
			p12("Failed to decode HTTP response as JSON for get IDV Verification status")
		end)
	end
}