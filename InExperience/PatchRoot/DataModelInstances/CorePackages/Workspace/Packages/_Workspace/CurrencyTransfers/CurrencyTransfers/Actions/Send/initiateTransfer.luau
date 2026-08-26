local currencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local sharedFlagsModule = require(currencyTransfers.Parent.SharedFlags)
local getFFlagCurrencyTransferUseBackendTransferLimitsModule = require(currencyTransfers.Flags.GetFFlagCurrencyTransferUseBackendTransferLimits)
local _ = require(currencyTransfers.Stores.createTransferStore)
local initiateTransferRequestModule = require(currencyTransfers.NetworkRequests.initiateTransferRequest)
local promptStateModule = require(currencyTransfers.Enums.PromptState)
local _ = require(currencyTransfers.Models.InitiateTransferModel)
local _ = require(currencyTransfers.Models.ErrorTransferModel)
local failureReasonModule = require(currencyTransfers.Enums.FailureReason)
local handleTransferErrorModule = require(currencyTransfers.Actions.Send.handleTransferError)
local handleTransferBlockModule = require(currencyTransfers.Actions.Send.handleTransferBlock)
local setTransferPromptStateModule = require(currencyTransfers.Actions.Send.setTransferPromptState)
local transferRetryOriginModule = require(currencyTransfers.Enums.TransferRetryOrigin)
local currencyTransferTelemetryModule = require(currencyTransfers.Events.CurrencyTransferTelemetry)
local robuxTransferFlowEventNameModule = require(currencyTransfers.Enums.RobuxTransferFlowEventName)
local logCurrencyTransferCounterModule = require(currencyTransfers.Utils.logCurrencyTransferCounter)
local logRobuxTransferFlowEventModule = require(currencyTransfers.Utils.logRobuxTransferFlowEvent)

return function(p1)
	-- upvalues: promptStateModule (ref), sharedFlagsModule (ref), logRobuxTransferFlowEventModule (ref), robuxTransferFlowEventNameModule (ref), initiateTransferRequestModule (ref), setTransferPromptStateModule (ref), getFFlagCurrencyTransferUseBackendTransferLimitsModule (ref), logCurrencyTransferCounterModule (ref), currencyTransferTelemetryModule (ref), failureReasonModule (ref), handleTransferBlockModule (ref), transferRetryOriginModule (ref), handleTransferErrorModule (ref)
	local networkImpl = p1.getNetworkImpl()
	local setPromptState = p1.setPromptState
	local setTransferRequestId = p1.setTransferRequestId
	local setRobuxBalanceAmount = p1.setRobuxBalanceAmount
	local setBalanceReceivedFromApi = p1.setBalanceReceivedFromApi
	local setUserRelationshipDetail = p1.setUserRelationshipDetail
	local setRecipient = p1.setRecipient
	local setSender = p1.setSender
	local setMinimumTransferAmount = p1.setMinimumTransferAmount
	local setMaximumTransferAmount = p1.setMaximumTransferAmount
	local recipientUserId = p1.getRecipientUserId(false)
	setPromptState(promptStateModule.TransferRequested)
	
	if sharedFlagsModule.FFlagEnableRobuxTransferFlowEventIngest then
		logRobuxTransferFlowEventModule(p1, robuxTransferFlowEventNameModule.initiate_attempted)
	end
	local t = { recipientId = recipientUserId }
	local transferOrigination = p1.getTransferOrigination()
	
	if transferOrigination then
		t.transferOrigination = transferOrigination
	end
	initiateTransferRequestModule(t, nil, networkImpl):andThen(function(p2)
		-- upvalues: setTransferPromptStateModule (copy), p1 (ref), promptStateModule (copy), setTransferRequestId (ref), setRobuxBalanceAmount (ref), setBalanceReceivedFromApi (ref), setUserRelationshipDetail (ref), setRecipient (ref), setSender (ref), getFFlagCurrencyTransferUseBackendTransferLimitsModule (copy), setMinimumTransferAmount (ref), setMaximumTransferAmount (ref), logCurrencyTransferCounterModule (copy), currencyTransferTelemetryModule (copy), sharedFlagsModule (copy), logRobuxTransferFlowEventModule (copy), robuxTransferFlowEventNameModule (copy)
		setTransferPromptStateModule(p1, promptStateModule.TransferStarted)
		
		if p2 and p2.transferRequestId and p2.robuxTransfer then
			setTransferRequestId(p2.transferRequestId)
			setRobuxBalanceAmount(p2.senderRobuxBalance)
			setBalanceReceivedFromApi(true)
			setUserRelationshipDetail(p2.userRelationshipDetail)
			setRecipient(p2.robuxTransfer.recipient)
			setSender(p2.robuxTransfer.sender)
			
			if getFFlagCurrencyTransferUseBackendTransferLimitsModule() then
				if p2.minimumTransferAmount then
					setMinimumTransferAmount(p2.minimumTransferAmount)
				end
				if p2.maximumTransferAmount then
					setMaximumTransferAmount(p2.maximumTransferAmount)
				end
			end
			setTransferPromptStateModule(p1, promptStateModule.TransferInput)
			logCurrencyTransferCounterModule(p1, currencyTransferTelemetryModule.CurrencyTransferInitiateSucceededCounter)
			
			if sharedFlagsModule.FFlagEnableRobuxTransferFlowEventIngest then
				logRobuxTransferFlowEventModule(p1, robuxTransferFlowEventNameModule.initiate_succeeded)
			end
		end
	end):catch(function(p2)
		-- upvalues: logCurrencyTransferCounterModule (copy), p1 (ref), currencyTransferTelemetryModule (copy), sharedFlagsModule (copy), logRobuxTransferFlowEventModule (copy), robuxTransferFlowEventNameModule (copy), failureReasonModule (copy), handleTransferBlockModule (copy), transferRetryOriginModule (copy), handleTransferErrorModule (copy)
		logCurrencyTransferCounterModule(p1, currencyTransferTelemetryModule.CurrencyTransferInitiateFailedCounter)
		
		if sharedFlagsModule.FFlagEnableRobuxTransferFlowEventIngest then
			logRobuxTransferFlowEventModule(p1, robuxTransferFlowEventNameModule.initiate_failed)
		end
		if typeof(p2) ~= "table" or not p2.errorMessage then
			handleTransferErrorModule(p1, nil)
			
			return
		elseif p2.failureReason == failureReasonModule.AmpRecourseAvailable and p2.ampRecourseActions and p2.ampFeatureCheck then
			handleTransferBlockModule(p1, p2.ampRecourseActions, p2.ampFeatureCheck, transferRetryOriginModule.InitiateTransfer)
			
			return
		end
		handleTransferErrorModule(p1, p2)
	end)
end