local httpService = game:GetService("HttpService")
local serverTriggeredModals = script:FindFirstAncestor("ServerTriggeredModals")
local parent = serverTriggeredModals.Parent
local promiseModule = require(parent.Promise)
local loggerModule = require(serverTriggeredModals.Logger)
local logResponseStatusModule = require(serverTriggeredModals.logResponseStatus)
local logResponseLatencyModule = require(serverTriggeredModals.logResponseLatency)
local var6 = require(parent.UrlBuilder).UrlBuilder.new({
	path = "modals-api/v1/prompts/impression",
	base = require(parent.UrlBuilder).UrlBase.APIS
})

return function(p0, p1) --[[ line: 21 ]]
	-- upvalues: var6 (ref), httpService (ref), promiseModule (ref), logResponseStatusModule (ref), loggerModule (ref), logResponseLatencyModule (ref)
	local var7 = httpService:RequestInternal({
		Method = "POST",
		Url = var6(),
		Headers = { ["Content-Type"] = "application/json" },
		Body = httpService:JSONEncode({ promptType = p0, promptId = p1 })
	})
	
	return promiseModule.new(function(p2, p3) --[[ line: 32 ]]
		-- upvalues: var7 (ref), logResponseStatusModule (copy), loggerModule (copy), logResponseLatencyModule (copy)
		var7:Start(function(p4, p5) --[[ line: 33 ]]
			-- upvalues: logResponseStatusModule (copy), loggerModule (copy), p3 (ref), logResponseLatencyModule (copy), p2 (ref)
			local statusCode = p5 and p5.StatusCode
			
			if not p4 or statusCode ~= 200 then
				logResponseStatusModule("modals-api/v1/prompts/impression", statusCode)
				loggerModule:error(`Report Prompt Impression request error with status code: {statusCode}`)
				p3()
				
				return
			end
			local roundTripTime = p5 and (p5.Stats and p5.Stats.RoundTripTime)
			local var10 = roundTripTime and roundTripTime * 1000
			
			if var10 then
				logResponseLatencyModule("modals-api/v1/prompts/impression", var10, statusCode)
			end
			p2()
		end)
	end)
end