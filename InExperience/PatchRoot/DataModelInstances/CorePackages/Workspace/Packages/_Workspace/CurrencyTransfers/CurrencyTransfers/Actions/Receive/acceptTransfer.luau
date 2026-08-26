local currencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local sharedFlagsModule = require(currencyTransfers.Parent.SharedFlags)
local _ = require(currencyTransfers.Stores.createTransferStore)
local acceptTransferRequestModule = require(currencyTransfers.NetworkRequests.acceptTransferRequest)
local promptStateModule = require(currencyTransfers.Enums.PromptState)
local _ = require(currencyTransfers.Models.AcceptTransferModel)
local _ = require(currencyTransfers.Models.ErrorTransferModel)
local failureReasonModule = require(currencyTransfers.Enums.FailureReason)
local handleReceiveSuccessModule = require(currencyTransfers.Actions.Receive.handleReceiveSuccess)
local handleReceiveErrorModule = require(currencyTransfers.Actions.Receive.handleReceiveError)
local handleReceiveBlockModule = require(currencyTransfers.Actions.Receive.handleReceiveBlock)
local transferRetryOriginModule = require(currencyTransfers.Enums.TransferRetryOrigin)
local currencyTransferTelemetryModule = require(currencyTransfers.Events.CurrencyTransferTelemetry)
local robuxTransferFlowEventNameModule = require(currencyTransfers.Enums.RobuxTransferFlowEventName)
local logCurrencyTransferCounterModule = require(currencyTransfers.Utils.logCurrencyTransferCounter)
local logRobuxTransferFlowEventModule = require(currencyTransfers.Utils.logRobuxTransferFlowEvent)

return function(p1)
	-- upvalues: logCurrencyTransferCounterModule (ref), currencyTransferTelemetryModule (ref), sharedFlagsModule (ref), logRobuxTransferFlowEventModule (ref), robuxTransferFlowEventNameModule (ref), handleReceiveErrorModule (ref), promptStateModule (ref), acceptTransferRequestModule (ref), handleReceiveSuccessModule (ref), failureReasonModule (ref), handleReceiveBlockModule (ref), transferRetryOriginModule (ref)
	local networkImpl = p1.getNetworkImpl()
	local setPromptState = p1.setPromptState
	local setRobuxTransfer = p1.setRobuxTransfer
	local setIsAlreadyAccepted = p1.setIsAlreadyAccepted
	local transferRequestId = p1.getTransferRequestId(false)
	
	if transferRequestId then
		setPromptState(promptStateModule.ReceiveRequested)
		local t = { transferRequestId = transferRequestId }
		logCurrencyTransferCounterModule(p1, currencyTransferTelemetryModule.CurrencyTransferAcceptAttemptedCounter)
		
		if sharedFlagsModule.FFlagEnableRobuxTransferFlowEventIngest then
			logRobuxTransferFlowEventModule(p1, robuxTransferFlowEventNameModule.accept_attempted)
		end
		return acceptTransferRequestModule(t, nil, networkImpl):andThen(function(p2)
			-- upvalues: setPromptState (ref), promptStateModule (copy), setRobuxTransfer (ref), setIsAlreadyAccepted (ref), logCurrencyTransferCounterModule (copy), p1 (ref), currencyTransferTelemetryModule (copy), sharedFlagsModule (copy), logRobuxTransferFlowEventModule (copy), robuxTransferFlowEventNameModule (copy), handleReceiveSuccessModule (copy), handleReceiveErrorModule (copy)
			setPromptState(promptStateModule.ReceiveStarted)
			
			if p2 and p2.robuxTransfer then
				setRobuxTransfer(p2.robuxTransfer)
				setIsAlreadyAccepted(p2.isAlreadyAccepted == true)
				logCurrencyTransferCounterModule(p1, currencyTransferTelemetryModule.CurrencyTransferAcceptSucceededCounter)
				
				if sharedFlagsModule.FFlagEnableRobuxTransferFlowEventIngest then
					logRobuxTransferFlowEventModule(p1, robuxTransferFlowEventNameModule.accept_succeeded)
				end
				if sharedFlagsModule.FFlagSduiOpenIncomingTransferUpsellAction then
					p1.triggerOnPromptDismissCommitted()
				end
				handleReceiveSuccessModule(p1)
				
				return
			else
				logCurrencyTransferCounterModule(p1, currencyTransferTelemetryModule.CurrencyTransferAcceptFailedCounter)
				
				if sharedFlagsModule.FFlagEnableRobuxTransferFlowEventIngest then
					logRobuxTransferFlowEventModule(p1, robuxTransferFlowEventNameModule.accept_failed)
				end
				handleReceiveErrorModule(p1, nil)
			end
		end):catch(function(p2)
			-- upvalues: logCurrencyTransferCounterModule (copy), p1 (ref), currencyTransferTelemetryModule (copy), sharedFlagsModule (copy), logRobuxTransferFlowEventModule (copy), robuxTransferFlowEventNameModule (copy), failureReasonModule (copy), handleReceiveBlockModule (copy), transferRetryOriginModule (copy), handleReceiveErrorModule (copy)
			logCurrencyTransferCounterModule(p1, currencyTransferTelemetryModule.CurrencyTransferAcceptFailedCounter)
			
			if sharedFlagsModule.FFlagEnableRobuxTransferFlowEventIngest then
				logRobuxTransferFlowEventModule(p1, robuxTransferFlowEventNameModule.accept_failed)
			end
			if typeof(p2) ~= "table" or not p2.errorMessage then
				handleReceiveErrorModule(p1, nil)
				
				return
			elseif p2.failureReason == failureReasonModule.AmpRecourseAvailable and p2.ampRecourseActions and p2.ampFeatureCheck then
				handleReceiveBlockModule(p1, p2.ampRecourseActions, p2.ampFeatureCheck, transferRetryOriginModule.AcceptTransfer)
				
				return
			end
			handleReceiveErrorModule(p1, p2)
		end)
	else
		logCurrencyTransferCounterModule(p1, currencyTransferTelemetryModule.CurrencyTransferAcceptFailedCounter)
		
		if sharedFlagsModule.FFlagEnableRobuxTransferFlowEventIngest then
			logRobuxTransferFlowEventModule(p1, robuxTransferFlowEventNameModule.accept_failed)
		end
		handleReceiveErrorModule(p1, nil)
	end
end