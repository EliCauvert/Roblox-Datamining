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
local var3 = urlBuilder.new({
	path = "user-consents-api/v1/user-consents/one-time",
	base = urlBase.APIS
})

return {
	grantOneTimeUserConsent = function(p0, p1, p2) --[[ line: 18 ]]
		-- upvalues: consentNameModule (ref), promise (ref), var3 (ref), fetch_1 (ref), httpService (ref), response (ref)
		local var4 = consentNameModule[p0]
		
		if var4 then
			local var5 = var3()
			
			return promise.new(function(p3, p4) --[[ line: 25 ]]
				-- upvalues: fetch_1 (copy), var5 (ref), httpService (copy), var4 (ref), p1 (ref), p2 (ref), response (copy)
				local ok, status = pcall(function() --[[ line: 26 ]]
					-- upvalues: fetch_1 (copy), var5 (copy), httpService (copy), var4 (copy), p1 (copy), p2 (copy), response (copy)
					return fetch_1(var5, {
						method = "POST",
						body = httpService:JSONEncode({ consentType = var4, ttlSeconds = p1 }),
						headers = {
							["Content-Type"] = "application/json",
							Accept = "application/json",
							["rbx-audit-data"] = p2
						}
					}):catch(function(_) --[[ line: 39 ]]
						-- upvalues: response (copy)
						return response.error()
					end):expect()
				end)
				
				if not ok then
					p4("Failed to make request: " .. tostring(status))
					
					return
				elseif status.ok then
					p3()
					
					return
				end
				p4(string.format("Got grant one time user consent HTTP Response: %d - %s", status.status, status.statusText))
			end)
		end
		return promise.reject(`Invalid consent name type: {p0}`)
	end
}