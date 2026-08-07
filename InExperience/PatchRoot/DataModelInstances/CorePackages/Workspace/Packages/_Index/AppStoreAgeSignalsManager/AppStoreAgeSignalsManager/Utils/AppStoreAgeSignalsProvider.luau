local parent = script:FindFirstAncestor("AppStoreAgeSignalsManager").Parent
local httpService = game:GetService("HttpService")
local userInputService = game:GetService("UserInputService")
local urlBuilder = require(parent.UrlBuilder).UrlBuilder
local urlBase = require(parent.UrlBuilder).UrlBase
local fetchModule = require(parent.Fetch)
local promiseModule = require(parent.Promise)
local fetch = fetchModule.fetch
local response = fetchModule.Response
local var4 = urlBuilder.new({
	path = "app-signals-service/v1/app-signals/get-eligibility",
	base = urlBase.APIS,
	query = { signalSource = "{signalSource}" }
})
local var5 = urlBuilder.new({
	path = "app-signals-service/v1/app-signals/store-result",
	base = urlBase.APIS
})

return {
	checkEligibility = function() --[[ line: 27 ]]
		-- upvalues: fetch (ref), userInputService (ref), promiseModule (ref), var4 (ref), response (ref)
		local name = userInputService:GetPlatform().Name
		
		return promiseModule.new(function(p0, p1) --[[ line: 30 ]]
			-- upvalues: var4 (copy), name (ref), fetch (ref), response (copy)
			local var6 = fetch(var4({ signalSource = name }), { method = "GET" }):catch(function() --[[ line: 33 ]]
				-- upvalues: response (copy)
				return response.error()
			end):expect()
			
			if not var6.ok then
				p1(string.format("Eligibility check failed with HTTP status: %d", var6.status))
				
				return
			end
			local var7 = var6:json():catch(function() --[[ line: 45 ]]
				return nil
			end):expect()
			
			if var7 then
				p0({ eligible = var7.eligible, signalSource = name })
				
				return
			end
			p1("Failed to decode eligibility response as JSON")
		end)
	end,
	publishResult = function(p2, p3, p4) --[[ line: 62 ]]
		-- upvalues: fetch (ref), promiseModule (ref), var5 (ref), httpService (ref), response (ref)
		return promiseModule.new(function(p5, p6) --[[ line: 64 ]]
			-- upvalues: var5 (copy), fetch (ref), httpService (copy), p2 (ref), p3 (ref), p4 (ref), response (copy)
			local var8 = fetch(var5(), {
				method = "POST",
				body = httpService:JSONEncode({ signalSource = p2, encodedSignals = p3, resultType = p4 }),
				headers = {
					["Content-Type"] = "application/json",
					Accept = "application/json"
				}
			}):catch(function() --[[ line: 78 ]]
				-- upvalues: response (copy)
				return response.error()
			end):expect()
			
			if var8.ok then
				p5()
				
				return
			end
			p6(string.format("Publish result failed with HTTP status: %d", var8.status))
		end)
	end
}