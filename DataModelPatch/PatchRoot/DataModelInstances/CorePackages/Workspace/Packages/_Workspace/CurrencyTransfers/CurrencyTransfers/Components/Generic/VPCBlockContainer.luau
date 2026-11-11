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
local ProcessTransferModule = require(CurrencyTransfers.Actions.Send.processTransfer)
local AcceptTransferModule = require(CurrencyTransfers.Actions.Receive.acceptTransfer)
local InitiateTransferModule = require(CurrencyTransfers.Actions.Send.initiateTransfer)
local PromptStateModule = require(CurrencyTransfers.Enums.PromptState)
local TransferDirectionModule = require(CurrencyTransfers.Enums.TransferDirection)
local TransferRetryOriginModule = require(CurrencyTransfers.Enums.TransferRetryOrigin)
local AmpUpsellModule = require(Parent.AmpUpsell)
local AccessResponseEnum = AmpUpsellModule.AmpEnums.AccessResponseEnum
local ActionTypeEnum = AmpUpsellModule.AmpEnums.ActionTypeEnum
local ActionStatusEnum = AmpUpsellModule.AmpEnums.ActionStatusEnum
local InExpAmpWizardController = AmpUpsellModule.InExpAmpWizardController
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

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), TransferLocalizationKeysModule (copy), UseTransferStoreModule (copy), TransferDirectionModule (copy), ReactModule (copy), LogCurrencyTransferCounterModule (copy), CurrencyTransferTelemetryModule (copy), SharedFlagsModule (copy), LogRobuxTransferFlowEventModule (copy), RobuxTransferFlowEventNameModule (copy), PromptStateModule (copy), GetTransferRequestInternalIdModule (copy), GetCounterUserIdModule (copy), InExpAmpWizardController (copy), ActionTypeEnum (copy), ActionStatusEnum (copy), AccessResponseEnum (copy), TransferRetryOriginModule (copy), AcceptTransferModule (copy), InitiateTransferModule (copy), ProcessTransferModule (copy), AmpWizardTransferConstantsModule (copy), Dialog (copy), DialogSize (copy), Orientation (copy), ButtonVariant (copy)
	local UseLocalizationResult = UseLocalizationFunction(TransferLocalizationKeysModule.Presets.VPCBlockContainer)
	local UseTransferStoreModuleResult = UseTransferStoreModule()
	local Direction = p1.direction
	local TriggerOnCloseFunction = UseTransferStoreModuleResult.triggerOnClose
	local SelectedAmount = UseTransferStoreModuleResult.getSelectedAmount(false)
	local TransferRetryOrigin = UseTransferStoreModuleResult.getTransferRetryOrigin(false)
	local TransferRequestId = UseTransferStoreModuleResult.getTransferRequestId(false)
	local AskParentBodySend = if Direction == TransferDirectionModule.Send then UseLocalizationResult.AskParentBodySend else UseLocalizationResult.AskParentBodyReceive
	ReactModule.useEffect(function()
		-- upvalues: LogCurrencyTransferCounterModule (upval), UseTransferStoreModuleResult (copy), CurrencyTransferTelemetryModule (upval), SharedFlagsModule (upval), LogRobuxTransferFlowEventModule (upval), RobuxTransferFlowEventNameModule (upval)
		LogCurrencyTransferCounterModule(UseTransferStoreModuleResult, CurrencyTransferTelemetryModule.CurrencyTransferVPCBlockDialogShownCounter, { recourseSurface = "vpc" })
		
		if SharedFlagsModule.FFlagEnableRobuxTransferFlowEventIngest then
			LogRobuxTransferFlowEventModule(UseTransferStoreModuleResult, RobuxTransferFlowEventNameModule.vpc_block_shown)
		end
		return nil
	end, { UseTransferStoreModuleResult })
	
	return ReactModule.createElement(Dialog.Root, {
		hasBackdrop = true,
		closeOnClickOutside = true,
		size = DialogSize.Small,
		onClose = function()
			-- upvalues: LogCurrencyTransferCounterModule (upval), UseTransferStoreModuleResult (copy), CurrencyTransferTelemetryModule (upval), SharedFlagsModule (upval), LogRobuxTransferFlowEventModule (upval), RobuxTransferFlowEventNameModule (upval), TriggerOnCloseFunction (copy)
			LogCurrencyTransferCounterModule(UseTransferStoreModuleResult, CurrencyTransferTelemetryModule.CurrencyTransferVPCBlockCancelClickedCounter, { recourseSurface = "vpc" })
			
			if SharedFlagsModule.FFlagEnableRobuxTransferFlowEventIngest then
				LogRobuxTransferFlowEventModule(UseTransferStoreModuleResult, RobuxTransferFlowEventNameModule.vpc_cancel_clicked)
			end
			TriggerOnCloseFunction()
		end
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
					onActivated = function()
						-- upvalues: LogCurrencyTransferCounterModule (upval), UseTransferStoreModuleResult (copy), CurrencyTransferTelemetryModule (upval), SharedFlagsModule (upval), LogRobuxTransferFlowEventModule (upval), RobuxTransferFlowEventNameModule (upval), p1 (copy), TriggerOnCloseFunction (copy), PromptStateModule (upval), GetTransferRequestInternalIdModule (upval), TransferRequestId (copy), SelectedAmount (copy), GetCounterUserIdModule (upval), Direction (copy), InExpAmpWizardController (upval), ActionTypeEnum (upval), ActionStatusEnum (upval), AccessResponseEnum (upval), TransferRetryOrigin (copy), TransferRetryOriginModule (upval), AcceptTransferModule (upval), InitiateTransferModule (upval), ProcessTransferModule (upval), TransferDirectionModule (upval), AmpWizardTransferConstantsModule (upval)
						LogCurrencyTransferCounterModule(UseTransferStoreModuleResult, CurrencyTransferTelemetryModule.CurrencyTransferVPCBlockAskClickedCounter, { recourseSurface = "vpc" })
						
						if SharedFlagsModule.FFlagEnableRobuxTransferFlowEventIngest then
							LogRobuxTransferFlowEventModule(UseTransferStoreModuleResult, RobuxTransferFlowEventNameModule.vpc_ask_clicked)
						end
						if p1.ampFeatureCheck then
							UseTransferStoreModuleResult.setPreviousPromptState((UseTransferStoreModuleResult.getPromptState(false)))
							UseTransferStoreModuleResult.setPromptState(PromptStateModule.Hidden)
							local config = {
								transferType = "Robux",
								transferId = GetTransferRequestInternalIdModule(TransferRequestId),
								robuxTransferAmount = tostring(SelectedAmount or 0)
							}
							local CounterUserIdModule = GetCounterUserIdModule(UseTransferStoreModuleResult, Direction)
							InExpAmpWizardController.OpenAmpWizardContainerInExp(p1.ampFeatureCheck, function(Granted, p2)
								-- upvalues: ActionTypeEnum (upval), ActionStatusEnum (upval), SharedFlagsModule (upval), LogRobuxTransferFlowEventModule (upval), UseTransferStoreModuleResult (upval), RobuxTransferFlowEventNameModule (upval), AccessResponseEnum (upval), TransferRetryOrigin (upval), TransferRetryOriginModule (upval), AcceptTransferModule (upval), InitiateTransferModule (upval), ProcessTransferModule (upval), SelectedAmount (upval), Direction (upval), TransferDirectionModule (upval), TriggerOnCloseFunction (upval)
								local IsSuccessMatch: boolean = type(p2) == "table" and (p2[ActionTypeEnum.ParentConsent] == ActionStatusEnum.Success or p2[ActionTypeEnum.ParentLink] == ActionStatusEnum.Success)
								
								if SharedFlagsModule.FFlagEnableRobuxTransferFlowEventIngest and IsSuccessMatch then
									LogRobuxTransferFlowEventModule(UseTransferStoreModuleResult, RobuxTransferFlowEventNameModule.vpc_submitted)
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
							end, config, AmpWizardTransferConstantsModule.ENTRY_POINT_EVENT_CTX, if CounterUserIdModule then {
								{
									name = "targetUser",
									type = "UserId",
									value = tostring(CounterUserIdModule)
								}
							} else nil, AmpWizardTransferConstantsModule.NAMESPACE_NAME)
							
							return
						else
							TriggerOnCloseFunction()
						end
					end
				}
			}
		})
	})
end