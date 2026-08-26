local currencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local parent = currencyTransfers.Parent
local httpService = game:GetService("HttpService")
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local transferRobuxAppModule = require(currencyTransfers.Components.TransferRobuxApp)
local createTransferStoreModule = require(currencyTransfers.Stores.createTransferStore)
local promptStateModule = require(currencyTransfers.Enums.PromptState)
local transferDirectionModule = require(currencyTransfers.Enums.TransferDirection)
local transferOriginationModule = require(currencyTransfers.Enums.TransferOrigination)
local getFFlagCurrencyTransferUseBackendTransferLimitsModule = require(currencyTransfers.Flags.GetFFlagCurrencyTransferUseBackendTransferLimits)
local handleTransferErrorModule = require(currencyTransfers.Actions.Send.handleTransferError)
local handleTransferBlockModule = require(currencyTransfers.Actions.Send.handleTransferBlock)
local failureReasonModule = require(currencyTransfers.Enums.FailureReason)
local errorTransferModelModule = require(currencyTransfers.Models.ErrorTransferModel)
local transferRetryOriginModule = require(currencyTransfers.Enums.TransferRetryOrigin)
local ampWizardTransferConstantsModule = require(currencyTransfers.Constants.AmpWizardTransferConstants)
local currencyTransferTelemetryModule = require(currencyTransfers.Events.CurrencyTransferTelemetry)
local robuxTransferFlowEventNameModule = require(currencyTransfers.Enums.RobuxTransferFlowEventName)
local logCurrencyTransferCounterModule = require(currencyTransfers.Utils.logCurrencyTransferCounter)
local logRobuxTransferFlowEventModule = require(currencyTransfers.Utils.logRobuxTransferFlowEvent)

return function(p1)
	-- upvalues: createTransferStoreModule (ref), sharedFlagsModule (ref), httpService (ref), transferDirectionModule (ref), transferOriginationModule (ref), logCurrencyTransferCounterModule (ref), currencyTransferTelemetryModule (ref), logRobuxTransferFlowEventModule (ref), robuxTransferFlowEventNameModule (ref), getFFlagCurrencyTransferUseBackendTransferLimitsModule (ref), errorTransferModelModule (ref), failureReasonModule (ref), ampWizardTransferConstantsModule (ref), handleTransferBlockModule (ref), transferRetryOriginModule (ref), handleTransferErrorModule (ref), reactModule (ref), transferRobuxAppModule (ref), promptStateModule (ref)
	local initiateResponse = p1.initiateResponse
	assert(type(initiateResponse) == "table", "[InExperienceTransferFlow] initiateResponse must be a table")
	local var1 = createTransferStoreModule()
	
	if sharedFlagsModule.FFlagEnableRobuxTransferFlowEventIngest then
		var1.setTransferClientSessionId(httpService:GenerateGUID(false))
	end
	var1.setDirection(transferDirectionModule.Send)
	var1.setTransferOrigination(transferOriginationModule.InExperience)
	logCurrencyTransferCounterModule(var1, currencyTransferTelemetryModule.CurrencyTransferFlowOpenedCounter)
	
	if sharedFlagsModule.FFlagEnableRobuxTransferFlowEventIngest then
		logRobuxTransferFlowEventModule(var1, robuxTransferFlowEventNameModule.in_experience_flow_open)
	end
	if p1.onClose then
		var1.setOnClose(p1.onClose)
	end
	if getFFlagCurrencyTransferUseBackendTransferLimitsModule() then
		local var2
		if initiateResponse.minimumTransferAmount then
			var1.setMinimumTransferAmount(initiateResponse.minimumTransferAmount)
		end
		if initiateResponse.maximumTransferAmount then
			var1.setMaximumTransferAmount(initiateResponse.maximumTransferAmount)
		end
	end
	if initiateResponse.failureReason == nil then
		assert(initiateResponse.transferRequestId, "[InExperienceTransferFlow] Missing initiateResponse.transferRequestId")
		var2 = initiateResponse.robuxTransfer.transferAmount
		assert(type(var2) == "number" and var2 > 0, "[InExperienceTransferFlow] transferAmount must be a positive number")
		var1.setTransferRequestId(initiateResponse.transferRequestId)
		var1.setRobuxBalanceAmount(initiateResponse.senderRobuxBalance)
		var1.setBalanceReceivedFromApi(true)
		var1.setUserRelationshipDetail(initiateResponse.userRelationshipDetail)
		var1.setRecipient(initiateResponse.robuxTransfer.recipient)
		var1.setSender(initiateResponse.robuxTransfer.sender)
		var1.setSelectedAmount(var2)
		var1.setPromptState(promptStateModule.TransferConfirm)
		
		return reactModule.createElement(transferRobuxAppModule, { transferStore = var1 })
	end
	var2 = errorTransferModelModule.format(initiateResponse)
	
	if var2.failureReason ~= failureReasonModule.AmpRecourseAvailable or not var2.ampRecourseActions or not var2.ampFeatureCheck then
		handleTransferErrorModule(var1, var2)
	elseif not table.find(var2.ampRecourseActions, ampWizardTransferConstantsModule.RECOURSE_PLUS_SUBSCRIPTION) or var2.ampFeatureCheck ~= "CanInitiateRobuxTransfer" then
		handleTransferBlockModule(var1, var2.ampRecourseActions, var2.ampFeatureCheck, transferRetryOriginModule.ProcessTransfer)
	end
	return reactModule.createElement(transferRobuxAppModule, { transferStore = var1 })
end