local HttpService = game:GetService("HttpService")
local ServerTriggeredModals = script:FindFirstAncestor("ServerTriggeredModals")
local Parent = ServerTriggeredModals.Parent
local PromiseModule = require(Parent.Promise)
local LoggerModule = require(ServerTriggeredModals.Logger)
local LogResponseStatusModule = require(ServerTriggeredModals.logResponseStatus)
local LogResponseLatencyModule = require(ServerTriggeredModals.logResponseLatency)
local NewResult = require(Parent.UrlBuilder).UrlBuilder.new({
	path = "modals-api/v1/prompts/impression",
	base = require(Parent.UrlBuilder).UrlBase.APIS
})

return function(PromptType, PromptId)
	-- upvalues: NewResult (copy), HttpService (copy), PromiseModule (copy), LogResponseStatusModule (copy), LoggerModule (copy), LogResponseLatencyModule (copy)
	local RequestInternalResult = HttpService:RequestInternal({
		Method = "POST",
		Url = NewResult(),
		Headers = { ["Content-Type"] = "application/json" },
		Body = HttpService:JSONEncode({ promptType = PromptType, promptId = PromptId })
	})
	
	return PromiseModule.new(function(Callback, Callback1)
		-- upvalues: RequestInternalResult (copy), LogResponseStatusModule (upval), LoggerModule (upval), LogResponseLatencyModule (upval)
		RequestInternalResult:Start(function(p1, p2)
			-- upvalues: LogResponseStatusModule (upval), LoggerModule (upval), Callback1 (copy), LogResponseLatencyModule (upval), Callback (copy)
			local StatusCode = p2 and p2.StatusCode
			
			if not p1 or StatusCode ~= 200 then
				LogResponseStatusModule("modals-api/v1/prompts/impression", StatusCode)
				LoggerModule:error(`Report Prompt Impression request error with status code: {StatusCode}`)
				Callback1()
				
				return
			end
			local RoundTripTime = p2 and (p2.Stats and p2.Stats.RoundTripTime)
			local ScaledRoundTripTime = RoundTripTime and RoundTripTime * 1000
			
			if ScaledRoundTripTime then
				LogResponseLatencyModule("modals-api/v1/prompts/impression", ScaledRoundTripTime, StatusCode)
			end
			Callback()
		end)
	end)
end