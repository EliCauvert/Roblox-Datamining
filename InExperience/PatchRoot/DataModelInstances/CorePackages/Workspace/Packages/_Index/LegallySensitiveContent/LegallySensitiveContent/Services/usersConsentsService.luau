local HttpService = game:GetService("HttpService")
local Parent = script.Parent.Parent
local DependenciesModule = require(Parent.dependencies)
local Promise = DependenciesModule.Promise
local UrlBuilder = DependenciesModule.UrlBuilder
local UrlBase = DependenciesModule.UrlBase
local Fetch = DependenciesModule.Fetch
local FetchFunction = Fetch.fetch
local Response = Fetch.Response
local ConsentNameModule = require(Parent.Enums.ConsentName)
local NewUrlBuilder = UrlBuilder.new({
	path = "user-consents-api/v1/user-consents/one-time",
	base = UrlBase.APIS
})

return {
	grantOneTimeUserConsent = function(p1, TtlSeconds, p2)
		-- upvalues: ConsentNameModule (copy), Promise (copy), NewUrlBuilder (copy), FetchFunction (copy), HttpService (copy), Response (copy)
		local ConsentNameModuleEntry = ConsentNameModule[p1]
		
		if ConsentNameModuleEntry then
			local UrlBuilder = NewUrlBuilder()
			
			return Promise.new(function(Callback1: () -> (), Callback: (any) -> ())
				-- upvalues: FetchFunction (upval), UrlBuilder (copy), HttpService (upval), ConsentNameModuleEntry (copy), TtlSeconds (copy), p2 (copy), Response (upval)
				local Success, Result = pcall(function()
					-- upvalues: FetchFunction (upval), UrlBuilder (upval), HttpService (upval), ConsentNameModuleEntry (upval), TtlSeconds (upval), p2 (upval), Response (upval)
					return FetchFunction(UrlBuilder, {
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
					}):catch(function(_)
						-- upvalues: Response (upval)
						return Response.error()
					end):expect()
				end)
				
				if not Success then
					Callback("Failed to make request: " .. tostring(Result))
					
					return
				end
				if Result.ok then
					Callback1()
					
					return
				else
					Callback((string.format("Got grant one time user consent HTTP Response: %d - %s", Result.status, Result.statusText)))
				end
			end)
		else
			return Promise.reject(`Invalid consent name type: {p1}`)
		end
	end
}