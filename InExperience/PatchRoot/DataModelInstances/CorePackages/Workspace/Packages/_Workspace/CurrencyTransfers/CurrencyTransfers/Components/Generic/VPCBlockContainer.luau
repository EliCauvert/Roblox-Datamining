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
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local processTransferModule = require(currencyTransfers.Actions.Send.processTransfer)
local acceptTransferModule = require(currencyTransfers.Actions.Receive.acceptTransfer)
local initiateTransferModule = require(currencyTransfers.Actions.Send.initiateTransfer)
local promptStateModule = require(currencyTransfers.Enums.PromptState)
local transferDirectionModule = require(currencyTransfers.Enums.TransferDirection)
local transferOriginationModule = require(currencyTransfers.Enums.TransferOrigination)
local transferRetryOriginModule = require(currencyTransfers.Enums.TransferRetryOrigin)
local ampUpsellModule = require(parent.AmpUpsell)
local accessResponseEnum = ampUpsellModule.AmpEnums.AccessResponseEnum
local actionTypeEnum = ampUpsellModule.AmpEnums.ActionTypeEnum
local actionStatusEnum = ampUpsellModule.AmpEnums.ActionStatusEnum
local inExpAmpWizardController = ampUpsellModule.InExpAmpWizardController
local openAmpWizardContainer = ampUpsellModule.OpenAmpWizardContainer
local fFlagEnableCurrencyTransferWizardVPCPrologueModule = require(currencyTransfers.Flags.FFlagEnableCurrencyTransferWizardVPCPrologue)
local fFlagCurrencyTransferVPCUseAmpWizardContainerForInAppModule = require(currencyTransfers.Flags.FFlagCurrencyTransferVPCUseAmpWizardContainerForInApp)
local ampWizardTransferConstantsModule = require(currencyTransfers.Constants.AmpWizardTransferConstants)
local getCounterUserIdModule = require(currencyTransfers.Utils.getCounterUserId)
local currencyTransferTelemetryModule = require(currencyTransfers.Events.CurrencyTransferTelemetry)
local robuxTransferFlowEventNameModule = require(currencyTransfers.Enums.RobuxTransferFlowEventName)
local logCurrencyTransferCounterModule = require(currencyTransfers.Utils.logCurrencyTransferCounter)
local logRobuxTransferFlowEventModule = require(currencyTransfers.Utils.logRobuxTransferFlowEvent)
local getTransferRequestInternalIdModule = require(currencyTransfers.Utils.getTransferRequestInternalId)

local function _(p1)
	-- upvalues: actionTypeEnum (ref), actionStatusEnum (ref)
	return type(p1) == "table" and (if p1[actionTypeEnum.ParentConsent] ~= actionStatusEnum.Success then p1[actionTypeEnum.ParentLink] == actionStatusEnum.Success else true)
end

local function WizardPrologueOpener(p1)
	-- upvalues: reactModule (ref)
	local openAmpWizard = p1.openAmpWizard
	local var1 = reactModule.useRef(false)
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), openAmpWizard (ref)
		if not var1.current then
			var1.current = true
			openAmpWizard()
		end
		return nil
	end, { openAmpWizard })
	
	return nil
end

return function(p1)
	-- upvalues: useLocalization (ref), transferLocalizationKeysModule (ref), useTransferStoreModule (ref), fFlagCurrencyTransferVPCUseAmpWizardContainerForInAppModule (ref), useDispatch (ref), transferOriginationModule (ref), transferDirectionModule (ref), fFlagEnableCurrencyTransferWizardVPCPrologueModule (ref), ampUpsellModule (ref), reactModule (ref), logCurrencyTransferCounterModule (ref), currencyTransferTelemetryModule (ref), sharedFlagsModule (ref), logRobuxTransferFlowEventModule (ref), robuxTransferFlowEventNameModule (ref), promptStateModule (ref), getTransferRequestInternalIdModule (ref), getCounterUserIdModule (ref), openAmpWizardContainer (ref), actionTypeEnum (ref), actionStatusEnum (ref), accessResponseEnum (ref), transferRetryOriginModule (ref), acceptTransferModule (ref), initiateTransferModule (ref), processTransferModule (ref), ampWizardTransferConstantsModule (ref), inExpAmpWizardController (ref), WizardPrologueOpener (ref), dialog (ref), dialogSize (ref), orientation (ref), buttonVariant (ref)
	local var1 = useLocalization(transferLocalizationKeysModule.Presets.VPCBlockContainer)
	local var2 = useTransferStoreModule()
	local var3 = if fFlagCurrencyTransferVPCUseAmpWizardContainerForInAppModule then useDispatch() else nil
	local direction = p1.direction
	local triggerOnClose = var2.triggerOnClose
	local selectedAmount = var2.getSelectedAmount(false)
	local transferRetryOrigin = var2.getTransferRetryOrigin(false)
	local transferRequestId = var2.getTransferRequestId(false)
	local var4 = fFlagCurrencyTransferVPCUseAmpWizardContainerForInAppModule and var2.getTransferOrigination(false) == transferOriginationModule.InExperience
	local var5 = if direction == transferDirectionModule.Send then var1.AskParentBodySend else var1.AskParentBodyReceive
	local var6 = fFlagEnableCurrencyTransferWizardVPCPrologueModule and (ampUpsellModule.GetFFlagEnableAmpVPCPrologue() and ampUpsellModule.GetFFlagEnableReusableVPCPrologue())
	reactModule.useEffect(function()
		-- upvalues: logCurrencyTransferCounterModule (copy), var2 (ref), currencyTransferTelemetryModule (copy), sharedFlagsModule (copy), logRobuxTransferFlowEventModule (copy), robuxTransferFlowEventNameModule (copy)
		logCurrencyTransferCounterModule(var2, currencyTransferTelemetryModule.CurrencyTransferVPCBlockDialogShownCounter, { recourseSurface = "vpc" })
		
		if sharedFlagsModule.FFlagEnableRobuxTransferFlowEventIngest then
			logRobuxTransferFlowEventModule(var2, robuxTransferFlowEventNameModule.vpc_block_shown)
		end
		return nil
	end, { var2 })
	
	local function logAskClicked()
		-- upvalues: logCurrencyTransferCounterModule (copy), var2 (ref), currencyTransferTelemetryModule (copy), sharedFlagsModule (copy), logRobuxTransferFlowEventModule (copy), robuxTransferFlowEventNameModule (copy)
		logCurrencyTransferCounterModule(var2, currencyTransferTelemetryModule.CurrencyTransferVPCBlockAskClickedCounter, { recourseSurface = "vpc" })
		
		if sharedFlagsModule.FFlagEnableRobuxTransferFlowEventIngest then
			logRobuxTransferFlowEventModule(var2, robuxTransferFlowEventNameModule.vpc_ask_clicked)
		end
	end
	
	local function logCancelClicked()
		-- upvalues: logCurrencyTransferCounterModule (copy), var2 (ref), currencyTransferTelemetryModule (copy), sharedFlagsModule (copy), logRobuxTransferFlowEventModule (copy), robuxTransferFlowEventNameModule (copy)
		logCurrencyTransferCounterModule(var2, currencyTransferTelemetryModule.CurrencyTransferVPCBlockCancelClickedCounter, { recourseSurface = "vpc" })
		
		if sharedFlagsModule.FFlagEnableRobuxTransferFlowEventIngest then
			logRobuxTransferFlowEventModule(var2, robuxTransferFlowEventNameModule.vpc_cancel_clicked)
		end
	end
	
	local function openAmpWizard()
		-- upvalues: var6 (ref), logCurrencyTransferCounterModule (copy), var2 (ref), currencyTransferTelemetryModule (copy), sharedFlagsModule (copy), logRobuxTransferFlowEventModule (copy), robuxTransferFlowEventNameModule (copy), p1 (ref), triggerOnClose (ref), promptStateModule (copy), getTransferRequestInternalIdModule (copy), transferRequestId (ref), selectedAmount (ref), getCounterUserIdModule (copy), direction (ref), fFlagCurrencyTransferVPCUseAmpWizardContainerForInAppModule (copy), var4 (ref), var3 (ref), openAmpWizardContainer (copy), actionTypeEnum (copy), actionStatusEnum (copy), transferDirectionModule (copy), accessResponseEnum (copy), transferRetryOrigin (ref), transferRetryOriginModule (copy), acceptTransferModule (copy), initiateTransferModule (copy), processTransferModule (copy), ampWizardTransferConstantsModule (copy), var1 (ref), var5 (ref), logAskClicked (ref), logCancelClicked (ref), inExpAmpWizardController (copy)
		if not var6 then
			logCurrencyTransferCounterModule(var2, currencyTransferTelemetryModule.CurrencyTransferVPCBlockAskClickedCounter, { recourseSurface = "vpc" })
			
			if sharedFlagsModule.FFlagEnableRobuxTransferFlowEventIngest then
				logRobuxTransferFlowEventModule(var2, robuxTransferFlowEventNameModule.vpc_ask_clicked)
			end
		end
		if not p1.ampFeatureCheck then
			triggerOnClose()
			
			return
		end
		var2.setPreviousPromptState(var2.getPromptState(false))
		var2.setPromptState(promptStateModule.Hidden)
		local t = {
			transferType = "Robux",
			transferId = getTransferRequestInternalIdModule(transferRequestId),
			robuxTransferAmount = tostring(selectedAmount or 0)
		}
		local var7 = getCounterUserIdModule(var2, direction)
		local var8 = if var7 then {
			{
				name = "targetUser",
				type = "UserId",
				value = tostring(var7)
			}
		} else nil
		
		if fFlagCurrencyTransferVPCUseAmpWizardContainerForInAppModule and not var4 then
			var3(openAmpWizardContainer(p1.ampFeatureCheck, function(p2, p3)
				-- upvalues: actionTypeEnum (copy), actionStatusEnum (copy), sharedFlagsModule (copy), logRobuxTransferFlowEventModule (copy), var2 (copy), robuxTransferFlowEventNameModule (copy), direction (copy), transferDirectionModule (copy), accessResponseEnum (copy), transferRetryOrigin (copy), transferRetryOriginModule (copy), acceptTransferModule (copy), initiateTransferModule (copy), processTransferModule (copy), selectedAmount (copy), triggerOnClose (copy)
				local var9 = type(p3) == "table" and (if p3[actionTypeEnum.ParentConsent] ~= actionStatusEnum.Success then p3[actionTypeEnum.ParentLink] == actionStatusEnum.Success else true)
				
				if sharedFlagsModule.FFlagEnableRobuxTransferFlowEventIngest and var9 then
					logRobuxTransferFlowEventModule(var2, robuxTransferFlowEventNameModule.vpc_submitted)
				end
				if sharedFlagsModule.FFlagSduiOpenIncomingTransferUpsellAction and var9 and direction == transferDirectionModule.Receive then
					var2.triggerOnPromptOptimisticHide()
				end
				if p2 ~= accessResponseEnum.Granted then
					triggerOnClose()
					
					return
				end
				local previousPromptState = var2.getPreviousPromptState(false)
				
				if previousPromptState then
					var2.setPromptState(previousPromptState)
				end
				if transferRetryOrigin == transferRetryOriginModule.AcceptTransfer then
					acceptTransferModule(var2)
					
					return
				elseif transferRetryOrigin == transferRetryOriginModule.InitiateTransfer then
					initiateTransferModule(var2)
					
					return
				elseif transferRetryOrigin == transferRetryOriginModule.ProcessTransfer then
					processTransferModule(var2, selectedAmount or 0)
					
					return
				elseif direction == transferDirectionModule.Receive then
					acceptTransferModule(var2)
					
					return
				end
				processTransferModule(var2, selectedAmount or 0)
			end, t, ampWizardTransferConstantsModule.ENTRY_POINT_EVENT_CTX, var8, ampWizardTransferConstantsModule.NAMESPACE_NAME, nil, nil, nil, if var6 then true else nil, if var6 then {
				config = {
					hideCancel = true,
					actionOrientation = "Vertical",
					hasBackdrop = true,
					closeOnClickOutside = true,
					onCloseCancels = true,
					titleText = var1.AskParentTitle,
					bodyText = var5,
					confirmText = var1.Ask
				},
				onConfirm = logAskClicked,
				onCancel = logCancelClicked
			} else nil))
			
			return
		end
		inExpAmpWizardController.OpenAmpWizardContainerInExp(p1.ampFeatureCheck, function(p2, p3)
			-- upvalues: actionTypeEnum (copy), actionStatusEnum (copy), sharedFlagsModule (copy), logRobuxTransferFlowEventModule (copy), var2 (copy), robuxTransferFlowEventNameModule (copy), direction (copy), transferDirectionModule (copy), accessResponseEnum (copy), transferRetryOrigin (copy), transferRetryOriginModule (copy), acceptTransferModule (copy), initiateTransferModule (copy), processTransferModule (copy), selectedAmount (copy), triggerOnClose (copy)
			local var9 = type(p3) == "table" and (if p3[actionTypeEnum.ParentConsent] ~= actionStatusEnum.Success then p3[actionTypeEnum.ParentLink] == actionStatusEnum.Success else true)
			
			if sharedFlagsModule.FFlagEnableRobuxTransferFlowEventIngest and var9 then
				logRobuxTransferFlowEventModule(var2, robuxTransferFlowEventNameModule.vpc_submitted)
			end
			if sharedFlagsModule.FFlagSduiOpenIncomingTransferUpsellAction and var9 and direction == transferDirectionModule.Receive then
				var2.triggerOnPromptOptimisticHide()
			end
			if p2 ~= accessResponseEnum.Granted then
				triggerOnClose()
				
				return
			end
			local previousPromptState = var2.getPreviousPromptState(false)
			
			if previousPromptState then
				var2.setPromptState(previousPromptState)
			end
			if transferRetryOrigin == transferRetryOriginModule.AcceptTransfer then
				acceptTransferModule(var2)
				
				return
			elseif transferRetryOrigin == transferRetryOriginModule.InitiateTransfer then
				initiateTransferModule(var2)
				
				return
			elseif transferRetryOrigin == transferRetryOriginModule.ProcessTransfer then
				processTransferModule(var2, selectedAmount or 0)
				
				return
			elseif direction == transferDirectionModule.Receive then
				acceptTransferModule(var2)
				
				return
			end
			processTransferModule(var2, selectedAmount or 0)
		end, t, ampWizardTransferConstantsModule.ENTRY_POINT_EVENT_CTX, var8, ampWizardTransferConstantsModule.NAMESPACE_NAME, nil, nil, nil, if var6 then true else nil, if var6 then {
			config = {
				hideCancel = true,
				actionOrientation = "Vertical",
				hasBackdrop = true,
				closeOnClickOutside = true,
				onCloseCancels = true,
				titleText = var1.AskParentTitle,
				bodyText = var5,
				confirmText = var1.Ask
			},
			onConfirm = logAskClicked,
			onCancel = logCancelClicked
		} else nil)
	end
	
	return if var6 then reactModule.createElement(WizardPrologueOpener, { openAmpWizard = openAmpWizard }) else reactModule.createElement(dialog.Root, {
		hasBackdrop = true,
		closeOnClickOutside = true,
		size = dialogSize.Small,
		onClose = function()
			-- upvalues: logCurrencyTransferCounterModule (copy), var2 (ref), currencyTransferTelemetryModule (copy), sharedFlagsModule (copy), logRobuxTransferFlowEventModule (copy), robuxTransferFlowEventNameModule (copy), triggerOnClose (ref)
			logCurrencyTransferCounterModule(var2, currencyTransferTelemetryModule.CurrencyTransferVPCBlockCancelClickedCounter, { recourseSurface = "vpc" })
			
			if sharedFlagsModule.FFlagEnableRobuxTransferFlowEventIngest then
				logRobuxTransferFlowEventModule(var2, robuxTransferFlowEventNameModule.vpc_cancel_clicked)
			end
			triggerOnClose()
		end
	}, {
		DialogTitle = reactModule.createElement(dialog.Title, { text = var1.AskParentTitle }),
		DialogContent = reactModule.createElement(dialog.Content, nil, {
			DialogText = reactModule.createElement(dialog.Text, { Text = var5 })
		}),
		DialogActions = reactModule.createElement(dialog.Actions, {
			orientation = orientation.Vertical,
			actions = {
				{
					text = var1.Ask,
					variant = buttonVariant.Emphasis,
					onActivated = openAmpWizard
				}
			}
		})
	})
end