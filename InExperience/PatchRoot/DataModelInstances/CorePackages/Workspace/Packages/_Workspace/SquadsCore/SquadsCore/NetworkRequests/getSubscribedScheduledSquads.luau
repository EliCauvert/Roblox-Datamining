local httpService = game:GetService("HttpService")
local squadsCore = script:FindFirstAncestor("SquadsCore")
local urlBuilderModule = require(squadsCore.Parent.UrlBuilder)
local loggerModule = require(squadsCore.Logger)
local serializeTableModule = require(squadsCore.Utils.serializeTable)
local _ = require(squadsCore.Types)
local var5 = urlBuilderModule.UrlBuilder.new({
	path = "group-up/v1/get-subscribed-scheduled-group-ups",
	base = urlBuilderModule.UrlBase.APIS
})()

return function(p0, p1)
	-- upvalues: httpService (ref), var5 (ref), loggerModule (ref), serializeTableModule (ref)
	return httpService:RequestInternal({
		Method = "GET",
		Headers = {
			["Content-Type"] = "application/json",
			Accept = "application/json"
		},
		Url = var5
	}):Start(function(_, p2)
		-- upvalues: p0 (ref), httpService (copy), loggerModule (copy), serializeTableModule (copy), p1 (ref)
		if p2.StatusCode == 200 then
			local body = p2.Body
			
			if p0 then
				p0(httpService:JSONDecode(body))
			end
			loggerModule:debug("Response: {}", serializeTableModule(body))
			
			return p2
		elseif p1 then
			p1()
		end
		loggerModule:error("Error getting subscribed scheduled squads: {}", p2.StatusMessage)
		
		return p2
	end)
end