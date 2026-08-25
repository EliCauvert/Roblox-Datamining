local currencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local parent = currencyTransfers.Parent
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local transferLocalizationKeysModule = require(currencyTransfers.Localization.TransferLocalizationKeys)
local foundationModule = require(parent.Foundation)
local buttonVariant = foundationModule.Enums.ButtonVariant
local dialog = foundationModule.Dialog
local dialogSize = foundationModule.Enums.DialogSize
local orientation = foundationModule.Enums.Orientation
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useTransferStoreModule = require(currencyTransfers.Hooks.useTransferStore)
local processTransferModule = require(currencyTransfers.Actions.Send.processTransfer)
local acceptTransferModule = require(currencyTransfers.Actions.Receive.acceptTransfer)
local initiateTransferModule = require(currencyTransfers.Actions.Send.initiateTransfer)
local promptStateModule = require(currencyTransfers.Enums.PromptState)
local transferDirectionModule = require(currencyTransfers.Enums.TransferDirection)
local transferRetryOriginModule = require(currencyTransfers.Enums.TransferRetryOrigin)
local ampUpsellModule = require(parent.AmpUpsell)
local accessResponseEnum = ampUpsellModule.AmpEnums.AccessResponseEnum
local actionTypeEnum = ampUpsellModule.AmpEnums.ActionTypeEnum
local actionStatusEnum = ampUpsellModule.AmpEnums.ActionStatusEnum
local inExpAmpWizardController = ampUpsellModule.InExpAmpWizardController
local fFlagEnableCurrencyTransferWizardVPCPrologueModule = require(currencyTransfers.Flags.FFlagEnableCurrencyTransferWizardVPCPrologue)
local ampWizardTransferConstantsModule = require(currencyTransfers.Constants.AmpWizardTransferConstants)
local getCounterUserIdModule = require(currencyTransfers.Utils.getCounterUserId)
local currencyTransferTelemetryModule = require(currencyTransfers.Events.CurrencyTransferTelemetry)
local robuxTransferFlowEventNameModule = require(currencyTransfers.Enums.RobuxTransferFlowEventName)
local logCurrencyTransferCounterModule = require(currencyTransfers.Utils.logCurrencyTransferCounter)
local logRobuxTransferFlowEventModule = require(currencyTransfers.Utils.logRobuxTransferFlowEvent)
local getTransferRequestInternalIdModule = require(currencyTransfers.Utils.getTransferRequestInternalId)

local function _(p0)
	-- upvalues: actionTypeEnum (ref), actionStatusEnum (ref)
	return type(p0) == "table" and (if p0[actionTypeEnum.ParentConsent] ~= actionStatusEnum.Success then p0[actionTypeEnum.ParentLink] == actionStatusEnum.Success else true)
end

local function WizardPrologueOpener(p1)
	-- upvalues: reactModule (ref)
	local openAmpWizard = p1.openAmpWizard
	local var22 = reactModule.useRef(false)
	reactModule.useEffect(function()
		-- upvalues: var22 (ref), openAmpWizard (ref)
		if not var22.current then
			var22.current = true
			openAmpWizard()
		end
		return nil
	end, { openAmpWizard })
	
	return nil
end

return function(p2)
	-- upvalues: useLocalization (ref), transferLocalizationKeysModule (ref), useTransferStoreModule (ref), transferDirectionModule (ref), fFlagEnableCurrencyTransferWizardVPCPrologueModule (ref), ampUpsellModule (ref), reactModule (ref), logCurrencyTransferCounterModule (ref), currencyTransferTelemetryModule (ref), sharedFlagsModule (ref), logRobuxTransferFlowEventModule (ref), robuxTransferFlowEventNameModule (ref), promptStateModule (ref), getTransferRequestInternalIdModule (ref), getCounterUserIdModule (ref), inExpAmpWizardController (ref), actionTypeEnum (ref), actionStatusEnum (ref), accessResponseEnum (ref), transferRetryOriginModule (ref), acceptTransferModule (ref), initiateTransferModule (ref), processTransferModule (ref), ampWizardTransferConstantsModule (ref), WizardPrologueOpener (ref), dialog (ref), dialogSize (ref), orientation (ref), buttonVariant (ref)
	local var23 = useLocalization(transferLocalizationKeysModule.Presets.VPCBlockContainer)
	local var24 = useTransferStoreModule()
	local direction = p2.direction
	local triggerOnClose = var24.triggerOnClose
	local selectedAmount = var24.getSelectedAmount(false)
	local transferRetryOrigin = var24.getTransferRetryOrigin(false)
	local transferRequestId = var24.getTransferRequestId(false)
	local var28 = if direction == transferDirectionModule.Send then var23.AskParentBodySend else var23.AskParentBodyReceive
	local var29 = fFlagEnableCurrencyTransferWizardVPCPrologueModule and (ampUpsellModule.GetFFlagEnableAmpVPCPrologue() and ampUpsellModule.GetFFlagEnableReusableVPCPrologue())
	reactModule.useEffect(function()
		-- upvalues: logCurrencyTransferCounterModule (copy), var24 (ref), currencyTransferTelemetryModule (copy), sharedFlagsModule (copy), logRobuxTransferFlowEventModule (copy), robuxTransferFlowEventNameModule (copy)
		logCurrencyTransferCounterModule(var24, currencyTransferTelemetryModule.CurrencyTransferVPCBlockDialogShownCounter, { recourseSurface = "vpc" })
		
		if sharedFlagsModule.FFlagEnableRobuxTransferFlowEventIngest then
			logRobuxTransferFlowEventModule(var24, robuxTransferFlowEventNameModule.vpc_block_shown)
		end
		return nil
	end, { var24 })
	
	local function logAskClicked()
		-- upvalues: logCurrencyTransferCounterModule (copy), var24 (ref), currencyTransferTelemetryModule (copy), sharedFlagsModule (copy), logRobuxTransferFlowEventModule (copy), robuxTransferFlowEventNameModule (copy)
		logCurrencyTransferCounterModule(var24, currencyTransferTelemetryModule.CurrencyTransferVPCBlockAskClickedCounter, { recourseSurface = "vpc" })
		
		if sharedFlagsModule.FFlagEnableRobuxTransferFlowEventIngest then
			logRobuxTransferFlowEventModule(var24, robuxTransferFlowEventNameModule.vpc_ask_clicked)
		end
	end
	
	local function logCancelClicked()
		-- upvalues: logCurrencyTransferCounterModule (copy), var24 (ref), currencyTransferTelemetryModule (copy), sharedFlagsModule (copy), logRobuxTransferFlowEventModule (copy), robuxTransferFlowEventNameModule (copy)
		logCurrencyTransferCounterModule(var24, currencyTransferTelemetryModule.CurrencyTransferVPCBlockCancelClickedCounter, { recourseSurface = "vpc" })
		
		if sharedFlagsModule.FFlagEnableRobuxTransferFlowEventIngest then
			logRobuxTransferFlowEventModule(var24, robuxTransferFlowEventNameModule.vpc_cancel_clicked)
		end
	end
	
	local function openAmpWizard()
		-- upvalues: var29 (ref), logCurrencyTransferCounterModule (copy), var24 (ref), currencyTransferTelemetryModule (copy), sharedFlagsModule (copy), logRobuxTransferFlowEventModule (copy), robuxTransferFlowEventNameModule (copy), p2 (ref), triggerOnClose (ref), promptStateModule (copy), getTransferRequestInternalIdModule (copy), transferRequestId (ref), selectedAmount (ref), getCounterUserIdModule (copy), direction (ref), inExpAmpWizardController (copy), actionTypeEnum (copy), actionStatusEnum (copy), transferDirectionModule (copy), accessResponseEnum (copy), transferRetryOrigin (ref), transferRetryOriginModule (copy), acceptTransferModule (copy), initiateTransferModule (copy), processTransferModule (copy), ampWizardTransferConstantsModule (copy), var23 (ref), var28 (ref), logAskClicked (ref), logCancelClicked (ref)
		if not var29 then
			logCurrencyTransferCounterModule(var24, currencyTransferTelemetryModule.CurrencyTransferVPCBlockAskClickedCounter, { recourseSurface = "vpc" })
			
			if sharedFlagsModule.FFlagEnableRobuxTransferFlowEventIngest then
				logRobuxTransferFlowEventModule(var24, robuxTransferFlowEventNameModule.vpc_ask_clicked)
			end
		end
		if p2.ampFeatureCheck then
			var24.setPreviousPromptState(var24.getPromptState(false))
			var24.setPromptState(promptStateModule.Hidden)
			local var33 = getCounterUserIdModule(var24, direction)
			inExpAmpWizardController.OpenAmpWizardContainerInExp(p2.ampFeatureCheck, function(p3, p4)
				-- upvalues: actionTypeEnum (copy), actionStatusEnum (copy), sharedFlagsModule (copy), logRobuxTransferFlowEventModule (copy), var24 (copy), robuxTransferFlowEventNameModule (copy), direction (copy), transferDirectionModule (copy), accessResponseEnum (copy), transferRetryOrigin (copy), transferRetryOriginModule (copy), acceptTransferModule (copy), initiateTransferModule (copy), processTransferModule (copy), selectedAmount (copy), triggerOnClose (copy)
				local var34 = type(p4) == "table" and (if p4[actionTypeEnum.ParentConsent] ~= actionStatusEnum.Success then p4[actionTypeEnum.ParentLink] == actionStatusEnum.Success else true)
				
				if sharedFlagsModule.FFlagEnableRobuxTransferFlowEventIngest and var34 then
					logRobuxTransferFlowEventModule(var24, robuxTransferFlowEventNameModule.vpc_submitted)
				end
				if sharedFlagsModule.FFlagSduiOpenIncomingTransferUpsellAction and var34 and direction == transferDirectionModule.Receive then
					var24.triggerOnPromptOptimisticHide()
				end
				if p3 ~= accessResponseEnum.Granted then
					triggerOnClose()
					
					return
				end
				local previousPromptState = var24.getPreviousPromptState(false)
				
				if previousPromptState then
					var24.setPromptState(previousPromptState)
				end
				if transferRetryOrigin == transferRetryOriginModule.AcceptTransfer then
					acceptTransferModule(var24)
					
					return
				elseif transferRetryOrigin == transferRetryOriginModule.InitiateTransfer then
					initiateTransferModule(var24)
					
					return
				elseif transferRetryOrigin == transferRetryOriginModule.ProcessTransfer then
					processTransferModule(var24, selectedAmount or 0)
					
					return
				elseif direction == transferDirectionModule.Receive then
					acceptTransferModule(var24)
					
					return
				end
				processTransferModule(var24, selectedAmount or 0)
			end, {
				transferType = "Robux",
				transferId = getTransferRequestInternalIdModule(transferRequestId),
				robuxTransferAmount = tostring(selectedAmount or 0)
			}, ampWizardTransferConstantsModule.ENTRY_POINT_EVENT_CTX, if var33 then {
				{
					name = "targetUser",
					type = "UserId",
					value = tostring(var33)
				}
			} else nil, ampWizardTransferConstantsModule.NAMESPACE_NAME, nil, nil, nil, if var29 then true else nil, if var29 then {
				config = {
					hideCancel = true,
					actionOrientation = "Vertical",
					hasBackdrop = true,
					closeOnClickOutside = true,
					onCloseCancels = true,
					titleText = var23.AskParentTitle,
					bodyText = var28,
					confirmText = var23.Ask
				},
				onConfirm = logAskClicked,
				onCancel = logCancelClicked
			} else nil)
			
			return
		end
		triggerOnClose()
	end
	
	return if var29 then reactModule.createElement(WizardPrologueOpener, { openAmpWizard = openAmpWizard }) else reactModule.createElement(dialog.Root, {
		hasBackdrop = true,
		closeOnClickOutside = true,
		size = dialogSize.Small,
		onClose = function()
			-- upvalues: logCurrencyTransferCounterModule (copy), var24 (ref), currencyTransferTelemetryModule (copy), sharedFlagsModule (copy), logRobuxTransferFlowEventModule (copy), robuxTransferFlowEventNameModule (copy), triggerOnClose (ref)
			logCurrencyTransferCounterModule(var24, currencyTransferTelemetryModule.CurrencyTransferVPCBlockCancelClickedCounter, { recourseSurface = "vpc" })
			
			if sharedFlagsModule.FFlagEnableRobuxTransferFlowEventIngest then
				logRobuxTransferFlowEventModule(var24, robuxTransferFlowEventNameModule.vpc_cancel_clicked)
			end
			triggerOnClose()
		end
	}, {
		DialogTitle = reactModule.createElement(dialog.Title, { text = var23.AskParentTitle }),
		DialogContent = reactModule.createElement(dialog.Content, nil, {
			DialogText = reactModule.createElement(dialog.Text, { Text = var28 })
		}),
		DialogActions = reactModule.createElement(dialog.Actions, {
			orientation = orientation.Vertical,
			actions = {
				{
					text = var23.Ask,
					variant = buttonVariant.Emphasis,
					onActivated = openAmpWizard
				}
			}
		})
	})
end