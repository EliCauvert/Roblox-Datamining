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
local ampWizardTransferConstantsModule = require(currencyTransfers.Constants.AmpWizardTransferConstants)
local getCounterUserIdModule = require(currencyTransfers.Utils.getCounterUserId)
local currencyTransferTelemetryModule = require(currencyTransfers.Events.CurrencyTransferTelemetry)
local robuxTransferFlowEventNameModule = require(currencyTransfers.Enums.RobuxTransferFlowEventName)
local logCurrencyTransferCounterModule = require(currencyTransfers.Utils.logCurrencyTransferCounter)
local logRobuxTransferFlowEventModule = require(currencyTransfers.Utils.logRobuxTransferFlowEvent)
local getTransferRequestInternalIdModule = require(currencyTransfers.Utils.getTransferRequestInternalId)

local function _(p0) --[[ line: 59 | named "isVpcRequestSubmitted" ]]
	-- upvalues: actionTypeEnum (ref), actionStatusEnum (ref)
	return type(p0) == "table" and (if p0[actionTypeEnum.ParentConsent] ~= actionStatusEnum.Success then p0[actionTypeEnum.ParentLink] == actionStatusEnum.Success else true)
end

return function(p1) --[[ line: 67 | named "VPCBlockContainer" ]]
	-- upvalues: useLocalization (ref), transferLocalizationKeysModule (ref), useTransferStoreModule (ref), transferDirectionModule (ref), reactModule (ref), logCurrencyTransferCounterModule (ref), currencyTransferTelemetryModule (ref), sharedFlagsModule (ref), logRobuxTransferFlowEventModule (ref), robuxTransferFlowEventNameModule (ref), promptStateModule (ref), getTransferRequestInternalIdModule (ref), getCounterUserIdModule (ref), inExpAmpWizardController (ref), actionTypeEnum (ref), actionStatusEnum (ref), accessResponseEnum (ref), transferRetryOriginModule (ref), acceptTransferModule (ref), initiateTransferModule (ref), processTransferModule (ref), ampWizardTransferConstantsModule (ref), dialog (ref), dialogSize (ref), orientation (ref), buttonVariant (ref)
	local var20 = useLocalization(transferLocalizationKeysModule.Presets.VPCBlockContainer)
	local var21 = useTransferStoreModule()
	local direction = p1.direction
	local triggerOnClose = var21.triggerOnClose
	local selectedAmount = var21.getSelectedAmount(false)
	local transferRetryOrigin = var21.getTransferRetryOrigin(false)
	local transferRequestId = var21.getTransferRequestId(false)
	local var25 = if direction == transferDirectionModule.Send then var20.AskParentBodySend else var20.AskParentBodyReceive
	reactModule.useEffect(function() --[[ line: 81 ]]
		-- upvalues: logCurrencyTransferCounterModule (copy), var21 (ref), currencyTransferTelemetryModule (copy), sharedFlagsModule (copy), logRobuxTransferFlowEventModule (copy), robuxTransferFlowEventNameModule (copy)
		logCurrencyTransferCounterModule(var21, currencyTransferTelemetryModule.CurrencyTransferVPCBlockDialogShownCounter, { recourseSurface = "vpc" })
		
		if sharedFlagsModule.FFlagEnableRobuxTransferFlowEventIngest then
			logRobuxTransferFlowEventModule(var21, robuxTransferFlowEventNameModule.vpc_block_shown)
		end
		return nil
	end, { var21 })
	
	return reactModule.createElement(dialog.Root, {
		hasBackdrop = true,
		closeOnClickOutside = true,
		size = dialogSize.Small,
		onClose = function() --[[ line: 91 ]]
			-- upvalues: logCurrencyTransferCounterModule (copy), var21 (ref), currencyTransferTelemetryModule (copy), sharedFlagsModule (copy), logRobuxTransferFlowEventModule (copy), robuxTransferFlowEventNameModule (copy), triggerOnClose (ref)
			logCurrencyTransferCounterModule(var21, currencyTransferTelemetryModule.CurrencyTransferVPCBlockCancelClickedCounter, { recourseSurface = "vpc" })
			
			if sharedFlagsModule.FFlagEnableRobuxTransferFlowEventIngest then
				logRobuxTransferFlowEventModule(var21, robuxTransferFlowEventNameModule.vpc_cancel_clicked)
			end
			triggerOnClose()
		end
	}, {
		DialogTitle = reactModule.createElement(dialog.Title, { text = var20.AskParentTitle }),
		DialogContent = reactModule.createElement(dialog.Content, nil, {
			DialogText = reactModule.createElement(dialog.Text, { Text = var25 })
		}),
		DialogActions = reactModule.createElement(dialog.Actions, {
			orientation = orientation.Vertical,
			actions = {
				{
					text = var20.Ask,
					variant = buttonVariant.Emphasis,
					onActivated = function() --[[ line: 101 ]]
						-- upvalues: logCurrencyTransferCounterModule (copy), var21 (ref), currencyTransferTelemetryModule (copy), sharedFlagsModule (copy), logRobuxTransferFlowEventModule (copy), robuxTransferFlowEventNameModule (copy), p1 (ref), triggerOnClose (ref), promptStateModule (copy), getTransferRequestInternalIdModule (copy), transferRequestId (ref), selectedAmount (ref), getCounterUserIdModule (copy), direction (ref), inExpAmpWizardController (copy), actionTypeEnum (copy), actionStatusEnum (copy), accessResponseEnum (copy), transferRetryOrigin (ref), transferRetryOriginModule (copy), acceptTransferModule (copy), initiateTransferModule (copy), processTransferModule (copy), transferDirectionModule (copy), ampWizardTransferConstantsModule (copy)
						logCurrencyTransferCounterModule(var21, currencyTransferTelemetryModule.CurrencyTransferVPCBlockAskClickedCounter, { recourseSurface = "vpc" })
						
						if sharedFlagsModule.FFlagEnableRobuxTransferFlowEventIngest then
							logRobuxTransferFlowEventModule(var21, robuxTransferFlowEventNameModule.vpc_ask_clicked)
						end
						if p1.ampFeatureCheck then
							var21.setPreviousPromptState(var21.getPromptState(false))
							var21.setPromptState(promptStateModule.Hidden)
							local var26 = getCounterUserIdModule(var21, direction)
							inExpAmpWizardController.OpenAmpWizardContainerInExp(p1.ampFeatureCheck, function(p2, p3) --[[ line: 133 ]]
								-- upvalues: actionTypeEnum (copy), actionStatusEnum (copy), sharedFlagsModule (copy), logRobuxTransferFlowEventModule (copy), var21 (copy), robuxTransferFlowEventNameModule (copy), accessResponseEnum (copy), transferRetryOrigin (copy), transferRetryOriginModule (copy), acceptTransferModule (copy), initiateTransferModule (copy), processTransferModule (copy), selectedAmount (copy), direction (copy), transferDirectionModule (copy), triggerOnClose (copy)
								if sharedFlagsModule.FFlagEnableRobuxTransferFlowEventIngest and (type(p3) == "table" and (if p3[actionTypeEnum.ParentConsent] ~= actionStatusEnum.Success then p3[actionTypeEnum.ParentLink] == actionStatusEnum.Success else true)) then
									logRobuxTransferFlowEventModule(var21, robuxTransferFlowEventNameModule.vpc_submitted)
								end
								if p2 ~= accessResponseEnum.Granted then
									triggerOnClose()
									
									return
								end
								local previousPromptState = var21.getPreviousPromptState(false)
								
								if previousPromptState then
									var21.setPromptState(previousPromptState)
								end
								if transferRetryOrigin == transferRetryOriginModule.AcceptTransfer then
									acceptTransferModule(var21)
									
									return
								elseif transferRetryOrigin == transferRetryOriginModule.InitiateTransfer then
									initiateTransferModule(var21)
									
									return
								elseif transferRetryOrigin == transferRetryOriginModule.ProcessTransfer then
									processTransferModule(var21, selectedAmount or 0)
									
									return
								elseif direction == transferDirectionModule.Receive then
									acceptTransferModule(var21)
									
									return
								end
								processTransferModule(var21, selectedAmount or 0)
							end, {
								transferType = "Robux",
								transferId = getTransferRequestInternalIdModule(transferRequestId),
								robuxTransferAmount = tostring(selectedAmount or 0)
							}, ampWizardTransferConstantsModule.ENTRY_POINT_EVENT_CTX, if var26 then {
								{
									name = "targetUser",
									type = "UserId",
									value = tostring(var26)
								}
							} else nil, ampWizardTransferConstantsModule.NAMESPACE_NAME)
							
							return
						end
						triggerOnClose()
					end
				}
			}
		})
	})
end