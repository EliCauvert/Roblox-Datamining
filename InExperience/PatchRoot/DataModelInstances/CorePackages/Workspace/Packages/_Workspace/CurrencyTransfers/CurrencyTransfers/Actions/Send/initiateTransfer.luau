local CurrencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local SharedFlagsModule = require(CurrencyTransfers.Parent.SharedFlags)
local GetFFlagCurrencyTransferUseBackendTransferLimitsModule = require(CurrencyTransfers.Flags.GetFFlagCurrencyTransferUseBackendTransferLimits)
local _ = require(CurrencyTransfers.Stores.createTransferStore)
local InitiateTransferRequestModule = require(CurrencyTransfers.NetworkRequests.initiateTransferRequest)
local PromptStateModule = require(CurrencyTransfers.Enums.PromptState)
local _ = require(CurrencyTransfers.Models.InitiateTransferModel)
local _ = require(CurrencyTransfers.Models.ErrorTransferModel)
local FailureReasonModule = require(CurrencyTransfers.Enums.FailureReason)
local HandleTransferErrorModule = require(CurrencyTransfers.Actions.Send.handleTransferError)
local HandleTransferBlockModule = require(CurrencyTransfers.Actions.Send.handleTransferBlock)
local SetTransferPromptStateModule = require(CurrencyTransfers.Actions.Send.setTransferPromptState)
local TransferRetryOriginModule = require(CurrencyTransfers.Enums.TransferRetryOrigin)
local CurrencyTransferTelemetryModule = require(CurrencyTransfers.Events.CurrencyTransferTelemetry)
local RobuxTransferFlowEventNameModule = require(CurrencyTransfers.Enums.RobuxTransferFlowEventName)
local LogCurrencyTransferCounterModule = require(CurrencyTransfers.Utils.logCurrencyTransferCounter)
local LogRobuxTransferFlowEventModule = require(CurrencyTransfers.Utils.logRobuxTransferFlowEvent)

return function(p1)
	-- upvalues: PromptStateModule (copy), SharedFlagsModule (copy), LogRobuxTransferFlowEventModule (copy), RobuxTransferFlowEventNameModule (copy), InitiateTransferRequestModule (copy), SetTransferPromptStateModule (copy), GetFFlagCurrencyTransferUseBackendTransferLimitsModule (copy), LogCurrencyTransferCounterModule (copy), CurrencyTransferTelemetryModule (copy), FailureReasonModule (copy), HandleTransferBlockModule (copy), TransferRetryOriginModule (copy), HandleTransferErrorModule (copy)
	local NetworkImpl = p1.getNetworkImpl()
	local SetTransferRequestIdFunction = p1.setTransferRequestId
	local SetRobuxBalanceAmountFunction = p1.setRobuxBalanceAmount
	local SetBalanceReceivedFromApiFunction = p1.setBalanceReceivedFromApi
	local SetUserRelationshipDetailFunction = p1.setUserRelationshipDetail
	local SetRecipientFunction = p1.setRecipient
	local SetSenderFunction = p1.setSender
	local SetMinimumTransferAmountFunction = p1.setMinimumTransferAmount
	local SetMaximumTransferAmountFunction = p1.setMaximumTransferAmount
	local RecipientUserId = p1.getRecipientUserId(false)
	p1.setPromptState(PromptStateModule.TransferRequested)
	
	if SharedFlagsModule.FFlagEnableRobuxTransferFlowEventIngest then
		LogRobuxTransferFlowEventModule(p1, RobuxTransferFlowEventNameModule.initiate_attempted)
	end
	local config = { recipientId = RecipientUserId }
	local TransferOrigination = p1.getTransferOrigination()
	
	if TransferOrigination then
		config.transferOrigination = TransferOrigination
	end
	InitiateTransferRequestModule(config, nil, NetworkImpl):andThen(function(Result)
		-- upvalues: SetTransferPromptStateModule (upval), p1 (copy), PromptStateModule (upval), SetTransferRequestIdFunction (copy), SetRobuxBalanceAmountFunction (copy), SetBalanceReceivedFromApiFunction (copy), SetUserRelationshipDetailFunction (copy), SetRecipientFunction (copy), SetSenderFunction (copy), GetFFlagCurrencyTransferUseBackendTransferLimitsModule (upval), SetMinimumTransferAmountFunction (copy), SetMaximumTransferAmountFunction (copy), LogCurrencyTransferCounterModule (upval), CurrencyTransferTelemetryModule (upval), SharedFlagsModule (upval), LogRobuxTransferFlowEventModule (upval), RobuxTransferFlowEventNameModule (upval)
		SetTransferPromptStateModule(p1, PromptStateModule.TransferStarted)
		
		if Result and Result.transferRequestId and Result.robuxTransfer then
			SetTransferRequestIdFunction(Result.transferRequestId)
			SetRobuxBalanceAmountFunction(Result.senderRobuxBalance)
			SetBalanceReceivedFromApiFunction(true)
			SetUserRelationshipDetailFunction(Result.userRelationshipDetail)
			SetRecipientFunction(Result.robuxTransfer.recipient)
			SetSenderFunction(Result.robuxTransfer.sender)
			
			if GetFFlagCurrencyTransferUseBackendTransferLimitsModule() then
				if Result.minimumTransferAmount then
					SetMinimumTransferAmountFunction(Result.minimumTransferAmount)
				end
				if Result.maximumTransferAmount then
					SetMaximumTransferAmountFunction(Result.maximumTransferAmount)
				end
			end
			SetTransferPromptStateModule(p1, PromptStateModule.TransferInput)
			LogCurrencyTransferCounterModule(p1, CurrencyTransferTelemetryModule.CurrencyTransferInitiateSucceededCounter)
			
			if SharedFlagsModule.FFlagEnableRobuxTransferFlowEventIngest then
				LogRobuxTransferFlowEventModule(p1, RobuxTransferFlowEventNameModule.initiate_succeeded)
			end
		end
	end):catch(function(Err)
		-- upvalues: LogCurrencyTransferCounterModule (upval), p1 (copy), CurrencyTransferTelemetryModule (upval), SharedFlagsModule (upval), LogRobuxTransferFlowEventModule (upval), RobuxTransferFlowEventNameModule (upval), FailureReasonModule (upval), HandleTransferBlockModule (upval), TransferRetryOriginModule (upval), HandleTransferErrorModule (upval)
		LogCurrencyTransferCounterModule(p1, CurrencyTransferTelemetryModule.CurrencyTransferInitiateFailedCounter)
		
		if SharedFlagsModule.FFlagEnableRobuxTransferFlowEventIngest then
			LogRobuxTransferFlowEventModule(p1, RobuxTransferFlowEventNameModule.initiate_failed)
		end
		if typeof(Err) ~= "table" or not Err.errorMessage then
			HandleTransferErrorModule(p1, nil)
			
			return
		end
		if Err.failureReason == FailureReasonModule.AmpRecourseAvailable and Err.ampRecourseActions and Err.ampFeatureCheck then
			HandleTransferBlockModule(p1, Err.ampRecourseActions, Err.ampFeatureCheck, TransferRetryOriginModule.InitiateTransfer)
			
			return
		else
			HandleTransferErrorModule(p1, Err)
		end
	end)
end