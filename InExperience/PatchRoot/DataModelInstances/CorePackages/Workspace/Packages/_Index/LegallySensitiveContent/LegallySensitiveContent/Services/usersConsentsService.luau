local httpService = game:GetService("HttpService")
local parent = script.Parent.Parent
local dependenciesModule = require(parent.dependencies)
local promise = dependenciesModule.Promise
local urlBuilder = dependenciesModule.UrlBuilder
local urlBase = dependenciesModule.UrlBase
local fetch = dependenciesModule.Fetch
local fetch_1 = fetch.fetch
local response = fetch.Response
local consentNameModule = require(parent.Enums.ConsentName)
local var1 = urlBuilder.new({
	path = "user-consents-api/v1/user-consents/one-time",
	base = urlBase.APIS
})

return {
	grantOneTimeUserConsent = function(p1, p2, p3)
		-- upvalues: consentNameModule (ref), promise (ref), var1 (ref), fetch_1 (ref), httpService (ref), response (ref)
		local var2 = consentNameModule[p1]
		
		if var2 then
			local var3 = var1()
			
			return promise.new(function(p4, p5)
				-- upvalues: fetch_1 (copy), var3 (ref), httpService (copy), var2 (ref), p2 (ref), p3 (ref), response (copy)
				local ok, status = pcall(function()
					-- upvalues: fetch_1 (copy), var3 (copy), httpService (copy), var2 (copy), p2 (copy), p3 (copy), response (copy)
					return fetch_1(var3, {
						method = "POST",
						body = httpService:JSONEncode({ consentType = var2, ttlSeconds = p2 }),
						headers = {
							["Content-Type"] = "application/json",
							Accept = "application/json",
							["rbx-audit-data"] = p3
						}
					}):catch(function(_)
						-- upvalues: response (copy)
						return response.error()
					end):expect()
				end)
				
				if not ok then
					p5("Failed to make request: " .. tostring(status))
					
					return
				elseif status.ok then
					p4()
					
					return
				end
				p5(string.format("Got grant one time user consent HTTP Response: %d - %s", status.status, status.statusText))
			end)
		end
		return promise.reject(`Invalid consent name type: {p1}`)
	end
}