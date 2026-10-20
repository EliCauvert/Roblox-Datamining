local AmpUpsell = script:FindFirstAncestor("AmpUpsell")
local Parent = AmpUpsell.Parent
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local FoundationModule = require(Parent.Foundation)
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local Dialog = FoundationModule.Dialog
local DialogSize = FoundationModule.Enums.DialogSize
local Orientation = FoundationModule.Enums.Orientation
local VpcPrologueStrings = require(AmpUpsell.Common.LocalizationStrings).vpcPrologueStrings
local _ = require(AmpUpsell.Common.Types)
local GetFFlagEnableReusableVPCPrologueModule = require(AmpUpsell.Flags.GetFFlagEnableReusableVPCPrologue)

local function _(p1)
	-- upvalues: VpcPrologueStrings (copy)
	if p1 then
		if p1.enablePurchases == true then
			return VpcPrologueStrings.bodyPurchases
		elseif p1.contentAgeRestriction ~= nil then
			return VpcPrologueStrings.bodyContentRestriction
		elseif p1.friendManagementAction == "Unblock" then
			return VpcPrologueStrings.bodyUnblock
		end
	end
	return VpcPrologueStrings.bodyGeneric
end

local function ConfigurableVPCPrologue(p1)
	-- upvalues: UseLocalizationFunction (copy), VpcPrologueStrings (copy), ButtonVariant (copy), ReactModule (copy), Dialog (copy), DialogSize (copy), Orientation (copy)
	local Config = p1.config or {}
	local RecourseData = p1.recourseData
	local UseLocalizationResult = UseLocalizationFunction({
		title = VpcPrologueStrings.title,
		body = if RecourseData then if RecourseData.enablePurchases == true then VpcPrologueStrings.bodyPurchases elseif RecourseData.contentAgeRestriction == nil then if RecourseData.friendManagementAction == "Unblock" then VpcPrologueStrings.bodyUnblock else VpcPrologueStrings.bodyGeneric else VpcPrologueStrings.bodyContentRestriction else VpcPrologueStrings.bodyGeneric,
		buttonAsk = VpcPrologueStrings.buttonAsk,
		buttonCancel = VpcPrologueStrings.buttonCancel
	})
	local Actions = {
		{
			text = Config.confirmText or UseLocalizationResult.buttonAsk,
			variant = ButtonVariant.Emphasis,
			onActivated = p1.onConfirm
		}
	}
	
	if not Config.hideCancel then
		table.insert(Actions, if Config.cancelFirst then 1 else 2, {
			text = Config.cancelText or UseLocalizationResult.buttonCancel,
			variant = ButtonVariant.Standard,
			onActivated = p1.onCancel
		})
	end
	local NoOmitLayoutOrder = not Config.omitLayoutOrder
	
	return ReactModule.createElement(Dialog.Root, {
		size = if Config.dialogSize == "Medium" then DialogSize.Medium else DialogSize.Small,
		hasBackdrop = Config.hasBackdrop,
		closeOnClickOutside = Config.closeOnClickOutside,
		onClose = if Config.onClose then Config.onClose elseif Config.onCloseCancels then p1.onCancel else nil
	}, {
		Title = ReactModule.createElement(Dialog.Title, {
			LayoutOrder = if NoOmitLayoutOrder then 1 else nil,
			text = Config.titleText or UseLocalizationResult.title
		}),
		Content = ReactModule.createElement(Dialog.Content, { LayoutOrder = if NoOmitLayoutOrder then 2 else nil }, {
			Text = Config.bodyContent or ReactModule.createElement(Dialog.Text, { Text = Config.bodyText or UseLocalizationResult.body })
		}),
		Buttons = ReactModule.createElement(Dialog.Actions, {
			LayoutOrder = if NoOmitLayoutOrder then 3 else nil,
			orientation = if Config.actionOrientation == "Vertical" then Orientation.Vertical elseif Config.actionOrientation == "Horizontal" then Orientation.Horizontal else nil,
			actions = Actions
		})
	})
end

local function LegacyVPCPrologue(p1)
	-- upvalues: VpcPrologueStrings (copy), UseLocalizationFunction (copy), ReactModule (copy), Dialog (copy), DialogSize (copy), ButtonVariant (copy)
	local RecourseData = p1.recourseData
	local UseLocalizationResult = UseLocalizationFunction({
		title = VpcPrologueStrings.title,
		body = if RecourseData then if RecourseData.enablePurchases == true then VpcPrologueStrings.bodyPurchases elseif RecourseData.contentAgeRestriction == nil then if RecourseData.friendManagementAction == "Unblock" then VpcPrologueStrings.bodyUnblock else VpcPrologueStrings.bodyGeneric else VpcPrologueStrings.bodyContentRestriction else VpcPrologueStrings.bodyGeneric,
		buttonAsk = VpcPrologueStrings.buttonAsk,
		buttonCancel = VpcPrologueStrings.buttonCancel
	})
	
	return ReactModule.createElement(Dialog.Root, { size = DialogSize.Small }, {
		Title = ReactModule.createElement(Dialog.Title, { LayoutOrder = 1, text = UseLocalizationResult.title }),
		Content = ReactModule.createElement(Dialog.Content, { LayoutOrder = 2 }, {
			Text = ReactModule.createElement(Dialog.Text, { Text = UseLocalizationResult.body })
		}),
		Buttons = ReactModule.createElement(Dialog.Actions, {
			LayoutOrder = 3,
			actions = {
				{
					text = UseLocalizationResult.buttonAsk,
					variant = ButtonVariant.Emphasis,
					onActivated = p1.onConfirm
				},
				{
					text = UseLocalizationResult.buttonCancel,
					variant = ButtonVariant.Standard,
					onActivated = p1.onCancel
				}
			}
		})
	})
end

return function(p1)
	-- upvalues: ReactModule (copy), GetFFlagEnableReusableVPCPrologueModule (copy), ConfigurableVPCPrologue (copy), LegacyVPCPrologue (copy)
	return ReactModule.createElement(if GetFFlagEnableReusableVPCPrologueModule() then ConfigurableVPCPrologue else LegacyVPCPrologue, p1)
end