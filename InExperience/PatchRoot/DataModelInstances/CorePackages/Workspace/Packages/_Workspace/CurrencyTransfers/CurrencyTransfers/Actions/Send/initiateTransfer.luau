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

return function(p0) --[[ line: 26 | named "initiateTransfer" ]]
	-- upvalues: promptStateModule (ref), sharedFlagsModule (ref), logRobuxTransferFlowEventModule (ref), robuxTransferFlowEventNameModule (ref), initiateTransferRequestModule (ref), setTransferPromptStateModule (ref), getFFlagCurrencyTransferUseBackendTransferLimitsModule (ref), logCurrencyTransferCounterModule (ref), currencyTransferTelemetryModule (ref), failureReasonModule (ref), handleTransferBlockModule (ref), transferRetryOriginModule (ref), handleTransferErrorModule (ref)
	local networkImpl = p0.getNetworkImpl()
	local setPromptState = p0.setPromptState
	local setTransferRequestId = p0.setTransferRequestId
	local setRobuxBalanceAmount = p0.setRobuxBalanceAmount
	local setBalanceReceivedFromApi = p0.setBalanceReceivedFromApi
	local setUserRelationshipDetail = p0.setUserRelationshipDetail
	local setRecipient = p0.setRecipient
	local setSender = p0.setSender
	local setMinimumTransferAmount = p0.setMinimumTransferAmount
	local setMaximumTransferAmount = p0.setMaximumTransferAmount
	local recipientUserId = p0.getRecipientUserId(false)
	setPromptState(promptStateModule.TransferRequested)
	
	if sharedFlagsModule.FFlagEnableRobuxTransferFlowEventIngest then
		logRobuxTransferFlowEventModule(p0, robuxTransferFlowEventNameModule.initiate_attempted)
	end
	local t = { recipientId = recipientUserId }
	local transferOrigination = p0.getTransferOrigination()
	
	if transferOrigination then
		t.transferOrigination = transferOrigination
	end
	initiateTransferRequestModule(t, nil, networkImpl):andThen(function(p2) --[[ line: 51 ]]
		-- upvalues: setTransferPromptStateModule (copy), p0 (ref), promptStateModule (copy), setTransferRequestId (ref), setRobuxBalanceAmount (ref), setBalanceReceivedFromApi (ref), setUserRelationshipDetail (ref), setRecipient (ref), setSender (ref), getFFlagCurrencyTransferUseBackendTransferLimitsModule (copy), setMinimumTransferAmount (ref), setMaximumTransferAmount (ref), logCurrencyTransferCounterModule (copy), currencyTransferTelemetryModule (copy), sharedFlagsModule (copy), logRobuxTransferFlowEventModule (copy), robuxTransferFlowEventNameModule (copy)
		setTransferPromptStateModule(p0, promptStateModule.TransferStarted)
		
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
			setTransferPromptStateModule(p0, promptStateModule.TransferInput)
			logCurrencyTransferCounterModule(p0, currencyTransferTelemetryModule.CurrencyTransferInitiateSucceededCounter)
			
			if sharedFlagsModule.FFlagEnableRobuxTransferFlowEventIngest then
				logRobuxTransferFlowEventModule(p0, robuxTransferFlowEventNameModule.initiate_succeeded)
			end
		end
	end):catch(function(p1) --[[ line: 79 ]]
		-- upvalues: logCurrencyTransferCounterModule (copy), p0 (ref), currencyTransferTelemetryModule (copy), sharedFlagsModule (copy), logRobuxTransferFlowEventModule (copy), robuxTransferFlowEventNameModule (copy), failureReasonModule (copy), handleTransferBlockModule (copy), transferRetryOriginModule (copy), handleTransferErrorModule (copy)
		logCurrencyTransferCounterModule(p0, currencyTransferTelemetryModule.CurrencyTransferInitiateFailedCounter)
		
		if sharedFlagsModule.FFlagEnableRobuxTransferFlowEventIngest then
			logRobuxTransferFlowEventModule(p0, robuxTransferFlowEventNameModule.initiate_failed)
		end
		if typeof(p1) ~= "table" or not p1.errorMessage then
			handleTransferErrorModule(p0, nil)
			
			return
		elseif p1.failureReason == failureReasonModule.AmpRecourseAvailable and p1.ampRecourseActions and p1.ampFeatureCheck then
			handleTransferBlockModule(p0, p1.ampRecourseActions, p1.ampFeatureCheck, transferRetryOriginModule.InitiateTransfer)
			
			return
		end
		handleTransferErrorModule(p0, p1)
	end)
end