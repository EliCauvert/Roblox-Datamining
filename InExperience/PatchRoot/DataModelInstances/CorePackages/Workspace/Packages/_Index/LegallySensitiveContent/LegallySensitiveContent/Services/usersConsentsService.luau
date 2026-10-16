local HttpService = game:GetService("HttpService")
local Parent = script.Parent.Parent
local DependenciesModule = require(Parent.dependencies)
local Promise = DependenciesModule.Promise
local Fetch = DependenciesModule.Fetch
local FetchFunction = Fetch.fetch
local Response = Fetch.Response
local ConsentNameModule = require(Parent.Enums.ConsentName)
local NewResult = DependenciesModule.UrlBuilder.new({
	path = "user-consents-api/v1/user-consents/one-time",
	base = DependenciesModule.UrlBase.APIS
})

return {
	grantOneTimeUserConsent = function(p1, TtlSeconds, p2) --[[ Line: 18 ]]
		-- upvalues: ConsentNameModule (copy), Promise (copy), NewResult (copy), FetchFunction (copy), HttpService (copy), Response (copy)
		local ConsentNameModuleEntry = ConsentNameModule[p1]
		
		if ConsentNameModuleEntry then
			local Result = NewResult()
			
			return Promise.new(function(Callback1: () -> (), Callback: (any) -> ()) --[[ Line: 25 ]]
				-- upvalues: FetchFunction (upval), Result (copy), HttpService (upval), ConsentNameModuleEntry (copy), TtlSeconds (copy), p2 (copy), Response (upval)
				local Success, Result1 = pcall(function() --[[ Line: 26 ]]
					-- upvalues: FetchFunction (upval), Result (upval), HttpService (upval), ConsentNameModuleEntry (upval), TtlSeconds (upval), p2 (upval), Response (upval)
					return FetchFunction(Result, {
						method = "POST",
						body = HttpService:JSONEncode({
							consentType = ConsentNameModuleEntry,
							ttlSeconds = TtlSeconds
						}),
						headers = {
							["Content-Type"] = "application/json",
							Accept = "application/json",
							["rbx-audit-data"] = p2
						}
					}):catch(function(_) --[[ Line: 39 ]]
						-- upvalues: Response (upval)
						return Response.error()
					end):expect()
				end)
				
				if not Success then
					Callback("Failed to make request: " .. tostring(Result1))
					
					return
				end
				if Result1.ok then
					Callback1()
					
					return
				else
					Callback((string.format("Got grant one time user consent HTTP Response: %d - %s", Result1.status, Result1.statusText)))
				end
			end)
		else
			return Promise.reject(`Invalid consent name type: {p1}`)
		end
	end
}