local parent = script.Parent
local parent_1 = parent.Parent
local parent_2 = parent_1.Parent
local roactModule = require(parent_2.Roact)
local fitFrameVertical = require(parent_2.RoactFitComponents).FitFrameVertical
local colors = require(parent_2.Style).Colors
local UIBloxModule = require(parent_2.UIBlox)
local interactiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local withStyle = UIBloxModule.Core.Style.withStyle
local fFlagLowCogsBannerInfoIconModule = require(parent_1.Flags.FFlagLowCogsBannerInfoIcon)
local infoIconWithTooltipModule = require(parent_1.Generic.InfoIconWithTooltip)
local multiTextLocalizerModule = require(parent_1.Locale.MultiTextLocalizer)
local localizationService = game:GetService("LocalizationService")
local localization = require(parent_2.AppLocales).Localization
local localizationProvider = require(parent_2.Localization).LocalizationProvider
local withLocalization = require(parent_2.Localization).withLocalization
local _ = require(parent_2.IXPServiceWrapper).IXPServiceWrapper
local sharedFlagsModule = require(parent_2.SharedFlags)
local default = require(parent_2.LoggingProtocol).default
local legacyUpsellCounterModule = require(parent_1.Generic.Events.LegacyUpsellCounter)
local loggerModule = require(parent_1.Utility.logger)
local fFlagMobilePopularItemBadgingExperimentEnabledModule = require(parent_1.Flags.FFlagMobilePopularItemBadgingExperimentEnabled)
local _ = require(parent_1.Flags.GetFStringMobilePopularItemBadgingLayer)
local productDetailsModule = require(parent.ProductDetails)
local productDetailsNewModule = require(parent.ProductDetailsNew)
local constantsModule = require(parent_1.Generic.Constants)
local getEnableCondenseRobuxUpsellModule = require(parent_1.Flags.getEnableCondenseRobuxUpsell)
local fFlagIntroduceMetricsLegacyUpsellModule = require(parent_1.Flags.FFlagIntroduceMetricsLegacyUpsell)
local name = roactModule.Component:extend(script.Name)
name.defaultProps = {
	isLoading = false,
	isDisabled = false,
	isDelayedInput = false,
	isQuest = false,
	enableInputDelayed = false,
	inputDelaySec = 3,
	isVng = false,
	anchorPoint = Vector2.new(0.5, 0.5),
	position = UDim2.new(0.5, 0, 0.5, 0)
}

function name.init(p0) --[[ line: 107 ]]
	-- upvalues: roactModule (ref), getEnableCondenseRobuxUpsellModule (ref), constantsModule (ref)
	p0.contentRef = roactModule.createRef()
	p0.state = {
		isCondensed = false,
		contentSize = Vector2.new(0, 0),
		footerSize = Vector2.new(0, 0)
	}
	
	function p0.validateCondensedCondition(p1) --[[ line: 115 ]]
		-- upvalues: getEnableCondenseRobuxUpsellModule (copy), constantsModule (copy), p0 (ref)
		if not getEnableCondenseRobuxUpsellModule() then return end
		local var16 = p1.AbsoluteSize.Y + constantsModule.MODAL_HEIGHT_WITHOUT_CONTENT + constantsModule.MODAL_NORMAL_SECTION_PADDING * 2 + constantsModule.MODAL_NORMAL_BUTTON_HEIGHT * 2
		
		if p0.state.isCondensed then
			p0:setState({
				isCondensed = p0.props.screenSize.Y < var16 + (constantsModule.MODAL_NORMAL_CONTENT_PADDING - constantsModule.MODAL_CONDENSED_CONTENT_PADDING) * 6 + (constantsModule.MODAL_NORMAL_BUTTON_MARGIN - constantsModule.MODAL_CONDENSED_BUTTON_MARGIN) + (constantsModule.NORMAL_ICON_SIZE - constantsModule.CONDENSED_ICON_SIZE)
			})
			
			return
		end
		p0:setState({
			isCondensed = p0.props.screenSize.Y < var16 + constantsModule.MODAL_NORMAL_BUTTON_MARGIN
		})
	end
	
	function p0.changeContentSize(p2) --[[ line: 143 ]]
		-- upvalues: p0 (ref)
		p0.validateCondensedCondition(p2)
		
		if p0.state.contentSize ~= p2.AbsoluteSize then
			p0:setState({ contentSize = p2.AbsoluteSize })
		end
	end
end

function name.didMount(_) --[[ line: 153 ]]
	-- upvalues: fFlagIntroduceMetricsLegacyUpsellModule (ref), loggerModule (ref), default (ref), legacyUpsellCounterModule (ref)
	if fFlagIntroduceMetricsLegacyUpsellModule then
		loggerModule.debug({ message = "Legacy Upsell Modal Shown" })
		default:logRobloxTelemetryCounter(legacyUpsellCounterModule.LegacyUpsellShownCounter, 1, {})
	end
end

function name.render(p3) --[[ line: 162 ]]
	-- upvalues: sharedFlagsModule (ref), roactModule (ref), localizationProvider (ref), localization (ref), localizationService (ref), fFlagMobilePopularItemBadgingExperimentEnabledModule (ref), multiTextLocalizerModule (ref)
	return if sharedFlagsModule.FFlagLowCogsBannerExperiment then roactModule.createElement(localizationProvider, {
		localization = localization.new(localizationService.RobloxLocaleId)
	}, { Alert = p3:renderNewAlert() }) elseif fFlagMobilePopularItemBadgingExperimentEnabledModule then roactModule.createElement(localizationProvider, {
		localization = localization.new(localizationService.RobloxLocaleId)
	}, { Alert = p3:renderAlertNewProductDetails() }) else roactModule.createElement(multiTextLocalizerModule, {
		keys = {
			InsufficientRobuxTitle = {
				key = "IAPExperience.RobuxUpsell.Title.InsufficientRobux"
			},
			AdditionalRobux = { key = "IAPExperience.RobuxUpsell.Text.AdditionalRobux" },
			WouldYouBuy = { key = "IAPExperience.RobuxUpsell.Text.WouldYouBuy" },
			DisclosurePayment = { key = "IAPExperience.RobuxUpsell.Text.DisclosurePayment" },
			DisclosureTermsURL = {
				key = if p3.props.isVng then "IAPExperience.RobuxUpsell.Text.VNGDisclosureTermsURL" else "IAPExperience.RobuxUpsell.Text.DisclosureTermsURL"
			},
			TermsOfUse = { key = "IAPExperience.RobuxUpsell.Text.TermsOfUse" },
			BuyRobuxButton = { key = "IAPExperience.RobuxUpsell.Action.BuyRobuxAndItem" },
			ButtonCancel = { key = "IAPExperience.RobuxUpsell.Action.Cancel" },
			LoadingText = { key = "IAPExperience.RobuxUpsell.Text.Loading" },
			PurchaseNotAvialableForQuest = {
				key = "IAPExperience.RobuxUpsell.Text.PurchaseNotAvailableOnHeadSet"
			}
		},
		render = function(p4) --[[ line: 220 ]]
			-- upvalues: p3 (ref)
			return p3:renderAlert(p4)
		end
	})
end

function name.renderAlert(p5, p6) --[[ line: 226 ]]
	-- upvalues: withStyle (ref), getEnableCondenseRobuxUpsellModule (ref), roactModule (ref), interactiveAlert (ref), fitFrameVertical (ref), constantsModule (ref), productDetailsModule (ref), buttonType (ref)
	local props = p5.props
	local state = p5.state
	
	return withStyle(function(p7) --[[ line: 230 ]]
		-- upvalues: getEnableCondenseRobuxUpsellModule (copy), state (ref), props (ref), p6 (ref), roactModule (copy), interactiveAlert (copy), fitFrameVertical (copy), constantsModule (copy), p5 (ref), productDetailsModule (copy), buttonType (copy)
		local theme = p7.Theme
		local font = p7.Font
		local var17 = font.BaseSize * font.Body.RelativeSize
		
		if getEnableCondenseRobuxUpsellModule() then
			var17 = if state.isCondensed then var17 * 0.9 else var17
		end
		local var18 = p6.AdditionalRobux:gsub("{robux}", utf8.char(57346) .. tostring(props.itemRobuxCost - props.balanceAmount))
		local var19 = p6.WouldYouBuy:gsub("{robux}", string.format("<font color=\"rgb(%s)\">%s%s</font>", tostring(Color3.new(math.round(theme.TextEmphasis.Color.R * 255), math.round(theme.TextEmphasis.Color.G * 255), math.round(theme.TextEmphasis.Color.B * 255))), utf8.char(57346), tostring(props.robuxPurchaseAmount)))
		local parts = string.split(p6.DisclosureTermsURL, "{termsofuse}")
		local termsOfUse = p6.TermsOfUse
		
		if props.termsOfUseActivated then
			termsOfUse = "<u>" .. termsOfUse .. "</u>"
		end
		return roactModule.createElement(interactiveAlert, {
			screenSize = props.screenSize,
			position = props.position,
			anchorPoint = props.anchorPoint,
			title = p6.InsufficientRobuxTitle,
			middleContent = function() --[[ line: 266 ]]
				-- upvalues: roactModule (copy), fitFrameVertical (copy), getEnableCondenseRobuxUpsellModule (copy), state (copy), constantsModule (copy), p5 (copy), productDetailsModule (copy), props (copy), theme (ref), font (ref), var18 (ref), var19 (ref), var17 (write), p6 (copy), parts (ref), termsOfUse (write)
				return roactModule.createElement(fitFrameVertical, {
					BackgroundTransparency = 1,
					width = UDim.new(1, 0),
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					contentPadding = if getEnableCondenseRobuxUpsellModule() then UDim.new(0, if state.isCondensed then constantsModule.MODAL_CONDENSED_CONTENT_PADDING else constantsModule.MODAL_NORMAL_CONTENT_PADDING) else UDim.new(0, constantsModule.MODAL_NORMAL_CONTENT_PADDING),
					[roactModule.Ref] = p5.contentRef,
					[roactModule.Change.AbsoluteSize] = p5.changeContentSize
				}, {
					ProductDetails = roactModule.createElement(productDetailsModule, {
						layoutOrder = 1,
						model = props.model,
						itemIcon = props.itemIcon,
						itemName = props.itemName,
						itemRobuxCost = props.itemRobuxCost,
						itemIconWidth = if getEnableCondenseRobuxUpsellModule() then if state.isCondensed then constantsModule.CONDENSED_ICON_SIZE else nil else nil,
						itemIconHeight = if getEnableCondenseRobuxUpsellModule() then if state.isCondensed then constantsModule.CONDENSED_ICON_SIZE else nil else nil
					}),
					Underline = roactModule.createElement("Frame", {
						LayoutOrder = 2,
						BorderSizePixel = 0,
						BackgroundColor3 = theme.Divider.Color,
						BackgroundTransparency = theme.Divider.Transparency,
						Size = UDim2.new(1, 0, 0, 1)
					}),
					AdditionalBuyText = roactModule.createElement("TextLabel", {
						LayoutOrder = 3,
						BackgroundTransparency = 1,
						RichText = true,
						TextWrapped = true,
						Size = UDim2.new(0, p5.state.contentSize.X, 0, 0),
						AutomaticSize = Enum.AutomaticSize.Y,
						Font = font.Body.Font,
						Text = if p5.props.isQuest then var18 else var18 .. " " .. var19,
						TextSize = var17,
						TextColor3 = theme.TextDefault.Color,
						TextTransparency = theme.TextDefault.Transparency
					}),
					Underline2 = roactModule.createElement("Frame", {
						LayoutOrder = 4,
						BorderSizePixel = 0,
						BackgroundColor3 = theme.Divider.Color,
						BackgroundTransparency = theme.Divider.Transparency,
						Size = UDim2.new(1, 0, 0, 1)
					}),
					DisclosureFrame = roactModule.createElement(fitFrameVertical, {
						LayoutOrder = 5,
						BackgroundTransparency = 1,
						width = UDim.new(1, 0),
						FillDirection = Enum.FillDirection.Vertical,
						HorizontalAlignment = Enum.HorizontalAlignment.Center,
						VerticalAlignment = Enum.VerticalAlignment.Center,
						contentPadding = UDim.new(0, 1)
					}, {
						DisclosurePayment = roactModule.createElement("TextLabel", {
							LayoutOrder = 1,
							BackgroundTransparency = 1,
							TextWrapped = true,
							AutomaticSize = Enum.AutomaticSize.XY,
							Font = font.Body.Font,
							Text = if p5.props.isQuest then p6.PurchaseNotAvailableOnHeadSet else p6.DisclosurePayment,
							TextSize = var17,
							TextColor3 = theme.TextDefault.Color,
							TextTransparency = theme.TextDefault.Transparency
						}),
						DisclosureTermsFrame = if p5.props.isQuest then nil else roactModule.createElement(fitFrameVertical, {
							LayoutOrder = 2,
							BackgroundTransparency = 1,
							width = UDim.new(1, 0),
							FillDirection = Enum.FillDirection.Horizontal,
							HorizontalAlignment = Enum.HorizontalAlignment.Center,
							VerticalAlignment = Enum.VerticalAlignment.Center,
							contentPadding = UDim.new(0, 1)
						}, {
							BeforeDisclosureText = roactModule.createElement("TextLabel", {
								LayoutOrder = 0,
								BackgroundTransparency = 1,
								AutomaticSize = Enum.AutomaticSize.XY,
								Font = font.Body.Font,
								Text = parts[1],
								TextSize = var17,
								TextColor3 = theme.TextDefault.Color,
								TextTransparency = theme.TextDefault.Transparency
							}),
							TermsOfUse = roactModule.createElement("TextButton", {
								LayoutOrder = 1,
								BackgroundTransparency = 1,
								RichText = true,
								AutomaticSize = Enum.AutomaticSize.XY,
								Font = font.Body.Font,
								Text = termsOfUse,
								TextSize = var17,
								TextColor3 = theme.TextDefault.Color,
								TextTransparency = theme.TextDefault.Transparency,
								Selectable = props.termsOfUseActivated ~= nil,
								[roactModule.Event.Activated] = props.termsOfUseActivated
							}),
							AfterDisclosureText = roactModule.createElement("TextLabel", {
								LayoutOrder = 2,
								BackgroundTransparency = 1,
								AutomaticSize = Enum.AutomaticSize.XY,
								Font = font.Body.Font,
								Text = parts[2],
								TextSize = var17,
								TextColor3 = theme.TextDefault.Color,
								TextTransparency = theme.TextDefault.Transparency
							})
						})
					})
				})
			end,
			buttonStackInfo = {
				forcedFillDirection = Enum.FillDirection.Vertical,
				marginBetween = if getEnableCondenseRobuxUpsellModule() then if state.isCondensed then constantsModule.MODAL_CONDENSED_BUTTON_MARGIN else constantsModule.MODAL_NORMAL_BUTTON_MARGIN else constantsModule.MODAL_NORMAL_BUTTON_MARGIN,
				buttons = if p5.props.isQuest then {
					{
						props = {
							isDisabled = props.isDisabled,
							onActivated = props.cancelPurchaseActivated,
							text = p6.ButtonCancel,
							inputIcon = props.cancelControllerIcon
						}
					}
				} else {
					{
						props = {
							isDisabled = props.isDisabled,
							onActivated = props.cancelPurchaseActivated,
							text = p6.ButtonCancel,
							inputIcon = props.cancelControllerIcon
						}
					},
					{
						buttonType = buttonType.PrimarySystem,
						props = {
							isLoading = props.isLoading,
							isDisabled = props.isDisabled,
							isDelayedInput = props.isDelayedInput,
							enableInputDelayed = props.enableInputDelayed,
							delayInputSeconds = props.inputDelaySec,
							onActivated = props.buyItemActivated,
							text = if props.enableInputDelayed then p6.LoadingText else p6.BuyRobuxButton,
							inputIcon = props.buyItemControllerIcon
						}
					}
				}
			}
		})
	end)
end

function name.renderAlertNewProductDetails(p8, _) --[[ line: 450 ]]
	-- upvalues: withLocalization (ref), withStyle (ref), getEnableCondenseRobuxUpsellModule (ref), constantsModule (ref), roactModule (ref), productDetailsNewModule (ref), productDetailsModule (ref), interactiveAlert (ref), fitFrameVertical (ref), buttonType (ref)
	local props = p8.props
	local state = p8.state
	
	return withLocalization({
		InsufficientRobuxTitle = "IAPExperience.RobuxUpsell.Title.InsufficientRobux",
		AdditionalRobux = "IAPExperience.RobuxUpsell.Text.AdditionalRobux",
		WouldYouBuy = "IAPExperience.RobuxUpsell.Text.WouldYouBuy",
		DisclosurePayment = "IAPExperience.RobuxUpsell.Text.DisclosurePayment",
		TermsOfUse = "IAPExperience.RobuxUpsell.Text.TermsOfUse",
		BuyRobuxButton = "IAPExperience.RobuxUpsell.Action.BuyRobuxAndItem",
		ButtonCancel = "IAPExperience.RobuxUpsell.Action.Cancel",
		LoadingText = "IAPExperience.RobuxUpsell.Text.Loading",
		PurchaseNotAvialableForQuest = "IAPExperience.RobuxUpsell.Text.PurchaseNotAvailableOnHeadSet",
		NeedMoreRobux = "IAPExperience.RobuxUpsell.Text.NeedMoreRobux",
		BadgeText = "IAPExperience.RobuxUpsell.Text.PopularItem",
		DisclosureTermsURL = if p8.props.isVng then "IAPExperience.RobuxUpsell.Text.VNGDisclosureTermsURL" else "IAPExperience.RobuxUpsell.Text.DisclosureTermsURL"
	})(function(p9) --[[ line: 468 ]]
		-- upvalues: withStyle (copy), getEnableCondenseRobuxUpsellModule (copy), state (ref), props (ref), constantsModule (copy), roactModule (copy), productDetailsNewModule (copy), productDetailsModule (copy), interactiveAlert (copy), fitFrameVertical (copy), p8 (ref), buttonType (copy)
		return withStyle(function(p10) --[[ line: 469 ]]
			-- upvalues: getEnableCondenseRobuxUpsellModule (copy), state (copy), props (copy), p9 (ref), constantsModule (copy), roactModule (copy), productDetailsNewModule (copy), productDetailsModule (copy), interactiveAlert (copy), fitFrameVertical (copy), p8 (copy), buttonType (copy)
			local theme = p10.Theme
			local font = p10.Font
			local var21 = font.BaseSize * font.Body.RelativeSize
			
			if getEnableCondenseRobuxUpsellModule() then
				var21 = if state.isCondensed then var21 * 0.9 else var21
			end
			local var22 = p9.AdditionalRobux:gsub("{robux}", utf8.char(57346) .. tostring(props.itemRobuxCost - props.balanceAmount))
			local var23 = p9.WouldYouBuy:gsub("{robux}", string.format("<font color=\"rgb(%s)\">%s%s</font>", tostring(Color3.new(math.round(theme.TextEmphasis.Color.R * 255), math.round(theme.TextEmphasis.Color.G * 255), math.round(theme.TextEmphasis.Color.B * 255))), utf8.char(57346), tostring(props.robuxPurchaseAmount)))
			local parts = string.split(p9.DisclosureTermsURL, "{termsofuse}")
			local termsOfUse = p9.TermsOfUse
			
			if props.termsOfUseActivated then
				termsOfUse = "<u>" .. termsOfUse .. "</u>"
			end
			local var25 = if game.GameId then tostring(game.GameId) else nil
			local var26 = if props.itemProductId then tostring(props.itemProductId) else nil
			local t = {
				layoutOrder = 1,
				model = props.model,
				itemIcon = props.itemIcon,
				itemName = props.itemName,
				itemRobuxCost = props.itemRobuxCost,
				itemIconWidth = if getEnableCondenseRobuxUpsellModule() then if state.isCondensed then constantsModule.CONDENSED_ICON_SIZE else nil else nil,
				itemIconHeight = if getEnableCondenseRobuxUpsellModule() then if state.isCondensed then constantsModule.CONDENSED_ICON_SIZE else nil else nil
			}
			local var28 = false
			local var29 = nil
			local var30 = nil
			local var31 = 0
			
			if var25 then
				local var32
				local _ = nil
				
				if var28 and var31 ~= 0 then
					local cloned = table.clone(t)
					cloned.isPopularItem = var28
					cloned.catalogSize = var29
					cloned.salesRank = var30
					cloned.badgeText = p9.BadgeText
					cloned.universeId = var25
					cloned.itemProductId = var26
					cloned.userVariant = var31
					var32 = roactModule.createElement(productDetailsNewModule, cloned)
				else
					var32 = roactModule.createElement(productDetailsModule, t)
				end
				return roactModule.createElement(interactiveAlert, {
					screenSize = props.screenSize,
					position = props.position,
					anchorPoint = props.anchorPoint,
					title = p9.NeedMoreRobux,
					middleContent = function() --[[ line: 570 ]]
						-- upvalues: roactModule (copy), fitFrameVertical (copy), getEnableCondenseRobuxUpsellModule (copy), state (copy), constantsModule (copy), p8 (copy), var32 (write), theme (ref), font (ref), var22 (ref), var23 (ref), var21 (write), p9 (copy), parts (ref), termsOfUse (write), props (copy)
						return roactModule.createElement(fitFrameVertical, {
							BackgroundTransparency = 1,
							width = UDim.new(1, 0),
							FillDirection = Enum.FillDirection.Vertical,
							HorizontalAlignment = Enum.HorizontalAlignment.Center,
							VerticalAlignment = Enum.VerticalAlignment.Center,
							contentPadding = if getEnableCondenseRobuxUpsellModule() then UDim.new(0, if state.isCondensed then constantsModule.MODAL_CONDENSED_CONTENT_PADDING else constantsModule.MODAL_NORMAL_CONTENT_PADDING) else UDim.new(0, constantsModule.MODAL_NORMAL_CONTENT_PADDING),
							[roactModule.Ref] = p8.contentRef,
							[roactModule.Change.AbsoluteSize] = p8.changeContentSize
						}, {
							ProductDetails = var32,
							SimulateMargin = roactModule.createElement("Frame", {
								BackgroundTransparency = 1,
								LayoutOrder = 2,
								Size = UDim2.new(0, 12, 0, 12)
							}),
							Underline = roactModule.createElement("Frame", {
								LayoutOrder = 2,
								BorderSizePixel = 0,
								BackgroundColor3 = theme.Divider.Color,
								BackgroundTransparency = theme.Divider.Transparency,
								Size = UDim2.new(1, 0, 0, 1)
							}),
							AdditionalBuyText = roactModule.createElement("TextLabel", {
								LayoutOrder = 3,
								BackgroundTransparency = 1,
								RichText = true,
								TextWrapped = true,
								Size = UDim2.new(0, p8.state.contentSize.X, 0, 0),
								AutomaticSize = Enum.AutomaticSize.Y,
								Font = font.Body.Font,
								Text = if p8.props.isQuest then var22 else var22 .. " " .. var23,
								TextSize = var21,
								TextColor3 = theme.TextDefault.Color,
								TextTransparency = theme.TextDefault.Transparency
							}),
							Underline2 = roactModule.createElement("Frame", {
								LayoutOrder = 4,
								BorderSizePixel = 0,
								BackgroundColor3 = theme.Divider.Color,
								BackgroundTransparency = theme.Divider.Transparency,
								Size = UDim2.new(1, 0, 0, 1)
							}),
							DisclosureFrame = roactModule.createElement(fitFrameVertical, {
								LayoutOrder = 5,
								BackgroundTransparency = 1,
								width = UDim.new(1, 0),
								FillDirection = Enum.FillDirection.Vertical,
								HorizontalAlignment = Enum.HorizontalAlignment.Center,
								VerticalAlignment = Enum.VerticalAlignment.Center,
								contentPadding = UDim.new(0, 1)
							}, {
								DisclosurePayment = roactModule.createElement("TextLabel", {
									LayoutOrder = 1,
									BackgroundTransparency = 1,
									TextWrapped = true,
									AutomaticSize = Enum.AutomaticSize.XY,
									Font = font.Body.Font,
									Text = if p8.props.isQuest then p9.PurchaseNotAvailableOnHeadSet else p9.DisclosurePayment,
									TextSize = var21,
									TextColor3 = theme.TextDefault.Color,
									TextTransparency = theme.TextDefault.Transparency
								}),
								DisclosureTermsFrame = if p8.props.isQuest then nil else roactModule.createElement(fitFrameVertical, {
									LayoutOrder = 2,
									BackgroundTransparency = 1,
									width = UDim.new(1, 0),
									FillDirection = Enum.FillDirection.Horizontal,
									HorizontalAlignment = Enum.HorizontalAlignment.Center,
									VerticalAlignment = Enum.VerticalAlignment.Center,
									contentPadding = UDim.new(0, 1)
								}, {
									BeforeDisclosureText = roactModule.createElement("TextLabel", {
										LayoutOrder = 0,
										BackgroundTransparency = 1,
										AutomaticSize = Enum.AutomaticSize.XY,
										Font = font.Body.Font,
										Text = parts[1],
										TextSize = var21,
										TextColor3 = theme.TextDefault.Color,
										TextTransparency = theme.TextDefault.Transparency
									}),
									TermsOfUse = roactModule.createElement("TextButton", {
										LayoutOrder = 1,
										BackgroundTransparency = 1,
										RichText = true,
										AutomaticSize = Enum.AutomaticSize.XY,
										Font = font.Body.Font,
										Text = termsOfUse,
										TextSize = var21,
										TextColor3 = theme.TextDefault.Color,
										TextTransparency = theme.TextDefault.Transparency,
										Selectable = props.termsOfUseActivated ~= nil,
										[roactModule.Event.Activated] = props.termsOfUseActivated
									}),
									AfterDisclosureText = roactModule.createElement("TextLabel", {
										LayoutOrder = 2,
										BackgroundTransparency = 1,
										AutomaticSize = Enum.AutomaticSize.XY,
										Font = font.Body.Font,
										Text = parts[2],
										TextSize = var21,
										TextColor3 = theme.TextDefault.Color,
										TextTransparency = theme.TextDefault.Transparency
									})
								})
							})
						})
					end,
					buttonStackInfo = {
						forcedFillDirection = Enum.FillDirection.Vertical,
						marginBetween = if getEnableCondenseRobuxUpsellModule() then if state.isCondensed then constantsModule.MODAL_CONDENSED_BUTTON_MARGIN else constantsModule.MODAL_NORMAL_BUTTON_MARGIN else constantsModule.MODAL_NORMAL_BUTTON_MARGIN,
						buttons = if p8.props.isQuest then {
							{
								props = {
									isDisabled = props.isDisabled,
									onActivated = props.cancelPurchaseActivated,
									text = p9.ButtonCancel,
									inputIcon = props.cancelControllerIcon
								}
							}
						} else {
							{
								props = {
									isDisabled = props.isDisabled,
									onActivated = props.cancelPurchaseActivated,
									text = p9.ButtonCancel,
									inputIcon = props.cancelControllerIcon
								}
							},
							{
								buttonType = buttonType.PrimarySystem,
								props = {
									isLoading = props.isLoading,
									isDisabled = props.isDisabled,
									isDelayedInput = props.isDelayedInput,
									enableInputDelayed = props.enableInputDelayed,
									delayInputSeconds = props.inputDelaySec,
									onActivated = props.buyItemActivated,
									text = if props.enableInputDelayed then p9.LoadingText else p9.BuyRobuxButton,
									inputIcon = props.buyItemControllerIcon
								}
							}
						}
					}
				})
			end
		end)
	end)
end

function name.renderNewAlert(p11) --[[ line: 752 ]]
	-- upvalues: withLocalization (ref), withStyle (ref), getEnableCondenseRobuxUpsellModule (ref), roactModule (ref), interactiveAlert (ref), fitFrameVertical (ref), constantsModule (ref), productDetailsModule (ref), buttonType (ref)
	local props = p11.props
	local state = p11.state
	
	return withLocalization({
		InsufficientRobuxTitle = "IAPExperience.RobuxUpsell.Title.InsufficientRobux",
		AdditionalRobux = "IAPExperience.RobuxUpsell.Text.AdditionalRobux",
		WouldYouBuy = "IAPExperience.RobuxUpsell.Text.WouldYouBuy",
		DisclosurePayment = "IAPExperience.RobuxUpsell.Text.DisclosurePayment",
		TermsOfUse = "IAPExperience.RobuxUpsell.Text.TermsOfUse",
		BuyRobuxButton = "IAPExperience.RobuxUpsell.Action.BuyRobuxAndItem",
		ButtonCancel = "IAPExperience.RobuxUpsell.Action.Cancel",
		LoadingText = "IAPExperience.RobuxUpsell.Text.Loading",
		PurchaseNotAvialableForQuest = "IAPExperience.RobuxUpsell.Text.PurchaseNotAvailableOnHeadSet",
		NeedMoreRobux = "IAPExperience.RobuxUpsell.Text.NeedMoreRobux",
		BonusBannerV1 = "IAPExperience.RobuxUpsell.Text.BonusBannerV1",
		BonusBannerInfo = "IAPExperience.RobuxUpsell.Text.BonusBannerInfo",
		DisclosureTermsURL = if p11.props.isVng then "IAPExperience.RobuxUpsell.Text.VNGDisclosureTermsURL" else "IAPExperience.RobuxUpsell.Text.DisclosureTermsURL"
	})(function(p12) --[[ line: 772 ]]
		-- upvalues: withStyle (copy), getEnableCondenseRobuxUpsellModule (copy), state (ref), props (ref), roactModule (copy), interactiveAlert (copy), fitFrameVertical (copy), constantsModule (copy), p11 (ref), productDetailsModule (copy), buttonType (copy)
		return withStyle(function(p13) --[[ line: 773 ]]
			-- upvalues: getEnableCondenseRobuxUpsellModule (copy), state (copy), props (copy), p12 (ref), roactModule (copy), interactiveAlert (copy), fitFrameVertical (copy), constantsModule (copy), p11 (copy), productDetailsModule (copy), buttonType (copy)
			local theme = p13.Theme
			local font = p13.Font
			local var34 = font.BaseSize * font.Body.RelativeSize
			
			if getEnableCondenseRobuxUpsellModule() then
				var34 = if state.isCondensed then var34 * 0.9 else var34
			end
			local var35 = font.BaseSize * font.Footer.RelativeSize
			local var36 = p12.AdditionalRobux:gsub("{robux}", utf8.char(57346) .. tostring(props.itemRobuxCost - props.balanceAmount))
			local var37 = p12.WouldYouBuy:gsub("{robux}", string.format("<font color=\"rgb(%s)\">%s%s</font>", tostring(Color3.new(math.round(theme.TextEmphasis.Color.R * 255), math.round(theme.TextEmphasis.Color.G * 255), math.round(theme.TextEmphasis.Color.B * 255))), utf8.char(57346), tostring(props.robuxPurchaseAmount)))
			local parts = string.split(p12.DisclosureTermsURL, "{termsofuse}")
			local termsOfUse = p12.TermsOfUse
			
			if props.termsOfUseActivated then
				termsOfUse = "<u>" .. termsOfUse .. "</u>"
			end
			local var39 = ""
			
			if props.robuxPurchaseAmountBeforeBonus ~= nil then
				var37 = p12.WouldYouBuy:gsub("{robux}", utf8.char(57346) .. "<s>" .. tostring(props.robuxPurchaseAmountBeforeBonus) .. "</s>" .. utf8.char(57346) .. tostring(props.robuxPurchaseAmount))
				var39 = p12.BonusBannerV1:gsub("{robux}", utf8.char(57346) .. tostring(props.robuxPurchaseAmount - props.robuxPurchaseAmountBeforeBonus))
			end
			return roactModule.createElement(interactiveAlert, {
				screenSize = props.screenSize,
				position = props.position,
				anchorPoint = props.anchorPoint,
				title = p12.NeedMoreRobux,
				middleContent = function() --[[ line: 830 ]]
					-- upvalues: roactModule (copy), fitFrameVertical (copy), getEnableCondenseRobuxUpsellModule (copy), state (copy), constantsModule (copy), p11 (copy), productDetailsModule (copy), props (copy), theme (ref), font (ref), var36 (ref), var37 (write), var34 (write), p12 (copy), var35 (ref), parts (ref), termsOfUse (write)
					return roactModule.createElement(fitFrameVertical, {
						BackgroundTransparency = 1,
						BackgroundColor3 = Color3.fromRGB(0, 255, 0),
						width = UDim.new(1, 0),
						FillDirection = Enum.FillDirection.Vertical,
						HorizontalAlignment = Enum.HorizontalAlignment.Center,
						VerticalAlignment = Enum.VerticalAlignment.Center,
						contentPadding = if getEnableCondenseRobuxUpsellModule() then UDim.new(0, if state.isCondensed then constantsModule.MODAL_CONDENSED_CONTENT_PADDING else constantsModule.MODAL_NORMAL_CONTENT_PADDING) else UDim.new(0, constantsModule.MODAL_NORMAL_CONTENT_PADDING),
						[roactModule.Ref] = p11.contentRef,
						[roactModule.Change.AbsoluteSize] = p11.changeContentSize
					}, {
						ProductDetails = roactModule.createElement(productDetailsModule, {
							layoutOrder = 1,
							model = props.model,
							itemIcon = props.itemIcon,
							itemName = props.itemName,
							itemRobuxCost = props.itemRobuxCost,
							itemIconWidth = if getEnableCondenseRobuxUpsellModule() then if state.isCondensed then constantsModule.CONDENSED_ICON_SIZE else nil else nil,
							itemIconHeight = if getEnableCondenseRobuxUpsellModule() then if state.isCondensed then constantsModule.CONDENSED_ICON_SIZE else nil else nil
						}),
						Underline = roactModule.createElement("Frame", {
							LayoutOrder = 2,
							BorderSizePixel = 0,
							BackgroundColor3 = theme.Divider.Color,
							BackgroundTransparency = theme.Divider.Transparency,
							Size = UDim2.new(1, 0, 0, 1)
						}),
						AdditionalBuyText = roactModule.createElement("TextLabel", {
							LayoutOrder = 3,
							BackgroundTransparency = 1,
							RichText = true,
							TextWrapped = true,
							Size = UDim2.new(0, p11.state.contentSize.X, 0, 0),
							AutomaticSize = Enum.AutomaticSize.Y,
							Font = font.Body.Font,
							Text = if p11.props.isQuest then var36 else var36 .. " " .. var37,
							TextSize = var34,
							TextColor3 = theme.TextDefault.Color,
							TextTransparency = theme.TextDefault.Transparency
						}),
						Underline2 = roactModule.createElement("Frame", {
							LayoutOrder = 4,
							BorderSizePixel = 0,
							BackgroundColor3 = theme.Divider.Color,
							BackgroundTransparency = theme.Divider.Transparency,
							Size = UDim2.new(1, 0, 0, 1)
						}),
						DisclosureFrame = roactModule.createElement(fitFrameVertical, {
							LayoutOrder = 5,
							BackgroundTransparency = 1,
							width = UDim.new(1, 0),
							FillDirection = Enum.FillDirection.Vertical,
							HorizontalAlignment = Enum.HorizontalAlignment.Center,
							VerticalAlignment = Enum.VerticalAlignment.Center,
							contentPadding = UDim.new(0, 1)
						}, {
							DisclosurePayment = roactModule.createElement("TextLabel", {
								LayoutOrder = 1,
								BackgroundTransparency = 1,
								TextWrapped = true,
								AutomaticSize = Enum.AutomaticSize.XY,
								Font = font.Body.Font,
								Text = if p11.props.isQuest then p12.PurchaseNotAvailableOnHeadSet else p12.DisclosurePayment,
								TextSize = var35,
								TextColor3 = theme.TextDefault.Color,
								TextTransparency = theme.TextDefault.Transparency
							}),
							DisclosureTermsFrame = if p11.props.isQuest then nil else roactModule.createElement(fitFrameVertical, {
								LayoutOrder = 2,
								BackgroundTransparency = 1,
								width = UDim.new(1, 0),
								FillDirection = Enum.FillDirection.Horizontal,
								HorizontalAlignment = Enum.HorizontalAlignment.Center,
								VerticalAlignment = Enum.VerticalAlignment.Center,
								contentPadding = UDim.new(0, 1)
							}, {
								BeforeDisclosureText = roactModule.createElement("TextLabel", {
									LayoutOrder = 0,
									BackgroundTransparency = 1,
									AutomaticSize = Enum.AutomaticSize.XY,
									Font = font.Body.Font,
									Text = parts[1],
									TextSize = var35,
									TextColor3 = theme.TextDefault.Color,
									TextTransparency = theme.TextDefault.Transparency
								}),
								TermsOfUse = roactModule.createElement("TextButton", {
									LayoutOrder = 1,
									BackgroundTransparency = 1,
									RichText = true,
									AutomaticSize = Enum.AutomaticSize.XY,
									Font = font.Body.Font,
									Text = termsOfUse,
									TextSize = var35,
									TextColor3 = theme.TextDefault.Color,
									TextTransparency = theme.TextDefault.Transparency,
									Selectable = props.termsOfUseActivated ~= nil,
									[roactModule.Event.Activated] = props.termsOfUseActivated
								}),
								AfterDisclosureText = roactModule.createElement("TextLabel", {
									LayoutOrder = 2,
									BackgroundTransparency = 1,
									AutomaticSize = Enum.AutomaticSize.XY,
									Font = font.Body.Font,
									Text = parts[2],
									TextSize = var35,
									TextColor3 = theme.TextDefault.Color,
									TextTransparency = theme.TextDefault.Transparency
								})
							})
						})
					})
				end,
				buttonStackInfo = {
					forcedFillDirection = Enum.FillDirection.Vertical,
					marginBetween = if getEnableCondenseRobuxUpsellModule() then if state.isCondensed then constantsModule.MODAL_CONDENSED_BUTTON_MARGIN else constantsModule.MODAL_NORMAL_BUTTON_MARGIN else constantsModule.MODAL_NORMAL_BUTTON_MARGIN,
					buttons = if p11.props.isQuest then {
						{
							props = {
								isDisabled = props.isDisabled,
								onActivated = props.cancelPurchaseActivated,
								text = p12.ButtonCancel,
								inputIcon = props.cancelControllerIcon
							}
						}
					} else {
						{
							props = {
								isDisabled = props.isDisabled,
								onActivated = props.cancelPurchaseActivated,
								text = p12.ButtonCancel,
								inputIcon = props.cancelControllerIcon
							}
						},
						{
							buttonType = buttonType.PrimarySystem,
							props = {
								isLoading = props.isLoading,
								isDisabled = props.isDisabled,
								isDelayedInput = props.isDelayedInput,
								enableInputDelayed = props.enableInputDelayed,
								delayInputSeconds = props.inputDelaySec,
								onActivated = props.buyItemActivated,
								text = if props.enableInputDelayed then p12.LoadingText else p12.BuyRobuxButton,
								inputIcon = props.buyItemControllerIcon
							}
						}
					}
				},
				footerContent = function() --[[ line: 1007 ]]
					-- upvalues: p11 (copy), p13 (ref), var39 (write), p12 (copy)
					return p11:renderFooterExperiment(p13, var39, p12.BonusBannerInfo)
				end
			})
		end)
	end)
end

function name.renderFooterExperiment(p14, p15, p16, p17) --[[ line: 1015 ]]
	-- upvalues: colors (ref), roactModule (ref), fitFrameVertical (ref), fFlagLowCogsBannerInfoIconModule (ref), infoIconWithTooltipModule (ref)
	local font = p15.Font
	local flint = colors.Flint
	
	return if p16 == "" then nil else roactModule.createElement(fitFrameVertical, {
		BackgroundTransparency = 1,
		width = UDim.new(1, 0),
		margin = { top = 0, bottom = -24, left = -24, right = -24 },
		[roactModule.Ref] = p14.footerRef,
		[roactModule.Change.AbsoluteSize] = p14.changeFooterSize
	}, {
		Banner = roactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Image = "rbxasset://textures/ui/BottomRoundedRect8px.png",
			ImageColor3 = Color3.fromRGB(239, 215, 140),
			Size = UDim2.new(1, 0, 0, 40),
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = Rect.new(8, 0, 24, 16),
			AutomaticSize = Enum.AutomaticSize.Y
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
					TextWrapped = true,
					AutomaticSize = Enum.AutomaticSize.XY,
					Font = font.Footer.Font,
					Text = p16,
					TextSize = font.BaseSize * font.Footer.RelativeSize,
					TextColor3 = flint
				}),
				InfoIcon = if fFlagLowCogsBannerInfoIconModule then infoIconWithTooltipModule({
					layoutOrder = 2,
					text = p17,
					color = flint,
					eventActivated = p14.bonusBannerInfoIconStateChange
				}) else nil
			})
		})
	})
end

return name