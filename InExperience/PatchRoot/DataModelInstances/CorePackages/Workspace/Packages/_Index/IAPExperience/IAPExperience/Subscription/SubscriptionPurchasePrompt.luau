local parent = script.Parent.Parent
local parent_1 = parent.Parent
local urlBuilder = require(parent_1.UrlBuilder).UrlBuilder
local navigateDown = require(parent_1.NavigationRodux).Thunks.NavigateDown
local fFlagSignalsNavP3Dispatch = require(parent_1.SharedFlags).FFlagSignalsNavP3Dispatch
local var1 = if fFlagSignalsNavP3Dispatch then require(parent_1.RobloxAppNavigation).NavigationCommands else nil
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

local function generateTestmodeDisclaimer(p1, p2, p3, p4)
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
			Size = UDim2.new(1, 0, 0, textService:GetTextSize(p1, 12, p2.Footer.Font, Vector2.new(p4, 1e999)).Y + 2),
			Font = p2.Footer.Font,
			TextXAlignment = Enum.TextXAlignment.Left,
			Text = p1,
			TextColor3 = p3.TextDefault.Color
		})
	})
end

local function generatePromptText(p1, p2, p3, p4, p5, p6)
	-- upvalues: reactModule (ref), textService (ref)
	return reactModule.createElement("TextLabel", {
		LayoutOrder = p6 or 2,
		BackgroundTransparency = 1,
		Size = UDim2.new(0, p4, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		TextXAlignment = Enum.TextXAlignment.Left,
		Font = p2.Body.Font,
		Text = p1.description,
		TextSize = 16,
		TextWrapped = true,
		TextColor3 = p3.TextDefault.Color,
		TextTransparency = p3.TextDefault.Transparency,
		RichText = true,
		[reactModule.Change.AbsoluteSize] = function(p7)
			-- upvalues: textService (copy), p5 (ref)
			p5(textService:GetTextSize(p7.Text, p7.TextSize, p7.Font, Vector2.new(p7.AbsoluteSize.X, 1e999)).Y)
		end
	})
end

local function createSubscribeButtonStacks(p1, p2)
	-- upvalues: getEnableDisableSubPurchaseModule (ref), buttonType (ref)
	if (getEnableDisableSubPurchaseModule() or p1.shouldUseNewModalDesign) and p1.disablePurchase then
		return {
			{
				buttonType = buttonType.PrimarySystem,
				props = {
					isDisabled = true,
					layoutOrder = 0,
					onActivated = function() end,
					text = p1.disablePurchaseText
				}
			}
		}
	elseif p1.secondaryPaymentMethod == nil or p1.secondaryPaymentMethod == "" then
		return {
			{
				buttonType = buttonType.PrimarySystem,
				props = {
					layoutOrder = 0,
					onActivated = function()
						-- upvalues: p1 (ref)
						p1.purchaseSubscriptionActivated(p1.primaryPaymentMethod)
					end,
					text = p2.subscribe
				}
			}
		}
	end
	local subscribeWithRobloxCredit = nil
	
	if p1.primaryPaymentMethod == "Stripe" then
		subscribeWithRobloxCredit = p2.subscribeWithCreditDebitCard
	elseif p1.primaryPaymentMethod == "CreditBalance" then
		subscribeWithRobloxCredit = p2.subscribeWithRobloxCredit
	end
	return {
		{
			buttonType = buttonType.PrimarySystem,
			props = {
				layoutOrder = 0,
				onActivated = function()
					-- upvalues: p1 (ref)
					p1.purchaseSubscriptionActivated(p1.primaryPaymentMethod)
				end,
				text = subscribeWithRobloxCredit
			}
		},
		{
			buttonType = buttonType.Secondary,
			props = {
				layoutOrder = 1,
				onActivated = function()
					-- upvalues: p1 (ref)
					p1.purchaseSubscriptionActivated(p1.secondaryPaymentMethod)
				end,
				text = p2.payAnotherWay
			}
		}
	}
end

local function generateDisclosure(p1, p2)
	-- upvalues: reactModule (ref), view (ref), text (ref)
	local parts = string.split(p1.DisclosureTermsURL, " {termsofuse} ")
	
	return reactModule.createElement(view, {
		tag = "row wrap auto-y align-y-center align-x-center size-full-0 gap-xsmall padding-x-xsmall padding-bottom-xsmall"
	}, {
		DisclosurePayment = reactModule.createElement(text, {
			LayoutOrder = 1,
			tag = "auto-xy text-body content-default text-align-x-left content-muted text-caption-small",
			Text = p1.DisclosurePayment
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
			onActivated = p2
		}),
		AfterText = reactModule.createElement(text, {
			LayoutOrder = 4,
			tag = "auto-xy text-body content-default text-align-x-left content-muted text-caption-small",
			Text = parts[2]
		})
	})
end

local function renderNewModalDesign(value, p1, p2, p3, p4, p5, p6, p7, p8)
	-- upvalues: verifiedBadgesModule (ref), getIconRichText (ref), enums (ref), reactModule (ref), partialPageModal (ref), createSubscribeButtonStacks (ref), generateTestmodeDisclaimer (ref), fFlagEnableDevSubsFastFollowFixes (ref), generateDisclosure (ref), imageSetLabel (ref), view (ref), text (ref), fFlagHideDevSubsPriceIfSubscribed (ref), foundationModule (ref), generatePromptText (ref)
	return reactModule.createElement(partialPageModal, {
		screenSize = value.screenSize,
		contentPadding = UDim.new(0, 24),
		buttonStackProps = {
			buttonHeight = 48,
			buttons = createSubscribeButtonStacks(value, p1),
			forcedFillDirection = Enum.FillDirection.Vertical
		},
		onCloseClicked = value.cancelPurchaseActivated,
		footerContent = function()
			-- upvalues: value (ref), generateTestmodeDisclaimer (copy), p1 (ref), p3 (ref), p2 (ref), p4 (ref), fFlagEnableDevSubsFastFollowFixes (copy), generateDisclosure (copy), p6 (ref)
			return if value.isTestingMode then generateTestmodeDisclaimer(p1.footerText, p3, p2, p4) elseif fFlagEnableDevSubsFastFollowFixes then nil else generateDisclosure(p1, p6)
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
				Size = UDim2.new(1, 0, 0, math.min(p5, value.screenSize.Y - 240)),
				ScrollingEnabled = value.screenSize.Y - 240 < p5,
				ScrollBarThickness = if value.screenSize.Y - 240 < p5 then 5 else nil,
				ScrollingDirection = Enum.ScrollingDirection.Y,
				CanvasSize = UDim2.new(1, 0, 0, p5)
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
						fontStyle = p8.Typography.HeadingSmall
					}),
					CreatorName = reactModule.createElement(text, {
						LayoutOrder = 2,
						tag = "auto-xy content-default text-align-x-left",
						Text = if value.creatorName then value.creatorName .. " " .. (if value.creatorVerified then verifiedBadgesModule.emoji.verified else "") else nil,
						fontStyle = p8.Typography.TitleLarge
					}),
					PriceRow = if value.disablePurchase and fFlagHideDevSubsPriceIfSubscribed then nil else reactModule.createElement(text, {
						LayoutOrder = 3,
						RichText = true,
						tag = "auto-xy content-emphasis text-align-x-left",
						Text = (if value.isRobuxSubscription then getIconRichText(enums.IconName.Robux) .. " " else "") .. value.displayPrice .. value.period,
						fontStyle = p8.Typography.TitleLarge
					})
				}),
				ActionButtonsRow = reactModule.createElement(view, {
					LayoutOrder = 2,
					tag = "row gap-small auto-y size-full-0 align-x-left"
				}, {
					ShareButton = if value.onShare then reactModule.createElement(foundationModule.Chip, {
						LayoutOrder = 1,
						text = p1.shareText,
						leading = { iconName = enums.IconName.ArrowThickToRight },
						size = enums.ChipSize.Small,
						onActivated = value.onShare
					}) else nil,
					ReportButton = if value.onReport then reactModule.createElement(foundationModule.Chip, {
						LayoutOrder = 2,
						text = p1.reportText,
						leading = { iconName = enums.IconName.Flag },
						size = enums.ChipSize.Small,
						onActivated = value.onReport
					}) else nil
				}),
				generatePromptText(value, p3, p2, p4, p7, 3)
			})
		})
	})
end

return function(p1)
	-- upvalues: reactModule (ref), useDispatch (ref), useTokens (ref), urlBuilder (ref), appPage (ref), fFlagSignalsNavP3Dispatch (ref), var1 (ref), navigateDown (ref), subscriptionTitleModule (ref), multiTextLocalizerModule (ref), withStyle (ref), getPartialPageModalMiddleContentWidth (ref), renderNewModalDesign (ref), partialPageModal (ref), createSubscribeButtonStacks (ref), generateTestmodeDisclaimer (ref), fFlagEnableDevSubsFastFollowFixes (ref), generateDisclosure (ref), generatePromptText (ref)
	local var2, var3 = reactModule.useState(0)
	local var4 = useDispatch()
	local var5 = useTokens()
	
	local function openTermsOfUse()
		-- upvalues: urlBuilder (copy), appPage (copy), fFlagSignalsNavP3Dispatch (copy), var1 (copy), var4 (ref), navigateDown (copy)
		local t = {
			name = appPage.GenericWebPage,
			detail = urlBuilder.static.about.terms()
		}
		
		if fFlagSignalsNavP3Dispatch then
			var1.down(var1.fromLegacyPage(t))
			
			return
		end
		var4(navigateDown(t))
	end
	
	local function calculatePromptHeight(p2)
		-- upvalues: p1 (ref), var3 (ref), subscriptionTitleModule (copy)
		if p1.shouldUseNewModalDesign then
			var3(338 + p2 + 24)
			
			return
		end
		var3(24 + subscriptionTitleModule:getTitleHeight(p1.screenSize.Y - 240) + 24 + p2)
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
		render = function(p2)
			-- upvalues: withStyle (copy), getPartialPageModalMiddleContentWidth (copy), p1 (ref), renderNewModalDesign (copy), var2 (ref), openTermsOfUse (ref), calculatePromptHeight (ref), var5 (ref), reactModule (copy), partialPageModal (copy), createSubscribeButtonStacks (copy), generateTestmodeDisclaimer (copy), fFlagEnableDevSubsFastFollowFixes (copy), generateDisclosure (copy), subscriptionTitleModule (copy), generatePromptText (copy)
			return withStyle(function(p3)
				-- upvalues: getPartialPageModalMiddleContentWidth (copy), p1 (copy), renderNewModalDesign (copy), p2 (ref), var2 (copy), openTermsOfUse (copy), calculatePromptHeight (copy), var5 (copy), reactModule (copy), partialPageModal (copy), createSubscribeButtonStacks (copy), generateTestmodeDisclaimer (copy), fFlagEnableDevSubsFastFollowFixes (copy), generateDisclosure (copy), subscriptionTitleModule (copy), generatePromptText (copy)
				local theme = p3.Theme
				local font = p3.Font
				local var6 = getPartialPageModalMiddleContentWidth(p1.screenSize.X)
				
				return if p1.shouldUseNewModalDesign then renderNewModalDesign(p1, p2, theme, font, var6, var2, openTermsOfUse, calculatePromptHeight, var5) else reactModule.createElement(partialPageModal, {
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
						-- upvalues: p1 (copy), generateTestmodeDisclaimer (copy), p2 (copy), font (ref), theme (ref), var6 (ref), fFlagEnableDevSubsFastFollowFixes (copy), generateDisclosure (copy), openTermsOfUse (copy)
						return if p1.isTestingMode then generateTestmodeDisclaimer(p2.footerText, font, theme, var6) elseif fFlagEnableDevSubsFastFollowFixes then nil else generateDisclosure(p2, openTermsOfUse)
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
							Size = UDim2.new(1, 0, 0, math.min(var2, p1.screenSize.Y - 240)),
							ScrollingEnabled = p1.screenSize.Y - 240 < var2,
							ScrollBarThickness = if p1.screenSize.Y - 240 < var2 then 5 else nil,
							ScrollingDirection = Enum.ScrollingDirection.Y,
							CanvasSize = UDim2.new(1, 0, 0, var2)
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
								subscriptionProviderName = p1.subscriptionProviderName,
								name = p1.name,
								displayPrice = p1.displayPrice,
								period = p1.period,
								disclaimerText = p1.disclaimerText,
								contentHeight = p1.screenSize.Y - 240,
								itemIcon = p1.itemIcon
							}),
							generatePromptText(p1, font, theme, var6, calculatePromptHeight, 2)
						})
					})
				})
			end)
		end
	})
end