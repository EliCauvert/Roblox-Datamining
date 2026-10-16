local GenericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local Parent = GenericAbuseReporting.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local GetIconRichTextFunction = FoundationModule.Utility.getIconRichText
local IconName = FoundationModule.Enums.IconName
local Text = FoundationModule.Text
local _ = require(GenericAbuseReporting.BeduiV2.Hooks.AbuseSheetFlow.AbuseSheetFlowTypes)
local UseArTranslationFunction = require(GenericAbuseReporting.BeduiV2.Utils.Translate.arTranslation).useArTranslation

return ReactModule.memo(function(p1) --[[ Line: 25 | Named "Subtitle" ]]
	-- upvalues: UseArTranslationFunction (copy), ReactModule (copy), IconName (copy), GetIconRichTextFunction (copy), Text (copy)
	local TranslateIntoStringFunction = UseArTranslationFunction().translateIntoString
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 28 ]]
		-- upvalues: p1 (copy), IconName (upval), GetIconRichTextFunction (upval)
		if p1.subtitle and p1.subtitle.leading then
			local IconNameEntry = IconName[p1.subtitle.leading]
			
			if IconNameEntry then
				return GetIconRichTextFunction(IconNameEntry)
			end
		end
		return ""
	end, { p1.subtitle })
	
	return if p1.subtitle then ReactModule.createElement(Text, {
		RichText = true,
		tag = "auto-xy text-body-medium content-default",
		Text = `{UseMemoResult} {TranslateIntoStringFunction(p1.subtitle.text)}`,
		LayoutOrder = p1.layoutOrder
	}) else nil
end)