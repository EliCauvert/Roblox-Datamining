local httpService = game:GetService("HttpService")
local serverTriggeredModals = script:FindFirstAncestor("ServerTriggeredModals")
local parent = serverTriggeredModals.Parent
local urlBuilder = require(parent.UrlBuilder).UrlBuilder
local urlBase = require(parent.UrlBuilder).UrlBase
local loggerModule = require(serverTriggeredModals.Logger)
local logResponseStatusModule = require(serverTriggeredModals.logResponseStatus)
local logResponseLatencyModule = require(serverTriggeredModals.logResponseLatency)
local var1 = urlBuilder.new({ path = "modals-api/v1/impression", base = urlBase.APIS })

return function(p1, p2, p3)
	-- upvalues: loggerModule (ref), var1 (ref), httpService (ref), logResponseLatencyModule (ref), logResponseStatusModule (ref)
	if not p1 then
		loggerModule:error("Missing networking implementation")
		
		return
	end
	local ok, status = pcall(function()
		-- upvalues: var1 (copy), httpService (copy), p2 (ref), p3 (ref), p1 (ref)
		return p1(var1(), "POST", {
			postBody = httpService:JSONEncode({ modalId = p2, modalType = p3 })
		})
	end)
	
	if ok then
		status:andThen(function(p4)
			-- upvalues: logResponseLatencyModule (copy), loggerModule (copy)
			local var2 = if p4 then p4.responseCode else nil
			logResponseLatencyModule("modals-api/v1/impression", p4.responseTimeMs, var2)
			
			if var2 ~= nil and var2 ~= 200 then
				loggerModule:error(`Unexpected responseCode when reporting impression: {var2}`)
			end
		end):catch(function(p4)
			-- upvalues: logResponseStatusModule (copy), loggerModule (copy)
			logResponseStatusModule("modals-api/v1/impression", p4.StatusCode)
			loggerModule:error(`Report Impression request error: {p4}`)
		end)
		
		return
	end
	loggerModule:error(`Report impression request failed to start: {status}`)
end