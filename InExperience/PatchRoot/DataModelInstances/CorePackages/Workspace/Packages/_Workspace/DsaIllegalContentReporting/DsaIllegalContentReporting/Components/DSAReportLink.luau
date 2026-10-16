local DsaIllegalContentReporting = script:FindFirstAncestor("DsaIllegalContentReporting")
local HttpService = game:GetService("HttpService")
local GuiService = game:GetService("GuiService")
local ConstantsModule = require(DsaIllegalContentReporting.Utility.Constants)
local Parent = DsaIllegalContentReporting.Parent
local UIBloxModule = require(Parent.UIBlox)
local ReactModule = require(Parent.React)
local StyleProviderWithDefaultTheme = require(Parent.Style).StyleProviderWithDefaultTheme
local StyledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local ResponsiveModule = require(Parent.Responsive)
local UsePreferredInputFunction = ResponsiveModule.usePreferredInput
local IsInExperienceUIVREnabled = require(Parent.SharedExperimentDefinition).isInExperienceUIVREnabled
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local LinkButton = UIBloxModule.App.Button.LinkButton
local UseStyleFunction = UIBloxModule.Core.Style.useStyle

function DSAReportLink() --[[ Line: 26 ]]
	-- upvalues: UseStyleFunction (copy), UsePreferredInputFunction (copy), ResponsiveModule (copy), IsInExperienceUIVREnabled (copy), UseLocalizationFunction (copy), ReactModule (copy), StyledTextLabel (copy), LinkButton (copy), HttpService (copy), ConstantsModule (copy), GuiService (copy)
	local UseStyleResult = UseStyleFunction()
	local IsUsePreferredInputResultMatch = UsePreferredInputFunction() == ResponsiveModule.Input.Directional
	local UseIsSpatialResult = if IsInExperienceUIVREnabled then ResponsiveModule.useIsSpatial() else false
	local IsUsePreferredInputResultMatch1 = IsUsePreferredInputResultMatch or (if IsInExperienceUIVREnabled then UseIsSpatialResult else false)
	local UseLocalizationResult = UseLocalizationFunction({
		reportLinkText = "Feature.ReportAbuse.DSAIllegal.ReportLink",
		readonlyLinkText = "Feature.DynamicUI.Translation.Reporting.IllegalContentEUBody"
	})
	
	return ReactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1) }, {
		Layout = ReactModule.createElement("UIListLayout", {
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		Padding = ReactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, 16) }),
		Divider = ReactModule.createElement("Frame", {
			BorderSizePixel = 0,
			LayoutOrder = 0,
			BackgroundColor3 = UseStyleResult.Theme.Divider.Color,
			BackgroundTransparency = UseStyleResult.Theme.Divider.Transparency,
			Size = UDim2.new(1, 0, 0, 1),
			Position = UDim2.new(0, 0, 1, 0),
			AnchorPoint = Vector2.new(0, 1)
		}),
		Link = if IsUsePreferredInputResultMatch1 then ReactModule.createElement(StyledTextLabel, {
			layoutOrder = 2,
			lineHeight = 1,
			fluidSizing = true,
			richText = false,
			size = UDim2.new(0, 500, 0, 60),
			text = UseLocalizationResult.readonlyLinkText,
			textXAlignment = Enum.TextXAlignment.Center,
			textYAlignment = Enum.TextYAlignment.Center,
			fontStyle = UseStyleResult.Font.Body,
			colorStyle = UseStyleResult.Theme.TextEmphasis
		}) else ReactModule.createElement(LinkButton, {
			layoutOrder = 2,
			fontStyle = if IsUsePreferredInputResultMatch then "CaptionBody" else "Footer",
			size = UDim2.new(0, 100, 0, 20),
			text = UseLocalizationResult.reportLinkText,
			onActivated = function() --[[ Line: 59 ]]
				-- upvalues: HttpService (upval), ConstantsModule (upval), GuiService (upval)
				GuiService:BroadcastNotification(HttpService:JSONEncode({
					presentationStyle = nil,
					visible = true,
					title = ConstantsModule.HELP_PAGE_TITLE,
					url = ConstantsModule.DSA_REPORT_LINK
				}), 20)
			end
		})
	})
end

function WrapperContainer() --[[ Line: 95 ]]
	-- upvalues: ReactModule (copy), StyleProviderWithDefaultTheme (copy)
	return ReactModule.createElement(StyleProviderWithDefaultTheme, { withDarkTheme = true }, { Button = ReactModule.createElement(DSAReportLink) })
end

return WrapperContainer