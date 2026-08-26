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
local takeItDownReportLink = game:DefineFastString("TakeItDownReportLink", "https://www.roblox.com/non-consensual-intimate-imagery-removal-request")

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), useLocalization (ref), getIconRichText (ref), iconName (ref), default (ref), takeItDownReportLink (ref), controlState (ref), view (ref), text (ref)
	local var1, var2 = reactModule.useState(false)
	local takeItDownReportLinkText = `<b>{useLocalization({
		TakeItDownReportLinkText = "Feature.ReportAbuse.Label.TakeItDownCopy"
	}).TakeItDownReportLinkText}</b> {getIconRichText(iconName.ArrowUpRightFromSquare)}`
	
	return reactModule.createElement(view, { tag = "auto-xy", LayoutOrder = p1.layoutOrder }, reactModule.createElement(text, {
		RichText = true,
		tag = "auto-xy radius-small padding-xsmall text-wrap text-body-small",
		Text = if var1 then `<u>{takeItDownReportLinkText}</u>` else takeItDownReportLinkText,
		onActivated = reactModule.useCallback(function()
			-- upvalues: default (copy), takeItDownReportLink (copy)
			default:openURL(takeItDownReportLink)
		end, {}),
		onStateChanged = reactModule.useCallback(function(p2)
			-- upvalues: var2 (ref), controlState (copy)
			var2(p2 == controlState.Hover)
		end, {})
	}))
end)