local httpService = game:GetService("HttpService")
local squadsCore = script:FindFirstAncestor("SquadsCore")
local urlBuilderModule = require(squadsCore.Parent.UrlBuilder)
local loggerModule = require(squadsCore.Logger)
local serializeTableModule = require(squadsCore.Utils.serializeTable)
local _ = require(squadsCore.Types)
local urlBuilder = urlBuilderModule.UrlBuilder
local urlBase = urlBuilderModule.UrlBase

return function(p1, p2, p3)
	-- upvalues: urlBuilder (ref), urlBase (ref), httpService (ref), loggerModule (ref), serializeTableModule (ref)
	return httpService:RequestInternal({
		Method = "GET",
		Headers = {
			["Content-Type"] = "application/json",
			Accept = "application/json"
		},
		Url = urlBuilder.new({
			path = "group-up/v1/get-scheduled-group-up-status",
			base = urlBase.APIS,
			query = { scheduledGroupUpId = p1 }
		})()
	}):Start(function(_, p4)
		-- upvalues: p2 (ref), httpService (copy), loggerModule (copy), serializeTableModule (copy), p3 (ref)
		if p4.StatusCode == 200 then
			local body = p4.Body
			
			if p2 then
				p2(httpService:JSONDecode(body).scheduledGroupUp)
			end
			loggerModule:debug("Response: {}", serializeTableModule(body))
			
			return p4
		elseif p3 then
			p3()
		end
		loggerModule:error("Error getting scheduled squad status: {}", p4.StatusMessage)
		
		return p4
	end)
end