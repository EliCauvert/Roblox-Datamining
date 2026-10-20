local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local UseLocalizationFunction = require(Parent1.Localization).Hooks.useLocalization
local Text = require(Parent1.Foundation).Text
local EscapeRichTextModule = require(Parent.Utils.escapeRichText)

return (ReactModule.memo(function(Frame)
	-- upvalues: UseLocalizationFunction (copy), EscapeRichTextModule (copy), ReactModule (copy), Text (copy)
	local ActionLabels = Frame.actionLabels
	local Labels = {}
	
	for i, actionLabel in ipairs(ActionLabels) do
		Labels[tostring(i)] = actionLabel.label
	end
	Labels.genericAction = "InGame.HelpMenu.GenericAction"
	local UseLocalizationResult = UseLocalizationFunction(Labels)
	local List = {}
	
	for i1, actionLabel1 in ipairs(ActionLabels) do
		local UseLocalizationResultEntry = UseLocalizationResult[tostring(i1)]
		
		if UseLocalizationResultEntry == nil or UseLocalizationResultEntry == "" then
			UseLocalizationResultEntry = UseLocalizationResult.genericAction
		end
		local EscapeRichTextModuleResult = EscapeRichTextModule(UseLocalizationResultEntry)
		
		if actionLabel1.disabled then
			EscapeRichTextModuleResult = "<font transparency=\"0.5\">" .. EscapeRichTextModuleResult .. "</font>"
		end
		table.insert(List, EscapeRichTextModuleResult)
	end
	return ReactModule.createElement(Text, {
		RichText = true,
		tag = {
			["size-full-0 auto-y text-wrap"] = true,
			["text-label-small"] = Frame.textVariant == "label-small",
			["text-title-large"] = Frame.textVariant ~= "label-small"
		},
		Text = table.concat(List, " / "),
		TextXAlignment = Frame.textXAlignment or Enum.TextXAlignment.Center,
		LayoutOrder = Frame.LayoutOrder,
		testId = Frame.testId
	})
end))