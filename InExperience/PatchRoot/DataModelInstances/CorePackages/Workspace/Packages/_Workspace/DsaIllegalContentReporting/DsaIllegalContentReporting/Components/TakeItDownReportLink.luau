local Parent = script:FindFirstAncestor("DsaIllegalContentReporting").Parent
local FoundationModule = require(Parent.Foundation)
local Default = require(Parent.LinkingProtocol).LinkingProtocol.default
local ReactModule = require(Parent.React)
local ControlState = FoundationModule.Enums.ControlState
local GetIconRichTextFunction = FoundationModule.Utility.getIconRichText
local IconName = FoundationModule.Enums.IconName
local Text = FoundationModule.Text
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local View = FoundationModule.View
local TakeItDownReportLink = game:DefineFastString("TakeItDownReportLink", "https://www.roblox.com/non-consensual-intimate-imagery-removal-request")

return ReactModule.memo(function(p1) --[[ Line: 27 | Named "TakeItDownReportLink" ]]
	-- upvalues: ReactModule (copy), UseLocalizationFunction (copy), GetIconRichTextFunction (copy), IconName (copy), Default (copy), TakeItDownReportLink (copy), ControlState (copy), View (copy), Text (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local Text1: string = `<b>{UseLocalizationFunction({
		TakeItDownReportLinkText = "Feature.ReportAbuse.Label.TakeItDownCopy"
	}).TakeItDownReportLinkText}</b> {GetIconRichTextFunction(IconName.ArrowUpRightFromSquare)}`
	
	return ReactModule.createElement(View, { tag = "auto-xy", LayoutOrder = p1.layoutOrder }, ReactModule.createElement(Text, {
		RichText = true,
		tag = "auto-xy radius-small padding-xsmall text-wrap text-body-small",
		Text = if UseStateResult then `<u>{Text1}</u>` else Text1,
		onActivated = ReactModule.useCallback(function() --[[ Line: 37 ]]
			-- upvalues: Default (upval), TakeItDownReportLink (upval)
			Default:openURL(TakeItDownReportLink)
		end, {}),
		onStateChanged = ReactModule.useCallback(function(Hover) --[[ Line: 41 ]]
			-- upvalues: UseStateResult2 (copy), ControlState (upval)
			UseStateResult2(Hover == ControlState.Hover)
		end, {})
	}))
end)