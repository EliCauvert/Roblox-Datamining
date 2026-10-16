local AmpUpsell = script:FindFirstAncestor("AmpUpsell")
local Parent = AmpUpsell.Parent
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local UIBloxModule = require(Parent.UIBlox)
local InteractiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local CryoModule = require(Parent.Cryo)
local GetFFlagEnableVPCUpsellFoundationDialogHardeningModule = require(AmpUpsell.Flags.GetFFlagEnableVPCUpsellFoundationDialogHardening)
local GetShouldUseFoundationUIVPCUpsellModule = require(AmpUpsell.Flags.GetShouldUseFoundationUIVPCUpsell)
local FoundationModule = require(Parent.Foundation)
local Dialog = FoundationModule.Dialog
local DialogSize = FoundationModule.Enums.DialogSize
local ButtonVariant = FoundationModule.Enums.ButtonVariant

local function selectScreenSize(p1) --[[ Line: 27 ]]
	return p1.ScreenSize
end

return function(p1) --[[ Line: 31 | Named "VPCConfirmationScreen" ]]
	-- upvalues: UseSelectorFunction (copy), selectScreenSize (copy), GetShouldUseFoundationUIVPCUpsellModule (copy), UseLocalizationFunction (copy), CryoModule (copy), ReactModule (copy), Dialog (copy), DialogSize (copy), GetFFlagEnableVPCUpsellFoundationDialogHardeningModule (copy), ButtonVariant (copy), InteractiveAlert (copy), ButtonType (copy)
	local OnAck = p1.onAck
	local UseSelectorResult = UseSelectorFunction(selectScreenSize)
	local MessageStrings = p1.messageStrings
	local ParentEmails = p1.parentEmails
	local DisablePortal = if p1.disablePortal then p1.disablePortal else false
	local UseLocalizationResult = if #ParentEmails == 1 then UseLocalizationFunction(CryoModule.Dictionary.join(MessageStrings, {
		bodyText = {
			MessageStrings.oneParentBody,
			parentEmail = ParentEmails[1]
		}
	})) else UseLocalizationFunction(CryoModule.Dictionary.join(MessageStrings, { bodyText = MessageStrings.multipleParentsBody }))
	
	return if GetShouldUseFoundationUIVPCUpsellModule(if p1.isInExperienceEntry then p1.isInExperienceEntry else false) then ReactModule.createElement(Dialog.Root, {
		size = DialogSize.Small,
		onClose = OnAck,
		disablePortal = DisablePortal,
		hasBackdrop = if GetFFlagEnableVPCUpsellFoundationDialogHardeningModule() then true else false
	}, {
		DialogTitle = ReactModule.createElement(Dialog.Title, { text = UseLocalizationResult.title }),
		DialogContent = ReactModule.createElement(Dialog.Content, { LayoutOrder = 2 }, {
			DialogText = ReactModule.createElement(Dialog.Text, { Text = UseLocalizationResult.bodyText })
		}),
		DialogActions = ReactModule.createElement(Dialog.Actions, {
			LayoutOrder = 3,
			actions = {
				{
					text = UseLocalizationResult.buttonText,
					variant = ButtonVariant.Standard,
					onActivated = OnAck
				}
			}
		})
	}) else ReactModule.createElement(InteractiveAlert, {
		anchorPoint = Vector2.new(0.5, 0.5),
		position = UDim2.new(0.5, 0, 0.5, 0),
		screenSize = UseSelectorResult,
		title = UseLocalizationResult.title,
		bodyText = UseLocalizationResult.bodyText,
		buttonStackInfo = {
			buttons = {
				{
					buttonType = ButtonType.PrimarySystem,
					props = {
						onActivated = OnAck,
						text = UseLocalizationResult.buttonText
					}
				}
			}
		}
	})
end