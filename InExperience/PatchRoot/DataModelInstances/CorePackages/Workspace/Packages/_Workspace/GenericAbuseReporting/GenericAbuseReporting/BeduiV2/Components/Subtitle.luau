local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local parent = genericAbuseReporting.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local getIconRichText = foundationModule.Utility.getIconRichText
local iconName = foundationModule.Enums.IconName
local text = foundationModule.Text
local _ = require(genericAbuseReporting.BeduiV2.Hooks.AbuseSheetFlow.AbuseSheetFlowTypes)
local useArTranslation = require(genericAbuseReporting.BeduiV2.Utils.Translate.arTranslation).useArTranslation

return reactModule.memo(function(p0) --[[ line: 25 | named "Subtitle" ]]
	-- upvalues: useArTranslation (ref), reactModule (ref), iconName (ref), getIconRichText (ref), text (ref)
	return if p0.subtitle then reactModule.createElement(text, {
		RichText = true,
		tag = "auto-xy text-body-medium content-default",
		Text = `{reactModule.useMemo(function() --[[ line: 28 ]]
			-- upvalues: p0 (ref), iconName (copy), getIconRichText (copy)
			if p0.subtitle and p0.subtitle.leading then
				local leading = iconName[p0.subtitle.leading]
				
				return if leading then getIconRichText(leading) else ""
			end
		end, { p0.subtitle })} {useArTranslation().translateIntoString(p0.subtitle.text)}`,
		LayoutOrder = p0.layoutOrder
	}) else nil
end)