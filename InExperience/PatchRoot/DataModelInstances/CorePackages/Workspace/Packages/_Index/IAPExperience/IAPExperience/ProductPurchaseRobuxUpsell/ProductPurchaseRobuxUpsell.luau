local Parent = script.Parent
local Parent1 = Parent.Parent
local Parent2 = Parent1.Parent
local RoactModule = require(Parent2.Roact)
local TModule = require(Parent2.t)
local LocalizationService = game:GetService("LocalizationService")
local Localization = require(Parent2.AppLocales).Localization
local LocalizationProvider = require(Parent2.Localization).LocalizationProvider
local WithLocalizationFunction = require(Parent2.Localization).withLocalization
local RoactFitComponentsModule = require(Parent2.RoactFitComponents)
local FitFrameVertical = RoactFitComponentsModule.FitFrameVertical
local FitTextLabel = RoactFitComponentsModule.FitTextLabel
local UIBloxModule = require(Parent2.UIBlox)
local FoundationModule = require(Parent2.Foundation)
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local InteractiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local IconSize = UIBloxModule.App.Constant.IconSize
local WithStyleFunction = UIBloxModule.Core.Style.withStyle
local Colors = require(Parent2.Style).Colors
local FFlagLowCogsBannerInfoIconModule = require(Parent1.Flags.FFlagLowCogsBannerInfoIcon)
local InfoIconWithTooltipModule = require(Parent1.Generic.InfoIconWithTooltip)
local SharedFlagsModule = require(Parent2.SharedFlags)
local MultiTextLocalizerModule = require(Parent1.Locale.MultiTextLocalizer)
local ProductDetailsModule = require(Parent.ProductDetails)
local IconsCommonRobux = UIBloxModule.App.ImageSet.Images["icons/common/robux"]
local ExtendResult = RoactModule.Component:extend(script.Name)
local FFlagIntroduceMetricsLegacyUpsellModule = require(Parent1.Flags.FFlagIntroduceMetricsLegacyUpsell)
local Default = require(Parent2.LoggingProtocol).default
local LegacyUpsellCounterModule = require(Parent1.Generic.Events.LegacyUpsellCounter)
local LoggerModule = require(Parent1.Utility.logger)
ExtendResult.validateProps = TModule.strictInterface({
	anchorPoint = TModule.optional(TModule.Vector2),
	position = TModule.optional(TModule.UDim2),
	screenSize = TModule.Vector2,
	isLoading = TModule.optional(TModule.boolean),
	isDisabled = TModule.optional(TModule.boolean),
	isDelayedInput = TModule.optional(TModule.boolean),
	enableInputDelayed = TModule.optional(TModule.boolean),
	model = TModule.optional(TModule.table),
	itemIcon = TModule.table,
	itemName = TModule.string,
	itemRobuxCost = TModule.number,
	robuxPurchaseAmount = TModule.number,
	robuxPurchaseAmountBeforeBonus = TModule.optional(TModule.number),
	balanceAmount = TModule.number,
	buyItemControllerIcon = TModule.optional(TModule.table),
	cancelControllerIcon = TModule.optional(TModule.table),
	buyItemActivated = TModule.callback,
	cancelPurchaseActivated = TModule.callback,
	isLuobu = TModule.optional(TModule.boolean),
	isVng = TModule.optional(TModule.boolean)
})
ExtendResult.defaultProps = {
	isLoading = false,
	isDisabled = false,
	isDelayedInput = false,
	enableInputDelayed = false,
	isLuobu = false,
	anchorPoint = Vector2.new(0.5, 0.5),
	position = UDim2.new(0.5, 0, 0.5, 0)
}

function ExtendResult.init(p1)
	-- upvalues: RoactModule (copy)
	p1.contentRef = RoactModule.createRef()
	p1.footerRef = RoactModule.createRef()
	p1.state = {
		contentSize = Vector2.new(0, 0),
		footerSize = Vector2.new(0, 0)
	}
	
	function p1.changeContentSize(Frame: Frame)
		-- upvalues: p1 (copy)
		if p1.state.contentSize ~= Frame.AbsoluteSize then
			p1:setState({ contentSize = Frame.AbsoluteSize })
		end
	end
	
	function p1.changeFooterSize(Frame: Frame)
		-- upvalues: p1 (copy)
		if p1.state.footerSize ~= Frame.AbsoluteSize then
			p1:setState({ footerSize = Frame.AbsoluteSize })
		end
	end
end

function ExtendResult:didMount()
	-- upvalues: FFlagIntroduceMetricsLegacyUpsellModule (copy), LoggerModule (copy), Default (copy), LegacyUpsellCounterModule (copy)
	if FFlagIntroduceMetricsLegacyUpsellModule then
		LoggerModule.debug({ message = "Legacy Upsell Modal Shown" })
		Default:logRobloxTelemetryCounter(LegacyUpsellCounterModule.LegacyUpsellShownCounter, 1, {})
	end
end

function ExtendResult.render(p1)
	-- upvalues: SharedFlagsModule (copy), RoactModule (copy), LocalizationProvider (copy), Localization (copy), LocalizationService (copy), MultiTextLocalizerModule (copy)
	local IAPExperienceRobuxUpsellTextBuyRobuxQuestionWithWarning: string = if p1.props.isLuobu then "IAPExperience.RobuxUpsell.Text.BuyRobuxQuestionWithWarning" else "IAPExperience.RobuxUpsell.Text.BuyRobuxQuestion"
	local IAPExperienceRobuxUpsellTextVNGDisclosureTerms: string = if p1.props.isVng then "IAPExperience.RobuxUpsell.Text.VNGDisclosureTerms" else "IAPExperience.RobuxUpsell.Text.DisclosureTerms"
	
	return if SharedFlagsModule.FFlagLowCogsBannerExperiment then RoactModule.createElement(LocalizationProvider, {
		localization = Localization.new(LocalizationService.RobloxLocaleId)
	}, { Alert = p1:renderNewAlert() }) else RoactModule.createElement(MultiTextLocalizerModule, {
		keys = {
			InsufficientFundsTitle = {
				key = "IAPExperience.RobuxUpsell.Title.InsufficientFunds"
			},
			BuyRobuxQuestion = {
				key = IAPExperienceRobuxUpsellTextBuyRobuxQuestionWithWarning
			},
			DisclosurePayment = { key = "IAPExperience.RobuxUpsell.Text.DisclosurePayment" },
			DisclosureTerms = { key = IAPExperienceRobuxUpsellTextVNGDisclosureTerms },
			RemainingBalance = { key = "IAPExperience.RobuxUpsell.Text.RemainingBalance" },
			BuyRobuxButton = { key = "IAPExperience.RobuxUpsell.Action.BuyRobux" },
			ButtonCancel = { key = "IAPExperience.RobuxUpsell.Action.Cancel" },
			LoadingText = { key = "IAPExperience.RobuxUpsell.Text.Loading" }
		},
		render = function(p2)
			-- upvalues: p1 (copy)
			return p1:renderAlert(p2)
		end
	})
end

function ExtendResult.renderAlert(p1, p2)
	-- upvalues: WithStyleFunction (copy), RoactModule (copy), InteractiveAlert (copy), FitFrameVertical (copy), ProductDetailsModule (copy), FitTextLabel (copy), ImageSetLabel (copy), IconsCommonRobux (copy), ButtonType (copy), IconSize (copy)
	return WithStyleFunction(function(p3)
		-- upvalues: p1 (copy), RoactModule (upval), InteractiveAlert (upval), p2 (copy), FitFrameVertical (upval), ProductDetailsModule (upval), FitTextLabel (upval), ImageSetLabel (upval), IconsCommonRobux (upval), ButtonType (upval), IconSize (upval)
		local Theme = p3.Theme
		local _Font = p3.Font
		local Text = (p1.props.balanceAmount or 0) + (p1.props.robuxPurchaseAmount or 0) - (p1.props.itemRobuxCost or 0)
		
		return RoactModule.createElement(InteractiveAlert, {
			screenSize = p1.props.screenSize,
			position = p1.props.position,
			anchorPoint = p1.props.anchorPoint,
			title = p2.InsufficientFundsTitle,
			middleContent = function()
				-- upvalues: RoactModule (upval), FitFrameVertical (upval), p1 (upval), ProductDetailsModule (upval), Theme (copy), FitTextLabel (upval), _Font (copy), p2 (upval), ImageSetLabel (upval), IconsCommonRobux (upval)
				return RoactModule.createElement(FitFrameVertical, {
					BackgroundTransparency = 1,
					width = UDim.new(1, 0),
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					contentPadding = UDim.new(0, 15),
					[RoactModule.Ref] = p1.contentRef,
					[RoactModule.Change.AbsoluteSize] = p1.changeContentSize
				}, {
					ItemDetails = RoactModule.createElement(ProductDetailsModule, {
						layoutOrder = 1,
						model = p1.props.model,
						itemIcon = p1.props.itemIcon,
						itemName = p1.props.itemName,
						itemRobuxCost = p1.props.itemRobuxCost
					}),
					Underline = RoactModule.createElement("Frame", {
						LayoutOrder = 2,
						BorderSizePixel = 0,
						BackgroundColor3 = Theme.Divider.Color,
						BackgroundTransparency = Theme.Divider.Transparency,
						Size = UDim2.new(1, 0, 0, 1)
					}),
					ConfirmationFrame = RoactModule.createElement(FitFrameVertical, {
						LayoutOrder = 3,
						BackgroundTransparency = 1,
						width = UDim.new(1, 0),
						FillDirection = Enum.FillDirection.Horizontal,
						HorizontalAlignment = Enum.HorizontalAlignment.Center,
						VerticalAlignment = Enum.VerticalAlignment.Center,
						contentPadding = UDim.new(0, 1)
					}, {
						WouldYouLikeText = RoactModule.createElement(FitTextLabel, {
							LayoutOrder = 1,
							BackgroundTransparency = 1,
							TextWrapped = true,
							width = FitTextLabel.Width.FitToText,
							maximumWidth = p1.state.contentSize.X * 0.8,
							Font = _Font.Body.Font,
							Text = p2.BuyRobuxQuestion,
							TextSize = _Font.BaseSize * _Font.Body.RelativeSize,
							TextColor3 = Theme.TextDefault.Color
						}),
						RobuxIcon = RoactModule.createElement(ImageSetLabel, {
							LayoutOrder = 2,
							BackgroundTransparency = 1,
							Position = UDim2.new(0, 5, 0, 5),
							Size = UDim2.new(0, 24, 0, 24),
							ScaleType = Enum.ScaleType.Stretch,
							Image = IconsCommonRobux,
							ImageColor3 = Theme.IconEmphasis.Color,
							ImageTransparency = Theme.IconEmphasis.Transparency
						}),
						RemainingRobux = RoactModule.createElement(FitTextLabel, {
							LayoutOrder = 3,
							BackgroundTransparency = 1,
							width = FitTextLabel.Width.FitToText,
							Font = _Font.Body.Font,
							Text = tostring(p1.props.robuxPurchaseAmount),
							TextSize = _Font.BaseSize * _Font.Body.RelativeSize,
							TextColor3 = Theme.TextEmphasis.Color
						})
					}),
					DisclosureFrame = RoactModule.createElement(FitFrameVertical, {
						LayoutOrder = 4,
						BackgroundTransparency = 1,
						width = UDim.new(1, 0),
						FillDirection = Enum.FillDirection.Vertical,
						HorizontalAlignment = Enum.HorizontalAlignment.Center,
						VerticalAlignment = Enum.VerticalAlignment.Center,
						contentPadding = UDim.new(0, 1)
					}, {
						DisclosurePayment = RoactModule.createElement(FitTextLabel, {
							LayoutOrder = 1,
							BackgroundTransparency = 1,
							TextWrapped = true,
							width = FitTextLabel.Width.FitToText,
							Font = _Font.Footer.Font,
							Text = p2.DisclosurePayment,
							TextSize = _Font.BaseSize * _Font.Footer.RelativeSize,
							TextColor3 = Theme.TextDefault.Color
						}),
						DisclosureTerms = RoactModule.createElement(FitTextLabel, {
							LayoutOrder = 2,
							BackgroundTransparency = 1,
							width = FitTextLabel.Width.FitToText,
							Font = _Font.Footer.Font,
							Text = p2.DisclosureTerms,
							TextSize = _Font.BaseSize * _Font.Footer.RelativeSize,
							TextColor3 = Theme.TextDefault.Color
						})
					})
				})
			end,
			buttonStackInfo = {
				buttons = {
					{
						props = {
							isDisabled = p1.props.isDisabled,
							onActivated = p1.props.cancelPurchaseActivated,
							text = p2.ButtonCancel,
							inputIcon = p1.props.cancelControllerIcon
						}
					},
					{
						buttonType = ButtonType.PrimarySystem,
						props = {
							delayInputSeconds = 3,
							isLoading = p1.props.isLoading,
							isDisabled = p1.props.isDisabled,
							isDelayedInput = p1.props.isDelayedInput,
							enableInputDelayed = p1.props.enableInputDelayed,
							onActivated = p1.props.buyItemActivated,
							text = p2.BuyRobuxButton,
							inputIcon = p1.props.buyItemControllerIcon
						}
					}
				}
			},
			footerContent = function()
				-- upvalues: p2 (upval), RoactModule (upval), FitFrameVertical (upval), p1 (upval), FitTextLabel (upval), _Font (copy), Theme (copy), ImageSetLabel (upval), IconSize (upval), IconsCommonRobux (upval), Text (copy)
				local Parts = string.split(p2.RemainingBalance, " {robux} ")
				
				return RoactModule.createElement(FitFrameVertical, {
					BackgroundTransparency = 1,
					width = UDim.new(1, 0),
					FillDirection = Enum.FillDirection.Horizontal,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					contentPadding = UDim.new(0, 1),
					[RoactModule.Ref] = p1.footerRef,
					[RoactModule.Change.AbsoluteSize] = p1.changeFooterSize
				}, {
					RemainingBalanceBefore = RoactModule.createElement(FitTextLabel, {
						LayoutOrder = 1,
						BackgroundTransparency = 1,
						width = FitTextLabel.Width.FitToText,
						Font = _Font.Footer.Font,
						Text = Parts[1],
						TextSize = _Font.BaseSize * _Font.Footer.RelativeSize,
						TextColor3 = Theme.TextDefault.Color
					}),
					RobuxIcon = RoactModule.createElement(ImageSetLabel, {
						LayoutOrder = 2,
						BackgroundTransparency = 1,
						Position = UDim2.new(0, 5, 0, 5),
						Size = UDim2.new(0, IconSize.Small, 0, IconSize.Small),
						ScaleType = Enum.ScaleType.Stretch,
						Image = IconsCommonRobux,
						ImageColor3 = Theme.IconEmphasis.Color,
						ImageTransparency = Theme.IconEmphasis.Transparency
					}),
					RemainingRobux = RoactModule.createElement(FitTextLabel, {
						LayoutOrder = 3,
						BackgroundTransparency = 1,
						width = FitTextLabel.Width.FitToText,
						Font = _Font.Footer.Font,
						Text = Text,
						TextSize = _Font.BaseSize * _Font.Footer.RelativeSize,
						TextColor3 = Theme.TextDefault.Color
					}),
					RemainingBalanceAfter = RoactModule.createElement(FitTextLabel, {
						LayoutOrder = 4,
						BackgroundTransparency = 1,
						width = FitTextLabel.Width.FitToText,
						Font = _Font.Footer.Font,
						Text = Parts[2],
						TextSize = _Font.BaseSize * _Font.Footer.RelativeSize,
						TextColor3 = Theme.TextDefault.Color
					})
				})
			end
		})
	end)
end

function ExtendResult.renderNewAlert(p1)
	-- upvalues: WithLocalizationFunction (copy), WithStyleFunction (copy), RoactModule (copy), InteractiveAlert (copy), FitFrameVertical (copy), ProductDetailsModule (copy), FitTextLabel (copy), ButtonType (copy)
	return WithLocalizationFunction({
		InsufficientFundsTitle = "IAPExperience.RobuxUpsell.Title.InsufficientFunds",
		DisclosurePayment = "IAPExperience.RobuxUpsell.Text.DisclosurePayment",
		RemainingBalance = "IAPExperience.RobuxUpsell.Text.RemainingBalance",
		BuyRobuxButton = "IAPExperience.RobuxUpsell.Action.BuyRobux",
		ButtonCancel = "IAPExperience.RobuxUpsell.Action.Cancel",
		LoadingText = "IAPExperience.RobuxUpsell.Text.Loading",
		NeedMoreRobux = "IAPExperience.RobuxUpsell.Text.NeedMoreRobux",
		BonusBannerV1 = "IAPExperience.RobuxUpsell.Text.BonusBannerV1",
		BonusBannerInfo = "IAPExperience.RobuxUpsell.Text.BonusBannerInfo",
		BuyRobuxQuestion = if p1.props.isLuobu then "IAPExperience.RobuxUpsell.Text.BuyRobuxQuestionWithWarning" else "IAPExperience.RobuxUpsell.Text.BuyRobuxQuestion",
		DisclosureTerms = if p1.props.isVng then "IAPExperience.RobuxUpsell.Text.VNGDisclosureTerms" else "IAPExperience.RobuxUpsell.Text.DisclosureTerms"
	})(function(p2)
		-- upvalues: WithStyleFunction (upval), p1 (copy), RoactModule (upval), InteractiveAlert (upval), FitFrameVertical (upval), ProductDetailsModule (upval), FitTextLabel (upval), ButtonType (upval)
		return WithStyleFunction(function(p3)
			-- upvalues: p2 (copy), p1 (upval), RoactModule (upval), InteractiveAlert (upval), FitFrameVertical (upval), ProductDetailsModule (upval), FitTextLabel (upval), ButtonType (upval)
			local Theme = p3.Theme
			local _Font = p3.Font
			local Text = p2.BuyRobuxQuestion .. " " .. utf8.char(57346) .. tostring(p1.props.robuxPurchaseAmount)
			local Robux = ""
			
			if p1.props.robuxPurchaseAmountBeforeBonus ~= nil then
				Text = p2.BuyRobuxQuestion .. " " .. ((utf8.char(57346) .. "<s>" .. tostring(p1.props.robuxPurchaseAmountBeforeBonus) .. "</s>") .. " " .. (utf8.char(57346) .. tostring(p1.props.robuxPurchaseAmount)))
				Robux = p2.BonusBannerV1:gsub("{robux}", utf8.char(57346) .. tostring(p1.props.robuxPurchaseAmount - p1.props.robuxPurchaseAmountBeforeBonus))
			end
			return RoactModule.createElement(InteractiveAlert, {
				screenSize = p1.props.screenSize,
				position = p1.props.position,
				anchorPoint = p1.props.anchorPoint,
				title = p2.NeedMoreRobux,
				middleContent = function()
					-- upvalues: RoactModule (upval), FitFrameVertical (upval), p1 (upval), ProductDetailsModule (upval), Theme (copy), FitTextLabel (upval), _Font (copy), Text (ref), p2 (upval)
					return RoactModule.createElement(FitFrameVertical, {
						BackgroundTransparency = 1,
						width = UDim.new(1, 0),
						FillDirection = Enum.FillDirection.Vertical,
						HorizontalAlignment = Enum.HorizontalAlignment.Center,
						VerticalAlignment = Enum.VerticalAlignment.Center,
						contentPadding = UDim.new(0, 15),
						[RoactModule.Ref] = p1.contentRef,
						[RoactModule.Change.AbsoluteSize] = p1.changeContentSize
					}, {
						ItemDetails = RoactModule.createElement(ProductDetailsModule, {
							layoutOrder = 1,
							model = p1.props.model,
							itemIcon = p1.props.itemIcon,
							itemName = p1.props.itemName,
							itemRobuxCost = p1.props.itemRobuxCost
						}),
						Underline = RoactModule.createElement("Frame", {
							LayoutOrder = 2,
							BorderSizePixel = 0,
							BackgroundColor3 = Theme.Divider.Color,
							BackgroundTransparency = Theme.Divider.Transparency,
							Size = UDim2.new(1, 0, 0, 1)
						}),
						ConfirmationFrame = RoactModule.createElement(FitFrameVertical, {
							LayoutOrder = 3,
							BackgroundTransparency = 1,
							width = UDim.new(1, 0),
							FillDirection = Enum.FillDirection.Horizontal,
							HorizontalAlignment = Enum.HorizontalAlignment.Center,
							VerticalAlignment = Enum.VerticalAlignment.Center,
							contentPadding = UDim.new(0, 1)
						}, {
							WouldYouLikeText = RoactModule.createElement(FitTextLabel, {
								LayoutOrder = 1,
								BackgroundTransparency = 1,
								TextWrapped = true,
								RichText = true,
								width = FitTextLabel.Width.FitToText,
								maximumWidth = p1.state.contentSize.X * 0.8,
								Font = _Font.Body.Font,
								Text = Text,
								TextSize = _Font.BaseSize * _Font.Body.RelativeSize,
								TextColor3 = Theme.TextDefault.Color
							})
						}),
						DisclosureFrame = RoactModule.createElement(FitFrameVertical, {
							LayoutOrder = 4,
							BackgroundTransparency = 1,
							width = UDim.new(1, 0),
							FillDirection = Enum.FillDirection.Vertical,
							HorizontalAlignment = Enum.HorizontalAlignment.Center,
							VerticalAlignment = Enum.VerticalAlignment.Center,
							contentPadding = UDim.new(0, 1)
						}, {
							DisclosurePayment = RoactModule.createElement(FitTextLabel, {
								LayoutOrder = 1,
								BackgroundTransparency = 1,
								TextWrapped = true,
								width = FitTextLabel.Width.FitToText,
								Font = _Font.Footer.Font,
								Text = p2.DisclosurePayment,
								TextSize = _Font.BaseSize * _Font.Footer.RelativeSize,
								TextColor3 = Theme.TextDefault.Color
							}),
							DisclosureTerms = RoactModule.createElement(FitTextLabel, {
								LayoutOrder = 2,
								BackgroundTransparency = 1,
								width = FitTextLabel.Width.FitToText,
								Font = _Font.Footer.Font,
								Text = p2.DisclosureTerms,
								TextSize = _Font.BaseSize * _Font.Footer.RelativeSize,
								TextColor3 = Theme.TextDefault.Color
							})
						})
					})
				end,
				buttonStackInfo = {
					buttons = {
						{
							props = {
								isDisabled = p1.props.isDisabled,
								onActivated = p1.props.cancelPurchaseActivated,
								text = p2.ButtonCancel,
								inputIcon = p1.props.cancelControllerIcon
							}
						},
						{
							buttonType = ButtonType.PrimarySystem,
							props = {
								delayInputSeconds = 3,
								isLoading = p1.props.isLoading,
								isDisabled = p1.props.isDisabled,
								isDelayedInput = p1.props.isDelayedInput,
								enableInputDelayed = p1.props.enableInputDelayed,
								onActivated = p1.props.buyItemActivated,
								text = p2.BuyRobuxButton,
								inputIcon = p1.props.buyItemControllerIcon
							}
						}
					}
				},
				footerContent = function()
					-- upvalues: p1 (upval), p3 (copy), Robux (ref), p2 (upval)
					return p1:renderFooterExperiment(p3, Robux, p2.BonusBannerInfo)
				end
			})
		end)
	end)
end

function ExtendResult.renderFooterExperiment(p1, p2, Text, Text1)
	-- upvalues: Colors (copy), RoactModule (copy), FitFrameVertical (copy), FoundationFontFaceMigration (copy), NormalizeFontFaceFunction (copy), FFlagLowCogsBannerInfoIconModule (copy), InfoIconWithTooltipModule (copy)
	local _Font = p2.Font
	local Flint = Colors.Flint
	
	return if Text == "" then nil else RoactModule.createElement(FitFrameVertical, {
		BackgroundTransparency = 1,
		width = UDim.new(1, 0),
		margin = { top = 0, bottom = -24, left = -24, right = -24 },
		[RoactModule.Ref] = p1.footerRef,
		[RoactModule.Change.AbsoluteSize] = p1.changeFooterSize
	}, {
		Banner = RoactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Image = "rbxasset://textures/ui/BottomRoundedRect8px.png",
			ImageColor3 = Color3.fromRGB(239, 215, 140),
			Size = UDim2.new(1, 0, 0, 40),
			AutomaticSize = Enum.AutomaticSize.Y,
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = Rect.new(8, 0, 24, 16)
		}, {
			BannerContent = RoactModule.createElement(FitFrameVertical, {
				LayoutOrder = 2,
				BackgroundTransparency = 1,
				width = UDim.new(1, 0),
				margin = { top = 12, bottom = 0, left = 0, right = 0 },
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				VerticalAlignment = Enum.VerticalAlignment.Center
			}, {
				BonusBefore = RoactModule.createElement("TextLabel", {
					LayoutOrder = 1,
					BackgroundTransparency = 1,
					RichText = true,
					TextWrap = true,
					AutomaticSize = Enum.AutomaticSize.XY,
					Font = if FoundationFontFaceMigration then nil else _Font.Footer.Font,
					FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(p2.Tokens.Typography.CaptionSmall.Font) else nil,
					Text = Text,
					TextSize = _Font.BaseSize * _Font.Footer.RelativeSize,
					TextColor3 = Flint
				}),
				InfoIcon = if FFlagLowCogsBannerInfoIconModule then InfoIconWithTooltipModule({
					layoutOrder = 2,
					text = Text1,
					color = Flint,
					eventActivated = p1.bonusBannerInfoIconStateChange
				}) else nil
			})
		})
	})
end

return ExtendResult