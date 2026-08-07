local httpService = game:GetService("HttpService")
local squadsCore = script:FindFirstAncestor("SquadsCore")
local parent = squadsCore.Parent
local urlBuilderModule = require(parent.UrlBuilder)
local tModule = require(parent.t)
local loggerModule = require(squadsCore.Logger)
local serializeTableModule = require(squadsCore.Utils.serializeTable)
local var6 = tModule.strictInterface({ scheduledGroupUpId = tModule.number })
local var7 = urlBuilderModule.UrlBuilder.new({
	path = "group-up/v1/subscribe-to-scheduled-group-up",
	base = urlBuilderModule.UrlBase.APIS
})()

return function(p0, p1, p2) --[[ line: 28 ]]
	-- upvalues: var6 (ref), httpService (ref), var7 (ref), loggerModule (ref), serializeTableModule (ref)
	assert(var6(p0))
	
	return httpService:RequestInternal({
		Method = "POST",
		Body = httpService:JSONEncode({ scheduledGroupUpId = p0.scheduledGroupUpId }),
		Headers = {
			["Content-Type"] = "application/json",
			Accept = "application/json"
		},
		Url = var7
	}):Start(function(_, p3) --[[ line: 47 ]]
		-- upvalues: p1 (ref), httpService (copy), loggerModule (copy), serializeTableModule (copy), p2 (ref), p0 (ref)
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
		loggerModule:error("Error subscribing to scheduledSquadId: {}. Status: {}", p0.scheduledGroupUpId, p3.StatusMessage)
		
		return p3
	end)
end