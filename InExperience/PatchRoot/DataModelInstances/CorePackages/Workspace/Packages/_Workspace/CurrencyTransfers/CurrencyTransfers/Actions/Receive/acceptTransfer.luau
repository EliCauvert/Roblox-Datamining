local CurrencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local SharedFlagsModule = require(CurrencyTransfers.Parent.SharedFlags)
local _ = require(CurrencyTransfers.Stores.createTransferStore)
local AcceptTransferRequestModule = require(CurrencyTransfers.NetworkRequests.acceptTransferRequest)
local PromptStateModule = require(CurrencyTransfers.Enums.PromptState)
local _ = require(CurrencyTransfers.Models.AcceptTransferModel)
local _ = require(CurrencyTransfers.Models.ErrorTransferModel)
local FailureReasonModule = require(CurrencyTransfers.Enums.FailureReason)
local HandleReceiveSuccessModule = require(CurrencyTransfers.Actions.Receive.handleReceiveSuccess)
local HandleReceiveErrorModule = require(CurrencyTransfers.Actions.Receive.handleReceiveError)
local HandleReceiveBlockModule = require(CurrencyTransfers.Actions.Receive.handleReceiveBlock)
local TransferRetryOriginModule = require(CurrencyTransfers.Enums.TransferRetryOrigin)
local CurrencyTransferTelemetryModule = require(CurrencyTransfers.Events.CurrencyTransferTelemetry)
local RobuxTransferFlowEventNameModule = require(CurrencyTransfers.Enums.RobuxTransferFlowEventName)
local LogCurrencyTransferCounterModule = require(CurrencyTransfers.Utils.logCurrencyTransferCounter)
local LogRobuxTransferFlowEventModule = require(CurrencyTransfers.Utils.logRobuxTransferFlowEvent)

return function(p1)
	-- upvalues: LogCurrencyTransferCounterModule (copy), CurrencyTransferTelemetryModule (copy), SharedFlagsModule (copy), LogRobuxTransferFlowEventModule (copy), RobuxTransferFlowEventNameModule (copy), HandleReceiveErrorModule (copy), PromptStateModule (copy), AcceptTransferRequestModule (copy), HandleReceiveSuccessModule (copy), FailureReasonModule (copy), HandleReceiveBlockModule (copy), TransferRetryOriginModule (copy)
	local NetworkImpl = p1.getNetworkImpl()
	local SetPromptStateFunction: (any) -> () = p1.setPromptState
	local SetRobuxTransferFunction = p1.setRobuxTransfer
	local SetIsAlreadyAcceptedFunction = p1.setIsAlreadyAccepted
	local TransferRequestId = p1.getTransferRequestId(false)
	
	if TransferRequestId then
		SetPromptStateFunction(PromptStateModule.ReceiveRequested)
		local config = { transferRequestId = TransferRequestId }
		LogCurrencyTransferCounterModule(p1, CurrencyTransferTelemetryModule.CurrencyTransferAcceptAttemptedCounter)
		
		if SharedFlagsModule.FFlagEnableRobuxTransferFlowEventIngest then
			LogRobuxTransferFlowEventModule(p1, RobuxTransferFlowEventNameModule.accept_attempted)
		end
		return AcceptTransferRequestModule(config, nil, NetworkImpl):andThen(function(Result)
			-- upvalues: SetPromptStateFunction (copy), PromptStateModule (upval), SetRobuxTransferFunction (copy), SetIsAlreadyAcceptedFunction (copy), LogCurrencyTransferCounterModule (upval), p1 (copy), CurrencyTransferTelemetryModule (upval), SharedFlagsModule (upval), LogRobuxTransferFlowEventModule (upval), RobuxTransferFlowEventNameModule (upval), HandleReceiveSuccessModule (upval), HandleReceiveErrorModule (upval)
			SetPromptStateFunction(PromptStateModule.ReceiveStarted)
			
			if Result and Result.robuxTransfer then
				SetRobuxTransferFunction(Result.robuxTransfer)
				SetIsAlreadyAcceptedFunction(Result.isAlreadyAccepted == true)
				LogCurrencyTransferCounterModule(p1, CurrencyTransferTelemetryModule.CurrencyTransferAcceptSucceededCounter)
				
				if SharedFlagsModule.FFlagEnableRobuxTransferFlowEventIngest then
					LogRobuxTransferFlowEventModule(p1, RobuxTransferFlowEventNameModule.accept_succeeded)
				end
				if SharedFlagsModule.FFlagSduiOpenIncomingTransferUpsellAction then
					p1.triggerOnPromptDismissCommitted()
				end
				HandleReceiveSuccessModule(p1)
				
				return
			else
				LogCurrencyTransferCounterModule(p1, CurrencyTransferTelemetryModule.CurrencyTransferAcceptFailedCounter)
				
				if SharedFlagsModule.FFlagEnableRobuxTransferFlowEventIngest then
					LogRobuxTransferFlowEventModule(p1, RobuxTransferFlowEventNameModule.accept_failed)
				end
				HandleReceiveErrorModule(p1, nil)
			end
		end):catch(function(Err)
			-- upvalues: LogCurrencyTransferCounterModule (upval), p1 (copy), CurrencyTransferTelemetryModule (upval), SharedFlagsModule (upval), LogRobuxTransferFlowEventModule (upval), RobuxTransferFlowEventNameModule (upval), FailureReasonModule (upval), HandleReceiveBlockModule (upval), TransferRetryOriginModule (upval), HandleReceiveErrorModule (upval)
			LogCurrencyTransferCounterModule(p1, CurrencyTransferTelemetryModule.CurrencyTransferAcceptFailedCounter)
			
			if SharedFlagsModule.FFlagEnableRobuxTransferFlowEventIngest then
				LogRobuxTransferFlowEventModule(p1, RobuxTransferFlowEventNameModule.accept_failed)
			end
			if typeof(Err) ~= "table" or not Err.errorMessage then
				HandleReceiveErrorModule(p1, nil)
				
				return
			end
			if Err.failureReason == FailureReasonModule.AmpRecourseAvailable and Err.ampRecourseActions and Err.ampFeatureCheck then
				HandleReceiveBlockModule(p1, Err.ampRecourseActions, Err.ampFeatureCheck, TransferRetryOriginModule.AcceptTransfer)
				
				return
			else
				HandleReceiveErrorModule(p1, Err)
			end
		end)
	else
		LogCurrencyTransferCounterModule(p1, CurrencyTransferTelemetryModule.CurrencyTransferAcceptFailedCounter)
		
		if SharedFlagsModule.FFlagEnableRobuxTransferFlowEventIngest then
			LogRobuxTransferFlowEventModule(p1, RobuxTransferFlowEventNameModule.accept_failed)
		end
		HandleReceiveErrorModule(p1, nil)
	end
end