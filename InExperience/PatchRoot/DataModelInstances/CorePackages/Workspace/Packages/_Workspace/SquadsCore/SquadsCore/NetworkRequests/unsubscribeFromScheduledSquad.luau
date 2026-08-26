local httpService = game:GetService("HttpService")
local squadsCore = script:FindFirstAncestor("SquadsCore")
local parent = squadsCore.Parent
local urlBuilderModule = require(parent.UrlBuilder)
local tModule = require(parent.t)
local loggerModule = require(squadsCore.Logger)
local serializeTableModule = require(squadsCore.Utils.serializeTable)
local var1 = tModule.strictInterface({ scheduledGroupUpId = tModule.number })
local var2 = urlBuilderModule.UrlBuilder.new({
	path = "group-up/v1/unsubscribe-from-scheduled-group-up",
	base = urlBuilderModule.UrlBase.APIS
})()

return function(p1, p2, p3)
	-- upvalues: var1 (ref), httpService (ref), var2 (ref), loggerModule (ref), serializeTableModule (ref)
	assert(var1(p1))
	
	return httpService:RequestInternal({
		Method = "POST",
		Body = httpService:JSONEncode({ scheduledGroupUpId = p1.scheduledGroupUpId }),
		Headers = {
			["Content-Type"] = "application/json",
			Accept = "application/json"
		},
		Url = var2
	}):Start(function(_, p4)
		-- upvalues: p2 (ref), httpService (copy), loggerModule (copy), serializeTableModule (copy), p3 (ref), p1 (ref)
		if p4.StatusCode == 200 then
			local body = p4.Body
			
			if p2 then
				p2(httpService:JSONDecode(body))
			end
			loggerModule:debug("Response: {}", serializeTableModule(body))
			
			return p4
		elseif p3 then
			p3()
		end
		loggerModule:error("Error unsubscribing from scheduledSquadId: {}. Status: {}", p1.scheduledGroupUpId, p4.StatusMessage)
		
		return p4
	end)
end