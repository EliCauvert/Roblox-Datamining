local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local DependenciesModule = require(Parent.dependencies)
local TextService = game:GetService("TextService")
local Roact = DependenciesModule.Roact
local RoactRodux = DependenciesModule.RoactRodux
local UIBlox = DependenciesModule.UIBlox
local Foundation = DependenciesModule.Foundation
local Text = Foundation.Text
local Icon = Foundation.Icon
local Enums = Foundation.Enums
local T = DependenciesModule.t
local RobloxAppEnums = DependenciesModule.RobloxAppEnums
local AppPage = RobloxAppEnums.AppPage
local RoactServices = DependenciesModule.RoactServices.RoactServices
local AppLinking = DependenciesModule.RoactServiceTags.AppLinking
local NavigateDownFunction = DependenciesModule.NavigationRodux.Thunks.NavigateDown
local FFlagSignalsNavP3Dispatch = DependenciesModule.SharedFlags.FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(Parent1.RobloxAppNavigation).NavigationCommands else nil
local NotificationType = RobloxAppEnums.NotificationType
local WithStyleFunction = UIBlox.Core.Style.withStyle
local ArgCheck = DependenciesModule.ArgCheck
local DEPRECATEDImageSetLabelModule = require(script.Parent.DEPRECATED_ImageSetLabel)
local WithLocalizationFunction = DependenciesModule.Localization.withLocalization
local FFlagEnableModularizedUserAgreementsList = DependenciesModule.SharedFlags.FFlagEnableModularizedUserAgreementsList
local GetFFlagVngTOSRevisedEnabledFunction = DependenciesModule.SharedFlags.GetFFlagVngTOSRevisedEnabled
local FFlagKISAUserAgreementsRedesign = DependenciesModule.SharedFlags.FFlagKISAUserAgreementsRedesign
local TrimLongTitleForTOSEnabled = game:DefineFastFlag("TrimLongTitleForTOSEnabled", false)
local RoactAppPolicy = DependenciesModule.UniversalAppPolicy.RoactAppPolicy
local FitFrame = DependenciesModule.FitFrame
local ImageSetLabel = UIBlox.Core.ImageSet.ImageSetLabel
local Images = UIBlox.App.ImageSet.Images
local StyledTextLabel = UIBlox.App.Text.StyledTextLabel
local Config = nil
Config = if game:DefineFastFlag("FixLocalizationOfStudioTermsForVNGSKU", false) then {
	TermsOfService = "CommonUI.UserAgreements.Popup.Agreement.TermsOfService",
	PrivacyPolicy = "CommonUI.UserAgreements.Popup.Agreement.PrivacyPolicy",
	StudioTermsForVNGSKU = "CommonUI.UserAgreements.Popup.Agreement.StudioTermsForVNGSKU"
} else {
	TermsOfService = "CommonUI.UserAgreements.Popup.Agreement.TermsOfService",
	PrivacyPolicy = "CommonUI.UserAgreements.Popup.Agreement.PrivacyPolicy"
}

if game:DefineFastFlag("FixLocalizationOfMissingAgreementTitles", false) then
	Config.PersonalInformationPolicy = "CommonUI.UserAgreements.Popup.Agreement.PersonalInformationPolicy"
	Config.ThirdPartyPersonalInformationPolicy = "CommonUI.UserAgreements.Popup.Agreement.ThirdPartyPersonalInformationPolicy"
	Config.TransferPersonalInformationPolicy = "CommonUI.UserAgreements.Popup.Agreement.TransferPersonalInformationPolicy"
	Config.OptionalPersonalInformationPolicy = "CommonUI.UserAgreements.Popup.Agreement.OptionalPersonalInformationPolicy"
end
local UserAgreementsListItem = Roact.PureComponent:extend("UserAgreementsListItem")
UserAgreementsListItem.validateProps = T.strictInterface({
	LayoutOrder = T.integer,
	Size = if GetFFlagVngTOSRevisedEnabledFunction() then nil else T.UDim2,
	agreement = T.strictInterface({
		id = T.string,
		agreementType = T.string,
		clientType = T.string,
		displayUrl = T.string,
		regulationType = T.string
	}),
	minHeight = T.optional(T.integer),
	margin = T.optional(T.strictInterface({
		top = T.integer,
		right = T.integer,
		bottom = T.integer,
		left = T.integer
	})),
	navigateDown = T.callback,
	agreementTypeExists = T.optional(T.boolean),
	useExternalBrowserForDisclaimerLinks = T.optional(T.boolean),
	linking = T.optional(T.table),
	hideLink = T.optional(T.boolean),
	checkBoxPresent = T.optional(T.boolean)
})
UserAgreementsListItem.defaultProps = {
	agreementTypeExists = false,
	margin = FitFrame.Rect.square(0)
}

function openExternalBrowser(p1, p2)
	-- upvalues: ArgCheck (copy)
	ArgCheck.isNotNil(p1, "linking")
	ArgCheck.isType(p2, "string", "url")
	p1:openURL(p2)
end

function UserAgreementsListItem.init(p1)
	-- upvalues: Roact (copy), FFlagEnableModularizedUserAgreementsList (copy)
	p1.buttonPressed, p1.updateButtonPressed = Roact.createBinding(false)
	
	function p1:onButtonInputBegan(Input)
		-- upvalues: p1 (copy)
		if Input.UserInputType == Enum.UserInputType.Touch or Input.UserInputType == Enum.UserInputType.MouseButton1 then
			if p1.buttonPressed:getValue() then return end
			p1.updateButtonPressed(true)
		end
	end
	
	function p1.onButtonInputEnded()
		-- upvalues: p1 (copy)
		if p1.buttonPressed:getValue() then
			p1.updateButtonPressed(false)
		end
	end
	
	function p1.showLinkText(): boolean
		-- upvalues: FFlagEnableModularizedUserAgreementsList (upval), p1 (copy)
		return if FFlagEnableModularizedUserAgreementsList then not p1.props.hideLink and not p1.props.agreementTypeExists else not p1.props.agreementTypeExists
	end
end

function UserAgreementsListItem.renderWithProviders(p1, p2, p3)
	-- upvalues: FFlagEnableModularizedUserAgreementsList (copy), GetFFlagVngTOSRevisedEnabledFunction (copy), TextService (copy), ImageSetLabel (copy), Images (copy), DEPRECATEDImageSetLabelModule (copy), FFlagKISAUserAgreementsRedesign (copy), Roact (copy), Icon (copy), Enums (copy), TrimLongTitleForTOSEnabled (copy), AppPage (copy), NotificationType (copy), Text (copy), StyledTextLabel (copy)
	local LayoutOrder = p1.props.LayoutOrder
	local Size = p1.props.Size
	local MinHeight = p1.props.minHeight or 55
	local Margin = p1.props.margin
	local CheckBoxPresent = p1.props.checkBoxPresent or false
	local _Font = p3.Font
	local Theme = p3.Theme
	local Tokens = p3.Tokens
	local Negated = -(Margin.left + Margin.right + 14)
	local FontSize350 = if FFlagEnableModularizedUserAgreementsList and CheckBoxPresent then Tokens.FontSize.FontSize_350 else _Font.BaseSize * _Font.Header2.RelativeSize
	local LineHeight = 20 / FontSize350
	local ScaledBaseSize = _Font.BaseSize * _Font.CaptionHeader.RelativeSize
	local LineHeight1 = 14 / ScaledBaseSize
	local DisplayUrl = p1.props.agreement.displayUrl
	local AgreementTitle = p2.agreementTitle
	local ShortTitle = p2.shortTitle
	local Largest = if GetFFlagVngTOSRevisedEnabledFunction() and p1.state.titleTextWidth and p1.state.titleTextWidth > 100 then math.max(MinHeight, TextService:GetTextSize(AgreementTitle, FontSize350, _Font.Body.Font, Vector2.new(p1.state.titleTextWidth, 1e999)).Y + 20 + Margin.top + Margin.bottom) else MinHeight
	local v1 = nil
	local ImageSetLabel1 = nil
	local IconsNavigationPushRight = nil
	
	if FFlagEnableModularizedUserAgreementsList then
		ImageSetLabel1 = ImageSetLabel
		v1 = 3
		IconsNavigationPushRight = Images["icons/navigation/pushRight"]
	else
		ImageSetLabel1 = DEPRECATEDImageSetLabelModule
		v1 = 1
		IconsNavigationPushRight = "LuaApp/icons/navigation/pushRight_small"
	end
	return Roact.createElement("ImageButton", {
		LayoutOrder = LayoutOrder,
		Size = if GetFFlagVngTOSRevisedEnabledFunction() then UDim2.new(1, 0, 0, Largest) else Size,
		AutoButtonColor = false,
		BackgroundColor3 = p3.Theme.BackgroundOnPress.Color,
		BackgroundTransparency = p1.buttonPressed:map(function(p4)
			-- upvalues: p3 (copy)
			return p4 and p3.Theme.BackgroundOnPress.Transparency or 1
		end),
		BorderSizePixel = 0,
		[Roact.Event.InputBegan] = p1.onButtonInputBegan,
		[Roact.Event.InputEnded] = p1.onButtonInputEnded,
		[Roact.Event.Activated] = function()
			-- upvalues: p1 (copy), DisplayUrl (copy), AgreementTitle (copy), TrimLongTitleForTOSEnabled (upval), ShortTitle (copy), AppPage (upval), NotificationType (upval)
			if p1.props.useExternalBrowserForDisclaimerLinks then
				openExternalBrowser(p1.props.linking, DisplayUrl)
				
				return
			else
				p1.props.navigateDown({
					name = AppPage.GenericWebPage,
					detail = DisplayUrl,
					extraProps = {
						title = if TrimLongTitleForTOSEnabled and string.len(AgreementTitle) > 30 then if ShortTitle == nil or ShortTitle == "" then "Terms" else ShortTitle else AgreementTitle,
						notificationType = NotificationType.OPEN_CUSTOM_WEBVIEW
					}
				})
			end
		end
	}, {
		Padding = Roact.createElement("UIPadding", {
			PaddingTop = UDim.new(0, Margin.top),
			PaddingBottom = UDim.new(0, Margin.bottom),
			PaddingLeft = UDim.new(0, Margin.left),
			PaddingRight = if FFlagEnableModularizedUserAgreementsList and CheckBoxPresent then UDim.new(0, Margin.right * 2) else UDim.new(0, 0)
		}),
		TextLayout = Roact.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.new(1, Negated, 1, 0)
		}, {
			ListLayout = Roact.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			TitleText = if FFlagKISAUserAgreementsRedesign then Roact.createElement(Text, {
				LayoutOrder = 1,
				tag = "text-body-medium text-wrap text-align-x-left content-emphasis",
				BackgroundTransparency = 1,
				Size = UDim2.new(if CheckBoxPresent then 0.9 else 1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				Text = AgreementTitle
			}) elseif GetFFlagVngTOSRevisedEnabledFunction() then Roact.createElement(StyledTextLabel, {
				layoutOrder = 1,
				size = UDim2.new(1, 0, 0, 0),
				text = AgreementTitle,
				fontStyle = _Font.Body,
				colorStyle = Theme.TextMuted,
				textXAlignment = Enum.TextXAlignment.Left,
				textYAlignment = Enum.TextYAlignment.Center,
				textTruncate = Enum.TextTruncate.None,
				automaticSize = Enum.AutomaticSize.Y,
				onAbsoluteSizeChange = function(Frame)
					-- upvalues: p1 (copy)
					local AbsoluteSize = Frame.AbsoluteSize
					
					if p1.state.titleTextWidth ~= AbsoluteSize.X then
						p1:setState({ titleTextWidth = AbsoluteSize.X })
					end
				end
			}) else Roact.createElement("TextLabel", {
				LayoutOrder = 1,
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Size = UDim2.new(if FFlagEnableModularizedUserAgreementsList and CheckBoxPresent then 0.9 else 1, 0, 0, if FFlagEnableModularizedUserAgreementsList then 40 else 20),
				Position = UDim2.new(0, 0, 0.5, 0),
				AnchorPoint = Vector2.new(0, 0.5),
				Text = AgreementTitle,
				Font = if FFlagEnableModularizedUserAgreementsList then _Font.Body.Font else _Font.Header2.Font,
				TextSize = FontSize350,
				LineHeight = LineHeight,
				TextColor3 = Theme.TextMuted.Color,
				TextTransparency = Theme.TextMuted.Transparency,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextWrapped = if FFlagEnableModularizedUserAgreementsList then true else false,
				TextYAlignment = Enum.TextYAlignment.Center
			}),
			LinkText = p1.showLinkText() and Roact.createElement("TextLabel", {
				LayoutOrder = 2,
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				TextTransparency = 0.5,
				Size = UDim2.new(1, 0, 0, 14),
				Text = DisplayUrl,
				Font = _Font.Header2.Font,
				TextSize = ScaledBaseSize,
				LineHeight = LineHeight1,
				TextColor3 = Theme.TextEmphasis.Color,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Center,
				TextTruncate = Enum.TextTruncate.AtEnd
			}) or nil
		}),
		RightImage = (function(p4, p5: number, Image)
			-- upvalues: FFlagKISAUserAgreementsRedesign (upval), Roact (upval), Icon (upval), Enums (upval), Margin (copy), FFlagEnableModularizedUserAgreementsList (upval), Theme (copy)
			return if FFlagKISAUserAgreementsRedesign then Roact.createElement(Icon, {
				name = Enums.IconName.ArrowLargeRight,
				size = Enums.IconSize.Medium,
				AnchorPoint = Vector2.new(1, 0.5),
				Position = UDim2.new(1, -Margin.right, 0.5, 0)
			}) else Roact.createElement(p4, {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				AnchorPoint = Vector2.new(1, 0.5),
				Size = UDim2.new(0, 14 * p5, 0, 14 * p5),
				Position = UDim2.new(1, -Margin.right, 0.5, 0),
				Image = Image,
				ImageColor3 = if FFlagEnableModularizedUserAgreementsList then Theme.UIEmphasis.Color else Theme.SecondaryDefault.Color,
				ImageTransparency = if FFlagEnableModularizedUserAgreementsList then 0 else Theme.SecondaryDefault.Transparency
			})
		end)(ImageSetLabel1, v1, IconsNavigationPushRight)
	})
end

function UserAgreementsListItem.render(p1)
	-- upvalues: Config (ref), WithLocalizationFunction (copy), WithStyleFunction (copy)
	return WithLocalizationFunction({
		shortTitle = "CommonUI.UserAgreements.Popup.TitleOnWebview",
		agreementTitle = Config[p1.props.agreement.agreementType] or "CommonUI.UserAgreements.Popup.DefaultAgreementTitle"
	})(function(p2)
		-- upvalues: WithStyleFunction (upval), p1 (copy)
		return WithStyleFunction(function(p3)
			-- upvalues: p1 (upval), p2 (copy)
			return p1:renderWithProviders(p2, p3)
		end)
	end)
end

return (RoactRodux.connect(nil, function(Callback)
	-- upvalues: FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownFunction (copy)
	return {
		navigateDown = function(p1)
			-- upvalues: FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), Callback (copy), NavigateDownFunction (upval)
			if FFlagSignalsNavP3Dispatch then
				NavigationCommands.down(NavigationCommands.fromLegacyPage(p1))
				
				return
			else
				Callback(NavigateDownFunction(p1))
			end
		end
	}
end)((RoactServices.connect({ linking = AppLinking })((RoactAppPolicy.connect(function(p1)
	return {
		useExternalBrowserForDisclaimerLinks = p1.shouldUseExternalBrowserForDisclaimerLinks()
	}
end)(UserAgreementsListItem))))))