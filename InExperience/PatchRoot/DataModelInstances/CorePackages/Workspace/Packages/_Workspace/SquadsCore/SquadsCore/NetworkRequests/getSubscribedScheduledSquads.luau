local httpService = game:GetService("HttpService")
local squadsCore = script:FindFirstAncestor("SquadsCore")
local urlBuilderModule = require(squadsCore.Parent.UrlBuilder)
local loggerModule = require(squadsCore.Logger)
local serializeTableModule = require(squadsCore.Utils.serializeTable)
local _ = require(squadsCore.Types)
local var1 = urlBuilderModule.UrlBuilder.new({
	path = "group-up/v1/get-subscribed-scheduled-group-ups",
	base = urlBuilderModule.UrlBase.APIS
})()

return function(p1, p2)
	-- upvalues: httpService (ref), var1 (ref), loggerModule (ref), serializeTableModule (ref)
	return httpService:RequestInternal({
		Method = "GET",
		Headers = {
			["Content-Type"] = "application/json",
			Accept = "application/json"
		},
		Url = var1
	}):Start(function(_, p3)
		-- upvalues: p1 (ref), httpService (copy), loggerModule (copy), serializeTableModule (copy), p2 (ref)
		if p3.StatusCode == 200 then
			local body = p3.Body
			
			if p1 then
				p1(httpService:JSONDecode(body))
			end
			loggerModule:debug("Response: {}", serializeTableModule(body))
			
			return p3
		elseif p2 then
			p2()
		end
		loggerModule:error("Error getting subscribed scheduled squads: {}", p3.StatusMessage)
		
		return p3
	end)
end