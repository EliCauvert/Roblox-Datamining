local CurrencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local SharedFlagsModule = require(CurrencyTransfers.Parent.SharedFlags)
local _ = require(CurrencyTransfers.Stores.createTransferStore)
local ProcessTransferRequestModule = require(CurrencyTransfers.NetworkRequests.processTransferRequest)
local PromptStateModule = require(CurrencyTransfers.Enums.PromptState)
local _ = require(CurrencyTransfers.Models.ProcessTransferModel)
local _ = require(CurrencyTransfers.Models.ErrorTransferModel)
local FailureReasonModule = require(CurrencyTransfers.Enums.FailureReason)
local HandleTransferSuccessModule = require(CurrencyTransfers.Actions.Send.handleTransferSuccess)
local HandleTransferErrorModule = require(CurrencyTransfers.Actions.Send.handleTransferError)
local HandleTransferBlockModule = require(CurrencyTransfers.Actions.Send.handleTransferBlock)
local TransferRetryOriginModule = require(CurrencyTransfers.Enums.TransferRetryOrigin)
local CurrencyTransferTelemetryModule = require(CurrencyTransfers.Events.CurrencyTransferTelemetry)
local RobuxTransferFlowEventNameModule = require(CurrencyTransfers.Enums.RobuxTransferFlowEventName)
local LogCurrencyTransferCounterModule = require(CurrencyTransfers.Utils.logCurrencyTransferCounter)
local LogRobuxTransferFlowEventModule = require(CurrencyTransfers.Utils.logRobuxTransferFlowEvent)

return function(p1, RobuxAmount) --[[ Line: 24 | Named "processTransfer" ]]
	-- upvalues: LogCurrencyTransferCounterModule (copy), CurrencyTransferTelemetryModule (copy), SharedFlagsModule (copy), LogRobuxTransferFlowEventModule (copy), RobuxTransferFlowEventNameModule (copy), HandleTransferErrorModule (copy), PromptStateModule (copy), ProcessTransferRequestModule (copy), HandleTransferSuccessModule (copy), FailureReasonModule (copy), HandleTransferBlockModule (copy), TransferRetryOriginModule (copy)
	local NetworkImpl = p1.getNetworkImpl()
	local SetPromptStateFunction: (any) -> () = p1.setPromptState
	local TransferRequestId = p1.getTransferRequestId(false)
	
	if TransferRequestId then
		SetPromptStateFunction(PromptStateModule.TransferProcessing)
		LogCurrencyTransferCounterModule(p1, CurrencyTransferTelemetryModule.CurrencyTransferProcessAttemptedCounter)
		
		if SharedFlagsModule.FFlagEnableRobuxTransferFlowEventIngest then
			LogRobuxTransferFlowEventModule(p1, RobuxTransferFlowEventNameModule.process_attempted)
		end
		return ProcessTransferRequestModule({
			transferRequestId = TransferRequestId,
			robuxAmount = RobuxAmount
		}, nil, NetworkImpl):andThen(function(Result) --[[ Line: 53 ]]
			-- upvalues: LogCurrencyTransferCounterModule (upval), p1 (copy), CurrencyTransferTelemetryModule (upval), SharedFlagsModule (upval), LogRobuxTransferFlowEventModule (upval), RobuxTransferFlowEventNameModule (upval), HandleTransferSuccessModule (upval), HandleTransferErrorModule (upval)
			if Result and Result.success then
				LogCurrencyTransferCounterModule(p1, CurrencyTransferTelemetryModule.CurrencyTransferProcessSucceededCounter)
				
				if SharedFlagsModule.FFlagEnableRobuxTransferFlowEventIngest then
					LogRobuxTransferFlowEventModule(p1, RobuxTransferFlowEventNameModule.process_succeeded)
				end
				HandleTransferSuccessModule(p1)
				
				return
			else
				LogCurrencyTransferCounterModule(p1, CurrencyTransferTelemetryModule.CurrencyTransferProcessFailedCounter)
				
				if SharedFlagsModule.FFlagEnableRobuxTransferFlowEventIngest then
					LogRobuxTransferFlowEventModule(p1, RobuxTransferFlowEventNameModule.process_failed)
				end
				HandleTransferErrorModule(p1)
			end
		end):catch(function(Err) --[[ Line: 74 ]]
			-- upvalues: LogCurrencyTransferCounterModule (upval), p1 (copy), CurrencyTransferTelemetryModule (upval), SharedFlagsModule (upval), LogRobuxTransferFlowEventModule (upval), RobuxTransferFlowEventNameModule (upval), FailureReasonModule (upval), HandleTransferBlockModule (upval), TransferRetryOriginModule (upval), HandleTransferErrorModule (upval)
			LogCurrencyTransferCounterModule(p1, CurrencyTransferTelemetryModule.CurrencyTransferProcessFailedCounter)
			
			if SharedFlagsModule.FFlagEnableRobuxTransferFlowEventIngest then
				LogRobuxTransferFlowEventModule(p1, RobuxTransferFlowEventNameModule.process_failed)
			end
			if typeof(Err) ~= "table" or not Err.errorMessage then
				HandleTransferErrorModule(p1, nil)
				
				return
			end
			if Err.failureReason == FailureReasonModule.AmpRecourseAvailable and Err.ampRecourseActions and Err.ampFeatureCheck then
				HandleTransferBlockModule(p1, Err.ampRecourseActions, Err.ampFeatureCheck, TransferRetryOriginModule.ProcessTransfer)
				
				return
			else
				HandleTransferErrorModule(p1, Err)
			end
		end)
	else
		LogCurrencyTransferCounterModule(p1, CurrencyTransferTelemetryModule.CurrencyTransferProcessFailedCounter)
		
		if SharedFlagsModule.FFlagEnableRobuxTransferFlowEventIngest then
			LogRobuxTransferFlowEventModule(p1, RobuxTransferFlowEventNameModule.process_failed)
		end
		HandleTransferErrorModule(p1)
	end
end