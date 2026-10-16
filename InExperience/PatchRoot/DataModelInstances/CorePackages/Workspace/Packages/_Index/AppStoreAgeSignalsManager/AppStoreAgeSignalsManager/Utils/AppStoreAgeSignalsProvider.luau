local Parent = script:FindFirstAncestor("AppStoreAgeSignalsManager").Parent
local HttpService = game:GetService("HttpService")
local UserInputService = game:GetService("UserInputService")
local UrlBuilder = require(Parent.UrlBuilder).UrlBuilder
local UrlBase = require(Parent.UrlBuilder).UrlBase
local FetchModule = require(Parent.Fetch)
local PromiseModule = require(Parent.Promise)
local FetchFunction = FetchModule.fetch
local Response = FetchModule.Response
local NewUrlBuilder = UrlBuilder.new({
	path = "app-signals-service/v1/app-signals/get-eligibility",
	base = UrlBase.APIS,
	query = { signalSource = "{signalSource}" }
})
local NewUrlBuilder1 = UrlBuilder.new({
	path = "app-signals-service/v1/app-signals/store-result",
	base = UrlBase.APIS
})

return {
	checkEligibility = function() --[[ Line: 27 ]]
		-- upvalues: FetchFunction (copy), UserInputService (copy), PromiseModule (copy), NewUrlBuilder (copy), Response (copy)
		local Name = UserInputService:GetPlatform().Name
		
		return PromiseModule.new(function(Callback1: (any) -> (), Callback: (any) -> ()) --[[ Line: 30 ]]
			-- upvalues: NewUrlBuilder (upval), Name (copy), FetchFunction (copy), Response (upval)
			local v1 = FetchFunction(NewUrlBuilder({ signalSource = Name }), { method = "GET" }):catch(function() --[[ Line: 33 ]]
				-- upvalues: Response (upval)
				return Response.error()
			end):expect()
			
			if not v1.ok then
				Callback(string.format("Eligibility check failed with HTTP status: %d", v1.status))
				
				return
			end
			local v2 = v1:json():catch(function() --[[ Line: 45 ]]
				return nil
			end):expect()
			
			if v2 then
				Callback1({ eligible = v2.eligible, signalSource = Name })
				
				return
			else
				Callback("Failed to decode eligibility response as JSON")
			end
		end)
	end,
	publishResult = function(SignalSource, EncodedSignals, ResultType) --[[ Line: 62 ]]
		-- upvalues: FetchFunction (copy), PromiseModule (copy), NewUrlBuilder1 (copy), HttpService (copy), Response (copy)
		return PromiseModule.new(function(Callback1: () -> (), Callback: (any) -> ()) --[[ Line: 64 ]]
			-- upvalues: NewUrlBuilder1 (upval), FetchFunction (copy), HttpService (upval), SignalSource (copy), EncodedSignals (copy), ResultType (copy), Response (upval)
			local v1 = FetchFunction(NewUrlBuilder1(), {
				method = "POST",
				body = HttpService:JSONEncode({
					signalSource = SignalSource,
					encodedSignals = EncodedSignals,
					resultType = ResultType
				}),
				headers = {
					["Content-Type"] = "application/json",
					Accept = "application/json"
				}
			}):catch(function() --[[ Line: 78 ]]
				-- upvalues: Response (upval)
				return Response.error()
			end):expect()
			
			if v1.ok then
				Callback1()
				
				return
			else
				Callback(string.format("Publish result failed with HTTP status: %d", v1.status))
			end
		end)
	end
}