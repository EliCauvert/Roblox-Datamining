local HttpService = game:GetService("HttpService")
local UrlBuilderModule = require(script:FindFirstAncestor("SocialCards").Parent.UrlBuilder)
local _ = require(script.Parent.parseCallCard)
local UrlBuilder = UrlBuilderModule.UrlBuilder
local UrlBase = UrlBuilderModule.UrlBase

return function(CallId, Callback)
	-- upvalues: UrlBuilder (copy), UrlBase (copy), HttpService (copy)
	HttpService:RequestInternal({
		Method = "GET",
		Headers = { Accept = "application/json" },
		Url = UrlBuilder.new({
			path = "call/v2/get-call-card",
			base = UrlBase.APIS,
			query = { callId = CallId }
		})()
	}):Start(function(_, p1)
		-- upvalues: Callback (copy), HttpService (upval)
		if p1.StatusCode == 200 then
			Callback(HttpService:JSONDecode(p1.Body))
		end
	end)
end