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

return function(p0) --[[ line: 80 | named "InExperienceTransferFlow" ]]
	-- upvalues: createTransferStoreModule (ref), sharedFlagsModule (ref), httpService (ref), transferDirectionModule (ref), transferOriginationModule (ref), logCurrencyTransferCounterModule (ref), currencyTransferTelemetryModule (ref), logRobuxTransferFlowEventModule (ref), robuxTransferFlowEventNameModule (ref), getFFlagCurrencyTransferUseBackendTransferLimitsModule (ref), errorTransferModelModule (ref), failureReasonModule (ref), ampWizardTransferConstantsModule (ref), handleTransferBlockModule (ref), transferRetryOriginModule (ref), handleTransferErrorModule (ref), reactModule (ref), transferRobuxAppModule (ref), promptStateModule (ref)
	local initiateResponse = p0.initiateResponse
	assert(type(initiateResponse) == "table", "[InExperienceTransferFlow] initiateResponse must be a table")
	local var20 = createTransferStoreModule()
	
	if sharedFlagsModule.FFlagEnableRobuxTransferFlowEventIngest then
		var20.setTransferClientSessionId(httpService:GenerateGUID(false))
	end
	var20.setDirection(transferDirectionModule.Send)
	var20.setTransferOrigination(transferOriginationModule.InExperience)
	logCurrencyTransferCounterModule(var20, currencyTransferTelemetryModule.CurrencyTransferFlowOpenedCounter)
	
	if sharedFlagsModule.FFlagEnableRobuxTransferFlowEventIngest then
		logRobuxTransferFlowEventModule(var20, robuxTransferFlowEventNameModule.in_experience_flow_open)
	end
	if p0.onClose then
		var20.setOnClose(p0.onClose)
	end
	if getFFlagCurrencyTransferUseBackendTransferLimitsModule() then
		local var21
		if initiateResponse.minimumTransferAmount then
			var20.setMinimumTransferAmount(initiateResponse.minimumTransferAmount)
		end
		if initiateResponse.maximumTransferAmount then
			var20.setMaximumTransferAmount(initiateResponse.maximumTransferAmount)
		end
	end
	if initiateResponse.failureReason == nil then
		assert(initiateResponse.transferRequestId, "[InExperienceTransferFlow] Missing initiateResponse.transferRequestId")
		var21 = initiateResponse.robuxTransfer.transferAmount
		assert(type(var21) == "number" and var21 > 0, "[InExperienceTransferFlow] transferAmount must be a positive number")
		var20.setTransferRequestId(initiateResponse.transferRequestId)
		var20.setRobuxBalanceAmount(initiateResponse.senderRobuxBalance)
		var20.setBalanceReceivedFromApi(true)
		var20.setUserRelationshipDetail(initiateResponse.userRelationshipDetail)
		var20.setRecipient(initiateResponse.robuxTransfer.recipient)
		var20.setSender(initiateResponse.robuxTransfer.sender)
		var20.setSelectedAmount(var21)
		var20.setPromptState(promptStateModule.TransferConfirm)
		
		return reactModule.createElement(transferRobuxAppModule, { transferStore = var20 })
	end
	var21 = errorTransferModelModule.format(initiateResponse)
	
	if var21.failureReason ~= failureReasonModule.AmpRecourseAvailable or not var21.ampRecourseActions or not var21.ampFeatureCheck then
		handleTransferErrorModule(var20, var21)
	elseif not table.find(var21.ampRecourseActions, ampWizardTransferConstantsModule.RECOURSE_PLUS_SUBSCRIPTION) or var21.ampFeatureCheck ~= "CanInitiateRobuxTransfer" then
		handleTransferBlockModule(var20, var21.ampRecourseActions, var21.ampFeatureCheck, transferRetryOriginModule.ProcessTransfer)
	end
	return reactModule.createElement(transferRobuxAppModule, { transferStore = var20 })
end