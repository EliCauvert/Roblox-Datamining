local parent = script.Parent.Parent
local parent_1 = parent.Parent
local urlBuilder = require(parent_1.UrlBuilder).UrlBuilder
local navigateDown = require(parent_1.NavigationRodux).Thunks.NavigateDown
local fFlagSignalsNavP3Dispatch = require(parent_1.SharedFlags).FFlagSignalsNavP3Dispatch
local var0 = if fFlagSignalsNavP3Dispatch then require(parent_1.RobloxAppNavigation).NavigationCommands else nil
local useDispatch = require(parent_1.RoactUtils).Hooks.RoactRodux.useDispatch
local appPage = require(parent_1.RobloxAppEnums).AppPage
local textService = game:GetService("TextService")
local verifiedBadgesModule = require(parent_1.VerifiedBadges)
local reactModule = require(parent_1.React)
local UIBloxModule = require(parent_1.UIBlox)
local partialPageModal = UIBloxModule.App.Dialog.Modal.PartialPageModal
local getPartialPageModalMiddleContentWidth = UIBloxModule.App.Dialog.Modal.getPartialPageModalMiddleContentWidth
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local withStyle = UIBloxModule.Style.withStyle
local foundationModule = require(parent_1.Foundation)
local view = foundationModule.View
local text = foundationModule.Text
local enums = foundationModule.Enums
local getIconRichText = foundationModule.Utility.getIconRichText
local useTokens = foundationModule.Hooks.useTokens
local multiTextLocalizerModule = require(parent.Locale.MultiTextLocalizer)
local subscriptionTitleModule = require(parent.Subscription.SubscriptionTitle)
local getEnableDisableSubPurchaseModule = require(parent.Flags.getEnableDisableSubPurchase)
local fFlagHideDevSubsPriceIfSubscribed = require(parent.Parent.SharedFlags).FFlagHideDevSubsPriceIfSubscribed
local fFlagEnableDevSubsFastFollowFixes = require(parent.Parent.SharedFlags).FFlagEnableDevSubsFastFollowFixes

local function generateTestmodeDisclaimer(p0, p1, p2, p3)
	-- upvalues: textService (ref), reactModule (ref)
	return reactModule.createElement("Frame", {
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		LayoutOrder = 2,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.new(0.5, 0, 0, 16),
		Size = UDim2.new(1, -48, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y
	}, {
		DisclaimerText = reactModule.createElement("TextLabel", {
			LayoutOrder = 1,
			BackgroundTransparency = 1,
			TextWrapped = true,
			TextSize = 12,
			Size = UDim2.new(1, 0, 0, textService:GetTextSize(p0, 12, p1.Footer.Font, Vector2.new(p3, 1e999)).Y + 2),
			Font = p1.Footer.Font,
			TextXAlignment = Enum.TextXAlignment.Left,
			Text = p0,
			TextColor3 = p2.TextDefault.Color
		})
	})
end

local function generatePromptText(p4, p5, p6, p7, p8, p9)
	-- upvalues: reactModule (ref), textService (ref)
	return reactModule.createElement("TextLabel", {
		LayoutOrder = p9 or 2,
		BackgroundTransparency = 1,
		Size = UDim2.new(0, p7, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		TextXAlignment = Enum.TextXAlignment.Left,
		Font = p5.Body.Font,
		Text = p4.description,
		TextSize = 16,
		TextWrapped = true,
		TextColor3 = p6.TextDefault.Color,
		TextTransparency = p6.TextDefault.Transparency,
		RichText = true,
		[reactModule.Change.AbsoluteSize] = function(p10)
			-- upvalues: textService (copy), p8 (ref)
			p8(textService:GetTextSize(p10.Text, p10.TextSize, p10.Font, Vector2.new(p10.AbsoluteSize.X, 1e999)).Y)
		end
	})
end

local function createSubscribeButtonStacks(p11, p12)
	-- upvalues: getEnableDisableSubPurchaseModule (ref), buttonType (ref)
	if (getEnableDisableSubPurchaseModule() or p11.shouldUseNewModalDesign) and p11.disablePurchase then
		return {
			{
				buttonType = buttonType.PrimarySystem,
				props = {
					isDisabled = true,
					layoutOrder = 0,
					onActivated = function() end,
					text = p11.disablePurchaseText
				}
			}
		}
	elseif p11.secondaryPaymentMethod == nil or p11.secondaryPaymentMethod == "" then
		return {
			{
				buttonType = buttonType.PrimarySystem,
				props = {
					layoutOrder = 0,
					onActivated = function()
						-- upvalues: p11 (ref)
						p11.purchaseSubscriptionActivated(p11.primaryPaymentMethod)
					end,
					text = p12.subscribe
				}
			}
		}
	end
	local subscribeWithRobloxCredit = nil
	
	if p11.primaryPaymentMethod == "Stripe" then
		subscribeWithRobloxCredit = p12.subscribeWithCreditDebitCard
	elseif p11.primaryPaymentMethod == "CreditBalance" then
		subscribeWithRobloxCredit = p12.subscribeWithRobloxCredit
	end
	return {
		{
			buttonType = buttonType.PrimarySystem,
			props = {
				layoutOrder = 0,
				onActivated = function()
					-- upvalues: p11 (ref)
					p11.purchaseSubscriptionActivated(p11.primaryPaymentMethod)
				end,
				text = subscribeWithRobloxCredit
			}
		},
		{
			buttonType = buttonType.Secondary,
			props = {
				layoutOrder = 1,
				onActivated = function()
					-- upvalues: p11 (ref)
					p11.purchaseSubscriptionActivated(p11.secondaryPaymentMethod)
				end,
				text = p12.payAnotherWay
			}
		}
	}
end

local function generateDisclosure(p13, p14)
	-- upvalues: reactModule (ref), view (ref), text (ref)
	local parts = string.split(p13.DisclosureTermsURL, " {termsofuse} ")
	
	return reactModule.createElement(view, {
		tag = "row wrap auto-y align-y-center align-x-center size-full-0 gap-xsmall padding-x-xsmall padding-bottom-xsmall"
	}, {
		DisclosurePayment = reactModule.createElement(text, {
			LayoutOrder = 1,
			tag = "auto-xy text-body content-default text-align-x-left content-muted text-caption-small",
			Text = p13.DisclosurePayment
		}),
		BeforeText = reactModule.createElement(text, {
			LayoutOrder = 2,
			tag = "auto-xy text-body content-default text-align-x-left content-muted text-caption-small",
			Text = parts[1]
		}),
		TextLink = reactModule.createElement(text, {
			LayoutOrder = 3,
			RichText = true,
			tag = "auto-xy text-body content-default text-align-x-left content-muted text-caption-small",
			Text = "<u>" .. p13.TermsOfUse .. "</u>",
			onActivated = p14
		}),
		AfterText = reactModule.createElement(text, {
			LayoutOrder = 4,
			tag = "auto-xy text-body content-default text-align-x-left content-muted text-caption-small",
			Text = parts[2]
		})
	})
end

local function renderNewModalDesign(value, p15, p16, p17, p18, p19, p20, p21, p22)
	-- upvalues: verifiedBadgesModule (ref), getIconRichText (ref), enums (ref), reactModule (ref), partialPageModal (ref), createSubscribeButtonStacks (ref), generateTestmodeDisclaimer (ref), fFlagEnableDevSubsFastFollowFixes (ref), generateDisclosure (ref), imageSetLabel (ref), view (ref), text (ref), fFlagHideDevSubsPriceIfSubscribed (ref), foundationModule (ref), generatePromptText (ref)
	return reactModule.createElement(partialPageModal, {
		screenSize = value.screenSize,
		contentPadding = UDim.new(0, 24),
		buttonStackProps = {
			buttonHeight = 48,
			buttons = createSubscribeButtonStacks(value, p15),
			forcedFillDirection = Enum.FillDirection.Vertical
		},
		onCloseClicked = value.cancelPurchaseActivated,
		footerContent = function()
			-- upvalues: value (ref), generateTestmodeDisclaimer (copy), p15 (ref), p17 (ref), p16 (ref), p18 (ref), fFlagEnableDevSubsFastFollowFixes (copy), generateDisclosure (copy), p20 (ref)
			return if value.isTestingMode then generateTestmodeDisclaimer(p15.footerText, p17, p16, p18) elseif fFlagEnableDevSubsFastFollowFixes then nil else generateDisclosure(p15, p20)
		end
	}, {
		reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			PromptScroll = reactModule.createElement("ScrollingFrame", {
				BackgroundTransparency = 1,
				LayoutOrder = 3,
				BorderSizePixel = 0,
				ZIndex = 2,
				Selectable = false,
				Size = UDim2.new(1, 0, 0, math.min(p19, value.screenSize.Y - 240)),
				ScrollingEnabled = value.screenSize.Y - 240 < p19,
				ScrollBarThickness = if value.screenSize.Y - 240 < p19 then 5 else nil,
				ScrollingDirection = Enum.ScrollingDirection.Y,
				CanvasSize = UDim2.new(1, 0, 0, p19)
			}, {
				Padding = reactModule.createElement("UIPadding", {
					PaddingTop = UDim.new(0, 24),
					PaddingBottom = UDim.new(0, 24)
				}),
				Layout = reactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					Padding = UDim.new(0, 24)
				}),
				HeroImage = reactModule.createElement(imageSetLabel, {
					LayoutOrder = 0,
					BackgroundTransparency = 1,
					Size = UDim2.new(0, 150, 0, 150),
					ScaleType = Enum.ScaleType.Fit,
					Image = value.itemIcon
				}, {
					UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 12) })
				}),
				AttributionSection = reactModule.createElement(view, {
					LayoutOrder = 1,
					tag = "auto-xy col align-x-start size-full-0"
				}, {
					Layout = reactModule.createElement("UIListLayout", {
						SortOrder = Enum.SortOrder.LayoutOrder,
						FillDirection = Enum.FillDirection.Vertical,
						HorizontalAlignment = Enum.HorizontalAlignment.Left,
						Padding = UDim.new(0, 4)
					}),
					SubscriptionName = reactModule.createElement(text, {
						LayoutOrder = 1,
						tag = "auto-xy content-emphasis text-align-x-left",
						Text = value.name,
						fontStyle = p22.Typography.HeadingSmall
					}),
					CreatorName = reactModule.createElement(text, {
						LayoutOrder = 2,
						tag = "auto-xy content-default text-align-x-left",
						Text = if value.creatorName then value.creatorName .. " " .. (if value.creatorVerified then verifiedBadgesModule.emoji.verified else "") else nil,
						fontStyle = p22.Typography.TitleLarge
					}),
					PriceRow = if value.disablePurchase and fFlagHideDevSubsPriceIfSubscribed then nil else reactModule.createElement(text, {
						LayoutOrder = 3,
						RichText = true,
						tag = "auto-xy content-emphasis text-align-x-left",
						Text = (if value.isRobuxSubscription then getIconRichText(enums.IconName.Robux) .. " " else "") .. value.displayPrice .. value.period,
						fontStyle = p22.Typography.TitleLarge
					})
				}),
				ActionButtonsRow = reactModule.createElement(view, {
					LayoutOrder = 2,
					tag = "row gap-small auto-y size-full-0 align-x-left"
				}, {
					ShareButton = if value.onShare then reactModule.createElement(foundationModule.Chip, {
						LayoutOrder = 1,
						text = p15.shareText,
						leading = { iconName = enums.IconName.ArrowThickToRight },
						size = enums.ChipSize.Small,
						onActivated = value.onShare
					}) else nil,
					ReportButton = if value.onReport then reactModule.createElement(foundationModule.Chip, {
						LayoutOrder = 2,
						text = p15.reportText,
						leading = { iconName = enums.IconName.Flag },
						size = enums.ChipSize.Small,
						onActivated = value.onReport
					}) else nil
				}),
				generatePromptText(value, p17, p16, p18, p21, 3)
			})
		})
	})
end

return function(p23)
	-- upvalues: reactModule (ref), useDispatch (ref), useTokens (ref), urlBuilder (ref), appPage (ref), fFlagSignalsNavP3Dispatch (ref), var0 (ref), navigateDown (ref), subscriptionTitleModule (ref), multiTextLocalizerModule (ref), withStyle (ref), getPartialPageModalMiddleContentWidth (ref), renderNewModalDesign (ref), partialPageModal (ref), createSubscribeButtonStacks (ref), generateTestmodeDisclaimer (ref), fFlagEnableDevSubsFastFollowFixes (ref), generateDisclosure (ref), generatePromptText (ref)
	local var15, var16 = reactModule.useState(0)
	local var17 = useDispatch()
	local var18 = useTokens()
	
	local function openTermsOfUse()
		-- upvalues: urlBuilder (copy), appPage (copy), fFlagSignalsNavP3Dispatch (copy), var0 (copy), var17 (ref), navigateDown (copy)
		local t = {
			name = appPage.GenericWebPage,
			detail = urlBuilder.static.about.terms()
		}
		
		if fFlagSignalsNavP3Dispatch then
			var0.down(var0.fromLegacyPage(t))
			
			return
		end
		var17(navigateDown(t))
	end
	
	local function calculatePromptHeight(p24)
		-- upvalues: p23 (ref), var16 (ref), subscriptionTitleModule (copy)
		if p23.shouldUseNewModalDesign then
			var16(338 + p24 + 24)
			
			return
		end
		var16(24 + subscriptionTitleModule:getTitleHeight(p23.screenSize.Y - 240) + 24 + p24)
	end
	
	return reactModule.createElement(multiTextLocalizerModule, {
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
		render = function(p25)
			-- upvalues: withStyle (copy), getPartialPageModalMiddleContentWidth (copy), p23 (ref), renderNewModalDesign (copy), var15 (ref), openTermsOfUse (ref), calculatePromptHeight (ref), var18 (ref), reactModule (copy), partialPageModal (copy), createSubscribeButtonStacks (copy), generateTestmodeDisclaimer (copy), fFlagEnableDevSubsFastFollowFixes (copy), generateDisclosure (copy), subscriptionTitleModule (copy), generatePromptText (copy)
			return withStyle(function(p26)
				-- upvalues: getPartialPageModalMiddleContentWidth (copy), p23 (copy), renderNewModalDesign (copy), p25 (ref), var15 (copy), openTermsOfUse (copy), calculatePromptHeight (copy), var18 (copy), reactModule (copy), partialPageModal (copy), createSubscribeButtonStacks (copy), generateTestmodeDisclaimer (copy), fFlagEnableDevSubsFastFollowFixes (copy), generateDisclosure (copy), subscriptionTitleModule (copy), generatePromptText (copy)
				local theme = p26.Theme
				local font = p26.Font
				local var22 = getPartialPageModalMiddleContentWidth(p23.screenSize.X)
				
				return if p23.shouldUseNewModalDesign then renderNewModalDesign(p23, p25, theme, font, var22, var15, openTermsOfUse, calculatePromptHeight, var18) else reactModule.createElement(partialPageModal, {
					title = p25.titleText,
					screenSize = p23.screenSize,
					contentPadding = UDim.new(0, 24),
					buttonStackProps = {
						buttonHeight = 48,
						buttons = createSubscribeButtonStacks(p23, p25),
						forcedFillDirection = Enum.FillDirection.Vertical
					},
					onCloseClicked = p23.cancelPurchaseActivated,
					footerContent = function()
						-- upvalues: p23 (copy), generateTestmodeDisclaimer (copy), p25 (copy), font (ref), theme (ref), var22 (ref), fFlagEnableDevSubsFastFollowFixes (copy), generateDisclosure (copy), openTermsOfUse (copy)
						return if p23.isTestingMode then generateTestmodeDisclaimer(p25.footerText, font, theme, var22) elseif fFlagEnableDevSubsFastFollowFixes then nil else generateDisclosure(p25, openTermsOfUse)
					end
				}, {
					reactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						Size = UDim2.new(1, 0, 0, 0),
						AutomaticSize = Enum.AutomaticSize.Y
					}, {
						PromptScroll = reactModule.createElement("ScrollingFrame", {
							BackgroundTransparency = 1,
							LayoutOrder = 3,
							BorderSizePixel = 0,
							ZIndex = 2,
							Selectable = false,
							Size = UDim2.new(1, 0, 0, math.min(var15, p23.screenSize.Y - 240)),
							ScrollingEnabled = p23.screenSize.Y - 240 < var15,
							ScrollBarThickness = if p23.screenSize.Y - 240 < var15 then 5 else nil,
							ScrollingDirection = Enum.ScrollingDirection.Y,
							CanvasSize = UDim2.new(1, 0, 0, var15)
						}, {
							Padding = reactModule.createElement("UIPadding", {
								PaddingTop = UDim.new(0, 24),
								PaddingBottom = UDim.new(0, 24)
							}),
							Layout = reactModule.createElement("UIListLayout", {
								SortOrder = Enum.SortOrder.LayoutOrder,
								HorizontalAlignment = Enum.HorizontalAlignment.Center,
								Padding = UDim.new(0, 24)
							}),
							SubscriptionTitleSection = reactModule.createElement(subscriptionTitleModule, {
								layoutOrder = 2,
								subscriptionProviderName = p23.subscriptionProviderName,
								name = p23.name,
								displayPrice = p23.displayPrice,
								period = p23.period,
								disclaimerText = p23.disclaimerText,
								contentHeight = p23.screenSize.Y - 240,
								itemIcon = p23.itemIcon
							}),
							generatePromptText(p23, font, theme, var22, calculatePromptHeight, 2)
						})
					})
				})
			end)
		end
	})
end