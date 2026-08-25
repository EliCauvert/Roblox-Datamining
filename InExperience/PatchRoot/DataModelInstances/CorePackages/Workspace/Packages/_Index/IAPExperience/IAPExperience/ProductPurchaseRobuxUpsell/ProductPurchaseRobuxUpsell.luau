local parent = script.Parent
local parent_1 = parent.Parent
local parent_2 = parent_1.Parent
local roactModule = require(parent_2.Roact)
local tModule = require(parent_2.t)
local localizationService = game:GetService("LocalizationService")
local localization = require(parent_2.AppLocales).Localization
local localizationProvider = require(parent_2.Localization).LocalizationProvider
local withLocalization = require(parent_2.Localization).withLocalization
local roactFitComponentsModule = require(parent_2.RoactFitComponents)
local fitFrameVertical = roactFitComponentsModule.FitFrameVertical
local fitTextLabel = roactFitComponentsModule.FitTextLabel
local UIBloxModule = require(parent_2.UIBlox)
local interactiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local images = UIBloxModule.App.ImageSet.Images
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local iconSize = UIBloxModule.App.Constant.IconSize
local withStyle = UIBloxModule.Core.Style.withStyle
local colors = require(parent_2.Style).Colors
local fFlagLowCogsBannerInfoIconModule = require(parent_1.Flags.FFlagLowCogsBannerInfoIcon)
local infoIconWithTooltipModule = require(parent_1.Generic.InfoIconWithTooltip)
local sharedFlagsModule = require(parent_2.SharedFlags)
local multiTextLocalizerModule = require(parent_1.Locale.MultiTextLocalizer)
local productDetailsModule = require(parent.ProductDetails)
local robux = images["icons/common/robux"]
local name = roactModule.Component:extend(script.Name)
local getEnableFixRobuxUpsellPriceCrashModule = require(parent_1.Flags.getEnableFixRobuxUpsellPriceCrash)
local fFlagIntroduceMetricsLegacyUpsellModule = require(parent_1.Flags.FFlagIntroduceMetricsLegacyUpsell)
local default = require(parent_2.LoggingProtocol).default
local legacyUpsellCounterModule = require(parent_1.Generic.Events.LegacyUpsellCounter)
local loggerModule = require(parent_1.Utility.logger)
name.validateProps = tModule.strictInterface({
	anchorPoint = tModule.optional(tModule.Vector2),
	position = tModule.optional(tModule.UDim2),
	screenSize = tModule.Vector2,
	isLoading = tModule.optional(tModule.boolean),
	isDisabled = tModule.optional(tModule.boolean),
	isDelayedInput = tModule.optional(tModule.boolean),
	enableInputDelayed = tModule.optional(tModule.boolean),
	model = tModule.optional(tModule.table),
	itemIcon = tModule.table,
	itemName = tModule.string,
	itemRobuxCost = tModule.number,
	robuxPurchaseAmount = tModule.number,
	robuxPurchaseAmountBeforeBonus = tModule.optional(tModule.number),
	balanceAmount = tModule.number,
	buyItemControllerIcon = tModule.optional(tModule.table),
	cancelControllerIcon = tModule.optional(tModule.table),
	buyItemActivated = tModule.callback,
	cancelPurchaseActivated = tModule.callback,
	isLuobu = tModule.optional(tModule.boolean),
	isVng = tModule.optional(tModule.boolean)
})
name.defaultProps = {
	isLoading = false,
	isDisabled = false,
	isDelayedInput = false,
	enableInputDelayed = false,
	isLuobu = false,
	anchorPoint = Vector2.new(0.5, 0.5),
	position = UDim2.new(0.5, 0, 0.5, 0)
}

function name.init(p0)
	-- upvalues: roactModule (ref)
	p0.contentRef = roactModule.createRef()
	p0.footerRef = roactModule.createRef()
	p0.state = {
		contentSize = Vector2.new(0, 0),
		footerSize = Vector2.new(0, 0)
	}
	
	function p0.changeContentSize(p1)
		-- upvalues: p0 (ref)
		if p0.state.contentSize ~= p1.AbsoluteSize then
			p0:setState({ contentSize = p1.AbsoluteSize })
		end
	end
	
	function p0.changeFooterSize(p2)
		-- upvalues: p0 (ref)
		if p0.state.footerSize ~= p2.AbsoluteSize then
			p0:setState({ footerSize = p2.AbsoluteSize })
		end
	end
end

function name.didMount(_)
	-- upvalues: fFlagIntroduceMetricsLegacyUpsellModule (ref), loggerModule (ref), default (ref), legacyUpsellCounterModule (ref)
	if fFlagIntroduceMetricsLegacyUpsellModule then
		loggerModule.debug({ message = "Legacy Upsell Modal Shown" })
		default:logRobloxTelemetryCounter(legacyUpsellCounterModule.LegacyUpsellShownCounter, 1, {})
	end
end

function name.render(p3)
	-- upvalues: sharedFlagsModule (ref), roactModule (ref), localizationProvider (ref), localization (ref), localizationService (ref), multiTextLocalizerModule (ref)
	return if sharedFlagsModule.FFlagLowCogsBannerExperiment then roactModule.createElement(localizationProvider, {
		localization = localization.new(localizationService.RobloxLocaleId)
	}, { Alert = p3:renderNewAlert() }) else roactModule.createElement(multiTextLocalizerModule, {
		keys = {
			InsufficientFundsTitle = {
				key = "IAPExperience.RobuxUpsell.Title.InsufficientFunds"
			},
			BuyRobuxQuestion = {
				key = if p3.props.isLuobu then "IAPExperience.RobuxUpsell.Text.BuyRobuxQuestionWithWarning" else "IAPExperience.RobuxUpsell.Text.BuyRobuxQuestion"
			},
			DisclosurePayment = { key = "IAPExperience.RobuxUpsell.Text.DisclosurePayment" },
			DisclosureTerms = {
				key = if p3.props.isVng then "IAPExperience.RobuxUpsell.Text.VNGDisclosureTerms" else "IAPExperience.RobuxUpsell.Text.DisclosureTerms"
			},
			RemainingBalance = { key = "IAPExperience.RobuxUpsell.Text.RemainingBalance" },
			BuyRobuxButton = { key = "IAPExperience.RobuxUpsell.Action.BuyRobux" },
			ButtonCancel = { key = "IAPExperience.RobuxUpsell.Action.Cancel" },
			LoadingText = { key = "IAPExperience.RobuxUpsell.Text.Loading" }
		},
		render = function(p4)
			-- upvalues: p3 (ref)
			return p3:renderAlert(p4)
		end
	})
end

function name.renderAlert(p5, p6)
	-- upvalues: withStyle (ref), getEnableFixRobuxUpsellPriceCrashModule (ref), roactModule (ref), interactiveAlert (ref), fitFrameVertical (ref), productDetailsModule (ref), fitTextLabel (ref), imageSetLabel (ref), robux (ref), buttonType (ref), iconSize (ref)
	return withStyle(function(p7)
		-- upvalues: getEnableFixRobuxUpsellPriceCrashModule (copy), p5 (ref), roactModule (copy), interactiveAlert (copy), p6 (ref), fitFrameVertical (copy), productDetailsModule (copy), fitTextLabel (copy), imageSetLabel (copy), robux (copy), buttonType (copy), iconSize (copy)
		local theme = p7.Theme
		local font = p7.Font
		local var15 = if getEnableFixRobuxUpsellPriceCrashModule() then (p5.props.balanceAmount or 0) + (p5.props.robuxPurchaseAmount or 0) - (p5.props.itemRobuxCost or 0) else p5.props.balanceAmount + p5.props.robuxPurchaseAmount - p5.props.itemRobuxCost
		
		return roactModule.createElement(interactiveAlert, {
			screenSize = p5.props.screenSize,
			position = p5.props.position,
			anchorPoint = p5.props.anchorPoint,
			title = p6.InsufficientFundsTitle,
			middleContent = function()
				-- upvalues: roactModule (copy), fitFrameVertical (copy), p5 (copy), productDetailsModule (copy), theme (ref), fitTextLabel (copy), font (ref), p6 (copy), imageSetLabel (copy), robux (copy)
				return roactModule.createElement(fitFrameVertical, {
					BackgroundTransparency = 1,
					width = UDim.new(1, 0),
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					contentPadding = UDim.new(0, 15),
					[roactModule.Ref] = p5.contentRef,
					[roactModule.Change.AbsoluteSize] = p5.changeContentSize
				}, {
					ItemDetails = roactModule.createElement(productDetailsModule, {
						layoutOrder = 1,
						model = p5.props.model,
						itemIcon = p5.props.itemIcon,
						itemName = p5.props.itemName,
						itemRobuxCost = p5.props.itemRobuxCost
					}),
					Underline = roactModule.createElement("Frame", {
						LayoutOrder = 2,
						BorderSizePixel = 0,
						BackgroundColor3 = theme.Divider.Color,
						BackgroundTransparency = theme.Divider.Transparency,
						Size = UDim2.new(1, 0, 0, 1)
					}),
					ConfirmationFrame = roactModule.createElement(fitFrameVertical, {
						LayoutOrder = 3,
						BackgroundTransparency = 1,
						width = UDim.new(1, 0),
						FillDirection = Enum.FillDirection.Horizontal,
						HorizontalAlignment = Enum.HorizontalAlignment.Center,
						VerticalAlignment = Enum.VerticalAlignment.Center,
						contentPadding = UDim.new(0, 1)
					}, {
						WouldYouLikeText = roactModule.createElement(fitTextLabel, {
							LayoutOrder = 1,
							BackgroundTransparency = 1,
							TextWrapped = true,
							width = fitTextLabel.Width.FitToText,
							maximumWidth = p5.state.contentSize.X * 0.8,
							Font = font.Body.Font,
							Text = p6.BuyRobuxQuestion,
							TextSize = font.BaseSize * font.Body.RelativeSize,
							TextColor3 = theme.TextDefault.Color
						}),
						RobuxIcon = roactModule.createElement(imageSetLabel, {
							LayoutOrder = 2,
							BackgroundTransparency = 1,
							Position = UDim2.new(0, 5, 0, 5),
							Size = UDim2.new(0, 24, 0, 24),
							ScaleType = Enum.ScaleType.Stretch,
							Image = robux,
							ImageColor3 = theme.IconEmphasis.Color,
							ImageTransparency = theme.IconEmphasis.Transparency
						}),
						RemainingRobux = roactModule.createElement(fitTextLabel, {
							LayoutOrder = 3,
							BackgroundTransparency = 1,
							width = fitTextLabel.Width.FitToText,
							Font = font.Body.Font,
							Text = tostring(p5.props.robuxPurchaseAmount),
							TextSize = font.BaseSize * font.Body.RelativeSize,
							TextColor3 = theme.TextEmphasis.Color
						})
					}),
					DisclosureFrame = roactModule.createElement(fitFrameVertical, {
						LayoutOrder = 4,
						BackgroundTransparency = 1,
						width = UDim.new(1, 0),
						FillDirection = Enum.FillDirection.Vertical,
						HorizontalAlignment = Enum.HorizontalAlignment.Center,
						VerticalAlignment = Enum.VerticalAlignment.Center,
						contentPadding = UDim.new(0, 1)
					}, {
						DisclosurePayment = roactModule.createElement(fitTextLabel, {
							LayoutOrder = 1,
							BackgroundTransparency = 1,
							TextWrapped = true,
							width = fitTextLabel.Width.FitToText,
							Font = font.Footer.Font,
							Text = p6.DisclosurePayment,
							TextSize = font.BaseSize * font.Footer.RelativeSize,
							TextColor3 = theme.TextDefault.Color
						}),
						DisclosureTerms = roactModule.createElement(fitTextLabel, {
							LayoutOrder = 2,
							BackgroundTransparency = 1,
							width = fitTextLabel.Width.FitToText,
							Font = font.Footer.Font,
							Text = p6.DisclosureTerms,
							TextSize = font.BaseSize * font.Footer.RelativeSize,
							TextColor3 = theme.TextDefault.Color
						})
					})
				})
			end,
			buttonStackInfo = {
				buttons = {
					{
						props = {
							isDisabled = p5.props.isDisabled,
							onActivated = p5.props.cancelPurchaseActivated,
							text = p6.ButtonCancel,
							inputIcon = p5.props.cancelControllerIcon
						}
					},
					{
						buttonType = buttonType.PrimarySystem,
						props = {
							delayInputSeconds = 3,
							isLoading = p5.props.isLoading,
							isDisabled = p5.props.isDisabled,
							isDelayedInput = p5.props.isDelayedInput,
							enableInputDelayed = p5.props.enableInputDelayed,
							onActivated = p5.props.buyItemActivated,
							text = p6.BuyRobuxButton,
							inputIcon = p5.props.buyItemControllerIcon
						}
					}
				}
			},
			footerContent = function()
				-- upvalues: p6 (copy), roactModule (copy), fitFrameVertical (copy), p5 (copy), fitTextLabel (copy), font (ref), theme (ref), imageSetLabel (copy), iconSize (copy), robux (copy), var15 (write)
				local parts = string.split(p6.RemainingBalance, " {robux} ")
				
				return roactModule.createElement(fitFrameVertical, {
					BackgroundTransparency = 1,
					width = UDim.new(1, 0),
					FillDirection = Enum.FillDirection.Horizontal,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					contentPadding = UDim.new(0, 1),
					[roactModule.Ref] = p5.footerRef,
					[roactModule.Change.AbsoluteSize] = p5.changeFooterSize
				}, {
					RemainingBalanceBefore = roactModule.createElement(fitTextLabel, {
						LayoutOrder = 1,
						BackgroundTransparency = 1,
						width = fitTextLabel.Width.FitToText,
						Font = font.Footer.Font,
						Text = parts[1],
						TextSize = font.BaseSize * font.Footer.RelativeSize,
						TextColor3 = theme.TextDefault.Color
					}),
					RobuxIcon = roactModule.createElement(imageSetLabel, {
						LayoutOrder = 2,
						BackgroundTransparency = 1,
						Position = UDim2.new(0, 5, 0, 5),
						Size = UDim2.new(0, iconSize.Small, 0, iconSize.Small),
						ScaleType = Enum.ScaleType.Stretch,
						Image = robux,
						ImageColor3 = theme.IconEmphasis.Color,
						ImageTransparency = theme.IconEmphasis.Transparency
					}),
					RemainingRobux = roactModule.createElement(fitTextLabel, {
						LayoutOrder = 3,
						BackgroundTransparency = 1,
						width = fitTextLabel.Width.FitToText,
						Font = font.Footer.Font,
						Text = var15,
						TextSize = font.BaseSize * font.Footer.RelativeSize,
						TextColor3 = theme.TextDefault.Color
					}),
					RemainingBalanceAfter = roactModule.createElement(fitTextLabel, {
						LayoutOrder = 4,
						BackgroundTransparency = 1,
						width = fitTextLabel.Width.FitToText,
						Font = font.Footer.Font,
						Text = parts[2],
						TextSize = font.BaseSize * font.Footer.RelativeSize,
						TextColor3 = theme.TextDefault.Color
					})
				})
			end
		})
	end)
end

function name.renderNewAlert(p8)
	-- upvalues: withLocalization (ref), withStyle (ref), roactModule (ref), interactiveAlert (ref), fitFrameVertical (ref), productDetailsModule (ref), fitTextLabel (ref), buttonType (ref)
	return withLocalization({
		InsufficientFundsTitle = "IAPExperience.RobuxUpsell.Title.InsufficientFunds",
		DisclosurePayment = "IAPExperience.RobuxUpsell.Text.DisclosurePayment",
		RemainingBalance = "IAPExperience.RobuxUpsell.Text.RemainingBalance",
		BuyRobuxButton = "IAPExperience.RobuxUpsell.Action.BuyRobux",
		ButtonCancel = "IAPExperience.RobuxUpsell.Action.Cancel",
		LoadingText = "IAPExperience.RobuxUpsell.Text.Loading",
		NeedMoreRobux = "IAPExperience.RobuxUpsell.Text.NeedMoreRobux",
		BonusBannerV1 = "IAPExperience.RobuxUpsell.Text.BonusBannerV1",
		BonusBannerInfo = "IAPExperience.RobuxUpsell.Text.BonusBannerInfo",
		BuyRobuxQuestion = if p8.props.isLuobu then "IAPExperience.RobuxUpsell.Text.BuyRobuxQuestionWithWarning" else "IAPExperience.RobuxUpsell.Text.BuyRobuxQuestion",
		DisclosureTerms = if p8.props.isVng then "IAPExperience.RobuxUpsell.Text.VNGDisclosureTerms" else "IAPExperience.RobuxUpsell.Text.DisclosureTerms"
	})(function(p9)
		-- upvalues: withStyle (copy), p8 (ref), roactModule (copy), interactiveAlert (copy), fitFrameVertical (copy), productDetailsModule (copy), fitTextLabel (copy), buttonType (copy)
		return withStyle(function(p10)
			-- upvalues: p9 (ref), p8 (copy), roactModule (copy), interactiveAlert (copy), fitFrameVertical (copy), productDetailsModule (copy), fitTextLabel (copy), buttonType (copy)
			local theme = p10.Theme
			local font = p10.Font
			local text = p9.BuyRobuxQuestion .. " " .. utf8.char(57346) .. tostring(p8.props.robuxPurchaseAmount)
			local var18 = ""
			
			if p8.props.robuxPurchaseAmountBeforeBonus ~= nil then
				text = p9.BuyRobuxQuestion .. " " .. ((utf8.char(57346) .. "<s>" .. tostring(p8.props.robuxPurchaseAmountBeforeBonus) .. "</s>") .. " " .. (utf8.char(57346) .. tostring(p8.props.robuxPurchaseAmount)))
				var18 = p9.BonusBannerV1:gsub("{robux}", utf8.char(57346) .. tostring(p8.props.robuxPurchaseAmount - p8.props.robuxPurchaseAmountBeforeBonus))
			end
			return roactModule.createElement(interactiveAlert, {
				screenSize = p8.props.screenSize,
				position = p8.props.position,
				anchorPoint = p8.props.anchorPoint,
				title = p9.NeedMoreRobux,
				middleContent = function()
					-- upvalues: roactModule (copy), fitFrameVertical (copy), p8 (copy), productDetailsModule (copy), theme (ref), fitTextLabel (copy), font (ref), text (write), p9 (copy)
					return roactModule.createElement(fitFrameVertical, {
						BackgroundTransparency = 1,
						width = UDim.new(1, 0),
						FillDirection = Enum.FillDirection.Vertical,
						HorizontalAlignment = Enum.HorizontalAlignment.Center,
						VerticalAlignment = Enum.VerticalAlignment.Center,
						contentPadding = UDim.new(0, 15),
						[roactModule.Ref] = p8.contentRef,
						[roactModule.Change.AbsoluteSize] = p8.changeContentSize
					}, {
						ItemDetails = roactModule.createElement(productDetailsModule, {
							layoutOrder = 1,
							model = p8.props.model,
							itemIcon = p8.props.itemIcon,
							itemName = p8.props.itemName,
							itemRobuxCost = p8.props.itemRobuxCost
						}),
						Underline = roactModule.createElement("Frame", {
							LayoutOrder = 2,
							BorderSizePixel = 0,
							BackgroundColor3 = theme.Divider.Color,
							BackgroundTransparency = theme.Divider.Transparency,
							Size = UDim2.new(1, 0, 0, 1)
						}),
						ConfirmationFrame = roactModule.createElement(fitFrameVertical, {
							LayoutOrder = 3,
							BackgroundTransparency = 1,
							width = UDim.new(1, 0),
							FillDirection = Enum.FillDirection.Horizontal,
							HorizontalAlignment = Enum.HorizontalAlignment.Center,
							VerticalAlignment = Enum.VerticalAlignment.Center,
							contentPadding = UDim.new(0, 1)
						}, {
							WouldYouLikeText = roactModule.createElement(fitTextLabel, {
								LayoutOrder = 1,
								BackgroundTransparency = 1,
								TextWrapped = true,
								RichText = true,
								width = fitTextLabel.Width.FitToText,
								maximumWidth = p8.state.contentSize.X * 0.8,
								Font = font.Body.Font,
								Text = text,
								TextSize = font.BaseSize * font.Body.RelativeSize,
								TextColor3 = theme.TextDefault.Color
							})
						}),
						DisclosureFrame = roactModule.createElement(fitFrameVertical, {
							LayoutOrder = 4,
							BackgroundTransparency = 1,
							width = UDim.new(1, 0),
							FillDirection = Enum.FillDirection.Vertical,
							HorizontalAlignment = Enum.HorizontalAlignment.Center,
							VerticalAlignment = Enum.VerticalAlignment.Center,
							contentPadding = UDim.new(0, 1)
						}, {
							DisclosurePayment = roactModule.createElement(fitTextLabel, {
								LayoutOrder = 1,
								BackgroundTransparency = 1,
								TextWrapped = true,
								width = fitTextLabel.Width.FitToText,
								Font = font.Footer.Font,
								Text = p9.DisclosurePayment,
								TextSize = font.BaseSize * font.Footer.RelativeSize,
								TextColor3 = theme.TextDefault.Color
							}),
							DisclosureTerms = roactModule.createElement(fitTextLabel, {
								LayoutOrder = 2,
								BackgroundTransparency = 1,
								width = fitTextLabel.Width.FitToText,
								Font = font.Footer.Font,
								Text = p9.DisclosureTerms,
								TextSize = font.BaseSize * font.Footer.RelativeSize,
								TextColor3 = theme.TextDefault.Color
							})
						})
					})
				end,
				buttonStackInfo = {
					buttons = {
						{
							props = {
								isDisabled = p8.props.isDisabled,
								onActivated = p8.props.cancelPurchaseActivated,
								text = p9.ButtonCancel,
								inputIcon = p8.props.cancelControllerIcon
							}
						},
						{
							buttonType = buttonType.PrimarySystem,
							props = {
								delayInputSeconds = 3,
								isLoading = p8.props.isLoading,
								isDisabled = p8.props.isDisabled,
								isDelayedInput = p8.props.isDelayedInput,
								enableInputDelayed = p8.props.enableInputDelayed,
								onActivated = p8.props.buyItemActivated,
								text = p9.BuyRobuxButton,
								inputIcon = p8.props.buyItemControllerIcon
							}
						}
					}
				},
				footerContent = function()
					-- upvalues: p8 (copy), p10 (ref), var18 (write), p9 (copy)
					return p8:renderFooterExperiment(p10, var18, p9.BonusBannerInfo)
				end
			})
		end)
	end)
end

function name.renderFooterExperiment(p11, p12, p13, p14)
	-- upvalues: colors (ref), roactModule (ref), fitFrameVertical (ref), fFlagLowCogsBannerInfoIconModule (ref), infoIconWithTooltipModule (ref)
	local font = p12.Font
	local flint = colors.Flint
	
	return if p13 == "" then nil else roactModule.createElement(fitFrameVertical, {
		BackgroundTransparency = 1,
		width = UDim.new(1, 0),
		margin = { top = 0, bottom = -24, left = -24, right = -24 },
		[roactModule.Ref] = p11.footerRef,
		[roactModule.Change.AbsoluteSize] = p11.changeFooterSize
	}, {
		Banner = roactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Image = "rbxasset://textures/ui/BottomRoundedRect8px.png",
			ImageColor3 = Color3.fromRGB(239, 215, 140),
			Size = UDim2.new(1, 0, 0, 40),
			AutomaticSize = Enum.AutomaticSize.Y,
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = Rect.new(8, 0, 24, 16)
		}, {
			BannerContent = roactModule.createElement(fitFrameVertical, {
				LayoutOrder = 2,
				BackgroundTransparency = 1,
				width = UDim.new(1, 0),
				margin = { top = 12, bottom = 0, left = 0, right = 0 },
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				VerticalAlignment = Enum.VerticalAlignment.Center
			}, {
				BonusBefore = roactModule.createElement("TextLabel", {
					LayoutOrder = 1,
					BackgroundTransparency = 1,
					RichText = true,
					TextWrap = true,
					AutomaticSize = Enum.AutomaticSize.XY,
					Font = font.Footer.Font,
					Text = p13,
					TextSize = font.BaseSize * font.Footer.RelativeSize,
					TextColor3 = flint
				}),
				InfoIcon = if fFlagLowCogsBannerInfoIconModule then infoIconWithTooltipModule({
					layoutOrder = 2,
					text = p14,
					color = flint,
					eventActivated = p11.bonusBannerInfoIconStateChange
				}) else nil
			})
		})
	})
end

return name