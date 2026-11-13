local AmpV2Wizard = script:FindFirstAncestor("AmpV2Wizard")
local Parent = AmpV2Wizard.Parent
local HttpService = game:GetService("HttpService")
local UrlBuilder = require(Parent.UrlBuilder).UrlBuilder
local UrlBase = require(Parent.UrlBuilder).UrlBase
local FetchModule = require(Parent.Fetch)
local PromiseModule = require(Parent.Promise)
local _ = require(AmpV2Wizard.OdpVerification.Types)
local FetchFunction = FetchModule.fetch
local Response = FetchModule.Response
local NewUrlBuilder = UrlBuilder.new({
	path = "age-verification-service/v1/age-verification/start-odp-verification",
	base = UrlBase.APIS
})

return {
	startOdpVerification = function(p1)
		-- upvalues: PromiseModule (copy), FetchFunction (copy), NewUrlBuilder (copy), HttpService (copy), Response (copy)
		return PromiseModule.new(function(Callback1: (any) -> (), Callback: (any) -> ())
			-- upvalues: FetchFunction (upval), NewUrlBuilder (upval), HttpService (upval), p1 (copy), Response (upval)
			local v1 = FetchFunction(NewUrlBuilder(), {
				method = "POST",
				body = HttpService:JSONEncode({
					sessionId = p1.sessionId,
					verificationType = p1.verificationType
				}),
				headers = { ["Content-Type"] = "application/json" }
			}):catch(function()
				-- upvalues: Response (upval)
				return Response.error()
			end):expect()
			
			if not v1.ok then
				Callback(`start-odp-verification failed with status: {v1.status}`)
				
				return
			end
			local v2 = v1:json():catch(function()
				return nil
			end):expect()
			
			if v2 then
				Callback1({
					sessionIdentifier = v2.sessionIdentifier,
					verificationLink = v2.verificationLink
				})
				
				return
			else
				Callback("Failed to decode start-odp-verification response")
			end
		end)
	end
}