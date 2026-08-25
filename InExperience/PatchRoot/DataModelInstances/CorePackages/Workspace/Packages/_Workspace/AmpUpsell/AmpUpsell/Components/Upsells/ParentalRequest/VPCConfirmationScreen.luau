local ampUpsell = script:FindFirstAncestor("AmpUpsell")
local parent = ampUpsell.Parent
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local UIBloxModule = require(parent.UIBlox)
local interactiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local cryoModule = require(parent.Cryo)
local getFFlagEnableVPCUpsellFoundationDialogHardeningModule = require(ampUpsell.Flags.GetFFlagEnableVPCUpsellFoundationDialogHardening)
local getShouldUseFoundationUIVPCUpsellModule = require(ampUpsell.Flags.GetShouldUseFoundationUIVPCUpsell)
local foundationModule = require(parent.Foundation)
local dialog = foundationModule.Dialog
local dialogSize = foundationModule.Enums.DialogSize
local buttonVariant = foundationModule.Enums.ButtonVariant

local function selectScreenSize(p0)
	return p0.ScreenSize
end

return function(p1)
	-- upvalues: useSelector (ref), selectScreenSize (ref), getShouldUseFoundationUIVPCUpsellModule (ref), useLocalization (ref), cryoModule (ref), reactModule (ref), dialog (ref), dialogSize (ref), getFFlagEnableVPCUpsellFoundationDialogHardeningModule (ref), buttonVariant (ref), interactiveAlert (ref), buttonType (ref)
	local onAck = p1.onAck
	local var8 = useSelector(selectScreenSize)
	local messageStrings = p1.messageStrings
	local parentEmails = p1.parentEmails
	local var9 = if #parentEmails == 1 then useLocalization(cryoModule.Dictionary.join(messageStrings, {
		bodyText = {
			messageStrings.oneParentBody,
			parentEmail = parentEmails[1]
		}
	})) else useLocalization(cryoModule.Dictionary.join(messageStrings, { bodyText = messageStrings.multipleParentsBody }))
	
	return if getShouldUseFoundationUIVPCUpsellModule(if p1.isInExperienceEntry then p1.isInExperienceEntry else false) then reactModule.createElement(dialog.Root, {
		size = dialogSize.Small,
		onClose = onAck,
		disablePortal = if p1.disablePortal then p1.disablePortal else false,
		hasBackdrop = if getFFlagEnableVPCUpsellFoundationDialogHardeningModule() then true else false
	}, {
		DialogTitle = reactModule.createElement(dialog.Title, { text = var9.title }),
		DialogContent = reactModule.createElement(dialog.Content, { LayoutOrder = 2 }, {
			DialogText = reactModule.createElement(dialog.Text, { Text = var9.bodyText })
		}),
		DialogActions = reactModule.createElement(dialog.Actions, {
			LayoutOrder = 3,
			actions = {
				{
					text = var9.buttonText,
					variant = buttonVariant.Standard,
					onActivated = onAck
				}
			}
		})
	}) else reactModule.createElement(interactiveAlert, {
		anchorPoint = Vector2.new(0.5, 0.5),
		position = UDim2.new(0.5, 0, 0.5, 0),
		screenSize = var8,
		title = var9.title,
		bodyText = var9.bodyText,
		buttonStackInfo = {
			buttons = {
				{
					buttonType = buttonType.PrimarySystem,
					props = { onActivated = onAck, text = var9.buttonText }
				}
			}
		}
	})
end