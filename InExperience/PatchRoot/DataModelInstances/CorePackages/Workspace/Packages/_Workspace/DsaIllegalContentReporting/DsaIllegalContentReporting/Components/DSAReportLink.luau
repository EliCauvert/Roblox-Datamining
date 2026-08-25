local dsaIllegalContentReporting = script:FindFirstAncestor("DsaIllegalContentReporting")
local httpService = game:GetService("HttpService")
local guiService = game:GetService("GuiService")
local constantsModule = require(dsaIllegalContentReporting.Utility.Constants)
local parent = dsaIllegalContentReporting.Parent
local UIBloxModule = require(parent.UIBlox)
local reactModule = require(parent.React)
local styleProviderWithDefaultTheme = require(parent.Style).StyleProviderWithDefaultTheme
local styledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local responsiveModule = require(parent.Responsive)
local usePreferredInput = responsiveModule.usePreferredInput
local isInExperienceUIVREnabled = require(parent.SharedExperimentDefinition).isInExperienceUIVREnabled
local useLocalization = require(parent.Localization).Hooks.useLocalization
local linkButton = UIBloxModule.App.Button.LinkButton
local useStyle = UIBloxModule.Core.Style.useStyle
local _ = { OPEN_CUSTOM_WEBVIEW = 20 }

function DSAReportLink()
	-- upvalues: useStyle (ref), usePreferredInput (ref), responsiveModule (ref), isInExperienceUIVREnabled (ref), useLocalization (ref), reactModule (ref), styledTextLabel (ref), linkButton (ref), httpService (ref), constantsModule (ref), guiService (ref)
	local var7 = useStyle()
	local var8 = usePreferredInput() == responsiveModule.Input.Directional
	local var9 = useLocalization({
		reportLinkText = "Feature.ReportAbuse.DSAIllegal.ReportLink",
		readonlyLinkText = "Feature.DynamicUI.Translation.Reporting.IllegalContentEUBody"
	})
	
	return reactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1) }, {
		Layout = reactModule.createElement("UIListLayout", {
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		Padding = reactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, 16) }),
		Divider = reactModule.createElement("Frame", {
			BorderSizePixel = 0,
			LayoutOrder = 0,
			BackgroundColor3 = var7.Theme.Divider.Color,
			BackgroundTransparency = var7.Theme.Divider.Transparency,
			Size = UDim2.new(1, 0, 0, 1),
			Position = UDim2.new(0, 0, 1, 0),
			AnchorPoint = Vector2.new(0, 1)
		}),
		Link = if var8 or (if isInExperienceUIVREnabled then if isInExperienceUIVREnabled then responsiveModule.useIsSpatial() else false else false) then reactModule.createElement(styledTextLabel, {
			layoutOrder = 2,
			lineHeight = 1,
			fluidSizing = true,
			richText = false,
			size = UDim2.new(0, 500, 0, 60),
			text = var9.readonlyLinkText,
			textXAlignment = Enum.TextXAlignment.Center,
			textYAlignment = Enum.TextYAlignment.Center,
			fontStyle = var7.Font.Body,
			colorStyle = var7.Theme.TextEmphasis
		}) else reactModule.createElement(linkButton, {
			layoutOrder = 2,
			fontStyle = if var8 then "CaptionBody" else "Footer",
			size = UDim2.new(0, 100, 0, 20),
			text = var9.reportLinkText,
			onActivated = function()
				-- upvalues: httpService (copy), constantsModule (copy), guiService (copy)
				guiService:BroadcastNotification(httpService:JSONEncode({
					presentationStyle = nil,
					visible = true,
					title = constantsModule.HELP_PAGE_TITLE,
					url = constantsModule.DSA_REPORT_LINK
				}), 20)
			end
		})
	})
end

function WrapperContainer()
	-- upvalues: reactModule (ref), styleProviderWithDefaultTheme (ref)
	return reactModule.createElement(styleProviderWithDefaultTheme, { withDarkTheme = true }, { Button = reactModule.createElement(DSAReportLink) })
end

return WrapperContainer