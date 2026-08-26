local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local parent = genericAbuseReporting.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local getIconRichText = foundationModule.Utility.getIconRichText
local iconName = foundationModule.Enums.IconName
local text = foundationModule.Text
local _ = require(genericAbuseReporting.BeduiV2.Hooks.AbuseSheetFlow.AbuseSheetFlowTypes)
local useArTranslation = require(genericAbuseReporting.BeduiV2.Utils.Translate.arTranslation).useArTranslation

return reactModule.memo(function(p1)
	-- upvalues: useArTranslation (ref), reactModule (ref), iconName (ref), getIconRichText (ref), text (ref)
	return if p1.subtitle then reactModule.createElement(text, {
		RichText = true,
		tag = "auto-xy text-body-medium content-default",
		Text = `{reactModule.useMemo(function()
			-- upvalues: p1 (ref), iconName (copy), getIconRichText (copy)
			if p1.subtitle and p1.subtitle.leading then
				local leading = iconName[p1.subtitle.leading]
				
				return if leading then getIconRichText(leading) else ""
			end
		end, { p1.subtitle })} {useArTranslation().translateIntoString(p1.subtitle.text)}`,
		LayoutOrder = p1.layoutOrder
	}) else nil
end)