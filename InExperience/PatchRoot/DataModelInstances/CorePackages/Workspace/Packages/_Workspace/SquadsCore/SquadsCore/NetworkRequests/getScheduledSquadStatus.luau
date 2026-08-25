local httpService = game:GetService("HttpService")
local squadsCore = script:FindFirstAncestor("SquadsCore")
local urlBuilderModule = require(squadsCore.Parent.UrlBuilder)
local loggerModule = require(squadsCore.Logger)
local serializeTableModule = require(squadsCore.Utils.serializeTable)
local _ = require(squadsCore.Types)
local urlBuilder = urlBuilderModule.UrlBuilder
local urlBase = urlBuilderModule.UrlBase

return function(p0, p1, p2)
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
			query = { scheduledGroupUpId = p0 }
		})()
	}):Start(function(_, p3)
		-- upvalues: p1 (ref), httpService (copy), loggerModule (copy), serializeTableModule (copy), p2 (ref)
		if p3.StatusCode == 200 then
			local body = p3.Body
			
			if p1 then
				p1(httpService:JSONDecode(body).scheduledGroupUp)
			end
			loggerModule:debug("Response: {}", serializeTableModule(body))
			
			return p3
		elseif p2 then
			p2()
		end
		loggerModule:error("Error getting scheduled squad status: {}", p3.StatusMessage)
		
		return p3
	end)
end