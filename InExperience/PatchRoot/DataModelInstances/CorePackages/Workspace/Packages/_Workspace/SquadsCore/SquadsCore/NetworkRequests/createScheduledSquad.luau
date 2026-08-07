local httpService = game:GetService("HttpService")
local squadsCore = script:FindFirstAncestor("SquadsCore")
local parent = squadsCore.Parent
local urlBuilderModule = require(parent.UrlBuilder)
local tModule = require(parent.t)
local loggerModule = require(squadsCore.Logger)
local scheduledSquadModelModule = require(squadsCore.Models.ScheduledSquadModel)
local serializeTableModule = require(squadsCore.Utils.serializeTable)
local _ = require(squadsCore.Types)
local var7 = tModule.strictInterface({
	parentChannelId = tModule.string,
	title = tModule.string,
	startTime = tModule.string
})
local var8 = urlBuilderModule.UrlBuilder.new({
	path = "group-up/v1/create-scheduled-group-up",
	base = urlBuilderModule.UrlBase.APIS
})()

return function(p0, p1, p2) --[[ line: 36 ]]
	-- upvalues: var7 (ref), httpService (ref), var8 (ref), scheduledSquadModelModule (ref), loggerModule (ref), serializeTableModule (ref)
	assert(var7(p0))
	
	return httpService:RequestInternal({
		Method = "POST",
		Body = httpService:JSONEncode({
			parentChannelId = p0.parentChannelId,
			title = p0.title,
			startTime = p0.startTime
		}),
		Headers = {
			["Content-Type"] = "application/json",
			Accept = "application/json"
		},
		Url = var8
	}):Start(function(_, p3) --[[ line: 57 ]]
		-- upvalues: p1 (ref), scheduledSquadModelModule (copy), httpService (copy), loggerModule (copy), serializeTableModule (copy), p2 (ref)
		if p3.StatusCode == 200 then
			local body = p3.Body
			
			if p1 then
				p1(scheduledSquadModelModule.format(httpService:JSONDecode(body)))
			end
			loggerModule:debug("Response: {}", serializeTableModule(body))
			
			return p3
		elseif p2 then
			p2(p3.StatusCode)
		end
		loggerModule:error("Error creating scheduled squad: {}", p3.StatusMessage)
		
		return p3
	end)
end