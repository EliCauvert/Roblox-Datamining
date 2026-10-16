local CurrencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local Parent = CurrencyTransfers.Parent
local HttpService = game:GetService("HttpService")
local ReactModule = require(Parent.React)
local SharedFlagsModule = require(Parent.SharedFlags)
local TransferRobuxAppModule = require(CurrencyTransfers.Components.TransferRobuxApp)
local CreateTransferStoreModule = require(CurrencyTransfers.Stores.createTransferStore)
local PromptStateModule = require(CurrencyTransfers.Enums.PromptState)
local TransferDirectionModule = require(CurrencyTransfers.Enums.TransferDirection)
local TransferOriginationModule = require(CurrencyTransfers.Enums.TransferOrigination)
local GetFFlagCurrencyTransferUseBackendTransferLimitsModule = require(CurrencyTransfers.Flags.GetFFlagCurrencyTransferUseBackendTransferLimits)
local HandleTransferErrorModule = require(CurrencyTransfers.Actions.Send.handleTransferError)
local HandleTransferBlockModule = require(CurrencyTransfers.Actions.Send.handleTransferBlock)
local FailureReasonModule = require(CurrencyTransfers.Enums.FailureReason)
local ErrorTransferModelModule = require(CurrencyTransfers.Models.ErrorTransferModel)
local TransferRetryOriginModule = require(CurrencyTransfers.Enums.TransferRetryOrigin)
local AmpWizardTransferConstantsModule = require(CurrencyTransfers.Constants.AmpWizardTransferConstants)
local CurrencyTransferTelemetryModule = require(CurrencyTransfers.Events.CurrencyTransferTelemetry)
local RobuxTransferFlowEventNameModule = require(CurrencyTransfers.Enums.RobuxTransferFlowEventName)
local LogCurrencyTransferCounterModule = require(CurrencyTransfers.Utils.logCurrencyTransferCounter)
local LogRobuxTransferFlowEventModule = require(CurrencyTransfers.Utils.logRobuxTransferFlowEvent)

return function(p1) --[[ Line: 80 | Named "InExperienceTransferFlow" ]]
	-- upvalues: CreateTransferStoreModule (copy), SharedFlagsModule (copy), HttpService (copy), TransferDirectionModule (copy), TransferOriginationModule (copy), LogCurrencyTransferCounterModule (copy), CurrencyTransferTelemetryModule (copy), LogRobuxTransferFlowEventModule (copy), RobuxTransferFlowEventNameModule (copy), GetFFlagCurrencyTransferUseBackendTransferLimitsModule (copy), ErrorTransferModelModule (copy), FailureReasonModule (copy), AmpWizardTransferConstantsModule (copy), HandleTransferBlockModule (copy), TransferRetryOriginModule (copy), HandleTransferErrorModule (copy), ReactModule (copy), TransferRobuxAppModule (copy), PromptStateModule (copy)
	local InitiateResponse = p1.initiateResponse
	assert(type(InitiateResponse) == "table", "[InExperienceTransferFlow] initiateResponse must be a table")
	local TransferStoreModule = CreateTransferStoreModule()
	
	if SharedFlagsModule.FFlagEnableRobuxTransferFlowEventIngest then
		TransferStoreModule.setTransferClientSessionId(HttpService:GenerateGUID(false))
	end
	TransferStoreModule.setDirection(TransferDirectionModule.Send)
	TransferStoreModule.setTransferOrigination(TransferOriginationModule.InExperience)
	LogCurrencyTransferCounterModule(TransferStoreModule, CurrencyTransferTelemetryModule.CurrencyTransferFlowOpenedCounter)
	
	if SharedFlagsModule.FFlagEnableRobuxTransferFlowEventIngest then
		LogRobuxTransferFlowEventModule(TransferStoreModule, RobuxTransferFlowEventNameModule.in_experience_flow_open)
	end
	if p1.onClose then
		TransferStoreModule.setOnClose(p1.onClose)
	end
	if GetFFlagCurrencyTransferUseBackendTransferLimitsModule() then
		if InitiateResponse.minimumTransferAmount then
			TransferStoreModule.setMinimumTransferAmount(InitiateResponse.minimumTransferAmount)
		end
		if InitiateResponse.maximumTransferAmount then
			TransferStoreModule.setMaximumTransferAmount(InitiateResponse.maximumTransferAmount)
		end
	end
	if InitiateResponse.failureReason == nil then
		assert(InitiateResponse.transferRequestId, "[InExperienceTransferFlow] Missing initiateResponse.transferRequestId")
		local TransferAmount: number = InitiateResponse.robuxTransfer.transferAmount
		assert(type(TransferAmount) == "number" and TransferAmount > 0, "[InExperienceTransferFlow] transferAmount must be a positive number")
		TransferStoreModule.setTransferRequestId(InitiateResponse.transferRequestId)
		TransferStoreModule.setRobuxBalanceAmount(InitiateResponse.senderRobuxBalance)
		TransferStoreModule.setBalanceReceivedFromApi(true)
		TransferStoreModule.setUserRelationshipDetail(InitiateResponse.userRelationshipDetail)
		TransferStoreModule.setRecipient(InitiateResponse.robuxTransfer.recipient)
		TransferStoreModule.setSender(InitiateResponse.robuxTransfer.sender)
		TransferStoreModule.setSelectedAmount(TransferAmount)
		TransferStoreModule.setPromptState(PromptStateModule.TransferConfirm)
		
		return ReactModule.createElement(TransferRobuxAppModule, { transferStore = TransferStoreModule })
	else
		local FormatResult = ErrorTransferModelModule.format(InitiateResponse)
		
		if FormatResult.failureReason == FailureReasonModule.AmpRecourseAvailable and FormatResult.ampRecourseActions and FormatResult.ampFeatureCheck then
			if not table.find(FormatResult.ampRecourseActions, AmpWizardTransferConstantsModule.RECOURSE_PLUS_SUBSCRIPTION) or FormatResult.ampFeatureCheck ~= "CanInitiateRobuxTransfer" then
				HandleTransferBlockModule(TransferStoreModule, FormatResult.ampRecourseActions, FormatResult.ampFeatureCheck, TransferRetryOriginModule.ProcessTransfer)
			end
		else
			HandleTransferErrorModule(TransferStoreModule, FormatResult)
		end
		return ReactModule.createElement(TransferRobuxAppModule, { transferStore = TransferStoreModule })
	end
end