local CurrencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local Parent = CurrencyTransfers.Parent
local ReactModule = require(Parent.React)
local SharedFlagsModule = require(Parent.SharedFlags)
local TransferLocalizationKeysModule = require(CurrencyTransfers.Localization.TransferLocalizationKeys)
local FoundationModule = require(Parent.Foundation)
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local Dialog = FoundationModule.Dialog
local DialogSize = FoundationModule.Enums.DialogSize
local Orientation = FoundationModule.Enums.Orientation
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseTransferStoreModule = require(CurrencyTransfers.Hooks.useTransferStore)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local ProcessTransferModule = require(CurrencyTransfers.Actions.Send.processTransfer)
local AcceptTransferModule = require(CurrencyTransfers.Actions.Receive.acceptTransfer)
local InitiateTransferModule = require(CurrencyTransfers.Actions.Send.initiateTransfer)
local PromptStateModule = require(CurrencyTransfers.Enums.PromptState)
local TransferDirectionModule = require(CurrencyTransfers.Enums.TransferDirection)
local TransferOriginationModule = require(CurrencyTransfers.Enums.TransferOrigination)
local TransferRetryOriginModule = require(CurrencyTransfers.Enums.TransferRetryOrigin)
local AmpUpsellModule = require(Parent.AmpUpsell)
local AccessResponseEnum = AmpUpsellModule.AmpEnums.AccessResponseEnum
local ActionTypeEnum = AmpUpsellModule.AmpEnums.ActionTypeEnum
local ActionStatusEnum = AmpUpsellModule.AmpEnums.ActionStatusEnum
local InExpAmpWizardController = AmpUpsellModule.InExpAmpWizardController
local OpenAmpWizardContainerFunction = AmpUpsellModule.OpenAmpWizardContainer
local FFlagEnableCurrencyTransferWizardVPCPrologueModule = require(CurrencyTransfers.Flags.FFlagEnableCurrencyTransferWizardVPCPrologue)
local FFlagCurrencyTransferVPCUseAmpWizardContainerForInAppModule = require(CurrencyTransfers.Flags.FFlagCurrencyTransferVPCUseAmpWizardContainerForInApp)
local FFlagCurrencyTransferVpcUfoDirectModule = require(CurrencyTransfers.Flags.FFlagCurrencyTransferVpcUfoDirect)
local AmpWizardTransferConstantsModule = require(CurrencyTransfers.Constants.AmpWizardTransferConstants)
local GetCounterUserIdModule = require(CurrencyTransfers.Utils.getCounterUserId)
local CurrencyTransferTelemetryModule = require(CurrencyTransfers.Events.CurrencyTransferTelemetry)
local RobuxTransferFlowEventNameModule = require(CurrencyTransfers.Enums.RobuxTransferFlowEventName)
local LogCurrencyTransferCounterModule = require(CurrencyTransfers.Utils.logCurrencyTransferCounter)
local LogRobuxTransferFlowEventModule = require(CurrencyTransfers.Utils.logRobuxTransferFlowEvent)
local GetTransferRequestInternalIdModule = require(CurrencyTransfers.Utils.getTransferRequestInternalId)

local function _(p1): boolean
	-- upvalues: ActionTypeEnum (copy), ActionStatusEnum (copy)
	return type(p1) == "table" and (p1[ActionTypeEnum.ParentConsent] == ActionStatusEnum.Success or p1[ActionTypeEnum.ParentLink] == ActionStatusEnum.Success)
end

local function WizardPrologueOpener(p1)
	-- upvalues: ReactModule (copy)
	local OpenAmpWizardFunction = p1.openAmpWizard
	local UseRefResult = ReactModule.useRef(false)
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy), OpenAmpWizardFunction (copy)
		if not UseRefResult.current then
			UseRefResult.current = true
			OpenAmpWizardFunction()
		end
		return nil
	end, { OpenAmpWizardFunction })
	
	return nil
end

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), TransferLocalizationKeysModule (copy), UseTransferStoreModule (copy), FFlagCurrencyTransferVPCUseAmpWizardContainerForInAppModule (copy), UseDispatchFunction (copy), TransferOriginationModule (copy), FFlagCurrencyTransferVpcUfoDirectModule (copy), TransferDirectionModule (copy), FFlagEnableCurrencyTransferWizardVPCPrologueModule (copy), AmpUpsellModule (copy), ReactModule (copy), LogCurrencyTransferCounterModule (copy), CurrencyTransferTelemetryModule (copy), SharedFlagsModule (copy), LogRobuxTransferFlowEventModule (copy), RobuxTransferFlowEventNameModule (copy), Parent (copy), AmpWizardTransferConstantsModule (copy), PromptStateModule (copy), GetTransferRequestInternalIdModule (copy), GetCounterUserIdModule (copy), OpenAmpWizardContainerFunction (copy), ActionTypeEnum (copy), ActionStatusEnum (copy), AccessResponseEnum (copy), TransferRetryOriginModule (copy), AcceptTransferModule (copy), InitiateTransferModule (copy), ProcessTransferModule (copy), InExpAmpWizardController (copy), WizardPrologueOpener (copy), Dialog (copy), DialogSize (copy), Orientation (copy), ButtonVariant (copy)
	local UseLocalizationResult = UseLocalizationFunction(TransferLocalizationKeysModule.Presets.VPCBlockContainer)
	local UseTransferStoreModuleResult = UseTransferStoreModule()
	local UseDispatchResult = if FFlagCurrencyTransferVPCUseAmpWizardContainerForInAppModule then UseDispatchFunction() else nil
	local Direction = p1.direction
	local TriggerOnCloseFunction = UseTransferStoreModuleResult.triggerOnClose
	local SelectedAmount = UseTransferStoreModuleResult.getSelectedAmount(false)
	local TransferRetryOrigin = UseTransferStoreModuleResult.getTransferRetryOrigin(false)
	local TransferRequestId = UseTransferStoreModuleResult.getTransferRequestId(false)
	local IsTransferOriginationMatch = if FFlagCurrencyTransferVPCUseAmpWizardContainerForInAppModule then if FFlagCurrencyTransferVpcUfoDirectModule and not FFlagCurrencyTransferVPCUseAmpWizardContainerForInAppModule then UseTransferStoreModuleResult.getTransferOrigination(false) == TransferOriginationModule.InExperience else UseTransferStoreModuleResult.getTransferOrigination(false) == TransferOriginationModule.InExperience elseif FFlagCurrencyTransferVpcUfoDirectModule and not FFlagCurrencyTransferVPCUseAmpWizardContainerForInAppModule then UseTransferStoreModuleResult.getTransferOrigination(false) == TransferOriginationModule.InExperience else FFlagCurrencyTransferVPCUseAmpWizardContainerForInAppModule
	local AskParentBodySend = if Direction == TransferDirectionModule.Send then UseLocalizationResult.AskParentBodySend else UseLocalizationResult.AskParentBodyReceive
	local FFlagEnableReusableVPCPrologue = FFlagEnableCurrencyTransferWizardVPCPrologueModule and (AmpUpsellModule.GetFFlagEnableAmpVPCPrologue() and AmpUpsellModule.GetFFlagEnableReusableVPCPrologue())
	ReactModule.useEffect(function()
		-- upvalues: LogCurrencyTransferCounterModule (upval), UseTransferStoreModuleResult (copy), CurrencyTransferTelemetryModule (upval), SharedFlagsModule (upval), LogRobuxTransferFlowEventModule (upval), RobuxTransferFlowEventNameModule (upval)
		LogCurrencyTransferCounterModule(UseTransferStoreModuleResult, CurrencyTransferTelemetryModule.CurrencyTransferVPCBlockDialogShownCounter, { recourseSurface = "vpc" })
		
		if SharedFlagsModule.FFlagEnableRobuxTransferFlowEventIngest then
			LogRobuxTransferFlowEventModule(UseTransferStoreModuleResult, RobuxTransferFlowEventNameModule.vpc_block_shown)
		end
		return nil
	end, { UseTransferStoreModuleResult })
	
	local function logAskClicked()
		-- upvalues: LogCurrencyTransferCounterModule (upval), UseTransferStoreModuleResult (copy), CurrencyTransferTelemetryModule (upval), SharedFlagsModule (upval), LogRobuxTransferFlowEventModule (upval), RobuxTransferFlowEventNameModule (upval)
		LogCurrencyTransferCounterModule(UseTransferStoreModuleResult, CurrencyTransferTelemetryModule.CurrencyTransferVPCBlockAskClickedCounter, { recourseSurface = "vpc" })
		
		if SharedFlagsModule.FFlagEnableRobuxTransferFlowEventIngest then
			LogRobuxTransferFlowEventModule(UseTransferStoreModuleResult, RobuxTransferFlowEventNameModule.vpc_ask_clicked)
		end
	end
	
	local function logCancelClicked()
		-- upvalues: LogCurrencyTransferCounterModule (upval), UseTransferStoreModuleResult (copy), CurrencyTransferTelemetryModule (upval), SharedFlagsModule (upval), LogRobuxTransferFlowEventModule (upval), RobuxTransferFlowEventNameModule (upval)
		LogCurrencyTransferCounterModule(UseTransferStoreModuleResult, CurrencyTransferTelemetryModule.CurrencyTransferVPCBlockCancelClickedCounter, { recourseSurface = "vpc" })
		
		if SharedFlagsModule.FFlagEnableRobuxTransferFlowEventIngest then
			LogRobuxTransferFlowEventModule(UseTransferStoreModuleResult, RobuxTransferFlowEventNameModule.vpc_cancel_clicked)
		end
	end
	
	local function onCancelClicked()
		-- upvalues: LogCurrencyTransferCounterModule (upval), UseTransferStoreModuleResult (copy), CurrencyTransferTelemetryModule (upval), SharedFlagsModule (upval), LogRobuxTransferFlowEventModule (upval), RobuxTransferFlowEventNameModule (upval), TriggerOnCloseFunction (copy)
		LogCurrencyTransferCounterModule(UseTransferStoreModuleResult, CurrencyTransferTelemetryModule.CurrencyTransferVPCBlockCancelClickedCounter, { recourseSurface = "vpc" })
		
		if SharedFlagsModule.FFlagEnableRobuxTransferFlowEventIngest then
			LogRobuxTransferFlowEventModule(UseTransferStoreModuleResult, RobuxTransferFlowEventNameModule.vpc_cancel_clicked)
		end
		TriggerOnCloseFunction()
	end
	
	local UseAmpUpsellLauncherResult = if FFlagCurrencyTransferVpcUfoDirectModule then require(Parent.AmpV2Wizard).useAmpUpsellLauncher({
		surface = AmpWizardTransferConstantsModule.ENTRY_POINT_EVENT_CTX,
		odpEventContext = AmpWizardTransferConstantsModule.ENTRY_POINT_EVENT_CTX,
		onEvent = ReactModule.useCallback(function(p2)
			-- upvalues: FFlagEnableReusableVPCPrologue (copy), LogCurrencyTransferCounterModule (upval), UseTransferStoreModuleResult (copy), CurrencyTransferTelemetryModule (upval), SharedFlagsModule (upval), LogRobuxTransferFlowEventModule (upval), RobuxTransferFlowEventNameModule (upval)
			if not FFlagEnableReusableVPCPrologue or p2.node ~= "Prologue" then return end
			if p2.outcome == "ODP" or p2.outcome == "Remote" then
				LogCurrencyTransferCounterModule(UseTransferStoreModuleResult, CurrencyTransferTelemetryModule.CurrencyTransferVPCBlockAskClickedCounter, { recourseSurface = "vpc" })
				
				if SharedFlagsModule.FFlagEnableRobuxTransferFlowEventIngest then
					LogRobuxTransferFlowEventModule(UseTransferStoreModuleResult, RobuxTransferFlowEventNameModule.vpc_ask_clicked)
					
					return
				end
			elseif p2.outcome == "Cancel" then
				LogCurrencyTransferCounterModule(UseTransferStoreModuleResult, CurrencyTransferTelemetryModule.CurrencyTransferVPCBlockCancelClickedCounter, { recourseSurface = "vpc" })
				
				if SharedFlagsModule.FFlagEnableRobuxTransferFlowEventIngest then
					LogRobuxTransferFlowEventModule(UseTransferStoreModuleResult, RobuxTransferFlowEventNameModule.vpc_cancel_clicked)
				end
			end
		end, {
			UseTransferStoreModuleResult,
			FFlagEnableReusableVPCPrologue
		})
	}) else nil
	
	local function openAmpWizard()
		-- upvalues: FFlagEnableReusableVPCPrologue (copy), LogCurrencyTransferCounterModule (upval), UseTransferStoreModuleResult (copy), CurrencyTransferTelemetryModule (upval), SharedFlagsModule (upval), LogRobuxTransferFlowEventModule (upval), RobuxTransferFlowEventNameModule (upval), p1 (copy), TriggerOnCloseFunction (copy), PromptStateModule (upval), GetTransferRequestInternalIdModule (upval), TransferRequestId (copy), SelectedAmount (copy), GetCounterUserIdModule (upval), Direction (copy), FFlagCurrencyTransferVpcUfoDirectModule (upval), IsTransferOriginationMatch (ref), UseAmpUpsellLauncherResult (ref), Parent (upval), AmpUpsellModule (upval), TransferDirectionModule (upval), UseLocalizationResult (copy), AskParentBodySend (copy), FFlagCurrencyTransferVPCUseAmpWizardContainerForInAppModule (upval), UseDispatchResult (copy), OpenAmpWizardContainerFunction (upval), ActionTypeEnum (upval), ActionStatusEnum (upval), AccessResponseEnum (upval), TransferRetryOrigin (copy), TransferRetryOriginModule (upval), AcceptTransferModule (upval), InitiateTransferModule (upval), ProcessTransferModule (upval), AmpWizardTransferConstantsModule (upval), logAskClicked (copy), logCancelClicked (copy), InExpAmpWizardController (upval)
		if not FFlagEnableReusableVPCPrologue then
			LogCurrencyTransferCounterModule(UseTransferStoreModuleResult, CurrencyTransferTelemetryModule.CurrencyTransferVPCBlockAskClickedCounter, { recourseSurface = "vpc" })
			
			if SharedFlagsModule.FFlagEnableRobuxTransferFlowEventIngest then
				LogRobuxTransferFlowEventModule(UseTransferStoreModuleResult, RobuxTransferFlowEventNameModule.vpc_ask_clicked)
			end
		end
		if not p1.ampFeatureCheck then
			TriggerOnCloseFunction()
			
			return
		end
		UseTransferStoreModuleResult.setPreviousPromptState((UseTransferStoreModuleResult.getPromptState(false)))
		UseTransferStoreModuleResult.setPromptState(PromptStateModule.Hidden)
		local RequestDetails = {
			transferType = "Robux",
			transferId = GetTransferRequestInternalIdModule(TransferRequestId),
			robuxTransferAmount = tostring(SelectedAmount or 0)
		}
		local CounterUserIdModule = GetCounterUserIdModule(UseTransferStoreModuleResult, Direction)
		local List = if CounterUserIdModule then {
			{
				name = "targetUser",
				type = "UserId",
				value = tostring(CounterUserIdModule)
			}
		} else nil
		
		if FFlagCurrencyTransferVpcUfoDirectModule and SharedFlagsModule.FFlagEnableAmpV2Wizard and not IsTransferOriginationMatch and UseAmpUpsellLauncherResult and require(Parent.AmpV2Wizard).FFlagAmpV2WizardTerminalOutcome then
			local AppFeaturePolicies = require(Parent.UniversalAppPolicy).getAppFeaturePolicies()
			local VPCRequestTypeEnum = AmpUpsellModule.AmpEnums.VPCRequestTypeEnum
			local ReceiveTransfer = if Direction == TransferDirectionModule.Receive then VPCRequestTypeEnum.ReceiveTransfer else VPCRequestTypeEnum.SendTransfer
			
			if AppFeaturePolicies.getUseAmpV2WizardForVpc() and table.find(AppFeaturePolicies.getAmpV2VpcExcludedRequestTypes(), ReceiveTransfer) == nil then
				local function _()
					-- upvalues: SharedFlagsModule (upval), LogRobuxTransferFlowEventModule (upval), UseTransferStoreModuleResult (upval), RobuxTransferFlowEventNameModule (upval), Direction (upval), TransferDirectionModule (upval)
					if SharedFlagsModule.FFlagEnableRobuxTransferFlowEventIngest then
						LogRobuxTransferFlowEventModule(UseTransferStoreModuleResult, RobuxTransferFlowEventNameModule.vpc_submitted)
					end
					if SharedFlagsModule.FFlagSduiOpenIncomingTransferUpsellAction and Direction == TransferDirectionModule.Receive then
						UseTransferStoreModuleResult.triggerOnPromptOptimisticHide()
					end
				end
				
				local ExtraProps = { usePrologue = FFlagEnableReusableVPCPrologue == true }
				
				if FFlagEnableReusableVPCPrologue then
					ExtraProps.prologueCopy = {
						title = UseLocalizationResult.AskParentTitle,
						description = AskParentBodySend,
						confirmLabel = UseLocalizationResult.Ask
					}
				end
				UseAmpUpsellLauncherResult({
					flow = {
						name = "VPC",
						props = {
							requestType = ReceiveTransfer,
							requestDetails = RequestDetails
						}
					},
					extraProps = ExtraProps
				}):andThen(function(Result)
					-- upvalues: SharedFlagsModule (upval), LogRobuxTransferFlowEventModule (upval), UseTransferStoreModuleResult (upval), RobuxTransferFlowEventNameModule (upval), Direction (upval), TransferDirectionModule (upval), TriggerOnCloseFunction (upval)
					if Result.reason == "Completed" and (Result.outcome == "Done" or Result.outcome == "Success") then
						if SharedFlagsModule.FFlagEnableRobuxTransferFlowEventIngest then
							LogRobuxTransferFlowEventModule(UseTransferStoreModuleResult, RobuxTransferFlowEventNameModule.vpc_submitted)
						end
						if SharedFlagsModule.FFlagSduiOpenIncomingTransferUpsellAction and Direction == TransferDirectionModule.Receive then
							UseTransferStoreModuleResult.triggerOnPromptOptimisticHide()
						end
					end
					TriggerOnCloseFunction()
				end)
				
				return
			end
		end
		if FFlagCurrencyTransferVPCUseAmpWizardContainerForInAppModule and not IsTransferOriginationMatch then
			UseDispatchResult(OpenAmpWizardContainerFunction(p1.ampFeatureCheck, function(Granted, p2)
				-- upvalues: ActionTypeEnum (upval), ActionStatusEnum (upval), SharedFlagsModule (upval), LogRobuxTransferFlowEventModule (upval), UseTransferStoreModuleResult (upval), RobuxTransferFlowEventNameModule (upval), Direction (upval), TransferDirectionModule (upval), AccessResponseEnum (upval), TransferRetryOrigin (upval), TransferRetryOriginModule (upval), AcceptTransferModule (upval), InitiateTransferModule (upval), ProcessTransferModule (upval), SelectedAmount (upval), TriggerOnCloseFunction (upval)
				local IsSuccessMatch: boolean = type(p2) == "table" and (p2[ActionTypeEnum.ParentConsent] == ActionStatusEnum.Success or p2[ActionTypeEnum.ParentLink] == ActionStatusEnum.Success)
				
				if SharedFlagsModule.FFlagEnableRobuxTransferFlowEventIngest and IsSuccessMatch then
					LogRobuxTransferFlowEventModule(UseTransferStoreModuleResult, RobuxTransferFlowEventNameModule.vpc_submitted)
				end
				if SharedFlagsModule.FFlagSduiOpenIncomingTransferUpsellAction and IsSuccessMatch and Direction == TransferDirectionModule.Receive then
					UseTransferStoreModuleResult.triggerOnPromptOptimisticHide()
				end
				if Granted ~= AccessResponseEnum.Granted then
					TriggerOnCloseFunction()
					
					return
				end
				local PreviousPromptState = UseTransferStoreModuleResult.getPreviousPromptState(false)
				
				if PreviousPromptState then
					UseTransferStoreModuleResult.setPromptState(PreviousPromptState)
				end
				if TransferRetryOrigin == TransferRetryOriginModule.AcceptTransfer then
					AcceptTransferModule(UseTransferStoreModuleResult)
					
					return
				end
				if TransferRetryOrigin == TransferRetryOriginModule.InitiateTransfer then
					InitiateTransferModule(UseTransferStoreModuleResult)
					
					return
				end
				if TransferRetryOrigin == TransferRetryOriginModule.ProcessTransfer then
					ProcessTransferModule(UseTransferStoreModuleResult, SelectedAmount or 0)
					
					return
				end
				if Direction == TransferDirectionModule.Receive then
					AcceptTransferModule(UseTransferStoreModuleResult)
					
					return
				else
					ProcessTransferModule(UseTransferStoreModuleResult, SelectedAmount or 0)
				end
			end, RequestDetails, AmpWizardTransferConstantsModule.ENTRY_POINT_EVENT_CTX, List, AmpWizardTransferConstantsModule.NAMESPACE_NAME, nil, nil, nil, if FFlagEnableReusableVPCPrologue then true else nil, if FFlagEnableReusableVPCPrologue then {
				config = {
					hideCancel = true,
					actionOrientation = "Vertical",
					hasBackdrop = true,
					closeOnClickOutside = true,
					onCloseCancels = true,
					titleText = UseLocalizationResult.AskParentTitle,
					bodyText = AskParentBodySend,
					confirmText = UseLocalizationResult.Ask
				},
				onConfirm = logAskClicked,
				onCancel = logCancelClicked
			} else nil))
			
			return
		else
			InExpAmpWizardController.OpenAmpWizardContainerInExp(p1.ampFeatureCheck, function(Granted, p2)
				-- upvalues: ActionTypeEnum (upval), ActionStatusEnum (upval), SharedFlagsModule (upval), LogRobuxTransferFlowEventModule (upval), UseTransferStoreModuleResult (upval), RobuxTransferFlowEventNameModule (upval), Direction (upval), TransferDirectionModule (upval), AccessResponseEnum (upval), TransferRetryOrigin (upval), TransferRetryOriginModule (upval), AcceptTransferModule (upval), InitiateTransferModule (upval), ProcessTransferModule (upval), SelectedAmount (upval), TriggerOnCloseFunction (upval)
				local IsSuccessMatch: boolean = type(p2) == "table" and (p2[ActionTypeEnum.ParentConsent] == ActionStatusEnum.Success or p2[ActionTypeEnum.ParentLink] == ActionStatusEnum.Success)
				
				if SharedFlagsModule.FFlagEnableRobuxTransferFlowEventIngest and IsSuccessMatch then
					LogRobuxTransferFlowEventModule(UseTransferStoreModuleResult, RobuxTransferFlowEventNameModule.vpc_submitted)
				end
				if SharedFlagsModule.FFlagSduiOpenIncomingTransferUpsellAction and IsSuccessMatch and Direction == TransferDirectionModule.Receive then
					UseTransferStoreModuleResult.triggerOnPromptOptimisticHide()
				end
				if Granted ~= AccessResponseEnum.Granted then
					TriggerOnCloseFunction()
					
					return
				end
				local PreviousPromptState = UseTransferStoreModuleResult.getPreviousPromptState(false)
				
				if PreviousPromptState then
					UseTransferStoreModuleResult.setPromptState(PreviousPromptState)
				end
				if TransferRetryOrigin == TransferRetryOriginModule.AcceptTransfer then
					AcceptTransferModule(UseTransferStoreModuleResult)
					
					return
				end
				if TransferRetryOrigin == TransferRetryOriginModule.InitiateTransfer then
					InitiateTransferModule(UseTransferStoreModuleResult)
					
					return
				end
				if TransferRetryOrigin == TransferRetryOriginModule.ProcessTransfer then
					ProcessTransferModule(UseTransferStoreModuleResult, SelectedAmount or 0)
					
					return
				end
				if Direction == TransferDirectionModule.Receive then
					AcceptTransferModule(UseTransferStoreModuleResult)
					
					return
				else
					ProcessTransferModule(UseTransferStoreModuleResult, SelectedAmount or 0)
				end
			end, RequestDetails, AmpWizardTransferConstantsModule.ENTRY_POINT_EVENT_CTX, List, AmpWizardTransferConstantsModule.NAMESPACE_NAME, nil, nil, nil, if FFlagEnableReusableVPCPrologue then true else nil, if FFlagEnableReusableVPCPrologue then {
				config = {
					hideCancel = true,
					actionOrientation = "Vertical",
					hasBackdrop = true,
					closeOnClickOutside = true,
					onCloseCancels = true,
					titleText = UseLocalizationResult.AskParentTitle,
					bodyText = AskParentBodySend,
					confirmText = UseLocalizationResult.Ask
				},
				onConfirm = logAskClicked,
				onCancel = logCancelClicked
			} else nil)
		end
	end
	
	return if FFlagEnableReusableVPCPrologue then ReactModule.createElement(WizardPrologueOpener, { openAmpWizard = openAmpWizard }) else ReactModule.createElement(Dialog.Root, {
		hasBackdrop = true,
		closeOnClickOutside = true,
		size = DialogSize.Small,
		onClose = onCancelClicked
	}, {
		DialogTitle = ReactModule.createElement(Dialog.Title, { text = UseLocalizationResult.AskParentTitle }),
		DialogContent = ReactModule.createElement(Dialog.Content, nil, {
			DialogText = ReactModule.createElement(Dialog.Text, { Text = AskParentBodySend })
		}),
		DialogActions = ReactModule.createElement(Dialog.Actions, {
			orientation = Orientation.Vertical,
			actions = {
				{
					text = UseLocalizationResult.Ask,
					variant = ButtonVariant.Emphasis,
					onActivated = openAmpWizard
				}
			}
		})
	})
end