local HttpService = game:GetService("HttpService")
local ServerTriggeredModals = script:FindFirstAncestor("ServerTriggeredModals")
local Parent = ServerTriggeredModals.Parent
local UrlBuilder = require(Parent.UrlBuilder).UrlBuilder
local UrlBase = require(Parent.UrlBuilder).UrlBase
local LoggerModule = require(ServerTriggeredModals.Logger)
local LogResponseStatusModule = require(ServerTriggeredModals.logResponseStatus)
local LogResponseLatencyModule = require(ServerTriggeredModals.logResponseLatency)
local NewUrlBuilder = UrlBuilder.new({ path = "modals-api/v1/impression", base = UrlBase.APIS })

return function(Callback, ModalId, ModalType)
	-- upvalues: LoggerModule (copy), NewUrlBuilder (copy), HttpService (copy), LogResponseLatencyModule (copy), LogResponseStatusModule (copy)
	if not Callback then
		LoggerModule:error("Missing networking implementation")
		
		return
	end
	local Success, Result = pcall(function()
		-- upvalues: NewUrlBuilder (upval), HttpService (upval), ModalId (copy), ModalType (copy), Callback (copy)
		return Callback(NewUrlBuilder(), "POST", {
			postBody = HttpService:JSONEncode({ modalId = ModalId, modalType = ModalType })
		})
	end)
	
	if Success then
		Result:andThen(function(Result)
			-- upvalues: LogResponseLatencyModule (upval), LoggerModule (upval)
			local ResponseCode = Result and Result.responseCode or nil
			LogResponseLatencyModule("modals-api/v1/impression", Result.responseTimeMs, ResponseCode)
			
			if ResponseCode ~= nil and ResponseCode ~= 200 then
				LoggerModule:error(`Unexpected responseCode when reporting impression: {ResponseCode}`)
			end
		end):catch(function(Err)
			-- upvalues: LogResponseStatusModule (upval), LoggerModule (upval)
			LogResponseStatusModule("modals-api/v1/impression", Err.StatusCode)
			LoggerModule:error(`Report Impression request error: {Err}`)
		end)
		
		return
	else
		LoggerModule:error(`Report impression request failed to start: {Result}`)
	end
end