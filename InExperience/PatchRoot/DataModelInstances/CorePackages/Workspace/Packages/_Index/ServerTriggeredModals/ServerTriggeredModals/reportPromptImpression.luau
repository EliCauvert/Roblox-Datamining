local httpService = game:GetService("HttpService")
local serverTriggeredModals = script:FindFirstAncestor("ServerTriggeredModals")
local parent = serverTriggeredModals.Parent
local promiseModule = require(parent.Promise)
local loggerModule = require(serverTriggeredModals.Logger)
local logResponseStatusModule = require(serverTriggeredModals.logResponseStatus)
local logResponseLatencyModule = require(serverTriggeredModals.logResponseLatency)
local fFlagServerTriggeredModalsAccepts2xxImpressionResponsesModule = require(serverTriggeredModals.Flags.FFlagServerTriggeredModalsAccepts2xxImpressionResponses)
local var7 = require(parent.UrlBuilder).UrlBuilder.new({
	path = "modals-api/v1/prompts/impression",
	base = require(parent.UrlBuilder).UrlBase.APIS
})

return function(p0, p1) --[[ line: 23 ]]
	-- upvalues: var7 (ref), httpService (ref), promiseModule (ref), fFlagServerTriggeredModalsAccepts2xxImpressionResponsesModule (ref), logResponseStatusModule (ref), loggerModule (ref), logResponseLatencyModule (ref)
	local var8 = httpService:RequestInternal({
		Method = "POST",
		Url = var7(),
		Headers = { ["Content-Type"] = "application/json" },
		Body = httpService:JSONEncode({ promptType = p0, promptId = p1 })
	})
	
	return promiseModule.new(function(p2, p3) --[[ line: 34 ]]
		-- upvalues: var8 (ref), fFlagServerTriggeredModalsAccepts2xxImpressionResponsesModule (copy), logResponseStatusModule (copy), loggerModule (copy), logResponseLatencyModule (copy)
		var8:Start(function(p4, p5) --[[ line: 35 ]]
			-- upvalues: fFlagServerTriggeredModalsAccepts2xxImpressionResponsesModule (copy), logResponseStatusModule (copy), loggerModule (copy), p3 (ref), logResponseLatencyModule (copy), p2 (ref)
			local var10
			local statusCode = p5 and p5.StatusCode
			
			if fFlagServerTriggeredModalsAccepts2xxImpressionResponsesModule then
				var10 = p4
				
				if var10 then
					var10 = false
					
					if statusCode ~= nil then
						var10 = false
						
						if statusCode >= 200 then
							var10 = statusCode < 300
							var10 = nil
						end
					end
				end
			else
				var10 = p4 and statusCode == 200
			end
			if not var10 then
				logResponseStatusModule("modals-api/v1/prompts/impression", statusCode)
				loggerModule:error(`Report Prompt Impression request error with status code: {statusCode}`)
				p3()
				
				return
			end
			local roundTripTime = p5 and (p5.Stats and p5.Stats.RoundTripTime)
			local var12 = roundTripTime and roundTripTime * 1000
			
			if var12 then
				logResponseLatencyModule("modals-api/v1/prompts/impression", var12, statusCode)
			end
			p2()
		end)
	end)
end