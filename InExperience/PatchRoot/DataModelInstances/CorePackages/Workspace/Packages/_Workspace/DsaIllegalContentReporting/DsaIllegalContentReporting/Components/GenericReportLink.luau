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
local GenericReportLink1 = game:DefineFastString("GenericReportLink", "https://www.roblox.com/illegal-content-reporting")
local ImproveIllegalContentReportingLinkLook = game:DefineFastFlag("ImproveIllegalContentReportingLinkLook", false)

function GenericReportLink()
	-- upvalues: ImproveIllegalContentReportingLinkLook (copy), ReactModule (copy), UseLocalizationFunction (copy), GetIconRichTextFunction (copy), IconName (copy), Default (copy), GenericReportLink1 (copy), ControlState (copy), View (copy), Text (copy)
	local v1 = nil
	local Callback = nil
	
	if ImproveIllegalContentReportingLinkLook then
		v1, Callback = ReactModule.useState(false)
	end
	local UseLocalizationResult = UseLocalizationFunction({
		GenericReportLinkText = "Feature.ReportAbuse.Label.GenericReportIllegalContentMessage"
	})
	local Text1 = if ImproveIllegalContentReportingLinkLook then `<b>{UseLocalizationResult.GenericReportLinkText}</b> {GetIconRichTextFunction(IconName.ArrowUpRightFromSquare)}` else nil
	local UseResult = if ImproveIllegalContentReportingLinkLook then ReactModule.useCallback(function(Hover)
		-- upvalues: Callback (ref), ControlState (upval)
		Callback(Hover == ControlState.Hover)
	end, {}) else nil
	
	return ReactModule.createElement(View, { tag = "auto-xy col gap-small" }, {
		ReactModule.createElement(Text, {
			RichText = true,
			tag = "auto-xy radius-small padding-xsmall text-wrap text-body-small",
			Text = if ImproveIllegalContentReportingLinkLook then if v1 then `<u>{Text1}</u>` else Text1 else `<b>{UseLocalizationResult.GenericReportLinkText}</b>`,
			onActivated = ReactModule.useCallback(function()
				-- upvalues: Default (upval), GenericReportLink1 (upval)
				Default:openURL(GenericReportLink1)
			end, {}),
			onStateChanged = if ImproveIllegalContentReportingLinkLook then UseResult else nil
		})
	})
end

return ReactModule.memo(GenericReportLink)