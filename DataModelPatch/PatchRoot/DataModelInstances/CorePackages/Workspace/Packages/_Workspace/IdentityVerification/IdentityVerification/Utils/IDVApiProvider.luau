local Parent = script:FindFirstAncestor("IdentityVerification").Parent
local HttpService = game:GetService("HttpService")
local UrlBuilder = require(Parent.UrlBuilder).UrlBuilder
local UrlBase = require(Parent.UrlBuilder).UrlBase
local FetchModule = require(Parent.Fetch)
local PromiseModule = require(Parent.Promise)
local FetchFunction = FetchModule.fetch
local Response = FetchModule.Response
local CryoModule = require(Parent.Cryo)
local NewUrlBuilder = UrlBuilder.new({
	path = "age-verification-service/v1/persona-id-verification/verified-status",
	base = UrlBase.APIS,
	query = { token = "{token}" }
})
local NewUrlBuilder1 = UrlBuilder.new({
	path = "age-verification-service/v1/persona-id-verification/start-verification",
	base = UrlBase.APIS
})
local NewUrlBuilder2 = UrlBuilder.new({
	path = "age-verification-service/v1/persona-id-verification/start-liveness-verification",
	base = UrlBase.APIS
})

local function startVerification(p1, p2)
	-- upvalues: FetchFunction (copy), PromiseModule (copy), NewUrlBuilder1 (copy), HttpService (copy), CryoModule (copy), Response (copy)
	return PromiseModule.new(function(Callback1: (any) -> (), Callback: (any) -> ())
		-- upvalues: p2 (copy), NewUrlBuilder1 (upval), FetchFunction (copy), HttpService (upval), CryoModule (upval), p1 (copy), Response (upval)
		local v1 = FetchFunction(p2 or NewUrlBuilder1(), {
			method = "POST",
			body = HttpService:JSONEncode(CryoModule.Dictionary.join({ generatedLink = true }, p1 or {})),
			headers = {
				["Content-Type"] = "application/json",
				Accept = "application/json"
			}
		}):catch(function()
			-- upvalues: Response (upval)
			return Response.error()
		end):expect()
		
		if not v1.ok then
			Callback(string.format("Got start-verification HTTP Response: %d", v1.status))
			
			return
		end
		local v2 = v1:json():catch(function()
			return nil
		end):expect()
		
		if v2 then
			Callback1({
				emailSent = v2.emailSent,
				sessionIdentifier = v2.sessionIdentifier,
				daysUntilNextVerification = v2.daysUntilNextVerification,
				verificationLink = v2.verificationLink,
				sessionToken = v2.sessionToken
			})
			
			return
		else
			Callback("Failed to decode HTTP response as JSON for IDV Verification")
		end
	end)
end

return {
	startVerification = startVerification,
	startVerificationWithWrappedNetworking = function(Callback, p1)
		-- upvalues: PromiseModule (copy), NewUrlBuilder1 (copy), CryoModule (copy), HttpService (copy)
		return PromiseModule.new(function(Callback1, Callback2)
			-- upvalues: NewUrlBuilder1 (upval), CryoModule (upval), p1 (copy), Callback (copy), HttpService (upval)
			Callback(NewUrlBuilder1(), "POST", {
				postBody = HttpService:JSONEncode((CryoModule.Dictionary.join({ generatedLink = true }, p1 or {})))
			}):catch(function(_)
				-- upvalues: Callback2 (copy)
				Callback2("Got error on start-verificatin")
			end):andThen(function(Entry)
				-- upvalues: Callback2 (copy), Callback1 (copy)
				if not Entry or not Entry[1] then
					Callback2("Got start-verification HTTP with no valid response")
					
					return
				end
				local Entry1 = Entry[1]
				
				if Entry1 then
					Callback1({
						emailSent = Entry1.emailSent,
						sessionIdentifier = Entry1.sessionIdentifier,
						daysUntilNextVerification = Entry1.daysUntilNextVerification,
						verificationLink = Entry1.verificationLink,
						sessionToken = Entry1.sessionToken
					})
					
					return
				else
					Callback2("Failed to decode HTTP response as JSON for IDV Verification")
				end
			end)
		end)
	end,
	startLivenessVerification = function(p1)
		-- upvalues: startVerification (copy), NewUrlBuilder2 (copy)
		return startVerification(p1, NewUrlBuilder2())
	end,
	getVerifiedStatus = function(Token)
		-- upvalues: FetchFunction (copy), PromiseModule (copy), NewUrlBuilder (copy), Response (copy)
		return PromiseModule.new(function(Callback1: (any) -> (), Callback: (any) -> ())
			-- upvalues: NewUrlBuilder (upval), Token (copy), FetchFunction (copy), Response (upval)
			local v1 = FetchFunction(NewUrlBuilder({ token = Token }), { method = "GET" }):catch(function()
				-- upvalues: Response (upval)
				return Response.error()
			end):expect()
			
			if not v1.ok then
				Callback(string.format("Got verified-status verification HTTP Response: %d", v1.status))
				
				return
			end
			local v2 = v1:json():catch(function()
				return nil
			end):expect()
			
			if v2 then
				Callback1({
					isPending = v2.isPending,
					sessionStatus = v2.sessionStatus,
					sessionErrorCode = v2.sessionErrorCode,
					isVerified = v2.isVerified,
					ageEstimationNextStep = v2.ageEstimationNextStep
				})
				
				return
			else
				Callback("Failed to decode HTTP response as JSON for get IDV Verification status")
			end
		end)
	end
}