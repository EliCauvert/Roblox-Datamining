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

return function(p0) --[[ line: 25 | named "acceptTransfer" ]]
	-- upvalues: logCurrencyTransferCounterModule (ref), currencyTransferTelemetryModule (ref), sharedFlagsModule (ref), logRobuxTransferFlowEventModule (ref), robuxTransferFlowEventNameModule (ref), handleReceiveErrorModule (ref), promptStateModule (ref), acceptTransferRequestModule (ref), handleReceiveSuccessModule (ref), failureReasonModule (ref), handleReceiveBlockModule (ref), transferRetryOriginModule (ref)
	local networkImpl = p0.getNetworkImpl()
	local setPromptState = p0.setPromptState
	local setRobuxTransfer = p0.setRobuxTransfer
	local setIsAlreadyAccepted = p0.setIsAlreadyAccepted
	local transferRequestId = p0.getTransferRequestId(false)
	
	if transferRequestId then
		setPromptState(promptStateModule.ReceiveRequested)
		local t = { transferRequestId = transferRequestId }
		logCurrencyTransferCounterModule(p0, currencyTransferTelemetryModule.CurrencyTransferAcceptAttemptedCounter)
		
		if sharedFlagsModule.FFlagEnableRobuxTransferFlowEventIngest then
			logRobuxTransferFlowEventModule(p0, robuxTransferFlowEventNameModule.accept_attempted)
		end
		return acceptTransferRequestModule(t, nil, networkImpl):andThen(function(p2) --[[ line: 54 ]]
			-- upvalues: setPromptState (ref), promptStateModule (copy), setRobuxTransfer (ref), setIsAlreadyAccepted (ref), logCurrencyTransferCounterModule (copy), p0 (ref), currencyTransferTelemetryModule (copy), sharedFlagsModule (copy), logRobuxTransferFlowEventModule (copy), robuxTransferFlowEventNameModule (copy), handleReceiveSuccessModule (copy), handleReceiveErrorModule (copy)
			setPromptState(promptStateModule.ReceiveStarted)
			
			if p2 and p2.robuxTransfer then
				setRobuxTransfer(p2.robuxTransfer)
				setIsAlreadyAccepted(p2.isAlreadyAccepted == true)
				logCurrencyTransferCounterModule(p0, currencyTransferTelemetryModule.CurrencyTransferAcceptSucceededCounter)
				
				if sharedFlagsModule.FFlagEnableRobuxTransferFlowEventIngest then
					logRobuxTransferFlowEventModule(p0, robuxTransferFlowEventNameModule.accept_succeeded)
				end
				handleReceiveSuccessModule(p0)
				
				return
			else
				logCurrencyTransferCounterModule(p0, currencyTransferTelemetryModule.CurrencyTransferAcceptFailedCounter)
				
				if sharedFlagsModule.FFlagEnableRobuxTransferFlowEventIngest then
					logRobuxTransferFlowEventModule(p0, robuxTransferFlowEventNameModule.accept_failed)
				end
				handleReceiveErrorModule(p0, nil)
			end
		end):catch(function(p1) --[[ line: 76 ]]
			-- upvalues: logCurrencyTransferCounterModule (copy), p0 (ref), currencyTransferTelemetryModule (copy), sharedFlagsModule (copy), logRobuxTransferFlowEventModule (copy), robuxTransferFlowEventNameModule (copy), failureReasonModule (copy), handleReceiveBlockModule (copy), transferRetryOriginModule (copy), handleReceiveErrorModule (copy)
			logCurrencyTransferCounterModule(p0, currencyTransferTelemetryModule.CurrencyTransferAcceptFailedCounter)
			
			if sharedFlagsModule.FFlagEnableRobuxTransferFlowEventIngest then
				logRobuxTransferFlowEventModule(p0, robuxTransferFlowEventNameModule.accept_failed)
			end
			if typeof(p1) ~= "table" or not p1.errorMessage then
				handleReceiveErrorModule(p0, nil)
				
				return
			elseif p1.failureReason == failureReasonModule.AmpRecourseAvailable and p1.ampRecourseActions and p1.ampFeatureCheck then
				handleReceiveBlockModule(p0, p1.ampRecourseActions, p1.ampFeatureCheck, transferRetryOriginModule.AcceptTransfer)
				
				return
			end
			handleReceiveErrorModule(p0, p1)
		end)
	else
		logCurrencyTransferCounterModule(p0, currencyTransferTelemetryModule.CurrencyTransferAcceptFailedCounter)
		
		if sharedFlagsModule.FFlagEnableRobuxTransferFlowEventIngest then
			logRobuxTransferFlowEventModule(p0, robuxTransferFlowEventNameModule.accept_failed)
		end
		handleReceiveErrorModule(p0, nil)
	end
end