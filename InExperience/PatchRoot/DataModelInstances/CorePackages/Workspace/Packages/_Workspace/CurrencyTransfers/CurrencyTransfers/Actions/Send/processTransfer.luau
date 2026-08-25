local currencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local sharedFlagsModule = require(currencyTransfers.Parent.SharedFlags)
local _ = require(currencyTransfers.Stores.createTransferStore)
local processTransferRequestModule = require(currencyTransfers.NetworkRequests.processTransferRequest)
local promptStateModule = require(currencyTransfers.Enums.PromptState)
local _ = require(currencyTransfers.Models.ProcessTransferModel)
local _ = require(currencyTransfers.Models.ErrorTransferModel)
local failureReasonModule = require(currencyTransfers.Enums.FailureReason)
local handleTransferSuccessModule = require(currencyTransfers.Actions.Send.handleTransferSuccess)
local handleTransferErrorModule = require(currencyTransfers.Actions.Send.handleTransferError)
local handleTransferBlockModule = require(currencyTransfers.Actions.Send.handleTransferBlock)
local transferRetryOriginModule = require(currencyTransfers.Enums.TransferRetryOrigin)
local currencyTransferTelemetryModule = require(currencyTransfers.Events.CurrencyTransferTelemetry)
local robuxTransferFlowEventNameModule = require(currencyTransfers.Enums.RobuxTransferFlowEventName)
local logCurrencyTransferCounterModule = require(currencyTransfers.Utils.logCurrencyTransferCounter)
local logRobuxTransferFlowEventModule = require(currencyTransfers.Utils.logRobuxTransferFlowEvent)

return function(p0, p1)
	-- upvalues: logCurrencyTransferCounterModule (ref), currencyTransferTelemetryModule (ref), sharedFlagsModule (ref), logRobuxTransferFlowEventModule (ref), robuxTransferFlowEventNameModule (ref), handleTransferErrorModule (ref), promptStateModule (ref), processTransferRequestModule (ref), handleTransferSuccessModule (ref), failureReasonModule (ref), handleTransferBlockModule (ref), transferRetryOriginModule (ref)
	local networkImpl = p0.getNetworkImpl()
	local setPromptState = p0.setPromptState
	local transferRequestId = p0.getTransferRequestId(false)
	
	if transferRequestId then
		setPromptState(promptStateModule.TransferProcessing)
		logCurrencyTransferCounterModule(p0, currencyTransferTelemetryModule.CurrencyTransferProcessAttemptedCounter)
		
		if sharedFlagsModule.FFlagEnableRobuxTransferFlowEventIngest then
			logRobuxTransferFlowEventModule(p0, robuxTransferFlowEventNameModule.process_attempted)
		end
		return processTransferRequestModule({ transferRequestId = transferRequestId, robuxAmount = p1 }, nil, networkImpl):andThen(function(p3)
			-- upvalues: logCurrencyTransferCounterModule (copy), p0 (ref), currencyTransferTelemetryModule (copy), sharedFlagsModule (copy), logRobuxTransferFlowEventModule (copy), robuxTransferFlowEventNameModule (copy), handleTransferSuccessModule (copy), handleTransferErrorModule (copy)
			if p3 and p3.success then
				logCurrencyTransferCounterModule(p0, currencyTransferTelemetryModule.CurrencyTransferProcessSucceededCounter)
				
				if sharedFlagsModule.FFlagEnableRobuxTransferFlowEventIngest then
					logRobuxTransferFlowEventModule(p0, robuxTransferFlowEventNameModule.process_succeeded)
				end
				handleTransferSuccessModule(p0)
				
				return
			else
				logCurrencyTransferCounterModule(p0, currencyTransferTelemetryModule.CurrencyTransferProcessFailedCounter)
				
				if sharedFlagsModule.FFlagEnableRobuxTransferFlowEventIngest then
					logRobuxTransferFlowEventModule(p0, robuxTransferFlowEventNameModule.process_failed)
				end
				handleTransferErrorModule(p0)
			end
		end):catch(function(p2)
			-- upvalues: logCurrencyTransferCounterModule (copy), p0 (ref), currencyTransferTelemetryModule (copy), sharedFlagsModule (copy), logRobuxTransferFlowEventModule (copy), robuxTransferFlowEventNameModule (copy), failureReasonModule (copy), handleTransferBlockModule (copy), transferRetryOriginModule (copy), handleTransferErrorModule (copy)
			logCurrencyTransferCounterModule(p0, currencyTransferTelemetryModule.CurrencyTransferProcessFailedCounter)
			
			if sharedFlagsModule.FFlagEnableRobuxTransferFlowEventIngest then
				logRobuxTransferFlowEventModule(p0, robuxTransferFlowEventNameModule.process_failed)
			end
			if typeof(p2) ~= "table" or not p2.errorMessage then
				handleTransferErrorModule(p0, nil)
				
				return
			elseif p2.failureReason == failureReasonModule.AmpRecourseAvailable and p2.ampRecourseActions and p2.ampFeatureCheck then
				handleTransferBlockModule(p0, p2.ampRecourseActions, p2.ampFeatureCheck, transferRetryOriginModule.ProcessTransfer)
				
				return
			end
			handleTransferErrorModule(p0, p2)
		end)
	else
		logCurrencyTransferCounterModule(p0, currencyTransferTelemetryModule.CurrencyTransferProcessFailedCounter)
		
		if sharedFlagsModule.FFlagEnableRobuxTransferFlowEventIngest then
			logRobuxTransferFlowEventModule(p0, robuxTransferFlowEventNameModule.process_failed)
		end
		handleTransferErrorModule(p0)
	end
end