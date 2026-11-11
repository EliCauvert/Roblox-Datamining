local AmpUpsell = script:FindFirstAncestor("AmpUpsell")
local Parent = AmpUpsell.Parent
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local FoundationModule = require(Parent.Foundation)
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local Dialog = FoundationModule.Dialog
local DialogSize = FoundationModule.Enums.DialogSize
local VpcPrologueStrings = require(AmpUpsell.Common.LocalizationStrings).vpcPrologueStrings

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

return function(p1)
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