local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local Text = require(Parent1.Foundation).Text
local EscapeRichTextModule = require(Parent.Utils.escapeRichText)
local UseLocalizedLabelsModule = require(Parent.Hooks.useLocalizedLabels)

return (ReactModule.memo(function(Frame)
	-- upvalues: UseLocalizedLabelsModule (copy), EscapeRichTextModule (copy), ReactModule (copy), Text (copy)
	local ActionLabels = Frame.actionLabels
	local Labels = {}
	
	for i, actionLabel in ipairs(ActionLabels) do
		Labels[tostring(i)] = actionLabel.label
	end
	local UseLocalizedLabelsModuleResult = UseLocalizedLabelsModule(Labels)
	local List = {}
	
	for i1, actionLabel1 in ipairs(ActionLabels) do
		local EscapeRichTextModuleResult = EscapeRichTextModule(UseLocalizedLabelsModuleResult[tostring(i1)])
		
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