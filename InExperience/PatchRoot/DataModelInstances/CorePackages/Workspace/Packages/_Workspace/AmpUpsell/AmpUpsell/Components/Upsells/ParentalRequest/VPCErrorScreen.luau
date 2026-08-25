local ampUpsell = script:FindFirstAncestor("AmpUpsell")
local parent = ampUpsell.Parent
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local vpcErrorScreenStrings = require(ampUpsell.Common.LocalizationStrings).vpcErrorScreenStrings
local getRetryBehaviorFromErrorCodeAndRetryNum = require(ampUpsell.Common.VPCErrorUtils).getRetryBehaviorFromErrorCodeAndRetryNum
local getStringsFromErrorCodeAndRetryNum = require(ampUpsell.Common.VPCErrorUtils).getStringsFromErrorCodeAndRetryNum
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local UIBloxModule = require(parent.UIBlox)
local interactiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local cryoModule = require(parent.Cryo)
local VPCRetryBehaviorEnum = require(ampUpsell.Common.Enums).VPCRetryBehaviorEnum
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
	-- upvalues: useSelector (ref), selectScreenSize (ref), getShouldUseFoundationUIVPCUpsellModule (ref), getRetryBehaviorFromErrorCodeAndRetryNum (ref), getStringsFromErrorCodeAndRetryNum (ref), useLocalization (ref), cryoModule (ref), vpcErrorScreenStrings (ref), VPCRetryBehaviorEnum (ref), buttonVariant (ref), buttonType (ref), reactModule (ref), dialog (ref), dialogSize (ref), getFFlagEnableVPCUpsellFoundationDialogHardeningModule (ref), interactiveAlert (ref)
	local errorCode = p1.errorCode
	local onRetryAmp = p1.onRetryAmp
	local onRetryVPC = p1.onRetryVPC
	local onCancel = p1.onCancel
	local onSuccess = p1.onSuccess
	local retryNum = p1.retryNum
	local var8 = useSelector(selectScreenSize)
	local var9 = if p1.disablePortal then p1.disablePortal else false
	local var10 = getShouldUseFoundationUIVPCUpsellModule(if p1.isInExperienceEntry then p1.isInExperienceEntry else false)
	local var11 = getRetryBehaviorFromErrorCodeAndRetryNum(errorCode, retryNum)
	local var12 = getStringsFromErrorCodeAndRetryNum(errorCode, retryNum)
	local var13 = useLocalization(cryoModule.Dictionary.join(vpcErrorScreenStrings, { titleText = var12.title, bodyText = var12.body }))
	local t = {}
	local t_1 = {}
	
	if var11 == VPCRetryBehaviorEnum.RetryVPC or var11 == VPCRetryBehaviorEnum.RetryAMP then
		local var16 = if var11 == VPCRetryBehaviorEnum.RetryVPC then onRetryVPC else onRetryAmp
		
		if var10 then
			t_1 = {
				{
					text = var13.cancelButton,
					variant = buttonVariant.Standard,
					onActivated = onCancel
				},
				{
					text = var13.retryButton,
					variant = buttonVariant.Emphasis,
					onActivated = var16
				}
			}
		else
			t = {
				{
					buttonType = buttonType.Secondary,
					props = { onActivated = onCancel, text = var13.cancelButton }
				},
				{
					buttonType = buttonType.PrimarySystem,
					props = { onActivated = var16, text = var13.retryButton }
				}
			}
		end
	elseif var11 == VPCRetryBehaviorEnum.Success then
		if var10 then
			t_1 = {
				{
					text = var13.okButton,
					variant = buttonVariant.Standard,
					onActivated = onSuccess
				}
			}
		else
			t = {
				{
					buttonType = buttonType.PrimarySystem,
					props = { onActivated = onSuccess, text = var13.okButton }
				}
			}
		end
	elseif var10 then
		t_1 = {
			{
				text = var13.okButton,
				variant = buttonVariant.Standard,
				onActivated = onCancel
			}
		}
	else
		t = {
			{
				buttonType = buttonType.PrimarySystem,
				props = { onActivated = onCancel, text = var13.okButton }
			}
		}
	end
	return if var10 then reactModule.createElement(dialog.Root, {
		size = dialogSize.Small,
		onClose = onCancel,
		disablePortal = var9,
		hasBackdrop = if getFFlagEnableVPCUpsellFoundationDialogHardeningModule() then true else false
	}, {
		DialogTitle = reactModule.createElement(dialog.Title, { text = var13.titleText }),
		DialogContent = reactModule.createElement(dialog.Content, { LayoutOrder = 2 }, {
			DialogText = reactModule.createElement(dialog.Text, { Text = var13.bodyText })
		}),
		DialogActions = reactModule.createElement(dialog.Actions, { LayoutOrder = 3, actions = t_1 })
	}) else reactModule.createElement(interactiveAlert, {
		anchorPoint = Vector2.new(0.5, 0.5),
		position = UDim2.new(0.5, 0, 0.5, 0),
		screenSize = var8,
		title = var13.titleText,
		bodyText = var13.bodyText,
		buttonStackInfo = { buttons = t }
	})
end