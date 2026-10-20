local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local UrlBuilder = require(Parent1.UrlBuilder).UrlBuilder
local NavigateDownFunction = require(Parent1.NavigationRodux).Thunks.NavigateDown
local FFlagSignalsNavP3Dispatch = require(Parent1.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(Parent1.RobloxAppNavigation).NavigationCommands else nil
local UseDispatchFunction = require(Parent1.RoactUtils).Hooks.RoactRodux.useDispatch
local AppPage = require(Parent1.RobloxAppEnums).AppPage
local TextService = game:GetService("TextService")
local VerifiedBadgesModule = require(Parent1.VerifiedBadges)
local ReactModule = require(Parent1.React)
local GetTextSizeFunction = require(Parent1.Style).GetTextSize
local UIBloxModule = require(Parent1.UIBlox)
local PartialPageModal = UIBloxModule.App.Dialog.Modal.PartialPageModal
local GetPartialPageModalMiddleContentWidthFunction = UIBloxModule.App.Dialog.Modal.getPartialPageModalMiddleContentWidth
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local WithStyleFunction = UIBloxModule.Style.withStyle
local FoundationModule = require(Parent1.Foundation)
local View = FoundationModule.View
local Text = FoundationModule.Text
local Enums = FoundationModule.Enums
local GetIconRichTextFunction = FoundationModule.Utility.getIconRichText
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local UseTokensFunction = FoundationModule.Hooks.useTokens
local MultiTextLocalizerModule = require(Parent.Locale.MultiTextLocalizer)
local SubscriptionTitleModule = require(Parent.Subscription.SubscriptionTitle)
local FFlagHideDevSubsPriceIfSubscribed = require(Parent.Parent.SharedFlags).FFlagHideDevSubsPriceIfSubscribed
local FFlagEnableDevSubsFastFollowFixes = require(Parent.Parent.SharedFlags).FFlagEnableDevSubsFastFollowFixes

local function generateTestmodeDisclaimer(FooterText, p1, Theme, X, p2)
	-- upvalues: FoundationFontFaceMigration (copy), GetTextSizeFunction (copy), TextService (copy), ReactModule (copy), NormalizeFontFaceFunction (copy)
	return ReactModule.createElement("Frame", {
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		LayoutOrder = 2,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.new(0.5, 0, 0, 16),
		Size = UDim2.new(1, -48, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y
	}, {
		DisclaimerText = ReactModule.createElement("TextLabel", {
			LayoutOrder = 1,
			BackgroundTransparency = 1,
			TextWrapped = true,
			TextSize = 12,
			Size = UDim2.new(1, 0, 0, if FoundationFontFaceMigration then GetTextSizeFunction(FooterText, 12, p2.Typography.CaptionSmall.Font, Vector2.new(X, 1e999), { addTemporaryPadding = false }).Y + 2 else TextService:GetTextSize(FooterText, 12, p1.Footer.Font, Vector2.new(X, 1e999)).Y + 2),
			Font = if FoundationFontFaceMigration then nil else p1.Footer.Font,
			FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(p2.Typography.CaptionSmall.Font) else nil,
			TextXAlignment = Enum.TextXAlignment.Left,
			Text = FooterText,
			TextColor3 = Theme.TextDefault.Color
		})
	})
end

local function generatePromptText(p1, p2, Theme, XOffset, Callback, p3, p4)
	-- upvalues: ReactModule (copy), FoundationFontFaceMigration (copy), NormalizeFontFaceFunction (copy), GetTextSizeFunction (copy), TextService (copy)
	return ReactModule.createElement("TextLabel", {
		LayoutOrder = p3 or 2,
		BackgroundTransparency = 1,
		Size = UDim2.new(0, XOffset, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		TextXAlignment = Enum.TextXAlignment.Left,
		Font = if FoundationFontFaceMigration then nil else p2.Body.Font,
		FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(p4.Typography.BodyLarge.Font) else nil,
		Text = p1.description,
		TextSize = 16,
		TextWrapped = true,
		TextColor3 = Theme.TextDefault.Color,
		TextTransparency = Theme.TextDefault.Transparency,
		RichText = true,
		[ReactModule.Change.AbsoluteSize] = function(Frame: Frame)
			-- upvalues: FoundationFontFaceMigration (upval), GetTextSizeFunction (upval), p4 (copy), TextService (upval), Callback (copy)
			Callback(if FoundationFontFaceMigration then GetTextSizeFunction(Frame.Text, Frame.TextSize, p4.Typography.BodyLarge.Font, Vector2.new(Frame.AbsoluteSize.X, 1e999), { addTemporaryPadding = false }).Y else TextService:GetTextSize(Frame.Text, Frame.TextSize, Frame.Font, Vector2.new(Frame.AbsoluteSize.X, 1e999)).Y)
		end
	})
end

local function createSubscribeButtonStacks(p1, p2)
	-- upvalues: ButtonType (copy)
	return if p1.disablePurchase then {
		{
			buttonType = ButtonType.PrimarySystem,
			props = {
				isDisabled = true,
				layoutOrder = 0,
				onActivated = function() end,
				text = p1.disablePurchaseText
			}
		}
	} elseif p1.secondaryPaymentMethod == nil or p1.secondaryPaymentMethod == "" then {
		{
			buttonType = ButtonType.PrimarySystem,
			props = {
				layoutOrder = 0,
				onActivated = function()
					-- upvalues: p1 (copy)
					p1.purchaseSubscriptionActivated(p1.primaryPaymentMethod)
				end,
				text = p2.subscribe
			}
		}
	} else {
		{
			buttonType = ButtonType.PrimarySystem,
			props = {
				layoutOrder = 0,
				onActivated = function()
					-- upvalues: p1 (copy)
					p1.purchaseSubscriptionActivated(p1.primaryPaymentMethod)
				end,
				text = if p1.primaryPaymentMethod == "Stripe" then p2.subscribeWithCreditDebitCard elseif p1.primaryPaymentMethod == "CreditBalance" then p2.subscribeWithRobloxCredit else nil
			}
		},
		{
			buttonType = ButtonType.Secondary,
			props = {
				layoutOrder = 1,
				onActivated = function()
					-- upvalues: p1 (copy)
					p1.purchaseSubscriptionActivated(p1.secondaryPaymentMethod)
				end,
				text = p2.payAnotherWay
			}
		}
	}
end

local function generateDisclosure(p1, OnActivated)
	-- upvalues: ReactModule (copy), View (copy), Text (copy)
	local Parts = string.split(p1.DisclosureTermsURL, " {termsofuse} ")
	
	return ReactModule.createElement(View, {
		tag = "row wrap auto-y align-y-center align-x-center size-full-0 gap-xsmall padding-x-xsmall padding-bottom-xsmall"
	}, {
		DisclosurePayment = ReactModule.createElement(Text, {
			LayoutOrder = 1,
			tag = "auto-xy text-body content-default text-align-x-left content-muted text-caption-small",
			Text = p1.DisclosurePayment
		}),
		BeforeText = ReactModule.createElement(Text, {
			LayoutOrder = 2,
			tag = "auto-xy text-body content-default text-align-x-left content-muted text-caption-small",
			Text = Parts[1]
		}),
		TextLink = ReactModule.createElement(Text, {
			LayoutOrder = 3,
			RichText = true,
			tag = "auto-xy text-body content-default text-align-x-left content-muted text-caption-small",
			Text = "<u>" .. p1.TermsOfUse .. "</u>",
			onActivated = OnActivated
		}),
		AfterText = ReactModule.createElement(Text, {
			LayoutOrder = 4,
			tag = "auto-xy text-body content-default text-align-x-left content-muted text-caption-small",
			Text = Parts[2]
		})
	})
end

local function renderNewModalDesign(p1, p2, Theme, p3, X, YOffset: number, OnActivated, CalculatePromptHeight, p4)
	-- upvalues: VerifiedBadgesModule (copy), GetIconRichTextFunction (copy), Enums (copy), ReactModule (copy), PartialPageModal (copy), createSubscribeButtonStacks (copy), generateTestmodeDisclaimer (copy), FFlagEnableDevSubsFastFollowFixes (copy), generateDisclosure (copy), ImageSetLabel (copy), View (copy), Text (copy), FFlagHideDevSubsPriceIfSubscribed (copy), FoundationModule (copy), generatePromptText (copy)
	local Text1 = (if p1.isRobuxSubscription then GetIconRichTextFunction(Enums.IconName.Robux) .. " " else "") .. p1.displayPrice .. p1.period
	
	return ReactModule.createElement(PartialPageModal, {
		screenSize = p1.screenSize,
		contentPadding = UDim.new(0, 24),
		buttonStackProps = {
			buttonHeight = 48,
			buttons = createSubscribeButtonStacks(p1, p2),
			forcedFillDirection = Enum.FillDirection.Vertical
		},
		onCloseClicked = p1.cancelPurchaseActivated,
		footerContent = function()
			-- upvalues: p1 (copy), generateTestmodeDisclaimer (upval), p2 (copy), p3 (copy), Theme (copy), X (copy), p4 (copy), FFlagEnableDevSubsFastFollowFixes (upval), generateDisclosure (upval), OnActivated (copy)
			return if p1.isTestingMode then generateTestmodeDisclaimer(p2.footerText, p3, Theme, X, p4) elseif FFlagEnableDevSubsFastFollowFixes then nil else generateDisclosure(p2, OnActivated)
		end
	}, {
		ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			PromptScroll = ReactModule.createElement("ScrollingFrame", {
				BackgroundTransparency = 1,
				LayoutOrder = 3,
				BorderSizePixel = 0,
				ZIndex = 2,
				Selectable = false,
				Size = UDim2.new(1, 0, 0, (math.min(YOffset, p1.screenSize.Y - 240))),
				ScrollingEnabled = p1.screenSize.Y - 240 < YOffset,
				ScrollBarThickness = if p1.screenSize.Y - 240 < YOffset then 5 else nil,
				ScrollingDirection = Enum.ScrollingDirection.Y,
				CanvasSize = UDim2.new(1, 0, 0, YOffset)
			}, {
				Padding = ReactModule.createElement("UIPadding", {
					PaddingTop = UDim.new(0, 24),
					PaddingBottom = UDim.new(0, 24)
				}),
				Layout = ReactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					Padding = UDim.new(0, 24)
				}),
				HeroImage = ReactModule.createElement(ImageSetLabel, {
					LayoutOrder = 0,
					BackgroundTransparency = 1,
					Size = UDim2.new(0, 150, 0, 150),
					ScaleType = Enum.ScaleType.Fit,
					Image = p1.itemIcon
				}, {
					UICorner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 12) })
				}),
				AttributionSection = ReactModule.createElement(View, {
					LayoutOrder = 1,
					tag = "auto-xy col align-x-start size-full-0"
				}, {
					Layout = ReactModule.createElement("UIListLayout", {
						SortOrder = Enum.SortOrder.LayoutOrder,
						FillDirection = Enum.FillDirection.Vertical,
						HorizontalAlignment = Enum.HorizontalAlignment.Left,
						Padding = UDim.new(0, 4)
					}),
					SubscriptionName = ReactModule.createElement(Text, {
						LayoutOrder = 1,
						tag = "auto-xy content-emphasis text-align-x-left",
						Text = p1.name,
						fontStyle = p4.Typography.HeadingSmall
					}),
					CreatorName = ReactModule.createElement(Text, {
						LayoutOrder = 2,
						tag = "auto-xy content-default text-align-x-left",
						Text = if p1.creatorName then p1.creatorName .. " " .. (p1.creatorVerified and VerifiedBadgesModule.emoji.verified or "") else nil,
						fontStyle = p4.Typography.TitleLarge
					}),
					PriceRow = if p1.disablePurchase and FFlagHideDevSubsPriceIfSubscribed then nil else ReactModule.createElement(Text, {
						LayoutOrder = 3,
						RichText = true,
						tag = "auto-xy content-emphasis text-align-x-left",
						Text = Text1,
						fontStyle = p4.Typography.TitleLarge
					})
				}),
				ActionButtonsRow = ReactModule.createElement(View, {
					LayoutOrder = 2,
					tag = "row gap-small auto-y size-full-0 align-x-left"
				}, {
					ShareButton = if p1.onShare then ReactModule.createElement(FoundationModule.Chip, {
						LayoutOrder = 1,
						text = p2.shareText,
						leading = { iconName = Enums.IconName.ArrowThickToRight },
						size = Enums.ChipSize.Small,
						onActivated = p1.onShare
					}) else nil,
					ReportButton = if p1.onReport then ReactModule.createElement(FoundationModule.Chip, {
						LayoutOrder = 2,
						text = p2.reportText,
						leading = { iconName = Enums.IconName.Flag },
						size = Enums.ChipSize.Small,
						onActivated = p1.onReport
					}) else nil
				}),
				generatePromptText(p1, p3, Theme, X, CalculatePromptHeight, 3, p4)
			})
		})
	})
end

return function(p1)
	-- upvalues: ReactModule (copy), UseDispatchFunction (copy), UseTokensFunction (copy), UrlBuilder (copy), AppPage (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownFunction (copy), SubscriptionTitleModule (copy), MultiTextLocalizerModule (copy), WithStyleFunction (copy), GetPartialPageModalMiddleContentWidthFunction (copy), renderNewModalDesign (copy), PartialPageModal (copy), createSubscribeButtonStacks (copy), generateTestmodeDisclaimer (copy), FFlagEnableDevSubsFastFollowFixes (copy), generateDisclosure (copy), generatePromptText (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(0)
	local UseDispatchResult = UseDispatchFunction()
	local UseTokensResult = UseTokensFunction()
	
	local function openTermsOfUse()
		-- upvalues: UrlBuilder (upval), AppPage (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (copy), NavigateDownFunction (upval)
		local config = {
			name = AppPage.GenericWebPage,
			detail = UrlBuilder.static.about.terms()
		}
		
		if FFlagSignalsNavP3Dispatch then
			NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
			
			return
		else
			UseDispatchResult(NavigateDownFunction(config))
		end
	end
	
	local function calculatePromptHeight(p2: number)
		-- upvalues: p1 (copy), UseStateResult2 (copy), SubscriptionTitleModule (upval)
		if p1.shouldUseNewModalDesign then
			UseStateResult2(338 + p2 + 24)
			
			return
		else
			UseStateResult2(24 + SubscriptionTitleModule:getTitleHeight(p1.screenSize.Y - 240) + 24 + p2)
		end
	end
	
	return ReactModule.createElement(MultiTextLocalizerModule, {
		keys = {
			titleText = {
				key = "IAPExperience.SubscriptionPurchasePrompt.Label.GetSubscription"
			},
			subscribe = { key = "Feature.Subscription.Action.Subscribe" },
			subscribeWithCreditDebitCard = {
				key = "Feature.Subscription.Action.SubscribeWithCreditDebitCard"
			},
			subscribeWithRobloxCredit = {
				key = "Feature.Subscription.Action.SubscribeWithRobloxCredit"
			},
			payAnotherWay = {
				key = "Feature.Subscription.Action.SubscribePayAnotherWay"
			},
			footerText = {
				key = "IAPExperience.SubscriptionPurchasePrompt.Label.TestFlowDisclaimer"
			},
			DisclosurePayment = { key = "IAPExperience.RobuxUpsell.Text.DisclosurePayment" },
			DisclosureTermsURL = {
				key = "IAPExperience.RobuxUpsell.Text.DisclosureTermsURL"
			},
			TermsOfUse = { key = "IAPExperience.RobuxUpsell.Text.TermsOfUse" },
			shareText = { key = "Feature.SocialShare.Action.Share" },
			reportText = { key = "Feature.GameDetails.Action.Report" }
		},
		render = function(p2)
			-- upvalues: WithStyleFunction (upval), GetPartialPageModalMiddleContentWidthFunction (upval), p1 (copy), renderNewModalDesign (upval), UseStateResult (copy), openTermsOfUse (copy), calculatePromptHeight (copy), UseTokensResult (copy), ReactModule (upval), PartialPageModal (upval), createSubscribeButtonStacks (upval), generateTestmodeDisclaimer (upval), FFlagEnableDevSubsFastFollowFixes (upval), generateDisclosure (upval), SubscriptionTitleModule (upval), generatePromptText (upval)
			return WithStyleFunction(function(p3)
				-- upvalues: GetPartialPageModalMiddleContentWidthFunction (upval), p1 (upval), renderNewModalDesign (upval), p2 (copy), UseStateResult (upval), openTermsOfUse (upval), calculatePromptHeight (upval), UseTokensResult (upval), ReactModule (upval), PartialPageModal (upval), createSubscribeButtonStacks (upval), generateTestmodeDisclaimer (upval), FFlagEnableDevSubsFastFollowFixes (upval), generateDisclosure (upval), SubscriptionTitleModule (upval), generatePromptText (upval)
				local Theme = p3.Theme
				local _Font = p3.Font
				local PartialPageModalMiddleContentWidth = GetPartialPageModalMiddleContentWidthFunction(p1.screenSize.X)
				
				return if p1.shouldUseNewModalDesign then renderNewModalDesign(p1, p2, Theme, _Font, PartialPageModalMiddleContentWidth, UseStateResult, openTermsOfUse, calculatePromptHeight, UseTokensResult) else ReactModule.createElement(PartialPageModal, {
					title = p2.titleText,
					screenSize = p1.screenSize,
					contentPadding = UDim.new(0, 24),
					buttonStackProps = {
						buttonHeight = 48,
						buttons = createSubscribeButtonStacks(p1, p2),
						forcedFillDirection = Enum.FillDirection.Vertical
					},
					onCloseClicked = p1.cancelPurchaseActivated,
					footerContent = function()
						-- upvalues: p1 (upval), generateTestmodeDisclaimer (upval), p2 (upval), _Font (copy), Theme (copy), PartialPageModalMiddleContentWidth (copy), UseTokensResult (upval), FFlagEnableDevSubsFastFollowFixes (upval), generateDisclosure (upval), openTermsOfUse (upval)
						return if p1.isTestingMode then generateTestmodeDisclaimer(p2.footerText, _Font, Theme, PartialPageModalMiddleContentWidth, UseTokensResult) elseif FFlagEnableDevSubsFastFollowFixes then nil else generateDisclosure(p2, openTermsOfUse)
					end
				}, {
					ReactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						Size = UDim2.new(1, 0, 0, 0),
						AutomaticSize = Enum.AutomaticSize.Y
					}, {
						PromptScroll = ReactModule.createElement("ScrollingFrame", {
							BackgroundTransparency = 1,
							LayoutOrder = 3,
							BorderSizePixel = 0,
							ZIndex = 2,
							Selectable = false,
							Size = UDim2.new(1, 0, 0, (math.min(UseStateResult, p1.screenSize.Y - 240))),
							ScrollingEnabled = p1.screenSize.Y - 240 < UseStateResult,
							ScrollBarThickness = if p1.screenSize.Y - 240 < UseStateResult then 5 else nil,
							ScrollingDirection = Enum.ScrollingDirection.Y,
							CanvasSize = UDim2.new(1, 0, 0, UseStateResult)
						}, {
							Padding = ReactModule.createElement("UIPadding", {
								PaddingTop = UDim.new(0, 24),
								PaddingBottom = UDim.new(0, 24)
							}),
							Layout = ReactModule.createElement("UIListLayout", {
								SortOrder = Enum.SortOrder.LayoutOrder,
								HorizontalAlignment = Enum.HorizontalAlignment.Center,
								Padding = UDim.new(0, 24)
							}),
							SubscriptionTitleSection = ReactModule.createElement(SubscriptionTitleModule, {
								layoutOrder = 2,
								subscriptionProviderName = p1.subscriptionProviderName,
								name = p1.name,
								displayPrice = p1.displayPrice,
								period = p1.period,
								disclaimerText = p1.disclaimerText,
								contentHeight = p1.screenSize.Y - 240,
								itemIcon = p1.itemIcon
							}),
							generatePromptText(p1, _Font, Theme, PartialPageModalMiddleContentWidth, calculatePromptHeight, 2, UseTokensResult)
						})
					})
				})
			end)
		end
	})
end