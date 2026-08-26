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

return function(p1, p2)
	-- upvalues: logCurrencyTransferCounterModule (ref), currencyTransferTelemetryModule (ref), sharedFlagsModule (ref), logRobuxTransferFlowEventModule (ref), robuxTransferFlowEventNameModule (ref), handleTransferErrorModule (ref), promptStateModule (ref), processTransferRequestModule (ref), handleTransferSuccessModule (ref), failureReasonModule (ref), handleTransferBlockModule (ref), transferRetryOriginModule (ref)
	local networkImpl = p1.getNetworkImpl()
	local setPromptState = p1.setPromptState
	local transferRequestId = p1.getTransferRequestId(false)
	
	if transferRequestId then
		setPromptState(promptStateModule.TransferProcessing)
		logCurrencyTransferCounterModule(p1, currencyTransferTelemetryModule.CurrencyTransferProcessAttemptedCounter)
		
		if sharedFlagsModule.FFlagEnableRobuxTransferFlowEventIngest then
			logRobuxTransferFlowEventModule(p1, robuxTransferFlowEventNameModule.process_attempted)
		end
		return processTransferRequestModule({ transferRequestId = transferRequestId, robuxAmount = p2 }, nil, networkImpl):andThen(function(p3)
			-- upvalues: logCurrencyTransferCounterModule (copy), p1 (ref), currencyTransferTelemetryModule (copy), sharedFlagsModule (copy), logRobuxTransferFlowEventModule (copy), robuxTransferFlowEventNameModule (copy), handleTransferSuccessModule (copy), handleTransferErrorModule (copy)
			if p3 and p3.success then
				logCurrencyTransferCounterModule(p1, currencyTransferTelemetryModule.CurrencyTransferProcessSucceededCounter)
				
				if sharedFlagsModule.FFlagEnableRobuxTransferFlowEventIngest then
					logRobuxTransferFlowEventModule(p1, robuxTransferFlowEventNameModule.process_succeeded)
				end
				handleTransferSuccessModule(p1)
				
				return
			else
				logCurrencyTransferCounterModule(p1, currencyTransferTelemetryModule.CurrencyTransferProcessFailedCounter)
				
				if sharedFlagsModule.FFlagEnableRobuxTransferFlowEventIngest then
					logRobuxTransferFlowEventModule(p1, robuxTransferFlowEventNameModule.process_failed)
				end
				handleTransferErrorModule(p1)
			end
		end):catch(function(p3)
			-- upvalues: logCurrencyTransferCounterModule (copy), p1 (ref), currencyTransferTelemetryModule (copy), sharedFlagsModule (copy), logRobuxTransferFlowEventModule (copy), robuxTransferFlowEventNameModule (copy), failureReasonModule (copy), handleTransferBlockModule (copy), transferRetryOriginModule (copy), handleTransferErrorModule (copy)
			logCurrencyTransferCounterModule(p1, currencyTransferTelemetryModule.CurrencyTransferProcessFailedCounter)
			
			if sharedFlagsModule.FFlagEnableRobuxTransferFlowEventIngest then
				logRobuxTransferFlowEventModule(p1, robuxTransferFlowEventNameModule.process_failed)
			end
			if typeof(p3) ~= "table" or not p3.errorMessage then
				handleTransferErrorModule(p1, nil)
				
				return
			elseif p3.failureReason == failureReasonModule.AmpRecourseAvailable and p3.ampRecourseActions and p3.ampFeatureCheck then
				handleTransferBlockModule(p1, p3.ampRecourseActions, p3.ampFeatureCheck, transferRetryOriginModule.ProcessTransfer)
				
				return
			end
			handleTransferErrorModule(p1, p3)
		end)
	else
		logCurrencyTransferCounterModule(p1, currencyTransferTelemetryModule.CurrencyTransferProcessFailedCounter)
		
		if sharedFlagsModule.FFlagEnableRobuxTransferFlowEventIngest then
			logRobuxTransferFlowEventModule(p1, robuxTransferFlowEventNameModule.process_failed)
		end
		handleTransferErrorModule(p1)
	end
end