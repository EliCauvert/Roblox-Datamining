local AmpUpsell = script:FindFirstAncestor("AmpUpsell")
local Parent = AmpUpsell.Parent
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local VpcErrorScreenStrings = require(AmpUpsell.Common.LocalizationStrings).vpcErrorScreenStrings
local GetRetryBehaviorFromErrorCodeAndRetryNumFunction = require(AmpUpsell.Common.VPCErrorUtils).getRetryBehaviorFromErrorCodeAndRetryNum
local GetStringsFromErrorCodeAndRetryNumFunction = require(AmpUpsell.Common.VPCErrorUtils).getStringsFromErrorCodeAndRetryNum
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local UIBloxModule = require(Parent.UIBlox)
local InteractiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local CryoModule = require(Parent.Cryo)
local VPCRetryBehaviorEnum = require(AmpUpsell.Common.Enums).VPCRetryBehaviorEnum
local GetFFlagEnableVPCUpsellFoundationDialogHardeningModule = require(AmpUpsell.Flags.GetFFlagEnableVPCUpsellFoundationDialogHardening)
local GetShouldUseFoundationUIVPCUpsellModule = require(AmpUpsell.Flags.GetShouldUseFoundationUIVPCUpsell)
local FoundationModule = require(Parent.Foundation)
local Dialog = FoundationModule.Dialog
local DialogSize = FoundationModule.Enums.DialogSize
local ButtonVariant = FoundationModule.Enums.ButtonVariant

local function selectScreenSize(p1)
	return p1.ScreenSize
end

return function(p1)
	-- upvalues: UseSelectorFunction (copy), selectScreenSize (copy), GetShouldUseFoundationUIVPCUpsellModule (copy), GetRetryBehaviorFromErrorCodeAndRetryNumFunction (copy), GetStringsFromErrorCodeAndRetryNumFunction (copy), UseLocalizationFunction (copy), CryoModule (copy), VpcErrorScreenStrings (copy), VPCRetryBehaviorEnum (copy), ButtonVariant (copy), ButtonType (copy), ReactModule (copy), Dialog (copy), DialogSize (copy), GetFFlagEnableVPCUpsellFoundationDialogHardeningModule (copy), InteractiveAlert (copy)
	local ErrorCode = p1.errorCode
	local OnRetryAmp = p1.onRetryAmp
	local OnRetryVPC = p1.onRetryVPC
	local OnCancel = p1.onCancel
	local OnSuccess = p1.onSuccess
	local RetryNum = p1.retryNum
	local UseSelectorResult = UseSelectorFunction(selectScreenSize)
	local DisablePortal = if p1.disablePortal then p1.disablePortal else false
	local ShouldUseFoundationUIVPCUpsellModule = GetShouldUseFoundationUIVPCUpsellModule(if p1.isInExperienceEntry then p1.isInExperienceEntry else false)
	local RetryBehaviorFromErrorCodeAndRetryNum = GetRetryBehaviorFromErrorCodeAndRetryNumFunction(ErrorCode, RetryNum)
	local StringsFromErrorCodeAndRetryNum = GetStringsFromErrorCodeAndRetryNumFunction(ErrorCode, RetryNum)
	local UseLocalizationResult = UseLocalizationFunction(CryoModule.Dictionary.join(VpcErrorScreenStrings, {
		titleText = StringsFromErrorCodeAndRetryNum.title,
		bodyText = StringsFromErrorCodeAndRetryNum.body
	}))
	local Buttons = {}
	local Actions = {}
	
	if RetryBehaviorFromErrorCodeAndRetryNum == VPCRetryBehaviorEnum.RetryVPC or RetryBehaviorFromErrorCodeAndRetryNum == VPCRetryBehaviorEnum.RetryAMP then
		local OnRetryVPC1 = if RetryBehaviorFromErrorCodeAndRetryNum == VPCRetryBehaviorEnum.RetryVPC then OnRetryVPC else OnRetryAmp
		
		if ShouldUseFoundationUIVPCUpsellModule then
			Actions = {
				{
					text = UseLocalizationResult.cancelButton,
					variant = ButtonVariant.Standard,
					onActivated = OnCancel
				},
				{
					text = UseLocalizationResult.retryButton,
					variant = ButtonVariant.Emphasis,
					onActivated = OnRetryVPC1
				}
			}
		else
			Buttons = {
				{
					buttonType = ButtonType.Secondary,
					props = {
						onActivated = OnCancel,
						text = UseLocalizationResult.cancelButton
					}
				},
				{
					buttonType = ButtonType.PrimarySystem,
					props = {
						onActivated = OnRetryVPC1,
						text = UseLocalizationResult.retryButton
					}
				}
			}
		end
	elseif RetryBehaviorFromErrorCodeAndRetryNum == VPCRetryBehaviorEnum.Success then
		if ShouldUseFoundationUIVPCUpsellModule then
			Actions = {
				{
					text = UseLocalizationResult.okButton,
					variant = ButtonVariant.Standard,
					onActivated = OnSuccess
				}
			}
		else
			Buttons = {
				{
					buttonType = ButtonType.PrimarySystem,
					props = {
						onActivated = OnSuccess,
						text = UseLocalizationResult.okButton
					}
				}
			}
		end
	elseif ShouldUseFoundationUIVPCUpsellModule then
		Actions = {
			{
				text = UseLocalizationResult.okButton,
				variant = ButtonVariant.Standard,
				onActivated = OnCancel
			}
		}
	else
		Buttons = {
			{
				buttonType = ButtonType.PrimarySystem,
				props = {
					onActivated = OnCancel,
					text = UseLocalizationResult.okButton
				}
			}
		}
	end
	return if ShouldUseFoundationUIVPCUpsellModule then ReactModule.createElement(Dialog.Root, {
		size = DialogSize.Small,
		onClose = OnCancel,
		disablePortal = DisablePortal,
		hasBackdrop = if GetFFlagEnableVPCUpsellFoundationDialogHardeningModule() then true else false
	}, {
		DialogTitle = ReactModule.createElement(Dialog.Title, { text = UseLocalizationResult.titleText }),
		DialogContent = ReactModule.createElement(Dialog.Content, { LayoutOrder = 2 }, {
			DialogText = ReactModule.createElement(Dialog.Text, { Text = UseLocalizationResult.bodyText })
		}),
		DialogActions = ReactModule.createElement(Dialog.Actions, { LayoutOrder = 3, actions = Actions })
	}) else ReactModule.createElement(InteractiveAlert, {
		anchorPoint = Vector2.new(0.5, 0.5),
		position = UDim2.new(0.5, 0, 0.5, 0),
		screenSize = UseSelectorResult,
		title = UseLocalizationResult.titleText,
		bodyText = UseLocalizationResult.bodyText,
		buttonStackInfo = { buttons = Buttons }
	})
end