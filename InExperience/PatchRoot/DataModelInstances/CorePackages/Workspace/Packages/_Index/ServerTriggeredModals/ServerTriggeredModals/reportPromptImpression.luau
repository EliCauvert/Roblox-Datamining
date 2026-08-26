local httpService = game:GetService("HttpService")
local serverTriggeredModals = script:FindFirstAncestor("ServerTriggeredModals")
local parent = serverTriggeredModals.Parent
local promiseModule = require(parent.Promise)
local loggerModule = require(serverTriggeredModals.Logger)
local logResponseStatusModule = require(serverTriggeredModals.logResponseStatus)
local logResponseLatencyModule = require(serverTriggeredModals.logResponseLatency)
local fFlagServerTriggeredModalsAccepts2xxImpressionResponsesModule = require(serverTriggeredModals.Flags.FFlagServerTriggeredModalsAccepts2xxImpressionResponses)
local var1 = require(parent.UrlBuilder).UrlBuilder.new({
	path = "modals-api/v1/prompts/impression",
	base = require(parent.UrlBuilder).UrlBase.APIS
})

return function(p1, p2)
	-- upvalues: var1 (ref), httpService (ref), promiseModule (ref), fFlagServerTriggeredModalsAccepts2xxImpressionResponsesModule (ref), logResponseStatusModule (ref), loggerModule (ref), logResponseLatencyModule (ref)
	local var2 = httpService:RequestInternal({
		Method = "POST",
		Url = var1(),
		Headers = { ["Content-Type"] = "application/json" },
		Body = httpService:JSONEncode({ promptType = p1, promptId = p2 })
	})
	
	return promiseModule.new(function(p3, p4)
		-- upvalues: var2 (ref), fFlagServerTriggeredModalsAccepts2xxImpressionResponsesModule (copy), logResponseStatusModule (copy), loggerModule (copy), logResponseLatencyModule (copy)
		var2:Start(function(p5, p6)
			-- upvalues: fFlagServerTriggeredModalsAccepts2xxImpressionResponsesModule (copy), logResponseStatusModule (copy), loggerModule (copy), p4 (ref), logResponseLatencyModule (copy), p3 (ref)
			local var3
			local statusCode = p6 and p6.StatusCode
			
			if fFlagServerTriggeredModalsAccepts2xxImpressionResponsesModule then
				var3 = p5
				
				if var3 then
					var3 = false
					
					if statusCode ~= nil then
						var3 = false
						
						if statusCode >= 200 then
							var3 = statusCode < 300
							var3 = nil
						end
					end
				end
			else
				var3 = p5 and statusCode == 200
			end
			if not var3 then
				logResponseStatusModule("modals-api/v1/prompts/impression", statusCode)
				loggerModule:error(`Report Prompt Impression request error with status code: {statusCode}`)
				p4()
				
				return
			end
			local roundTripTime = p6 and (p6.Stats and p6.Stats.RoundTripTime)
			local var4 = roundTripTime and roundTripTime * 1000
			
			if var4 then
				logResponseLatencyModule("modals-api/v1/prompts/impression", var4, statusCode)
			end
			p3()
		end)
	end)
end