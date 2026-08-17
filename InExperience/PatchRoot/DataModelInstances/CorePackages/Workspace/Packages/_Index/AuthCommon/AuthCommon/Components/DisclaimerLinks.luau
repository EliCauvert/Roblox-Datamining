local authCommon = script:FindFirstAncestor("AuthCommon")
local parent = authCommon.Parent
local roactModule = require(parent.Roact)
local roactRoduxModule = require(parent.RoactRodux)
local UIBloxModule = require(parent.UIBlox)
local text = require(parent.AppCommonLib).Text
local linkButton = UIBloxModule.App.Button.LinkButton
local contextualMenu = UIBloxModule.App.Menu.ContextualMenu
local menuDirection = UIBloxModule.App.Menu.MenuDirection
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local appLinking = require(parent.RoactServiceTags).AppLinking
local roactServices = require(parent.RoactServices).RoactServices
local roactAppPolicy = require(parent.UniversalAppPolicy).RoactAppPolicy
local cryoModule = require(parent.Cryo)
local useDesignTokens = require(parent.Style).useDesignTokens
local uiMode = require(parent.RobloxAppEnums).UiMode
local useUiModeInfo = require(parent.RobloxAppHooks).useUiModeInfo
local fFlagFoundationStylingOnSignUp = require(parent.SharedFlags).FFlagFoundationStylingOnSignUp
local disclaimerLinksVariantModule = require(authCommon.Enums.DisclaimerLinksVariant)
local fitChildrenModule = require(authCommon.Components.FitChildren)
local navigateDown = require(parent.NavigationRodux).Thunks.NavigateDown
local fFlagSignalsNavP3Dispatch = require(parent.SharedFlags).FFlagSignalsNavP3Dispatch
local var7 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil
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
local disclaimerLinks = roactModule.PureComponent:extend("DisclaimerLinks")

function disclaimerLinks.init(p0) --[[ line: 62 ]]
	-- upvalues: openExternalBrowserModule (ref), appPage (ref), transitionAnimationModule (ref), urlBuilder (ref), authFormInteraction (ref), eventStreamConstants (ref)
	function p0.openDisclaimerLink(p1) --[[ line: 63 ]]
		-- upvalues: p0 (ref), openExternalBrowserModule (copy), appPage (copy), transitionAnimationModule (copy)
		if p0.props.useExternalBrowserForDisclaimerLinks then
			openExternalBrowserModule(p0.props.linking, p1)
			
			return
		end
		p0.props.navigateDown({
			name = appPage.GenericWebPage,
			detail = p1,
			extraProps = {
				title = "",
				transitionAnimation = transitionAnimationModule.SlideInFromRight
			}
		})
	end
	
	function p0.openTermsLink() --[[ line: 78 ]]
		-- upvalues: urlBuilder (copy), p0 (ref), authFormInteraction (copy), eventStreamConstants (copy)
		local var16 = urlBuilder.static.about.terms()
		
		if p0.props.ctx then
			authFormInteraction(p0.props.ctx, eventStreamConstants.Field.TermsOfService, p0.props.state)
		end
		p0.openDisclaimerLink(var16)
	end
	
	function p0.openPrivacyLink() --[[ line: 86 ]]
		-- upvalues: urlBuilder (copy), p0 (ref), authFormInteraction (copy), eventStreamConstants (copy)
		local var17 = urlBuilder.static.about.privacy()
		
		if p0.props.ctx then
			authFormInteraction(p0.props.ctx, eventStreamConstants.Field.PrivacyPolicy, p0.props.state)
		end
		p0.openDisclaimerLink(var17)
	end
end

function disclaimerLinks.render(p2) --[[ line: 95 ]]
	-- upvalues: withLocalization (ref), withStyle (ref), uiMode (ref), fFlagFoundationStylingOnSignUp (ref), t (ref), text (ref), fitChildrenModule (ref), roactModule (ref), imageSetLabel (ref), getFFlagEnableAuditForSinglePageSignUp (ref), registerAuditContentModule (ref), registerAdditionalAuditContentModule (ref), urlBuilder (ref), contextualMenu (ref), menuDirection (ref), linkButton (ref), cryoModule (ref), disclaimerLinkButtonsModule (ref)
	local isDualLayout = p2.props.isDualLayout
	local loginView = p2.props.tokens.LuaApps.LoginView
	local var18 = if loginView then loginView.boxPadding else 4
	
	return withLocalization({
		termsOfUseText = "CommonUI.Features.Label.Terms",
		termsOfUseTextLong = "CommonUI.Features.Label.TermsOfUse",
		privacyPolicyText = "CommonUI.Features.Label.Privacy",
		privacyPolicyTextLong = "CommonUI.Features.Label.PrivacyPolicy"
	})(function(p3) --[[ line: 106 ]]
		-- upvalues: withStyle (copy), p2 (ref), uiMode (copy), fFlagFoundationStylingOnSignUp (copy), t (copy), isDualLayout (ref), text (copy), var18 (ref), fitChildrenModule (copy), roactModule (copy), imageSetLabel (copy), loginView (ref), getFFlagEnableAuditForSinglePageSignUp (copy), registerAuditContentModule (copy), registerAdditionalAuditContentModule (copy), urlBuilder (copy), contextualMenu (copy), menuDirection (copy), linkButton (copy), cryoModule (copy), disclaimerLinkButtonsModule (copy)
		return withStyle(function(p4) --[[ line: 107 ]]
			-- upvalues: p2 (copy), uiMode (copy), fFlagFoundationStylingOnSignUp (copy), t (copy), isDualLayout (copy), p3 (ref), text (copy), var18 (copy), fitChildrenModule (copy), roactModule (copy), imageSetLabel (copy), loginView (copy), getFFlagEnableAuditForSinglePageSignUp (copy), registerAuditContentModule (copy), registerAdditionalAuditContentModule (copy), urlBuilder (copy), contextualMenu (copy), menuDirection (copy), linkButton (copy), cryoModule (copy), disclaimerLinkButtonsModule (copy)
			local var19 = p2.props.uiModeInfo.uiMode == uiMode.TenFoot
			local layoutOrder = p2.props.LayoutOrder
			local var20 = if fFlagFoundationStylingOnSignUp then t[p2.props.variant] else nil
			local baseSize = p4.Font.BaseSize
			local var21 = if isDualLayout then "CommonUI.Features.Label.TermsOfUse" else "CommonUI.Features.Label.Terms"
			local var22 = if isDualLayout then "CommonUI.Features.Label.PrivacyPolicy" else "CommonUI.Features.Label.Privacy"
			local var23 = if isDualLayout then p3.termsOfUseTextLong else p3.termsOfUseText
			local var24 = if isDualLayout then p3.privacyPolicyTextLong else "<b>" .. p3.privacyPolicyText .. "</b>"
			local font = p4.Font.Header2.Font
			local var25 = text.GetTextWidth(" ", font, baseSize) / 2
			local textWidth = text.GetTextWidth("-", font, baseSize)
			local var27 = if isDualLayout then 2 * (text.GetTextHeight(p3.privacyPolicyText, font, baseSize) + 2 * var18) else text.GetTextHeight(p3.privacyPolicyText, font, baseSize) + var18
			local var28 = if isDualLayout then "Frame" else fitChildrenModule.FitFrame
			
			local var29 = function() --[[ line: 141 ]]
				-- upvalues: roactModule (copy), imageSetLabel (copy), loginView (copy), p4 (ref)
				return {
					Image = roactModule.createElement(imageSetLabel, {
						BackgroundTransparency = 1,
						LayoutOrder = 1,
						ImageTransparency = 0,
						Size = UDim2.new(0, loginView.disclaimerIconSize, 0, loginView.disclaimerIconSize),
						Position = UDim2.fromOffset(0, 0),
						ScaleType = Enum.ScaleType.Fit,
						Image = loginView.linkIcon,
						ImageColor3 = p4.Theme.UIEmphasis.Color
					})
				}
			end
			
			local var30 = function() --[[ line: 156 ]]
				-- upvalues: p2 (copy), getFFlagEnableAuditForSinglePageSignUp (copy), registerAuditContentModule (copy), var23 (ref), roactModule (copy), var21 (ref), var24 (ref), var22 (ref), isDualLayout (copy), p3 (copy), registerAdditionalAuditContentModule (copy), urlBuilder (copy)
				return if p2.props.enableAuditContentCapture and getFFlagEnableAuditForSinglePageSignUp() then {
					TermsAuditContent = registerAuditContentModule and (var23 and roactModule.createElement(registerAuditContentModule, { translationKey = var21, translatedSourceString = var23 })),
					PrivacyAuditContent = registerAuditContentModule and (var24 and roactModule.createElement(registerAuditContentModule, {
						translationKey = var22,
						translatedSourceString = if isDualLayout then p3.privacyPolicyTextLong else p3.privacyPolicyText
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
			
			local var31 = function() --[[ line: 189 ]]
				-- upvalues: roactModule (copy), var25 (ref), isDualLayout (copy), contextualMenu (copy), var23 (ref), p4 (ref), p2 (copy), loginView (copy), var29 (ref), var24 (ref), menuDirection (copy), linkButton (copy), var20 (ref), textWidth (ref), font (ref), baseSize (ref)
				return {
					UIListLayout = roactModule.createElement("UIListLayout", {
						Padding = UDim.new(0, var25),
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
								text = var23,
								fontStyle = p4.Font.Header1,
								onActivated = p2.openTermsLink,
								rightSideGadgetSize = Vector2.new(loginView.disclaimerIconSize + loginView.disclaimerPadding, loginView.disclaimerIconSize),
								renderRightSideGadget = var29
							},
							{
								text = var24,
								fontStyle = p4.Font.Header1,
								onActivated = p2.openPrivacyLink,
								rightSideGadgetSize = Vector2.new(loginView.disclaimerIconSize + loginView.disclaimerPadding, loginView.disclaimerIconSize),
								renderRightSideGadget = var29
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
						text = var23,
						size = if isDualLayout then UDim2.new(1, 0, 0.5, 0) else UDim2.new(0, 0, 1, 0),
						onActivated = p2.openTermsLink,
						colorStyleDefault = var20,
						colorStyleHover = var20
					}) else nil,
					Hyphen = if not isDualLayout then roactModule.createElement("TextLabel", {
						BackgroundTransparency = 1,
						Text = " ",
						LayoutOrder = 2,
						Size = UDim2.new(0, textWidth, 1, 0),
						Font = font,
						TextColor3 = p4.Theme.TextEmphasis.Color,
						TextTransparency = p4.Theme.TextEmphasis.Transparency,
						TextSize = baseSize
					}) else nil,
					PrivacyPolicy = if not isDualLayout then roactModule.createElement(linkButton, {
						fontStyle = "Header2",
						layoutOrder = 3,
						underlineAlwaysEnabled = true,
						text = var24,
						size = if isDualLayout then UDim2.new(1, 0, 0.5, 0) else UDim2.new(0, 0, 1, 0),
						onActivated = p2.openPrivacyLink,
						colorStyleDefault = var20,
						colorStyleHover = var20
					}) else nil
				}
			end
			
			if var19 then
				return if getFFlagEnableAuditForSinglePageSignUp() then roactModule.createFragment(cryoModule.Dictionary.join({
					DisclaimerLinkButtons = roactModule.createElement(disclaimerLinkButtonsModule, {
						textTos = var23,
						activatedTos = p2.openTermsLink,
						textPrivacy = var24,
						activatedPrivacy = p2.openPrivacyLink,
						fillDirection = p2.props.fillDirection,
						layoutOrder = layoutOrder,
						tokens = loginView
					})
				}, var30())) else roactModule.createElement(disclaimerLinkButtonsModule, {
					textTos = var23,
					activatedTos = p2.openTermsLink,
					textPrivacy = var24,
					activatedPrivacy = p2.openPrivacyLink,
					fillDirection = p2.props.fillDirection,
					layoutOrder = layoutOrder,
					tokens = loginView
				})
			end
			local t_1 = {
				BackgroundTransparency = 1,
				fitAxis = if not isDualLayout then fitChildrenModule.FitAxis.Width else nil,
				Size = UDim2.new(1, 0, 0, var27),
				LayoutOrder = layoutOrder
			}
			
			return if getFFlagEnableAuditForSinglePageSignUp() then roactModule.createElement(var28, t_1, cryoModule.Dictionary.join(var31(), var30())) else roactModule.createElement(var28, t_1, var31())
		end)
	end)
end

-- [0.044s] <RUNTIME-ERROR> : Error block 0 analysis at pc 40 ('luna.Call' object has no attribute 'name')