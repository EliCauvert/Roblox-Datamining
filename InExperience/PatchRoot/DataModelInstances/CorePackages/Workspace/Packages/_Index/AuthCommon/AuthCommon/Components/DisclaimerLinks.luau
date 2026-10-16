local AuthCommon = script:FindFirstAncestor("AuthCommon")
local Parent = AuthCommon.Parent
local RoactModule = require(Parent.Roact)
local RoactRoduxModule = require(Parent.RoactRodux)
local UIBloxModule = require(Parent.UIBlox)
local FoundationModule = require(Parent.Foundation)
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local Text = require(Parent.AppCommonLib).Text
local LinkButton = UIBloxModule.App.Button.LinkButton
local ContextualMenu = UIBloxModule.App.Menu.ContextualMenu
local MenuDirection = UIBloxModule.App.Menu.MenuDirection
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local AppLinking = require(Parent.RoactServiceTags).AppLinking
local RoactServices = require(Parent.RoactServices).RoactServices
local RoactAppPolicy = require(Parent.UniversalAppPolicy).RoactAppPolicy
local CryoModule = require(Parent.Cryo)
local StyleModule = require(Parent.Style)
local GetTextSizeFunction = StyleModule.GetTextSize
local UseDesignTokens = StyleModule.useDesignTokens
local UiMode = require(Parent.RobloxAppEnums).UiMode
local UseUiModeInfo = require(Parent.RobloxAppHooks).useUiModeInfo
local FFlagFoundationStylingOnSignUp = require(Parent.SharedFlags).FFlagFoundationStylingOnSignUp
local DisclaimerLinksVariantModule = require(AuthCommon.Enums.DisclaimerLinksVariant)
local FitChildrenModule = require(AuthCommon.Components.FitChildren)
local NavigateDownFunction = require(Parent.NavigationRodux).Thunks.NavigateDown
local FFlagSignalsNavP3Dispatch = require(Parent.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(Parent.RobloxAppNavigation).NavigationCommands else nil
local AppPage = require(Parent.RobloxAppEnums).AppPage
local TransitionAnimationModule = require(AuthCommon.Enums.TransitionAnimation)
local WithLocalizationFunction = require(Parent.Localization).withLocalization
local WithStyleFunction = UIBloxModule.Style.withStyle
local OpenExternalBrowserModule = require(AuthCommon.Thunks.OpenExternalBrowser)
local UrlBuilder = require(Parent.UrlBuilder).UrlBuilder
local AuthAnalyticsModule = require(Parent.AuthAnalytics)
local AuthFormInteractionFunction = AuthAnalyticsModule.Events.authFormInteraction
local EventStreamConstants = AuthAnalyticsModule.EventStreamConstants
local DisclaimerLinkButtonsModule = require(script.Parent.DisclaimerLinkButtons)
local RegisterAuditContentModule = require(AuthCommon.Components.RegisterAuditContent)
local RegisterAdditionalAuditContentModule = require(AuthCommon.Components.RegisterAdditionalAuditContent)
local GetFFlagEnableAuditForSinglePageSignUpFunction = require(Parent.SharedFlags).GetFFlagEnableAuditForSinglePageSignUp
local config = {
	[DisclaimerLinksVariantModule.Default] = "TextDefault",
	[DisclaimerLinksVariantModule.Link] = nil
}
local StateLayer = {
	affordance = FoundationModule.Enums.StateLayerAffordance.None
}

local function createFoundationLink(Text, OnActivated, LayoutOrder, UnderlineLinks, UnderlinedLinkTextTag) --[[ Line: 68 ]]
	-- upvalues: RoactModule (copy), FoundationModule (copy), StateLayer (copy)
	return if UnderlineLinks then RoactModule.createElement(FoundationModule.View, {
		tag = "auto-xy padding-small",
		onActivated = OnActivated,
		stateLayer = StateLayer,
		LayoutOrder = LayoutOrder
	}, {
		Label = RoactModule.createElement(FoundationModule.Text, {
			RichText = true,
			Text = `<u>{Text}</u>`,
			tag = `auto-xy content-emphasis {UnderlinedLinkTextTag or "text-caption-small"}`
		})
	}) else RoactModule.createElement(FoundationModule.Button, {
		text = Text,
		variant = FoundationModule.Enums.ButtonVariant.Utility,
		size = FoundationModule.Enums.ButtonSize.Small,
		onActivated = OnActivated,
		LayoutOrder = LayoutOrder
	})
end

local DisclaimerLinks = RoactModule.PureComponent:extend("DisclaimerLinks")

function DisclaimerLinks.init(p1) --[[ Line: 94 ]]
	-- upvalues: OpenExternalBrowserModule (copy), AppPage (copy), TransitionAnimationModule (copy), UrlBuilder (copy), AuthFormInteractionFunction (copy), EventStreamConstants (copy)
	function p1.openDisclaimerLink(Detail) --[[ Line: 95 ]]
		-- upvalues: p1 (copy), OpenExternalBrowserModule (upval), AppPage (upval), TransitionAnimationModule (upval)
		if p1.props.useExternalBrowserForDisclaimerLinks then
			OpenExternalBrowserModule(p1.props.linking, Detail)
			
			return
		else
			p1.props.navigateDown({
				name = AppPage.GenericWebPage,
				detail = Detail,
				extraProps = {
					title = "",
					transitionAnimation = TransitionAnimationModule.SlideInFromRight
				}
			})
		end
	end
	
	function p1.openTermsLink() --[[ Line: 110 ]]
		-- upvalues: UrlBuilder (upval), p1 (copy), AuthFormInteractionFunction (upval), EventStreamConstants (upval)
		local TermsResult = UrlBuilder.static.about.terms()
		
		if p1.props.ctx then
			AuthFormInteractionFunction(p1.props.ctx, EventStreamConstants.Field.TermsOfService, p1.props.state)
		end
		p1.openDisclaimerLink(TermsResult)
	end
	
	function p1.openPrivacyLink() --[[ Line: 118 ]]
		-- upvalues: UrlBuilder (upval), p1 (copy), AuthFormInteractionFunction (upval), EventStreamConstants (upval)
		local PrivacyResult = UrlBuilder.static.about.privacy()
		
		if p1.props.ctx then
			AuthFormInteractionFunction(p1.props.ctx, EventStreamConstants.Field.PrivacyPolicy, p1.props.state)
		end
		p1.openDisclaimerLink(PrivacyResult)
	end
end

function DisclaimerLinks.render(p1) --[[ Line: 127 ]]
	-- upvalues: WithLocalizationFunction (copy), WithStyleFunction (copy), UiMode (copy), FFlagFoundationStylingOnSignUp (copy), config (copy), FoundationFontFaceMigration (copy), GetTextSizeFunction (copy), Text (copy), FitChildrenModule (copy), RoactModule (copy), ImageSetLabel (copy), GetFFlagEnableAuditForSinglePageSignUpFunction (copy), RegisterAuditContentModule (copy), RegisterAdditionalAuditContentModule (copy), UrlBuilder (copy), ContextualMenu (copy), MenuDirection (copy), LinkButton (copy), NormalizeFontFaceFunction (copy), DisclaimerLinksVariantModule (copy), CryoModule (copy), createFoundationLink (copy), DisclaimerLinkButtonsModule (copy)
	local IsDualLayout = p1.props.isDualLayout
	local LoginView = p1.props.tokens.LuaApps.LoginView
	local BoxPadding = if LoginView then LoginView.boxPadding else 4
	
	return WithLocalizationFunction({
		termsOfUseText = "CommonUI.Features.Label.Terms",
		termsOfUseTextLong = "CommonUI.Features.Label.TermsOfUse",
		privacyPolicyText = "CommonUI.Features.Label.Privacy",
		privacyPolicyTextLong = "CommonUI.Features.Label.PrivacyPolicy"
	})(function(p2) --[[ Line: 138 ]]
		-- upvalues: WithStyleFunction (upval), p1 (copy), UiMode (upval), FFlagFoundationStylingOnSignUp (upval), config (upval), IsDualLayout (copy), FoundationFontFaceMigration (upval), GetTextSizeFunction (upval), Text (upval), BoxPadding (copy), FitChildrenModule (upval), RoactModule (upval), ImageSetLabel (upval), LoginView (copy), GetFFlagEnableAuditForSinglePageSignUpFunction (upval), RegisterAuditContentModule (upval), RegisterAdditionalAuditContentModule (upval), UrlBuilder (upval), ContextualMenu (upval), MenuDirection (upval), LinkButton (upval), NormalizeFontFaceFunction (upval), DisclaimerLinksVariantModule (upval), CryoModule (upval), createFoundationLink (upval), DisclaimerLinkButtonsModule (upval)
		return WithStyleFunction(function(p3) --[[ Line: 139 ]]
			-- upvalues: p1 (upval), UiMode (upval), FFlagFoundationStylingOnSignUp (upval), config (upval), IsDualLayout (upval), p2 (copy), FoundationFontFaceMigration (upval), GetTextSizeFunction (upval), Text (upval), BoxPadding (upval), FitChildrenModule (upval), RoactModule (upval), ImageSetLabel (upval), LoginView (upval), GetFFlagEnableAuditForSinglePageSignUpFunction (upval), RegisterAuditContentModule (upval), RegisterAdditionalAuditContentModule (upval), UrlBuilder (upval), ContextualMenu (upval), MenuDirection (upval), LinkButton (upval), NormalizeFontFaceFunction (upval), DisclaimerLinksVariantModule (upval), CryoModule (upval), createFoundationLink (upval), DisclaimerLinkButtonsModule (upval)
			local IsUiModeMatch = p1.props.uiModeInfo.uiMode == UiMode.TenFoot
			local LayoutOrder = p1.props.LayoutOrder
			local Entry = if FFlagFoundationStylingOnSignUp then config[p1.props.variant] else nil
			local BaseSize = p3.Font.BaseSize
			local CommonUIFeaturesLabelTermsOfUse: string = if IsDualLayout then "CommonUI.Features.Label.TermsOfUse" else "CommonUI.Features.Label.Terms"
			local CommonUIFeaturesLabelPrivacyPolicy: string = if IsDualLayout then "CommonUI.Features.Label.PrivacyPolicy" else "CommonUI.Features.Label.Privacy"
			local TermsOfUseTextLong = if IsDualLayout then p2.termsOfUseTextLong else p2.termsOfUseText
			local PrivacyPolicyTextLong = if IsDualLayout then p2.privacyPolicyTextLong else "<b>" .. p2.privacyPolicyText .. "</b>"
			local HeaderFont = p3.Font.Header2.Font
			local XRatio = if FoundationFontFaceMigration then GetTextSizeFunction(" ", BaseSize, p3.Tokens.Typography.TitleLarge.Font, Vector2.new(10000, 10000)).X / 2 else Text.GetTextWidth(" ", HeaderFont, BaseSize) / 2
			local X = if FoundationFontFaceMigration then GetTextSizeFunction("-", BaseSize, p3.Tokens.Typography.TitleLarge.Font, Vector2.new(10000, 10000)).X else Text.GetTextWidth("-", HeaderFont, BaseSize)
			local Y = if FoundationFontFaceMigration then GetTextSizeFunction(p2.privacyPolicyText, BaseSize, p3.Tokens.Typography.TitleLarge.Font, Vector2.new(10000, 10000)).Y else nil
			local ScaledY = if IsDualLayout then if FoundationFontFaceMigration then 2 * (Y + 2 * BoxPadding) else 2 * (Text.GetTextHeight(p2.privacyPolicyText, HeaderFont, BaseSize) + 2 * BoxPadding) elseif FoundationFontFaceMigration then Y + BoxPadding else Text.GetTextHeight(p2.privacyPolicyText, HeaderFont, BaseSize) + BoxPadding
			local Frame = if IsDualLayout then "Frame" else FitChildrenModule.FitFrame
			
			local function RenderRightSideGadget() --[[ Line: 192 ]]
				-- upvalues: RoactModule (upval), ImageSetLabel (upval), LoginView (upval), p3 (copy)
				return {
					Image = RoactModule.createElement(ImageSetLabel, {
						BackgroundTransparency = 1,
						LayoutOrder = 1,
						ImageTransparency = 0,
						Size = UDim2.new(0, LoginView.disclaimerIconSize, 0, LoginView.disclaimerIconSize),
						Position = UDim2.fromOffset(0, 0),
						ScaleType = Enum.ScaleType.Fit,
						Image = LoginView.linkIcon,
						ImageColor3 = p3.Theme.UIEmphasis.Color
					})
				}
			end
			
			local function v59() --[[ Line: 207 ]]
				-- upvalues: p1 (upval), GetFFlagEnableAuditForSinglePageSignUpFunction (upval), RegisterAuditContentModule (upval), TermsOfUseTextLong (copy), RoactModule (upval), CommonUIFeaturesLabelTermsOfUse (copy), PrivacyPolicyTextLong (copy), CommonUIFeaturesLabelPrivacyPolicy (copy), IsDualLayout (upval), p2 (upval), RegisterAdditionalAuditContentModule (upval), UrlBuilder (upval)
				return if p1.props.enableAuditContentCapture and GetFFlagEnableAuditForSinglePageSignUpFunction() then {
					TermsAuditContent = RegisterAuditContentModule and (TermsOfUseTextLong and RoactModule.createElement(RegisterAuditContentModule, {
						translationKey = CommonUIFeaturesLabelTermsOfUse,
						translatedSourceString = TermsOfUseTextLong
					})),
					PrivacyAuditContent = RegisterAuditContentModule and (PrivacyPolicyTextLong and RoactModule.createElement(RegisterAuditContentModule, {
						translationKey = CommonUIFeaturesLabelPrivacyPolicy,
						translatedSourceString = if IsDualLayout then p2.privacyPolicyTextLong else p2.privacyPolicyText
					})),
					TermsLinkAuditContent = RegisterAdditionalAuditContentModule and RoactModule.createElement(RegisterAdditionalAuditContentModule, {
						contentKey = "termsLink",
						value = UrlBuilder.static.about.terms()
					}),
					PrivacyLinkAuditContent = RegisterAdditionalAuditContentModule and RoactModule.createElement(RegisterAdditionalAuditContentModule, {
						contentKey = "privacyLink",
						value = UrlBuilder.static.about.privacy()
					})
				} else {}
			end
			
			local function v60() --[[ Line: 240 ]]
				-- upvalues: RoactModule (upval), XRatio (copy), IsDualLayout (upval), ContextualMenu (upval), TermsOfUseTextLong (copy), p3 (copy), p1 (upval), LoginView (upval), RenderRightSideGadget (copy), PrivacyPolicyTextLong (copy), MenuDirection (upval), LinkButton (upval), Entry (copy), X (copy), FoundationFontFaceMigration (upval), HeaderFont (copy), NormalizeFontFaceFunction (upval), BaseSize (copy)
				return {
					UIListLayout = RoactModule.createElement("UIListLayout", {
						Padding = UDim.new(0, XRatio),
						SortOrder = Enum.SortOrder.LayoutOrder,
						FillDirection = if IsDualLayout then Enum.FillDirection.Vertical else Enum.FillDirection.Horizontal,
						HorizontalAlignment = if IsDualLayout then Enum.HorizontalAlignment.Left else Enum.HorizontalAlignment.Center,
						VerticalAlignment = Enum.VerticalAlignment.Center
					}),
					ContextualMenu = if IsDualLayout then RoactModule.createElement(ContextualMenu, {
						open = true,
						stayOnActivated = true,
						isElementBackgroundVisible = false,
						isElementDividerVisible = false,
						closeBackgroundVisible = false,
						topElementRounded = false,
						bottomElementRounded = false,
						buttonProps = {
							{
								text = TermsOfUseTextLong,
								fontStyle = p3.Font.Header1,
								onActivated = p1.openTermsLink,
								rightSideGadgetSize = Vector2.new(LoginView.disclaimerIconSize + LoginView.disclaimerPadding, LoginView.disclaimerIconSize),
								renderRightSideGadget = RenderRightSideGadget
							},
							{
								text = PrivacyPolicyTextLong,
								fontStyle = p3.Font.Header1,
								onActivated = p1.openPrivacyLink,
								rightSideGadgetSize = Vector2.new(LoginView.disclaimerIconSize + LoginView.disclaimerPadding, LoginView.disclaimerIconSize),
								renderRightSideGadget = RenderRightSideGadget
							}
						},
						horizontalAlignment = Enum.HorizontalAlignment.Center,
						menuDirection = MenuDirection.Down,
						contextMenuWidthOverride = UDim.new(1, 0),
						elementHeight = LoginView.disclaimerElementHeight,
						openPositionX = UDim.new(0, 0),
						openPositionY = UDim.new(0, 0),
						screenSize = Vector2.new(0, 0)
					}) else nil,
					TermsOfUse = if IsDualLayout then nil else RoactModule.createElement(LinkButton, {
						fontStyle = "Header2",
						layoutOrder = 1,
						underlineAlwaysEnabled = true,
						text = TermsOfUseTextLong,
						size = if IsDualLayout then UDim2.new(1, 0, 0.5, 0) else UDim2.new(0, 0, 1, 0),
						onActivated = p1.openTermsLink,
						colorStyleDefault = Entry,
						colorStyleHover = Entry
					}),
					Hyphen = if IsDualLayout then nil else RoactModule.createElement("TextLabel", {
						BackgroundTransparency = 1,
						Text = " ",
						LayoutOrder = 2,
						Size = UDim2.new(0, X, 1, 0),
						Font = if FoundationFontFaceMigration then nil else HeaderFont,
						FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(p3.Tokens.Typography.TitleLarge.Font) else nil,
						TextColor3 = p3.Theme.TextEmphasis.Color,
						TextTransparency = p3.Theme.TextEmphasis.Transparency,
						TextSize = BaseSize
					}),
					PrivacyPolicy = if IsDualLayout then nil else RoactModule.createElement(LinkButton, {
						fontStyle = "Header2",
						layoutOrder = 3,
						underlineAlwaysEnabled = true,
						text = PrivacyPolicyTextLong,
						size = if IsDualLayout then UDim2.new(1, 0, 0.5, 0) else UDim2.new(0, 0, 1, 0),
						onActivated = p1.openPrivacyLink,
						colorStyleDefault = Entry,
						colorStyleHover = Entry
					})
				}
			end
			
			if p1.props.variant == DisclaimerLinksVariantModule.Foundation and not IsDualLayout and not IsUiModeMatch then
				return RoactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					Size = UDim2.new(0, 0, 0, 0),
					AutomaticSize = Enum.AutomaticSize.XY,
					LayoutOrder = LayoutOrder
				}, CryoModule.Dictionary.join({
					UIListLayout = RoactModule.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Horizontal,
						HorizontalAlignment = Enum.HorizontalAlignment.Center,
						SortOrder = Enum.SortOrder.LayoutOrder
					}),
					TermsOfUse = createFoundationLink(p2.termsOfUseText, p1.openTermsLink, 1, p1.props.underlineLinks, p1.props.underlinedLinkTextTag),
					PrivacyPolicy = createFoundationLink(p2.privacyPolicyText, p1.openPrivacyLink, 2, p1.props.underlineLinks, p1.props.underlinedLinkTextTag)
				}, (v59())))
			elseif IsUiModeMatch then
				return if GetFFlagEnableAuditForSinglePageSignUpFunction() then RoactModule.createFragment(CryoModule.Dictionary.join({
					DisclaimerLinkButtons = RoactModule.createElement(DisclaimerLinkButtonsModule, {
						textTos = TermsOfUseTextLong,
						activatedTos = p1.openTermsLink,
						textPrivacy = PrivacyPolicyTextLong,
						activatedPrivacy = p1.openPrivacyLink,
						fillDirection = p1.props.fillDirection,
						layoutOrder = LayoutOrder,
						tokens = LoginView
					})
				}, (v59()))) else RoactModule.createElement(DisclaimerLinkButtonsModule, {
					textTos = TermsOfUseTextLong,
					activatedTos = p1.openTermsLink,
					textPrivacy = PrivacyPolicyTextLong,
					activatedPrivacy = p1.openPrivacyLink,
					fillDirection = p1.props.fillDirection,
					layoutOrder = LayoutOrder,
					tokens = LoginView
				})
			else
				local config1 = {
					BackgroundTransparency = 1,
					fitAxis = if IsDualLayout then nil else FitChildrenModule.FitAxis.Width,
					Size = UDim2.new(1, 0, 0, ScaledY),
					LayoutOrder = LayoutOrder
				}
				
				return if GetFFlagEnableAuditForSinglePageSignUpFunction() then RoactModule.createElement(Frame, config1, CryoModule.Dictionary.join(v60(), (v59()))) else RoactModule.createElement(Frame, config1, (v60()))
			end
		end)
	end)
end

local v1 = RoactServices.connect({ linking = AppLinking })((RoactAppPolicy.connect(function(p1) --[[ Line: 433 ]]
	return {
		useExternalBrowserForDisclaimerLinks = p1.shouldUseExternalBrowserForDisclaimerLinks()
	}
end)((RoactRoduxModule.connect(function(_, _) --[[ Line: 419 ]]
	return {}
end, function(Callback) --[[ Line: 421 ]]
	-- upvalues: FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownFunction (copy)
	return {
		navigateDown = function(p1) --[[ Line: 423 ]]
			-- upvalues: FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), Callback (copy), NavigateDownFunction (upval)
			return if FFlagSignalsNavP3Dispatch then NavigationCommands.down(NavigationCommands.fromLegacyPage(p1)) else Callback(NavigateDownFunction(p1))
		end
	}
end)(DisclaimerLinks)))))

return function(p1) --[[ Line: 444 ]]
	-- upvalues: UseDesignTokens (copy), UseUiModeInfo (copy), RoactModule (copy), v1 (copy), CryoModule (copy)
	return RoactModule.createElement(v1, CryoModule.Dictionary.join({ tokens = UseDesignTokens(), uiModeInfo = UseUiModeInfo() }, p1))
end