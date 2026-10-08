local authCommon = script:FindFirstAncestor("AuthCommon")
local parent = authCommon.Parent
local roactModule = require(parent.Roact)
local roactRoduxModule = require(parent.RoactRodux)
local UIBloxModule = require(parent.UIBlox)
local foundationModule = require(parent.Foundation)
local normalizeFontFace = foundationModule.Utility.normalizeFontFace
local foundationFontFaceMigration = foundationModule.Utility.Flags.FoundationFontFaceMigration
local text = require(parent.AppCommonLib).Text
local linkButton = UIBloxModule.App.Button.LinkButton
local contextualMenu = UIBloxModule.App.Menu.ContextualMenu
local menuDirection = UIBloxModule.App.Menu.MenuDirection
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local appLinking = require(parent.RoactServiceTags).AppLinking
local roactServices = require(parent.RoactServices).RoactServices
local roactAppPolicy = require(parent.UniversalAppPolicy).RoactAppPolicy
local cryoModule = require(parent.Cryo)
local styleModule = require(parent.Style)
local getTextSize = styleModule.GetTextSize
local useDesignTokens = styleModule.useDesignTokens
local uiMode = require(parent.RobloxAppEnums).UiMode
local useUiModeInfo = require(parent.RobloxAppHooks).useUiModeInfo
local fFlagFoundationStylingOnSignUp = require(parent.SharedFlags).FFlagFoundationStylingOnSignUp
local disclaimerLinksVariantModule = require(authCommon.Enums.DisclaimerLinksVariant)
local fitChildrenModule = require(authCommon.Components.FitChildren)
local navigateDown = require(parent.NavigationRodux).Thunks.NavigateDown
local fFlagSignalsNavP3Dispatch = require(parent.SharedFlags).FFlagSignalsNavP3Dispatch
local var1 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil
local appPage = require(parent.RobloxAppEnums).AppPage
local transitionAnimationModule = require(authCommon.Enums.TransitionAnimation)
local withLocalization = require(parent.Localization).withLocalization
local withStyle = UIBloxModule.Style.withStyle
local openExternalBrowserModule = require(authCommon.Thunks.OpenExternalBrowser)
local urlBuilder = require(parent.UrlBuilder).UrlBuilder
local authAnalyticsModule = require(parent.AuthAnalytics)
local authFormInteraction = authAnalyticsModule.Events.authFormInteraction
local eventStreamConstants = authAnalyticsModule.EventStreamConstants
local disclaimerLinkButtonsModule = require(script.Parent.DisclaimerLinkButtons)
local registerAuditContentModule = require(authCommon.Components.RegisterAuditContent)
local registerAdditionalAuditContentModule = require(authCommon.Components.RegisterAdditionalAuditContent)
local getFFlagEnableAuditForSinglePageSignUp = require(parent.SharedFlags).GetFFlagEnableAuditForSinglePageSignUp
local t = {
	[disclaimerLinksVariantModule.Default] = "TextDefault",
	[disclaimerLinksVariantModule.Link] = nil
}
local t_1 = {
	affordance = foundationModule.Enums.StateLayerAffordance.None
}

local function createFoundationLink(p1, p2, p3, p4, p5)
	-- upvalues: roactModule (ref), foundationModule (ref), t_1 (ref)
	return if p4 then roactModule.createElement(foundationModule.View, {
		tag = "auto-xy padding-small",
		onActivated = p2,
		stateLayer = t_1,
		LayoutOrder = p3
	}, {
		Label = roactModule.createElement(foundationModule.Text, {
			RichText = true,
			Text = `<u>{p1}</u>`,
			tag = `auto-xy content-emphasis {p5 or "text-caption-small"}`
		})
	}) else roactModule.createElement(foundationModule.Button, {
		text = p1,
		variant = foundationModule.Enums.ButtonVariant.Utility,
		size = foundationModule.Enums.ButtonSize.Small,
		onActivated = p2,
		LayoutOrder = p3
	})
end

local disclaimerLinks = roactModule.PureComponent:extend("DisclaimerLinks")

function disclaimerLinks.init(p1)
	-- upvalues: openExternalBrowserModule (ref), appPage (ref), transitionAnimationModule (ref), urlBuilder (ref), authFormInteraction (ref), eventStreamConstants (ref)
	function p5.openDisclaimerLink(p2)
		-- upvalues: p1 (ref), openExternalBrowserModule (copy), appPage (copy), transitionAnimationModule (copy)
		if p1.props.useExternalBrowserForDisclaimerLinks then
			openExternalBrowserModule(p1.props.linking, p2)
			
			return
		end
		p1.props.navigateDown({
			name = appPage.GenericWebPage,
			detail = p2,
			extraProps = {
				title = "",
				transitionAnimation = transitionAnimationModule.SlideInFromRight
			}
		})
	end
	
	function p5.openTermsLink()
		-- upvalues: urlBuilder (copy), p1 (ref), authFormInteraction (copy), eventStreamConstants (copy)
		local var2 = urlBuilder.static.about.terms()
		
		if p1.props.ctx then
			authFormInteraction(p1.props.ctx, eventStreamConstants.Field.TermsOfService, p1.props.state)
		end
		p1.openDisclaimerLink(var2)
	end
	
	function p5.openPrivacyLink()
		-- upvalues: urlBuilder (copy), p1 (ref), authFormInteraction (copy), eventStreamConstants (copy)
		local var2 = urlBuilder.static.about.privacy()
		
		if p1.props.ctx then
			authFormInteraction(p1.props.ctx, eventStreamConstants.Field.PrivacyPolicy, p1.props.state)
		end
		p1.openDisclaimerLink(var2)
	end
end

function disclaimerLinks.render(p1)
	-- upvalues: withLocalization (ref), withStyle (ref), uiMode (ref), fFlagFoundationStylingOnSignUp (ref), t (ref), foundationFontFaceMigration (ref), getTextSize (ref), text (ref), fitChildrenModule (ref), roactModule (ref), imageSetLabel (ref), getFFlagEnableAuditForSinglePageSignUp (ref), registerAuditContentModule (ref), registerAdditionalAuditContentModule (ref), urlBuilder (ref), contextualMenu (ref), menuDirection (ref), linkButton (ref), normalizeFontFace (ref), disclaimerLinksVariantModule (ref), cryoModule (ref), createFoundationLink (ref), disclaimerLinkButtonsModule (ref)
	local isDualLayout = p1.props.isDualLayout
	local loginView = p1.props.tokens.LuaApps.LoginView
	local var2 = if loginView then loginView.boxPadding else 4
	
	return withLocalization({
		termsOfUseText = "CommonUI.Features.Label.Terms",
		termsOfUseTextLong = "CommonUI.Features.Label.TermsOfUse",
		privacyPolicyText = "CommonUI.Features.Label.Privacy",
		privacyPolicyTextLong = "CommonUI.Features.Label.PrivacyPolicy"
	})(function(p2)
		-- upvalues: withStyle (copy), p1 (ref), uiMode (copy), fFlagFoundationStylingOnSignUp (copy), t (copy), isDualLayout (ref), foundationFontFaceMigration (copy), getTextSize (copy), text (copy), var2 (ref), fitChildrenModule (copy), roactModule (copy), imageSetLabel (copy), loginView (ref), getFFlagEnableAuditForSinglePageSignUp (copy), registerAuditContentModule (copy), registerAdditionalAuditContentModule (copy), urlBuilder (copy), contextualMenu (copy), menuDirection (copy), linkButton (copy), normalizeFontFace (copy), disclaimerLinksVariantModule (copy), cryoModule (copy), createFoundationLink (copy), disclaimerLinkButtonsModule (copy)
		return withStyle(function(p3)
			-- upvalues: p1 (copy), uiMode (copy), fFlagFoundationStylingOnSignUp (copy), t (copy), isDualLayout (copy), p2 (ref), foundationFontFaceMigration (copy), getTextSize (copy), text (copy), var2 (copy), fitChildrenModule (copy), roactModule (copy), imageSetLabel (copy), loginView (copy), getFFlagEnableAuditForSinglePageSignUp (copy), registerAuditContentModule (copy), registerAdditionalAuditContentModule (copy), urlBuilder (copy), contextualMenu (copy), menuDirection (copy), linkButton (copy), normalizeFontFace (copy), disclaimerLinksVariantModule (copy), cryoModule (copy), createFoundationLink (copy), disclaimerLinkButtonsModule (copy)
			local var3 = p1.props.uiModeInfo.uiMode == uiMode.TenFoot
			local layoutOrder = p1.props.LayoutOrder
			local var4 = if fFlagFoundationStylingOnSignUp then t[p1.props.variant] else nil
			local baseSize = p3.Font.BaseSize
			local var5 = if isDualLayout then "CommonUI.Features.Label.TermsOfUse" else "CommonUI.Features.Label.Terms"
			local var6 = if isDualLayout then "CommonUI.Features.Label.PrivacyPolicy" else "CommonUI.Features.Label.Privacy"
			local var7 = if isDualLayout then p2.termsOfUseTextLong else p2.termsOfUseText
			local var8 = if isDualLayout then p2.privacyPolicyTextLong else "<b>" .. p8.privacyPolicyText .. "</b>"
			local font = p3.Font.Header2.Font
			local var9 = if foundationFontFaceMigration then getTextSize(" ", baseSize, p3.Tokens.Typography.TitleLarge.Font, Vector2.new(10000, 10000)).X / 2 else text.GetTextWidth(" ", font, baseSize) / 2
			local var10 = if foundationFontFaceMigration then getTextSize("-", baseSize, p3.Tokens.Typography.TitleLarge.Font, Vector2.new(10000, 10000)).X else text.GetTextWidth("-", font, baseSize)
			local var11 = if foundationFontFaceMigration then getTextSize(p2.privacyPolicyText, baseSize, p3.Tokens.Typography.TitleLarge.Font, Vector2.new(10000, 10000)).Y else nil
			local var12 = if isDualLayout then if foundationFontFaceMigration then 2 * (var11 + 2 * var2) else 2 * (text.GetTextHeight(p2.privacyPolicyText, font, baseSize) + 2 * var2) elseif foundationFontFaceMigration then var11 + var2 else text.GetTextHeight(p2.privacyPolicyText, font, baseSize) + var2
			local var13 = if isDualLayout then "Frame" else fitChildrenModule.FitFrame
			
			local var14 = function()
				-- upvalues: roactModule (copy), imageSetLabel (copy), loginView (copy), p3 (ref)
				return {
					Image = roactModule.createElement(imageSetLabel, {
						BackgroundTransparency = 1,
						LayoutOrder = 1,
						ImageTransparency = 0,
						Size = UDim2.new(0, loginView.disclaimerIconSize, 0, loginView.disclaimerIconSize),
						Position = UDim2.fromOffset(0, 0),
						ScaleType = Enum.ScaleType.Fit,
						Image = loginView.linkIcon,
						ImageColor3 = p3.Theme.UIEmphasis.Color
					})
				}
			end
			
			local var15 = function()
				-- upvalues: p1 (copy), getFFlagEnableAuditForSinglePageSignUp (copy), registerAuditContentModule (copy), var7 (ref), roactModule (copy), var5 (ref), var8 (ref), var6 (ref), isDualLayout (copy), p2 (copy), registerAdditionalAuditContentModule (copy), urlBuilder (copy)
				return if p1.props.enableAuditContentCapture and getFFlagEnableAuditForSinglePageSignUp() then {
					TermsAuditContent = registerAuditContentModule and (var7 and roactModule.createElement(registerAuditContentModule, { translationKey = var5, translatedSourceString = var7 })),
					PrivacyAuditContent = registerAuditContentModule and (var8 and roactModule.createElement(registerAuditContentModule, {
						translationKey = var6,
						translatedSourceString = if isDualLayout then p2.privacyPolicyTextLong else p2.privacyPolicyText
					})),
					TermsLinkAuditContent = registerAdditionalAuditContentModule and roactModule.createElement(registerAdditionalAuditContentModule, {
						contentKey = "termsLink",
						value = urlBuilder.static.about.terms()
					}),
					PrivacyLinkAuditContent = registerAdditionalAuditContentModule and roactModule.createElement(registerAdditionalAuditContentModule, {
						contentKey = "privacyLink",
						value = urlBuilder.static.about.privacy()
					})
				} else {}
			end
			
			local var16 = function()
				-- upvalues: roactModule (copy), var9 (ref), isDualLayout (copy), contextualMenu (copy), var7 (ref), p3 (ref), p1 (copy), loginView (copy), var14 (ref), var8 (ref), menuDirection (copy), linkButton (copy), var4 (ref), var10 (ref), foundationFontFaceMigration (copy), font (ref), normalizeFontFace (copy), baseSize (ref)
				return {
					UIListLayout = roactModule.createElement("UIListLayout", {
						Padding = UDim.new(0, var9),
						SortOrder = Enum.SortOrder.LayoutOrder,
						FillDirection = if isDualLayout then Enum.FillDirection.Vertical else Enum.FillDirection.Horizontal,
						HorizontalAlignment = if isDualLayout then Enum.HorizontalAlignment.Left else Enum.HorizontalAlignment.Center,
						VerticalAlignment = Enum.VerticalAlignment.Center
					}),
					ContextualMenu = if isDualLayout then roactModule.createElement(contextualMenu, {
						open = true,
						stayOnActivated = true,
						isElementBackgroundVisible = false,
						isElementDividerVisible = false,
						closeBackgroundVisible = false,
						topElementRounded = false,
						bottomElementRounded = false,
						buttonProps = {
							{
								text = var7,
								fontStyle = p3.Font.Header1,
								onActivated = p1.openTermsLink,
								rightSideGadgetSize = Vector2.new(loginView.disclaimerIconSize + loginView.disclaimerPadding, loginView.disclaimerIconSize),
								renderRightSideGadget = var14
							},
							{
								text = var8,
								fontStyle = p3.Font.Header1,
								onActivated = p1.openPrivacyLink,
								rightSideGadgetSize = Vector2.new(loginView.disclaimerIconSize + loginView.disclaimerPadding, loginView.disclaimerIconSize),
								renderRightSideGadget = var14
							}
						},
						horizontalAlignment = Enum.HorizontalAlignment.Center,
						menuDirection = menuDirection.Down,
						contextMenuWidthOverride = UDim.new(1, 0),
						elementHeight = loginView.disclaimerElementHeight,
						openPositionX = UDim.new(0, 0),
						openPositionY = UDim.new(0, 0),
						screenSize = Vector2.new(0, 0)
					}) else nil,
					TermsOfUse = if not isDualLayout then roactModule.createElement(linkButton, {
						fontStyle = "Header2",
						layoutOrder = 1,
						underlineAlwaysEnabled = true,
						text = var7,
						size = if isDualLayout then UDim2.new(1, 0, 0.5, 0) else UDim2.new(0, 0, 1, 0),
						onActivated = p1.openTermsLink,
						colorStyleDefault = var4,
						colorStyleHover = var4
					}) else nil,
					Hyphen = if not isDualLayout then roactModule.createElement("TextLabel", {
						BackgroundTransparency = 1,
						Text = " ",
						LayoutOrder = 2,
						Size = UDim2.new(0, var10, 1, 0),
						Font = if foundationFontFaceMigration then nil else font,
						FontFace = if foundationFontFaceMigration then normalizeFontFace(p3.Tokens.Typography.TitleLarge.Font) else nil,
						TextColor3 = p3.Theme.TextEmphasis.Color,
						TextTransparency = p3.Theme.TextEmphasis.Transparency,
						TextSize = baseSize
					}) else nil,
					PrivacyPolicy = if not isDualLayout then roactModule.createElement(linkButton, {
						fontStyle = "Header2",
						layoutOrder = 3,
						underlineAlwaysEnabled = true,
						text = var8,
						size = if isDualLayout then UDim2.new(1, 0, 0.5, 0) else UDim2.new(0, 0, 1, 0),
						onActivated = p1.openPrivacyLink,
						colorStyleDefault = var4,
						colorStyleHover = var4
					}) else nil
				}
			end
			
			if p1.props.variant == disclaimerLinksVariantModule.Foundation and not isDualLayout and not var3 then
				return roactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					Size = UDim2.new(0, 0, 0, 0),
					AutomaticSize = Enum.AutomaticSize.XY,
					LayoutOrder = layoutOrder
				}, cryoModule.Dictionary.join({
					UIListLayout = roactModule.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Horizontal,
						HorizontalAlignment = Enum.HorizontalAlignment.Center,
						SortOrder = Enum.SortOrder.LayoutOrder
					}),
					TermsOfUse = createFoundationLink(p2.termsOfUseText, p1.openTermsLink, 1, p1.props.underlineLinks, p1.props.underlinedLinkTextTag),
					PrivacyPolicy = createFoundationLink(p2.privacyPolicyText, p1.openPrivacyLink, 2, p1.props.underlineLinks, p1.props.underlinedLinkTextTag)
				}, var15()))
			elseif var3 then
				return if getFFlagEnableAuditForSinglePageSignUp() then roactModule.createFragment(cryoModule.Dictionary.join({
					DisclaimerLinkButtons = roactModule.createElement(disclaimerLinkButtonsModule, {
						textTos = var7,
						activatedTos = p1.openTermsLink,
						textPrivacy = var8,
						activatedPrivacy = p1.openPrivacyLink,
						fillDirection = p1.props.fillDirection,
						layoutOrder = layoutOrder,
						tokens = loginView
					})
				}, var15())) else roactModule.createElement(disclaimerLinkButtonsModule, {
					textTos = var7,
					activatedTos = p1.openTermsLink,
					textPrivacy = var8,
					activatedPrivacy = p1.openPrivacyLink,
					fillDirection = p1.props.fillDirection,
					layoutOrder = layoutOrder,
					tokens = loginView
				})
			end
			local t_1 = {
				BackgroundTransparency = 1,
				fitAxis = if not isDualLayout then fitChildrenModule.FitAxis.Width else nil,
				Size = UDim2.new(1, 0, 0, var12),
				LayoutOrder = layoutOrder
			}
			
			return if getFFlagEnableAuditForSinglePageSignUp() then roactModule.createElement(var13, t_1, cryoModule.Dictionary.join(var16(), var15())) else roactModule.createElement(var13, t_1, var16())
		end)
	end)
end

-- [0.037s] <RUNTIME-ERROR> : Error block 0 analysis at pc 47 ('luna.Call' object has no attribute 'name')