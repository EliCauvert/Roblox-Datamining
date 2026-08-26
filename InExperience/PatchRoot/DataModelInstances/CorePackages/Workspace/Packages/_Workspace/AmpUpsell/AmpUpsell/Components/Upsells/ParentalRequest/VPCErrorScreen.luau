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

local function selectScreenSize(p1)
	return p1.ScreenSize
end

return function(p1)
	-- upvalues: useSelector (ref), selectScreenSize (ref), getShouldUseFoundationUIVPCUpsellModule (ref), getRetryBehaviorFromErrorCodeAndRetryNum (ref), getStringsFromErrorCodeAndRetryNum (ref), useLocalization (ref), cryoModule (ref), vpcErrorScreenStrings (ref), VPCRetryBehaviorEnum (ref), buttonVariant (ref), buttonType (ref), reactModule (ref), dialog (ref), dialogSize (ref), getFFlagEnableVPCUpsellFoundationDialogHardeningModule (ref), interactiveAlert (ref)
	local errorCode = p1.errorCode
	local onRetryAmp = p1.onRetryAmp
	local onRetryVPC = p1.onRetryVPC
	local onCancel = p1.onCancel
	local onSuccess = p1.onSuccess
	local retryNum = p1.retryNum
	local var1 = useSelector(selectScreenSize)
	local var2 = if p1.disablePortal then p1.disablePortal else false
	local var3 = getShouldUseFoundationUIVPCUpsellModule(if p1.isInExperienceEntry then p1.isInExperienceEntry else false)
	local var4 = getRetryBehaviorFromErrorCodeAndRetryNum(errorCode, retryNum)
	local var5 = getStringsFromErrorCodeAndRetryNum(errorCode, retryNum)
	local var6 = useLocalization(cryoModule.Dictionary.join(vpcErrorScreenStrings, { titleText = var5.title, bodyText = var5.body }))
	local t = {}
	local t_1 = {}
	
	if var4 == VPCRetryBehaviorEnum.RetryVPC or var4 == VPCRetryBehaviorEnum.RetryAMP then
		local var7 = if var4 == VPCRetryBehaviorEnum.RetryVPC then onRetryVPC else onRetryAmp
		
		if var3 then
			t_1 = {
				{
					text = var6.cancelButton,
					variant = buttonVariant.Standard,
					onActivated = onCancel
				},
				{
					text = var6.retryButton,
					variant = buttonVariant.Emphasis,
					onActivated = var7
				}
			}
		else
			t = {
				{
					buttonType = buttonType.Secondary,
					props = { onActivated = onCancel, text = var6.cancelButton }
				},
				{
					buttonType = buttonType.PrimarySystem,
					props = { onActivated = var7, text = var6.retryButton }
				}
			}
		end
	elseif var4 == VPCRetryBehaviorEnum.Success then
		if var3 then
			t_1 = {
				{
					text = var6.okButton,
					variant = buttonVariant.Standard,
					onActivated = onSuccess
				}
			}
		else
			t = {
				{
					buttonType = buttonType.PrimarySystem,
					props = { onActivated = onSuccess, text = var6.okButton }
				}
			}
		end
	elseif var3 then
		t_1 = {
			{
				text = var6.okButton,
				variant = buttonVariant.Standard,
				onActivated = onCancel
			}
		}
	else
		t = {
			{
				buttonType = buttonType.PrimarySystem,
				props = { onActivated = onCancel, text = var6.okButton }
			}
		}
	end
	return if var3 then reactModule.createElement(dialog.Root, {
		size = dialogSize.Small,
		onClose = onCancel,
		disablePortal = var2,
		hasBackdrop = if getFFlagEnableVPCUpsellFoundationDialogHardeningModule() then true else false
	}, {
		DialogTitle = reactModule.createElement(dialog.Title, { text = var6.titleText }),
		DialogContent = reactModule.createElement(dialog.Content, { LayoutOrder = 2 }, {
			DialogText = reactModule.createElement(dialog.Text, { Text = var6.bodyText })
		}),
		DialogActions = reactModule.createElement(dialog.Actions, { LayoutOrder = 3, actions = t_1 })
	}) else reactModule.createElement(interactiveAlert, {
		anchorPoint = Vector2.new(0.5, 0.5),
		position = UDim2.new(0.5, 0, 0.5, 0),
		screenSize = var1,
		title = var6.titleText,
		bodyText = var6.bodyText,
		buttonStackInfo = { buttons = t }
	})
end