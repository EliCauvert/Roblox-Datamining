local parent = script:FindFirstAncestor("AppStoreAgeSignalsManager").Parent
local httpService = game:GetService("HttpService")
local userInputService = game:GetService("UserInputService")
local urlBuilder = require(parent.UrlBuilder).UrlBuilder
local urlBase = require(parent.UrlBuilder).UrlBase
local fetchModule = require(parent.Fetch)
local promiseModule = require(parent.Promise)
local fetch = fetchModule.fetch
local response = fetchModule.Response
local var1 = urlBuilder.new({
	path = "app-signals-service/v1/app-signals/get-eligibility",
	base = urlBase.APIS,
	query = { signalSource = "{signalSource}" }
})
local var2 = urlBuilder.new({
	path = "app-signals-service/v1/app-signals/store-result",
	base = urlBase.APIS
})

return {
	checkEligibility = function()
		-- upvalues: fetch (ref), userInputService (ref), promiseModule (ref), var1 (ref), response (ref)
		local name = userInputService:GetPlatform().Name
		
		return promiseModule.new(function(p1, p2)
			-- upvalues: var1 (copy), name (ref), fetch (ref), response (copy)
			local var3 = fetch(var1({ signalSource = name }), { method = "GET" }):catch(function()
				-- upvalues: response (copy)
				return response.error()
			end):expect()
			
			if not var3.ok then
				p2(string.format("Eligibility check failed with HTTP status: %d", var3.status))
				
				return
			end
			local var4 = var3:json():catch(function()
				return nil
			end):expect()
			
			if var4 then
				p1({ eligible = var4.eligible, signalSource = name })
				
				return
			end
			p2("Failed to decode eligibility response as JSON")
		end)
	end,
	publishResult = function(p1, p2, p3)
		-- upvalues: fetch (ref), promiseModule (ref), var2 (ref), httpService (ref), response (ref)
		return promiseModule.new(function(p4, p5)
			-- upvalues: var2 (copy), fetch (ref), httpService (copy), p1 (ref), p2 (ref), p3 (ref), response (copy)
			local var3 = fetch(var2(), {
				method = "POST",
				body = httpService:JSONEncode({ signalSource = p1, encodedSignals = p2, resultType = p3 }),
				headers = {
					["Content-Type"] = "application/json",
					Accept = "application/json"
				}
			}):catch(function()
				-- upvalues: response (copy)
				return response.error()
			end):expect()
			
			if var3.ok then
				p4()
				
				return
			end
			p5(string.format("Publish result failed with HTTP status: %d", var3.status))
		end)
	end
}