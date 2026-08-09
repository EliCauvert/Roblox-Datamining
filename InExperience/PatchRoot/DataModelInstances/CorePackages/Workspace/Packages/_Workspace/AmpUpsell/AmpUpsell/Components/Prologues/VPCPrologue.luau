local ampUpsell = script:FindFirstAncestor("AmpUpsell")
local parent = ampUpsell.Parent
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local foundationModule = require(parent.Foundation)
local buttonVariant = foundationModule.Enums.ButtonVariant
local dialog = foundationModule.Dialog
local dialogSize = foundationModule.Enums.DialogSize
local vpcPrologueStrings = require(ampUpsell.Common.LocalizationStrings).vpcPrologueStrings

local function _(p0) --[[ line: 21 | named "getBodyLocalizationKey" ]]
	-- upvalues: vpcPrologueStrings (ref)
	if p0 then
		return if p0.enablePurchases == true then vpcPrologueStrings.bodyPurchases elseif p0.contentAgeRestriction == nil then if p0.friendManagementAction == "Unblock" then vpcPrologueStrings.bodyUnblock else vpcPrologueStrings.bodyGeneric else vpcPrologueStrings.bodyContentRestriction
	end
end

return function(p1) --[[ line: 34 | named "VPCPrologue" ]]
	-- upvalues: vpcPrologueStrings (ref), useLocalization (ref), reactModule (ref), dialog (ref), dialogSize (ref), buttonVariant (ref)
	local var3
	local recourseData = p1.recourseData
	
	if recourseData then
		var3 = if recourseData.enablePurchases == true then vpcPrologueStrings.bodyPurchases elseif recourseData.contentAgeRestriction ~= nil then if recourseData.friendManagementAction == "Unblock" then vpcPrologueStrings.bodyUnblock else vpcPrologueStrings.bodyGeneric else vpcPrologueStrings.bodyContentRestriction
	end
	recourseData = useLocalization({
		title = vpcPrologueStrings.title,
		body = var3,
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
					onActivated = p1.onConfirm
				},
				{
					text = recourseData.buttonCancel,
					variant = buttonVariant.Standard,
					onActivated = p1.onCancel
				}
			}
		})
	})
end