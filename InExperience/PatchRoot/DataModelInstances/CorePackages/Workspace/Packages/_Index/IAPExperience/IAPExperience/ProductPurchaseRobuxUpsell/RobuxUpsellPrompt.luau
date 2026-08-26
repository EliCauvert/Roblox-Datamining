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

function name.init(p1)
	-- upvalues: roactModule (ref), getEnableCondenseRobuxUpsellModule (ref), constantsModule (ref)
	p1.contentRef = roactModule.createRef()
	p1.state = {
		isCondensed = false,
		contentSize = Vector2.new(0, 0),
		footerSize = Vector2.new(0, 0)
	}
	
	function p0.validateCondensedCondition(p2)
		-- upvalues: getEnableCondenseRobuxUpsellModule (copy), constantsModule (copy), p1 (ref)
		if not getEnableCondenseRobuxUpsellModule() then return end
		local var1 = p2.AbsoluteSize.Y + constantsModule.MODAL_HEIGHT_WITHOUT_CONTENT + constantsModule.MODAL_NORMAL_SECTION_PADDING * 2 + constantsModule.MODAL_NORMAL_BUTTON_HEIGHT * 2
		
		if p1.state.isCondensed then
			p1:setState({
				isCondensed = p1.props.screenSize.Y < var1 + (constantsModule.MODAL_NORMAL_CONTENT_PADDING - constantsModule.MODAL_CONDENSED_CONTENT_PADDING) * 6 + (constantsModule.MODAL_NORMAL_BUTTON_MARGIN - constantsModule.MODAL_CONDENSED_BUTTON_MARGIN) + (constantsModule.NORMAL_ICON_SIZE - constantsModule.CONDENSED_ICON_SIZE)
			})
			
			return
		end
		p1:setState({
			isCondensed = p1.props.screenSize.Y < var1 + constantsModule.MODAL_NORMAL_BUTTON_MARGIN
		})
	end
	
	function p0.changeContentSize(p2)
		-- upvalues: p1 (ref)
		p1.validateCondensedCondition(p2)
		
		if p1.state.contentSize ~= p2.AbsoluteSize then
			p1:setState({ contentSize = p2.AbsoluteSize })
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

function name.render(p1)
	-- upvalues: sharedFlagsModule (ref), roactModule (ref), localizationProvider (ref), localization (ref), localizationService (ref), fFlagMobilePopularItemBadgingExperimentEnabledModule (ref), multiTextLocalizerModule (ref)
	return if sharedFlagsModule.FFlagLowCogsBannerExperiment then roactModule.createElement(localizationProvider, {
		localization = localization.new(localizationService.RobloxLocaleId)
	}, { Alert = p1:renderNewAlert() }) elseif fFlagMobilePopularItemBadgingExperimentEnabledModule then roactModule.createElement(localizationProvider, {
		localization = localization.new(localizationService.RobloxLocaleId)
	}, { Alert = p1:renderAlertNewProductDetails() }) else roactModule.createElement(multiTextLocalizerModule, {
		keys = {
			InsufficientRobuxTitle = {
				key = "IAPExperience.RobuxUpsell.Title.InsufficientRobux"
			},
			AdditionalRobux = { key = "IAPExperience.RobuxUpsell.Text.AdditionalRobux" },
			WouldYouBuy = { key = "IAPExperience.RobuxUpsell.Text.WouldYouBuy" },
			DisclosurePayment = { key = "IAPExperience.RobuxUpsell.Text.DisclosurePayment" },
			DisclosureTermsURL = {
				key = if p1.props.isVng then "IAPExperience.RobuxUpsell.Text.VNGDisclosureTermsURL" else "IAPExperience.RobuxUpsell.Text.DisclosureTermsURL"
			},
			TermsOfUse = { key = "IAPExperience.RobuxUpsell.Text.TermsOfUse" },
			BuyRobuxButton = { key = "IAPExperience.RobuxUpsell.Action.BuyRobuxAndItem" },
			ButtonCancel = { key = "IAPExperience.RobuxUpsell.Action.Cancel" },
			LoadingText = { key = "IAPExperience.RobuxUpsell.Text.Loading" },
			PurchaseNotAvialableForQuest = {
				key = "IAPExperience.RobuxUpsell.Text.PurchaseNotAvailableOnHeadSet"
			}
		},
		render = function(p2)
			-- upvalues: p1 (ref)
			return p1:renderAlert(p2)
		end
	})
end

function name.renderAlert(p1, p2)
	-- upvalues: withStyle (ref), getEnableCondenseRobuxUpsellModule (ref), roactModule (ref), interactiveAlert (ref), fitFrameVertical (ref), constantsModule (ref), productDetailsModule (ref), buttonType (ref)
	local props = p1.props
	local state = p1.state
	
	return withStyle(function(p3)
		-- upvalues: getEnableCondenseRobuxUpsellModule (copy), state (ref), props (ref), p2 (ref), roactModule (copy), interactiveAlert (copy), fitFrameVertical (copy), constantsModule (copy), p1 (ref), productDetailsModule (copy), buttonType (copy)
		local theme = p3.Theme
		local font = p3.Font
		local var1 = font.BaseSize * font.Body.RelativeSize
		
		if getEnableCondenseRobuxUpsellModule() then
			var1 = if state.isCondensed then var1 * 0.9 else var1
		end
		local var2 = p2.AdditionalRobux:gsub("{robux}", utf8.char(57346) .. tostring(props.itemRobuxCost - props.balanceAmount))
		local var3 = p2.WouldYouBuy:gsub("{robux}", string.format("<font color=\"rgb(%s)\">%s%s</font>", tostring(Color3.new(math.round(theme.TextEmphasis.Color.R * 255), math.round(theme.TextEmphasis.Color.G * 255), math.round(theme.TextEmphasis.Color.B * 255))), utf8.char(57346), tostring(props.robuxPurchaseAmount)))
		local parts = string.split(p2.DisclosureTermsURL, "{termsofuse}")
		local termsOfUse = p2.TermsOfUse
		
		if props.termsOfUseActivated then
			termsOfUse = "<u>" .. termsOfUse .. "</u>"
		end
		return roactModule.createElement(interactiveAlert, {
			screenSize = props.screenSize,
			position = props.position,
			anchorPoint = props.anchorPoint,
			title = p2.InsufficientRobuxTitle,
			middleContent = function()
				-- upvalues: roactModule (copy), fitFrameVertical (copy), getEnableCondenseRobuxUpsellModule (copy), state (copy), constantsModule (copy), p1 (copy), productDetailsModule (copy), props (copy), theme (ref), font (ref), var2 (ref), var3 (ref), var1 (write), p2 (copy), parts (ref), termsOfUse (write)
				return roactModule.createElement(fitFrameVertical, {
					BackgroundTransparency = 1,
					width = UDim.new(1, 0),
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					contentPadding = if getEnableCondenseRobuxUpsellModule() then UDim.new(0, if state.isCondensed then constantsModule.MODAL_CONDENSED_CONTENT_PADDING else constantsModule.MODAL_NORMAL_CONTENT_PADDING) else UDim.new(0, constantsModule.MODAL_NORMAL_CONTENT_PADDING),
					[roactModule.Ref] = p1.contentRef,
					[roactModule.Change.AbsoluteSize] = p1.changeContentSize
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
						Size = UDim2.new(0, p1.state.contentSize.X, 0, 0),
						AutomaticSize = Enum.AutomaticSize.Y,
						Font = font.Body.Font,
						Text = if p1.props.isQuest then var2 else var2 .. " " .. var19,
						TextSize = var1,
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
							Text = if p1.props.isQuest then p2.PurchaseNotAvailableOnHeadSet else p2.DisclosurePayment,
							TextSize = var1,
							TextColor3 = theme.TextDefault.Color,
							TextTransparency = theme.TextDefault.Transparency
						}),
						DisclosureTermsFrame = if p1.props.isQuest then nil else roactModule.createElement(fitFrameVertical, {
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
								TextSize = var1,
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
								TextSize = var1,
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
								TextSize = var1,
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
				buttons = if p1.props.isQuest then {
					{
						props = {
							isDisabled = props.isDisabled,
							onActivated = props.cancelPurchaseActivated,
							text = p2.ButtonCancel,
							inputIcon = props.cancelControllerIcon
						}
					}
				} else {
					{
						props = {
							isDisabled = props.isDisabled,
							onActivated = props.cancelPurchaseActivated,
							text = p2.ButtonCancel,
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
							text = if props.enableInputDelayed then p2.LoadingText else p2.BuyRobuxButton,
							inputIcon = props.buyItemControllerIcon
						}
					}
				}
			}
		})
	end)
end

function name.renderAlertNewProductDetails(p1, _)
	-- upvalues: withLocalization (ref), withStyle (ref), getEnableCondenseRobuxUpsellModule (ref), constantsModule (ref), roactModule (ref), productDetailsNewModule (ref), productDetailsModule (ref), interactiveAlert (ref), fitFrameVertical (ref), buttonType (ref)
	local props = p1.props
	local state = p1.state
	
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
		DisclosureTermsURL = if p1.props.isVng then "IAPExperience.RobuxUpsell.Text.VNGDisclosureTermsURL" else "IAPExperience.RobuxUpsell.Text.DisclosureTermsURL"
	})(function(p2)
		-- upvalues: withStyle (copy), getEnableCondenseRobuxUpsellModule (copy), state (ref), props (ref), constantsModule (copy), roactModule (copy), productDetailsNewModule (copy), productDetailsModule (copy), interactiveAlert (copy), fitFrameVertical (copy), p1 (ref), buttonType (copy)
		return withStyle(function(p3)
			-- upvalues: getEnableCondenseRobuxUpsellModule (copy), state (copy), props (copy), p2 (ref), constantsModule (copy), roactModule (copy), productDetailsNewModule (copy), productDetailsModule (copy), interactiveAlert (copy), fitFrameVertical (copy), p1 (copy), buttonType (copy)
			local theme = p3.Theme
			local font = p3.Font
			local var1 = font.BaseSize * font.Body.RelativeSize
			
			if getEnableCondenseRobuxUpsellModule() then
				var1 = if state.isCondensed then var1 * 0.9 else var1
			end
			local var2 = p2.AdditionalRobux:gsub("{robux}", utf8.char(57346) .. tostring(props.itemRobuxCost - props.balanceAmount))
			local var3 = p2.WouldYouBuy:gsub("{robux}", string.format("<font color=\"rgb(%s)\">%s%s</font>", tostring(Color3.new(math.round(theme.TextEmphasis.Color.R * 255), math.round(theme.TextEmphasis.Color.G * 255), math.round(theme.TextEmphasis.Color.B * 255))), utf8.char(57346), tostring(props.robuxPurchaseAmount)))
			local parts = string.split(p2.DisclosureTermsURL, "{termsofuse}")
			local termsOfUse = p2.TermsOfUse
			
			if props.termsOfUseActivated then
				termsOfUse = "<u>" .. termsOfUse .. "</u>"
			end
			local var4 = if game.GameId then tostring(game.GameId) else nil
			local var5 = if props.itemProductId then tostring(props.itemProductId) else nil
			local t = {
				layoutOrder = 1,
				model = props.model,
				itemIcon = props.itemIcon,
				itemName = props.itemName,
				itemRobuxCost = props.itemRobuxCost,
				itemIconWidth = if getEnableCondenseRobuxUpsellModule() then if state.isCondensed then constantsModule.CONDENSED_ICON_SIZE else nil else nil,
				itemIconHeight = if getEnableCondenseRobuxUpsellModule() then if state.isCondensed then constantsModule.CONDENSED_ICON_SIZE else nil else nil
			}
			local var6 = false
			local var7 = nil
			local var8 = nil
			local var9 = 0
			
			if var4 then
				local var10
				local _ = nil
				
				if var6 and var9 ~= 0 then
					local cloned = table.clone(t)
					cloned.isPopularItem = var6
					cloned.catalogSize = var7
					cloned.salesRank = var8
					cloned.badgeText = p2.BadgeText
					cloned.universeId = var4
					cloned.itemProductId = var5
					cloned.userVariant = var9
					var10 = roactModule.createElement(productDetailsNewModule, cloned)
				else
					var10 = roactModule.createElement(productDetailsModule, t)
				end
				return roactModule.createElement(interactiveAlert, {
					screenSize = props.screenSize,
					position = props.position,
					anchorPoint = props.anchorPoint,
					title = p2.NeedMoreRobux,
					middleContent = function()
						-- upvalues: roactModule (copy), fitFrameVertical (copy), getEnableCondenseRobuxUpsellModule (copy), state (copy), constantsModule (copy), p1 (copy), var10 (write), theme (ref), font (ref), var2 (ref), var3 (ref), var1 (write), p2 (copy), parts (ref), termsOfUse (write), props (copy)
						return roactModule.createElement(fitFrameVertical, {
							BackgroundTransparency = 1,
							width = UDim.new(1, 0),
							FillDirection = Enum.FillDirection.Vertical,
							HorizontalAlignment = Enum.HorizontalAlignment.Center,
							VerticalAlignment = Enum.VerticalAlignment.Center,
							contentPadding = if getEnableCondenseRobuxUpsellModule() then UDim.new(0, if state.isCondensed then constantsModule.MODAL_CONDENSED_CONTENT_PADDING else constantsModule.MODAL_NORMAL_CONTENT_PADDING) else UDim.new(0, constantsModule.MODAL_NORMAL_CONTENT_PADDING),
							[roactModule.Ref] = p1.contentRef,
							[roactModule.Change.AbsoluteSize] = p1.changeContentSize
						}, {
							ProductDetails = var10,
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
								Size = UDim2.new(0, p1.state.contentSize.X, 0, 0),
								AutomaticSize = Enum.AutomaticSize.Y,
								Font = font.Body.Font,
								Text = if p1.props.isQuest then var2 else var2 .. " " .. var23,
								TextSize = var1,
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
									Text = if p1.props.isQuest then p2.PurchaseNotAvailableOnHeadSet else p2.DisclosurePayment,
									TextSize = var1,
									TextColor3 = theme.TextDefault.Color,
									TextTransparency = theme.TextDefault.Transparency
								}),
								DisclosureTermsFrame = if p1.props.isQuest then nil else roactModule.createElement(fitFrameVertical, {
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
										TextSize = var1,
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
										TextSize = var1,
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
										TextSize = var1,
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
						buttons = if p1.props.isQuest then {
							{
								props = {
									isDisabled = props.isDisabled,
									onActivated = props.cancelPurchaseActivated,
									text = p2.ButtonCancel,
									inputIcon = props.cancelControllerIcon
								}
							}
						} else {
							{
								props = {
									isDisabled = props.isDisabled,
									onActivated = props.cancelPurchaseActivated,
									text = p2.ButtonCancel,
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
									text = if props.enableInputDelayed then p2.LoadingText else p2.BuyRobuxButton,
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

function name.renderNewAlert(p1)
	-- upvalues: withLocalization (ref), withStyle (ref), getEnableCondenseRobuxUpsellModule (ref), roactModule (ref), interactiveAlert (ref), fitFrameVertical (ref), constantsModule (ref), productDetailsModule (ref), buttonType (ref)
	local props = p1.props
	local state = p1.state
	
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
		DisclosureTermsURL = if p1.props.isVng then "IAPExperience.RobuxUpsell.Text.VNGDisclosureTermsURL" else "IAPExperience.RobuxUpsell.Text.DisclosureTermsURL"
	})(function(p2)
		-- upvalues: withStyle (copy), getEnableCondenseRobuxUpsellModule (copy), state (ref), props (ref), roactModule (copy), interactiveAlert (copy), fitFrameVertical (copy), constantsModule (copy), p1 (ref), productDetailsModule (copy), buttonType (copy)
		return withStyle(function(p3)
			-- upvalues: getEnableCondenseRobuxUpsellModule (copy), state (copy), props (copy), p2 (ref), roactModule (copy), interactiveAlert (copy), fitFrameVertical (copy), constantsModule (copy), p1 (copy), productDetailsModule (copy), buttonType (copy)
			local theme = p3.Theme
			local font = p3.Font
			local var1 = font.BaseSize * font.Body.RelativeSize
			
			if getEnableCondenseRobuxUpsellModule() then
				var1 = if state.isCondensed then var1 * 0.9 else var1
			end
			local var2 = font.BaseSize * font.Footer.RelativeSize
			local var3 = p2.AdditionalRobux:gsub("{robux}", utf8.char(57346) .. tostring(props.itemRobuxCost - props.balanceAmount))
			local var4 = p2.WouldYouBuy:gsub("{robux}", string.format("<font color=\"rgb(%s)\">%s%s</font>", tostring(Color3.new(math.round(theme.TextEmphasis.Color.R * 255), math.round(theme.TextEmphasis.Color.G * 255), math.round(theme.TextEmphasis.Color.B * 255))), utf8.char(57346), tostring(props.robuxPurchaseAmount)))
			local parts = string.split(p2.DisclosureTermsURL, "{termsofuse}")
			local termsOfUse = p2.TermsOfUse
			
			if props.termsOfUseActivated then
				termsOfUse = "<u>" .. termsOfUse .. "</u>"
			end
			local var5 = ""
			
			if props.robuxPurchaseAmountBeforeBonus ~= nil then
				var4 = p2.WouldYouBuy:gsub("{robux}", utf8.char(57346) .. "<s>" .. tostring(props.robuxPurchaseAmountBeforeBonus) .. "</s>" .. utf8.char(57346) .. tostring(props.robuxPurchaseAmount))
				var5 = p2.BonusBannerV1:gsub("{robux}", utf8.char(57346) .. tostring(props.robuxPurchaseAmount - props.robuxPurchaseAmountBeforeBonus))
			end
			return roactModule.createElement(interactiveAlert, {
				screenSize = props.screenSize,
				position = props.position,
				anchorPoint = props.anchorPoint,
				title = p2.NeedMoreRobux,
				middleContent = function()
					-- upvalues: roactModule (copy), fitFrameVertical (copy), getEnableCondenseRobuxUpsellModule (copy), state (copy), constantsModule (copy), p1 (copy), productDetailsModule (copy), props (copy), theme (ref), font (ref), var3 (ref), var4 (write), var1 (write), p2 (copy), var2 (ref), parts (ref), termsOfUse (write)
					return roactModule.createElement(fitFrameVertical, {
						BackgroundTransparency = 1,
						BackgroundColor3 = Color3.fromRGB(0, 255, 0),
						width = UDim.new(1, 0),
						FillDirection = Enum.FillDirection.Vertical,
						HorizontalAlignment = Enum.HorizontalAlignment.Center,
						VerticalAlignment = Enum.VerticalAlignment.Center,
						contentPadding = if getEnableCondenseRobuxUpsellModule() then UDim.new(0, if state.isCondensed then constantsModule.MODAL_CONDENSED_CONTENT_PADDING else constantsModule.MODAL_NORMAL_CONTENT_PADDING) else UDim.new(0, constantsModule.MODAL_NORMAL_CONTENT_PADDING),
						[roactModule.Ref] = p1.contentRef,
						[roactModule.Change.AbsoluteSize] = p1.changeContentSize
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
							Size = UDim2.new(0, p1.state.contentSize.X, 0, 0),
							AutomaticSize = Enum.AutomaticSize.Y,
							Font = font.Body.Font,
							Text = if p1.props.isQuest then var3 else var3 .. " " .. var37,
							TextSize = var1,
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
								Text = if p1.props.isQuest then p2.PurchaseNotAvailableOnHeadSet else p2.DisclosurePayment,
								TextSize = var2,
								TextColor3 = theme.TextDefault.Color,
								TextTransparency = theme.TextDefault.Transparency
							}),
							DisclosureTermsFrame = if p1.props.isQuest then nil else roactModule.createElement(fitFrameVertical, {
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
									TextSize = var2,
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
									TextSize = var2,
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
									TextSize = var2,
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
					buttons = if p1.props.isQuest then {
						{
							props = {
								isDisabled = props.isDisabled,
								onActivated = props.cancelPurchaseActivated,
								text = p2.ButtonCancel,
								inputIcon = props.cancelControllerIcon
							}
						}
					} else {
						{
							props = {
								isDisabled = props.isDisabled,
								onActivated = props.cancelPurchaseActivated,
								text = p2.ButtonCancel,
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
								text = if props.enableInputDelayed then p2.LoadingText else p2.BuyRobuxButton,
								inputIcon = props.buyItemControllerIcon
							}
						}
					}
				},
				footerContent = function()
					-- upvalues: p1 (copy), p3 (ref), var5 (write), p2 (copy)
					return p1:renderFooterExperiment(p3, var5, p2.BonusBannerInfo)
				end
			})
		end)
	end)
end

function name.renderFooterExperiment(p1, p2, p3, p4)
	-- upvalues: colors (ref), roactModule (ref), fitFrameVertical (ref), fFlagLowCogsBannerInfoIconModule (ref), infoIconWithTooltipModule (ref)
	local font = p2.Font
	local flint = colors.Flint
	
	return if p3 == "" then nil else roactModule.createElement(fitFrameVertical, {
		BackgroundTransparency = 1,
		width = UDim.new(1, 0),
		margin = { top = 0, bottom = -24, left = -24, right = -24 },
		[roactModule.Ref] = p1.footerRef,
		[roactModule.Change.AbsoluteSize] = p1.changeFooterSize
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
					Text = p3,
					TextSize = font.BaseSize * font.Footer.RelativeSize,
					TextColor3 = flint
				}),
				InfoIcon = if fFlagLowCogsBannerInfoIconModule then infoIconWithTooltipModule({
					layoutOrder = 2,
					text = p4,
					color = flint,
					eventActivated = p1.bonusBannerInfoIconStateChange
				}) else nil
			})
		})
	})
end

return name