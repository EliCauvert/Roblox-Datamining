local httpService = game:GetService("HttpService")
local serverTriggeredModals = script:FindFirstAncestor("ServerTriggeredModals")
local parent = serverTriggeredModals.Parent
local urlBuilder = require(parent.UrlBuilder).UrlBuilder
local urlBase = require(parent.UrlBuilder).UrlBase
local loggerModule = require(serverTriggeredModals.Logger)
local logResponseStatusModule = require(serverTriggeredModals.logResponseStatus)
local logResponseLatencyModule = require(serverTriggeredModals.logResponseLatency)
local var5 = urlBuilder.new({ path = "modals-api/v1/impression", base = urlBase.APIS })

return function(p0, p1, p2) --[[ line: 20 ]]
	-- upvalues: loggerModule (ref), var5 (ref), httpService (ref), logResponseLatencyModule (ref), logResponseStatusModule (ref)
	if not p0 then
		loggerModule:error("Missing networking implementation")
		
		return
	end
	local ok, status = pcall(function() --[[ line: 26 ]]
		-- upvalues: var5 (copy), httpService (copy), p1 (ref), p2 (ref), p0 (ref)
		return p0(var5(), "POST", {
			postBody = httpService:JSONEncode({ modalId = p1, modalType = p2 })
		})
	end)
	
	if ok then
		status:andThen(function(p4) --[[ line: 38 ]]
			-- upvalues: logResponseLatencyModule (copy), loggerModule (copy)
			local var6 = if p4 then p4.responseCode else nil
			logResponseLatencyModule("modals-api/v1/impression", p4.responseTimeMs, var6)
			
			if var6 ~= nil and var6 ~= 200 then
				loggerModule:error(`Unexpected responseCode when reporting impression: {var6}`)
			end
		end):catch(function(p3) --[[ line: 45 ]]
			-- upvalues: logResponseStatusModule (copy), loggerModule (copy)
			logResponseStatusModule("modals-api/v1/impression", p3.StatusCode)
			loggerModule:error(`Report Impression request error: {p3}`)
		end)
		
		return
	end
	loggerModule:error(`Report impression request failed to start: {status}`)
end