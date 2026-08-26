local parent = script:FindFirstAncestor("DsaIllegalContentReporting").Parent
local foundationModule = require(parent.Foundation)
local default = require(parent.LinkingProtocol).LinkingProtocol.default
local localizationModule = require(parent.Localization)
local reactModule = require(parent.React)
local controlState = foundationModule.Enums.ControlState
local getIconRichText = foundationModule.Utility.getIconRichText
local iconName = foundationModule.Enums.IconName
local text = foundationModule.Text
local useLocalization = localizationModule.Hooks.useLocalization
local view = foundationModule.View
local genericReportLink = game:DefineFastString("GenericReportLink", "https://www.roblox.com/illegal-content-reporting")
local improveIllegalContentReportingLinkLook = game:DefineFastFlag("ImproveIllegalContentReportingLinkLook", false)

function GenericReportLink()
	-- upvalues: improveIllegalContentReportingLinkLook (ref), reactModule (ref), useLocalization (ref), getIconRichText (ref), iconName (ref), default (ref), genericReportLink (ref), controlState (ref), view (ref), text (ref)
	local var1 = nil
	local var2 = nil
	
	if improveIllegalContentReportingLinkLook then
		local var3, var4 = reactModule.useState(false)
		var1 = var3
		var2 = var4
	end
	local var5 = useLocalization({
		GenericReportLinkText = "Feature.ReportAbuse.Label.GenericReportIllegalContentMessage"
	})
	local var6 = if improveIllegalContentReportingLinkLook then `<b>{var5.GenericReportLinkText}</b> {getIconRichText(iconName.ArrowUpRightFromSquare)}` else nil
	
	return reactModule.createElement(view, { tag = "auto-xy col gap-small" }, {
		reactModule.createElement(text, {
			RichText = true,
			tag = "auto-xy radius-small padding-xsmall text-wrap text-body-small",
			Text = if improveIllegalContentReportingLinkLook then if var1 then `<u>{var6}</u>` else var6 else `<b>{var5.GenericReportLinkText}</b>`,
			onActivated = reactModule.useCallback(function()
				-- upvalues: default (copy), genericReportLink (copy)
				default:openURL(genericReportLink)
			end, {}),
			onStateChanged = if improveIllegalContentReportingLinkLook then if improveIllegalContentReportingLinkLook then reactModule.useCallback(function(p1)
				-- upvalues: var2 (write), controlState (copy)
				var2(p1 == controlState.Hover)
			end, {}) else nil else nil
		})
	})
end

return reactModule.memo(GenericReportLink)