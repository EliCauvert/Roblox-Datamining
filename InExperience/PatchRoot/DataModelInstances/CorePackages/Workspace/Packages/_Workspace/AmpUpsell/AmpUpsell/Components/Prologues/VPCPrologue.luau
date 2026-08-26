local ampUpsell = script:FindFirstAncestor("AmpUpsell")
local parent = ampUpsell.Parent
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local foundationModule = require(parent.Foundation)
local buttonVariant = foundationModule.Enums.ButtonVariant
local dialog = foundationModule.Dialog
local dialogSize = foundationModule.Enums.DialogSize
local orientation = foundationModule.Enums.Orientation
local vpcPrologueStrings = require(ampUpsell.Common.LocalizationStrings).vpcPrologueStrings
local _ = require(ampUpsell.Common.Types)
local getFFlagEnableReusableVPCPrologueModule = require(ampUpsell.Flags.GetFFlagEnableReusableVPCPrologue)

local function _(p1)
	-- upvalues: vpcPrologueStrings (ref)
	if p1 then
		return if p1.enablePurchases == true then vpcPrologueStrings.bodyPurchases elseif p1.contentAgeRestriction == nil then if p1.friendManagementAction == "Unblock" then vpcPrologueStrings.bodyUnblock else vpcPrologueStrings.bodyGeneric else vpcPrologueStrings.bodyContentRestriction
	end
end

local function ConfigurableVPCPrologue(p1)
	-- upvalues: useLocalization (ref), vpcPrologueStrings (ref), buttonVariant (ref), reactModule (ref), dialog (ref), dialogSize (ref), orientation (ref)
	local var1
	local config = p1.config or {}
	local t = { title = vpcPrologueStrings.title }
	local recourseData = p1.recourseData
	
	if not recourseData then
		t.body = var1
		t.buttonAsk = vpcPrologueStrings.buttonAsk
		t.buttonCancel = vpcPrologueStrings.buttonCancel
		local var2 = useLocalization(t)
		local list = {
			{
				text = config.confirmText or var2.buttonAsk,
				variant = buttonVariant.Emphasis,
				onActivated = p1.onConfirm
			}
		}
		
		if not config.hideCancel then
			table.insert(list, if config.cancelFirst then 1 else 2, {
				text = config.cancelText or var2.buttonCancel,
				variant = buttonVariant.Standard,
				onActivated = p1.onCancel
			})
		end
		local var3 = not config.omitLayoutOrder
		
		return reactModule.createElement(dialog.Root, {
			size = if config.dialogSize == "Medium" then dialogSize.Medium else dialogSize.Small,
			hasBackdrop = config.hasBackdrop,
			closeOnClickOutside = config.closeOnClickOutside,
			onClose = if config.onClose then config.onClose elseif config.onCloseCancels then p1.onCancel else nil
		}, {
			Title = reactModule.createElement(dialog.Title, {
				LayoutOrder = if var3 then 1 else nil,
				text = config.titleText or var2.title
			}),
			Content = reactModule.createElement(dialog.Content, { LayoutOrder = if var3 then 2 else nil }, {
				Text = config.bodyContent or reactModule.createElement(dialog.Text, { Text = config.bodyText or var2.body })
			}),
			Buttons = reactModule.createElement(dialog.Actions, {
				LayoutOrder = if var3 then 3 else nil,
				orientation = if config.actionOrientation == "Vertical" then orientation.Vertical elseif config.actionOrientation == "Horizontal" then orientation.Horizontal else nil,
				actions = list
			})
		})
	var1 = if recourseData.enablePurchases == true then vpcPrologueStrings.bodyPurchases elseif recourseData.contentAgeRestriction ~= nil then if recourseData.friendManagementAction == "Unblock" then vpcPrologueStrings.bodyUnblock else vpcPrologueStrings.bodyGeneric else vpcPrologueStrings.bodyContentRestriction
end

local function LegacyVPCPrologue(p2)
	-- upvalues: vpcPrologueStrings (ref), useLocalization (ref), reactModule (ref), dialog (ref), dialogSize (ref), buttonVariant (ref)
	local var4
	local recourseData = p2.recourseData
	
	if recourseData then
		var4 = if recourseData.enablePurchases == true then vpcPrologueStrings.bodyPurchases elseif recourseData.contentAgeRestriction ~= nil then if recourseData.friendManagementAction == "Unblock" then vpcPrologueStrings.bodyUnblock else vpcPrologueStrings.bodyGeneric else vpcPrologueStrings.bodyContentRestriction
	end
	recourseData = useLocalization({
		title = vpcPrologueStrings.title,
		body = var4,
		buttonAsk = vpcPrologueStrings.buttonAsk,
		buttonCancel = vpcPrologueStrings.buttonCancel
	})
	
	return reactModule.createElement(dialog.Root, { size = dialogSize.Small }, {
		Title = reactModule.createElement(dialog.Title, { LayoutOrder = 1, text = recourseData.title }),
		Content = reactModule.createElement(dialog.Content, { LayoutOrder = 2 }, {
			Text = reactModule.createElement(dialog.Text, { Text = recourseData.body })
		}),
		Buttons = reactModule.createElement(dialog.Actions, {
			LayoutOrder = 3,
			actions = {
				{
					text = recourseData.buttonAsk,
					variant = buttonVariant.Emphasis,
					onActivated = p2.onConfirm
				},
				{
					text = recourseData.buttonCancel,
					variant = buttonVariant.Standard,
					onActivated = p2.onCancel
				}
			}
		})
	})
end

return function(p2)
	-- upvalues: reactModule (ref), getFFlagEnableReusableVPCPrologueModule (ref), ConfigurableVPCPrologue (ref), LegacyVPCPrologue (ref)
	return reactModule.createElement(if getFFlagEnableReusableVPCPrologueModule() then ConfigurableVPCPrologue else LegacyVPCPrologue, p2)
end