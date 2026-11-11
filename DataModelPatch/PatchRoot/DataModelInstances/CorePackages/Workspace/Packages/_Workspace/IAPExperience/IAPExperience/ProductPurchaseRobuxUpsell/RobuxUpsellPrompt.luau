local Parent = script.Parent
local Parent1 = Parent.Parent
local Parent2 = Parent1.Parent
local RoactModule = require(Parent2.Roact)
local FitFrameVertical = require(Parent2.RoactFitComponents).FitFrameVertical
local Colors = require(Parent2.Style).Colors
local UIBloxModule = require(Parent2.UIBlox)
local InteractiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local WithStyleFunction = UIBloxModule.Core.Style.withStyle
local FFlagLowCogsBannerInfoIconModule = require(Parent1.Flags.FFlagLowCogsBannerInfoIcon)
local InfoIconWithTooltipModule = require(Parent1.Generic.InfoIconWithTooltip)
local MultiTextLocalizerModule = require(Parent1.Locale.MultiTextLocalizer)
local LocalizationService = game:GetService("LocalizationService")
local Localization = require(Parent2.AppLocales).Localization
local LocalizationProvider = require(Parent2.Localization).LocalizationProvider
local WithLocalizationFunction = require(Parent2.Localization).withLocalization
local _ = require(Parent2.IXPServiceWrapper).IXPServiceWrapper
local SharedFlagsModule = require(Parent2.SharedFlags)
local Default = require(Parent2.LoggingProtocol).default
local LegacyUpsellCounterModule = require(Parent1.Generic.Events.LegacyUpsellCounter)
local LoggerModule = require(Parent1.Utility.logger)
local FFlagMobilePopularItemBadgingExperimentEnabledModule = require(Parent1.Flags.FFlagMobilePopularItemBadgingExperimentEnabled)
local _ = require(Parent1.Flags.GetFStringMobilePopularItemBadgingLayer)
local ProductDetailsModule = require(Parent.ProductDetails)
local ProductDetailsNewModule = require(Parent.ProductDetailsNew)
local ConstantsModule = require(Parent1.Generic.Constants)
local GetEnableCondenseRobuxUpsellModule = require(Parent1.Flags.getEnableCondenseRobuxUpsell)
local FFlagIntroduceMetricsLegacyUpsellModule = require(Parent1.Flags.FFlagIntroduceMetricsLegacyUpsell)
local ExtendResult = RoactModule.Component:extend(script.Name)
ExtendResult.defaultProps = {
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

function ExtendResult.init(p1)
	-- upvalues: RoactModule (copy), GetEnableCondenseRobuxUpsellModule (copy), ConstantsModule (copy)
	p1.contentRef = RoactModule.createRef()
	p1.state = {
		isCondensed = false,
		contentSize = Vector2.new(0, 0),
		footerSize = Vector2.new(0, 0)
	}
	
	function p1.validateCondensedCondition(Frame)
		-- upvalues: GetEnableCondenseRobuxUpsellModule (upval), ConstantsModule (upval), p1 (copy)
		if not GetEnableCondenseRobuxUpsellModule() then return end
		local NewY = Frame.AbsoluteSize.Y + ConstantsModule.MODAL_HEIGHT_WITHOUT_CONTENT + ConstantsModule.MODAL_NORMAL_SECTION_PADDING * 2 + ConstantsModule.MODAL_NORMAL_BUTTON_HEIGHT * 2
		
		if p1.state.isCondensed then
			p1:setState({
				isCondensed = p1.props.screenSize.Y < NewY + (ConstantsModule.MODAL_NORMAL_CONTENT_PADDING - ConstantsModule.MODAL_CONDENSED_CONTENT_PADDING) * 6 + (ConstantsModule.MODAL_NORMAL_BUTTON_MARGIN - ConstantsModule.MODAL_CONDENSED_BUTTON_MARGIN) + (ConstantsModule.NORMAL_ICON_SIZE - ConstantsModule.CONDENSED_ICON_SIZE)
			})
			
			return
		else
			p1:setState({
				isCondensed = p1.props.screenSize.Y < NewY + ConstantsModule.MODAL_NORMAL_BUTTON_MARGIN
			})
		end
	end
	
	function p1.changeContentSize(Frame: Frame)
		-- upvalues: p1 (copy)
		p1.validateCondensedCondition(Frame)
		
		if p1.state.contentSize ~= Frame.AbsoluteSize then
			p1:setState({ contentSize = Frame.AbsoluteSize })
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
	-- upvalues: SharedFlagsModule (copy), RoactModule (copy), LocalizationProvider (copy), Localization (copy), LocalizationService (copy), FFlagMobilePopularItemBadgingExperimentEnabledModule (copy), MultiTextLocalizerModule (copy)
	local IAPExperienceRobuxUpsellTextVNGDisclosureTermsURL: string = if p1.props.isVng then "IAPExperience.RobuxUpsell.Text.VNGDisclosureTermsURL" else "IAPExperience.RobuxUpsell.Text.DisclosureTermsURL"
	
	return if SharedFlagsModule.FFlagLowCogsBannerExperiment then RoactModule.createElement(LocalizationProvider, {
		localization = Localization.new(LocalizationService.RobloxLocaleId)
	}, { Alert = p1:renderNewAlert() }) elseif FFlagMobilePopularItemBadgingExperimentEnabledModule then RoactModule.createElement(LocalizationProvider, {
		localization = Localization.new(LocalizationService.RobloxLocaleId)
	}, { Alert = p1:renderAlertNewProductDetails() }) else RoactModule.createElement(MultiTextLocalizerModule, {
		keys = {
			InsufficientRobuxTitle = {
				key = "IAPExperience.RobuxUpsell.Title.InsufficientRobux"
			},
			AdditionalRobux = { key = "IAPExperience.RobuxUpsell.Text.AdditionalRobux" },
			WouldYouBuy = { key = "IAPExperience.RobuxUpsell.Text.WouldYouBuy" },
			DisclosurePayment = { key = "IAPExperience.RobuxUpsell.Text.DisclosurePayment" },
			DisclosureTermsURL = { key = IAPExperienceRobuxUpsellTextVNGDisclosureTermsURL },
			TermsOfUse = { key = "IAPExperience.RobuxUpsell.Text.TermsOfUse" },
			BuyRobuxButton = { key = "IAPExperience.RobuxUpsell.Action.BuyRobuxAndItem" },
			ButtonCancel = { key = "IAPExperience.RobuxUpsell.Action.Cancel" },
			LoadingText = { key = "IAPExperience.RobuxUpsell.Text.Loading" },
			PurchaseNotAvialableForQuest = {
				key = "IAPExperience.RobuxUpsell.Text.PurchaseNotAvailableOnHeadSet"
			}
		},
		render = function(p2)
			-- upvalues: p1 (copy)
			return p1:renderAlert(p2)
		end
	})
end

function ExtendResult.renderAlert(p1, p2)
	-- upvalues: WithStyleFunction (copy), GetEnableCondenseRobuxUpsellModule (copy), RoactModule (copy), InteractiveAlert (copy), FitFrameVertical (copy), ConstantsModule (copy), ProductDetailsModule (copy), ButtonType (copy)
	local Props = p1.props
	local State = p1.state
	
	return WithStyleFunction(function(p3)
		-- upvalues: GetEnableCondenseRobuxUpsellModule (upval), State (copy), Props (copy), p2 (copy), RoactModule (upval), InteractiveAlert (upval), FitFrameVertical (upval), ConstantsModule (upval), p1 (copy), ProductDetailsModule (upval), ButtonType (upval)
		local Theme = p3.Theme
		local _Font = p3.Font
		local ScaledBaseSize = _Font.BaseSize * _Font.Body.RelativeSize
		
		if GetEnableCondenseRobuxUpsellModule() then
			ScaledBaseSize = State.isCondensed and ScaledBaseSize * 0.9 or ScaledBaseSize
		end
		local Robux = p2.AdditionalRobux:gsub("{robux}", utf8.char(57346) .. tostring(Props.itemRobuxCost - Props.balanceAmount))
		local Robux1 = p2.WouldYouBuy:gsub("{robux}", (string.format("<font color=\"rgb(%s)\">%s%s</font>", tostring((Color3.new(math.round(Theme.TextEmphasis.Color.R * 255), math.round(Theme.TextEmphasis.Color.G * 255), (math.round(Theme.TextEmphasis.Color.B * 255))))), utf8.char(57346), (tostring(Props.robuxPurchaseAmount)))))
		local Parts = string.split(p2.DisclosureTermsURL, "{termsofuse}")
		local TermsOfUse = p2.TermsOfUse
		
		if Props.termsOfUseActivated then
			TermsOfUse = "<u>" .. TermsOfUse .. "</u>"
		end
		return RoactModule.createElement(InteractiveAlert, {
			screenSize = Props.screenSize,
			position = Props.position,
			anchorPoint = Props.anchorPoint,
			title = p2.InsufficientRobuxTitle,
			middleContent = function()
				-- upvalues: RoactModule (upval), FitFrameVertical (upval), GetEnableCondenseRobuxUpsellModule (upval), State (upval), ConstantsModule (upval), p1 (upval), ProductDetailsModule (upval), Props (upval), Theme (copy), _Font (copy), Robux (copy), Robux1 (copy), ScaledBaseSize (ref), p2 (upval), Parts (copy), TermsOfUse (ref)
				return RoactModule.createElement(FitFrameVertical, {
					BackgroundTransparency = 1,
					width = UDim.new(1, 0),
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					contentPadding = if GetEnableCondenseRobuxUpsellModule() then UDim.new(0, State.isCondensed and ConstantsModule.MODAL_CONDENSED_CONTENT_PADDING or ConstantsModule.MODAL_NORMAL_CONTENT_PADDING) else UDim.new(0, ConstantsModule.MODAL_NORMAL_CONTENT_PADDING),
					[RoactModule.Ref] = p1.contentRef,
					[RoactModule.Change.AbsoluteSize] = p1.changeContentSize
				}, {
					ProductDetails = RoactModule.createElement(ProductDetailsModule, {
						layoutOrder = 1,
						model = Props.model,
						itemIcon = Props.itemIcon,
						itemName = Props.itemName,
						itemRobuxCost = Props.itemRobuxCost,
						itemIconWidth = GetEnableCondenseRobuxUpsellModule() and (State.isCondensed and ConstantsModule.CONDENSED_ICON_SIZE) or nil,
						itemIconHeight = GetEnableCondenseRobuxUpsellModule() and (State.isCondensed and ConstantsModule.CONDENSED_ICON_SIZE) or nil
					}),
					Underline = RoactModule.createElement("Frame", {
						LayoutOrder = 2,
						BorderSizePixel = 0,
						BackgroundColor3 = Theme.Divider.Color,
						BackgroundTransparency = Theme.Divider.Transparency,
						Size = UDim2.new(1, 0, 0, 1)
					}),
					AdditionalBuyText = RoactModule.createElement("TextLabel", {
						LayoutOrder = 3,
						BackgroundTransparency = 1,
						RichText = true,
						TextWrapped = true,
						Size = UDim2.new(0, p1.state.contentSize.X, 0, 0),
						AutomaticSize = Enum.AutomaticSize.Y,
						Font = _Font.Body.Font,
						Text = if p1.props.isQuest then Robux else Robux .. " " .. Robux1,
						TextSize = ScaledBaseSize,
						TextColor3 = Theme.TextDefault.Color,
						TextTransparency = Theme.TextDefault.Transparency
					}),
					Underline2 = RoactModule.createElement("Frame", {
						LayoutOrder = 4,
						BorderSizePixel = 0,
						BackgroundColor3 = Theme.Divider.Color,
						BackgroundTransparency = Theme.Divider.Transparency,
						Size = UDim2.new(1, 0, 0, 1)
					}),
					DisclosureFrame = RoactModule.createElement(FitFrameVertical, {
						LayoutOrder = 5,
						BackgroundTransparency = 1,
						width = UDim.new(1, 0),
						FillDirection = Enum.FillDirection.Vertical,
						HorizontalAlignment = Enum.HorizontalAlignment.Center,
						VerticalAlignment = Enum.VerticalAlignment.Center,
						contentPadding = UDim.new(0, 1)
					}, {
						DisclosurePayment = RoactModule.createElement("TextLabel", {
							LayoutOrder = 1,
							BackgroundTransparency = 1,
							TextWrapped = true,
							AutomaticSize = Enum.AutomaticSize.XY,
							Font = _Font.Body.Font,
							Text = if p1.props.isQuest then p2.PurchaseNotAvailableOnHeadSet else p2.DisclosurePayment,
							TextSize = ScaledBaseSize,
							TextColor3 = Theme.TextDefault.Color,
							TextTransparency = Theme.TextDefault.Transparency
						}),
						DisclosureTermsFrame = if p1.props.isQuest then nil else RoactModule.createElement(FitFrameVertical, {
							LayoutOrder = 2,
							BackgroundTransparency = 1,
							width = UDim.new(1, 0),
							FillDirection = Enum.FillDirection.Horizontal,
							HorizontalAlignment = Enum.HorizontalAlignment.Center,
							VerticalAlignment = Enum.VerticalAlignment.Center,
							contentPadding = UDim.new(0, 1)
						}, {
							BeforeDisclosureText = RoactModule.createElement("TextLabel", {
								LayoutOrder = 0,
								BackgroundTransparency = 1,
								AutomaticSize = Enum.AutomaticSize.XY,
								Font = _Font.Body.Font,
								Text = Parts[1],
								TextSize = ScaledBaseSize,
								TextColor3 = Theme.TextDefault.Color,
								TextTransparency = Theme.TextDefault.Transparency
							}),
							TermsOfUse = RoactModule.createElement("TextButton", {
								LayoutOrder = 1,
								BackgroundTransparency = 1,
								RichText = true,
								AutomaticSize = Enum.AutomaticSize.XY,
								Font = _Font.Body.Font,
								Text = TermsOfUse,
								TextSize = ScaledBaseSize,
								TextColor3 = Theme.TextDefault.Color,
								TextTransparency = Theme.TextDefault.Transparency,
								Selectable = Props.termsOfUseActivated ~= nil,
								[RoactModule.Event.Activated] = Props.termsOfUseActivated
							}),
							AfterDisclosureText = RoactModule.createElement("TextLabel", {
								LayoutOrder = 2,
								BackgroundTransparency = 1,
								AutomaticSize = Enum.AutomaticSize.XY,
								Font = _Font.Body.Font,
								Text = Parts[2],
								TextSize = ScaledBaseSize,
								TextColor3 = Theme.TextDefault.Color,
								TextTransparency = Theme.TextDefault.Transparency
							})
						})
					})
				})
			end,
			buttonStackInfo = {
				forcedFillDirection = Enum.FillDirection.Vertical,
				marginBetween = GetEnableCondenseRobuxUpsellModule() and (State.isCondensed and ConstantsModule.MODAL_CONDENSED_BUTTON_MARGIN) or ConstantsModule.MODAL_NORMAL_BUTTON_MARGIN,
				buttons = if p1.props.isQuest then {
					{
						props = {
							isDisabled = Props.isDisabled,
							onActivated = Props.cancelPurchaseActivated,
							text = p2.ButtonCancel,
							inputIcon = Props.cancelControllerIcon
						}
					}
				} else {
					{
						props = {
							isDisabled = Props.isDisabled,
							onActivated = Props.cancelPurchaseActivated,
							text = p2.ButtonCancel,
							inputIcon = Props.cancelControllerIcon
						}
					},
					{
						buttonType = ButtonType.PrimarySystem,
						props = {
							isLoading = Props.isLoading,
							isDisabled = Props.isDisabled,
							isDelayedInput = Props.isDelayedInput,
							enableInputDelayed = Props.enableInputDelayed,
							delayInputSeconds = Props.inputDelaySec,
							onActivated = Props.buyItemActivated,
							text = if Props.enableInputDelayed then p2.LoadingText else p2.BuyRobuxButton,
							inputIcon = Props.buyItemControllerIcon
						}
					}
				}
			}
		})
	end)
end

function ExtendResult.renderAlertNewProductDetails(p1, _)
	-- upvalues: WithLocalizationFunction (copy), WithStyleFunction (copy), GetEnableCondenseRobuxUpsellModule (copy), ConstantsModule (copy), RoactModule (copy), ProductDetailsNewModule (copy), ProductDetailsModule (copy), InteractiveAlert (copy), FitFrameVertical (copy), ButtonType (copy)
	local Props = p1.props
	local State = p1.state
	
	return WithLocalizationFunction({
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
		-- upvalues: WithStyleFunction (upval), GetEnableCondenseRobuxUpsellModule (upval), State (copy), Props (copy), ConstantsModule (upval), RoactModule (upval), ProductDetailsNewModule (upval), ProductDetailsModule (upval), InteractiveAlert (upval), FitFrameVertical (upval), p1 (copy), ButtonType (upval)
		return WithStyleFunction(function(p3)
			-- upvalues: GetEnableCondenseRobuxUpsellModule (upval), State (upval), Props (upval), p2 (copy), ConstantsModule (upval), RoactModule (upval), ProductDetailsNewModule (upval), ProductDetailsModule (upval), InteractiveAlert (upval), FitFrameVertical (upval), p1 (upval), ButtonType (upval)
			local Theme = p3.Theme
			local _Font = p3.Font
			local ScaledBaseSize = _Font.BaseSize * _Font.Body.RelativeSize
			
			if GetEnableCondenseRobuxUpsellModule() then
				ScaledBaseSize = State.isCondensed and ScaledBaseSize * 0.9 or ScaledBaseSize
			end
			local Robux = p2.AdditionalRobux:gsub("{robux}", utf8.char(57346) .. tostring(Props.itemRobuxCost - Props.balanceAmount))
			local Robux1 = p2.WouldYouBuy:gsub("{robux}", (string.format("<font color=\"rgb(%s)\">%s%s</font>", tostring((Color3.new(math.round(Theme.TextEmphasis.Color.R * 255), math.round(Theme.TextEmphasis.Color.G * 255), (math.round(Theme.TextEmphasis.Color.B * 255))))), utf8.char(57346), (tostring(Props.robuxPurchaseAmount)))))
			local Parts = string.split(p2.DisclosureTermsURL, "{termsofuse}")
			local TermsOfUse = p2.TermsOfUse
			
			if Props.termsOfUseActivated then
				TermsOfUse = "<u>" .. TermsOfUse .. "</u>"
			end
			local Text = if game.GameId then tostring(game.GameId) else nil
			local Text1 = if Props.itemProductId then tostring(Props.itemProductId) else nil
			local config = {
				layoutOrder = 1,
				model = Props.model,
				itemIcon = Props.itemIcon,
				itemName = Props.itemName,
				itemRobuxCost = Props.itemRobuxCost,
				itemIconWidth = GetEnableCondenseRobuxUpsellModule() and (State.isCondensed and ConstantsModule.CONDENSED_ICON_SIZE) or nil,
				itemIconHeight = GetEnableCondenseRobuxUpsellModule() and (State.isCondensed and ConstantsModule.CONDENSED_ICON_SIZE) or nil
			}
			local IsPopularItem = false
			local CatalogSize = nil
			local SalesRank = nil
			local UserVariant = 0
			local Element = nil
			
			if if Text then IsPopularItem and UserVariant ~= 0 else IsPopularItem and UserVariant ~= 0 then
				local Copy = table.clone(config)
				Copy.isPopularItem = IsPopularItem
				Copy.catalogSize = CatalogSize
				Copy.salesRank = SalesRank
				Copy.badgeText = p2.BadgeText
				Copy.universeId = Text
				Copy.itemProductId = Text1
				Copy.userVariant = UserVariant
				Element = RoactModule.createElement(ProductDetailsNewModule, Copy)
			else
				Element = RoactModule.createElement(ProductDetailsModule, config)
			end
			return RoactModule.createElement(InteractiveAlert, {
				screenSize = Props.screenSize,
				position = Props.position,
				anchorPoint = Props.anchorPoint,
				title = p2.NeedMoreRobux,
				middleContent = function()
					-- upvalues: RoactModule (upval), FitFrameVertical (upval), GetEnableCondenseRobuxUpsellModule (upval), State (upval), ConstantsModule (upval), p1 (upval), Element (ref), Theme (copy), _Font (copy), Robux (copy), Robux1 (copy), ScaledBaseSize (ref), p2 (upval), Parts (copy), TermsOfUse (ref), Props (upval)
					return RoactModule.createElement(FitFrameVertical, {
						BackgroundTransparency = 1,
						width = UDim.new(1, 0),
						FillDirection = Enum.FillDirection.Vertical,
						HorizontalAlignment = Enum.HorizontalAlignment.Center,
						VerticalAlignment = Enum.VerticalAlignment.Center,
						contentPadding = if GetEnableCondenseRobuxUpsellModule() then UDim.new(0, State.isCondensed and ConstantsModule.MODAL_CONDENSED_CONTENT_PADDING or ConstantsModule.MODAL_NORMAL_CONTENT_PADDING) else UDim.new(0, ConstantsModule.MODAL_NORMAL_CONTENT_PADDING),
						[RoactModule.Ref] = p1.contentRef,
						[RoactModule.Change.AbsoluteSize] = p1.changeContentSize
					}, {
						ProductDetails = Element,
						SimulateMargin = RoactModule.createElement("Frame", {
							BackgroundTransparency = 1,
							LayoutOrder = 2,
							Size = UDim2.new(0, 12, 0, 12)
						}),
						Underline = RoactModule.createElement("Frame", {
							LayoutOrder = 2,
							BorderSizePixel = 0,
							BackgroundColor3 = Theme.Divider.Color,
							BackgroundTransparency = Theme.Divider.Transparency,
							Size = UDim2.new(1, 0, 0, 1)
						}),
						AdditionalBuyText = RoactModule.createElement("TextLabel", {
							LayoutOrder = 3,
							BackgroundTransparency = 1,
							RichText = true,
							TextWrapped = true,
							Size = UDim2.new(0, p1.state.contentSize.X, 0, 0),
							AutomaticSize = Enum.AutomaticSize.Y,
							Font = _Font.Body.Font,
							Text = if p1.props.isQuest then Robux else Robux .. " " .. Robux1,
							TextSize = ScaledBaseSize,
							TextColor3 = Theme.TextDefault.Color,
							TextTransparency = Theme.TextDefault.Transparency
						}),
						Underline2 = RoactModule.createElement("Frame", {
							LayoutOrder = 4,
							BorderSizePixel = 0,
							BackgroundColor3 = Theme.Divider.Color,
							BackgroundTransparency = Theme.Divider.Transparency,
							Size = UDim2.new(1, 0, 0, 1)
						}),
						DisclosureFrame = RoactModule.createElement(FitFrameVertical, {
							LayoutOrder = 5,
							BackgroundTransparency = 1,
							width = UDim.new(1, 0),
							FillDirection = Enum.FillDirection.Vertical,
							HorizontalAlignment = Enum.HorizontalAlignment.Center,
							VerticalAlignment = Enum.VerticalAlignment.Center,
							contentPadding = UDim.new(0, 1)
						}, {
							DisclosurePayment = RoactModule.createElement("TextLabel", {
								LayoutOrder = 1,
								BackgroundTransparency = 1,
								TextWrapped = true,
								AutomaticSize = Enum.AutomaticSize.XY,
								Font = _Font.Body.Font,
								Text = if p1.props.isQuest then p2.PurchaseNotAvailableOnHeadSet else p2.DisclosurePayment,
								TextSize = ScaledBaseSize,
								TextColor3 = Theme.TextDefault.Color,
								TextTransparency = Theme.TextDefault.Transparency
							}),
							DisclosureTermsFrame = if p1.props.isQuest then nil else RoactModule.createElement(FitFrameVertical, {
								LayoutOrder = 2,
								BackgroundTransparency = 1,
								width = UDim.new(1, 0),
								FillDirection = Enum.FillDirection.Horizontal,
								HorizontalAlignment = Enum.HorizontalAlignment.Center,
								VerticalAlignment = Enum.VerticalAlignment.Center,
								contentPadding = UDim.new(0, 1)
							}, {
								BeforeDisclosureText = RoactModule.createElement("TextLabel", {
									LayoutOrder = 0,
									BackgroundTransparency = 1,
									AutomaticSize = Enum.AutomaticSize.XY,
									Font = _Font.Body.Font,
									Text = Parts[1],
									TextSize = ScaledBaseSize,
									TextColor3 = Theme.TextDefault.Color,
									TextTransparency = Theme.TextDefault.Transparency
								}),
								TermsOfUse = RoactModule.createElement("TextButton", {
									LayoutOrder = 1,
									BackgroundTransparency = 1,
									RichText = true,
									AutomaticSize = Enum.AutomaticSize.XY,
									Font = _Font.Body.Font,
									Text = TermsOfUse,
									TextSize = ScaledBaseSize,
									TextColor3 = Theme.TextDefault.Color,
									TextTransparency = Theme.TextDefault.Transparency,
									Selectable = Props.termsOfUseActivated ~= nil,
									[RoactModule.Event.Activated] = Props.termsOfUseActivated
								}),
								AfterDisclosureText = RoactModule.createElement("TextLabel", {
									LayoutOrder = 2,
									BackgroundTransparency = 1,
									AutomaticSize = Enum.AutomaticSize.XY,
									Font = _Font.Body.Font,
									Text = Parts[2],
									TextSize = ScaledBaseSize,
									TextColor3 = Theme.TextDefault.Color,
									TextTransparency = Theme.TextDefault.Transparency
								})
							})
						})
					})
				end,
				buttonStackInfo = {
					forcedFillDirection = Enum.FillDirection.Vertical,
					marginBetween = GetEnableCondenseRobuxUpsellModule() and (State.isCondensed and ConstantsModule.MODAL_CONDENSED_BUTTON_MARGIN) or ConstantsModule.MODAL_NORMAL_BUTTON_MARGIN,
					buttons = if p1.props.isQuest then {
						{
							props = {
								isDisabled = Props.isDisabled,
								onActivated = Props.cancelPurchaseActivated,
								text = p2.ButtonCancel,
								inputIcon = Props.cancelControllerIcon
							}
						}
					} else {
						{
							props = {
								isDisabled = Props.isDisabled,
								onActivated = Props.cancelPurchaseActivated,
								text = p2.ButtonCancel,
								inputIcon = Props.cancelControllerIcon
							}
						},
						{
							buttonType = ButtonType.PrimarySystem,
							props = {
								isLoading = Props.isLoading,
								isDisabled = Props.isDisabled,
								isDelayedInput = Props.isDelayedInput,
								enableInputDelayed = Props.enableInputDelayed,
								delayInputSeconds = Props.inputDelaySec,
								onActivated = Props.buyItemActivated,
								text = if Props.enableInputDelayed then p2.LoadingText else p2.BuyRobuxButton,
								inputIcon = Props.buyItemControllerIcon
							}
						}
					}
				}
			})
		end)
	end)
end

function ExtendResult.renderNewAlert(p1)
	-- upvalues: WithLocalizationFunction (copy), WithStyleFunction (copy), GetEnableCondenseRobuxUpsellModule (copy), RoactModule (copy), InteractiveAlert (copy), FitFrameVertical (copy), ConstantsModule (copy), ProductDetailsModule (copy), ButtonType (copy)
	local Props = p1.props
	local State = p1.state
	
	return WithLocalizationFunction({
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
		-- upvalues: WithStyleFunction (upval), GetEnableCondenseRobuxUpsellModule (upval), State (copy), Props (copy), RoactModule (upval), InteractiveAlert (upval), FitFrameVertical (upval), ConstantsModule (upval), p1 (copy), ProductDetailsModule (upval), ButtonType (upval)
		return WithStyleFunction(function(p3)
			-- upvalues: GetEnableCondenseRobuxUpsellModule (upval), State (upval), Props (upval), p2 (copy), RoactModule (upval), InteractiveAlert (upval), FitFrameVertical (upval), ConstantsModule (upval), p1 (upval), ProductDetailsModule (upval), ButtonType (upval)
			local Theme = p3.Theme
			local _Font = p3.Font
			local ScaledBaseSize = _Font.BaseSize * _Font.Body.RelativeSize
			
			if GetEnableCondenseRobuxUpsellModule() then
				ScaledBaseSize = State.isCondensed and ScaledBaseSize * 0.9 or ScaledBaseSize
			end
			local ScaledBaseSize1 = _Font.BaseSize * _Font.Footer.RelativeSize
			local Robux = p2.AdditionalRobux:gsub("{robux}", utf8.char(57346) .. tostring(Props.itemRobuxCost - Props.balanceAmount))
			local Robux1 = p2.WouldYouBuy:gsub("{robux}", (string.format("<font color=\"rgb(%s)\">%s%s</font>", tostring((Color3.new(math.round(Theme.TextEmphasis.Color.R * 255), math.round(Theme.TextEmphasis.Color.G * 255), (math.round(Theme.TextEmphasis.Color.B * 255))))), utf8.char(57346), (tostring(Props.robuxPurchaseAmount)))))
			local Parts = string.split(p2.DisclosureTermsURL, "{termsofuse}")
			local TermsOfUse = p2.TermsOfUse
			
			if Props.termsOfUseActivated then
				TermsOfUse = "<u>" .. TermsOfUse .. "</u>"
			end
			local Robux2 = ""
			
			if Props.robuxPurchaseAmountBeforeBonus ~= nil then
				Robux1 = p2.WouldYouBuy:gsub("{robux}", utf8.char(57346) .. "<s>" .. tostring(Props.robuxPurchaseAmountBeforeBonus) .. "</s>" .. utf8.char(57346) .. tostring(Props.robuxPurchaseAmount))
				Robux2 = p2.BonusBannerV1:gsub("{robux}", utf8.char(57346) .. tostring(Props.robuxPurchaseAmount - Props.robuxPurchaseAmountBeforeBonus))
			end
			return RoactModule.createElement(InteractiveAlert, {
				screenSize = Props.screenSize,
				position = Props.position,
				anchorPoint = Props.anchorPoint,
				title = p2.NeedMoreRobux,
				middleContent = function()
					-- upvalues: RoactModule (upval), FitFrameVertical (upval), GetEnableCondenseRobuxUpsellModule (upval), State (upval), ConstantsModule (upval), p1 (upval), ProductDetailsModule (upval), Props (upval), Theme (copy), _Font (copy), Robux (copy), Robux1 (ref), ScaledBaseSize (ref), p2 (upval), ScaledBaseSize1 (copy), Parts (copy), TermsOfUse (ref)
					return RoactModule.createElement(FitFrameVertical, {
						BackgroundTransparency = 1,
						BackgroundColor3 = Color3.fromRGB(0, 255, 0),
						width = UDim.new(1, 0),
						FillDirection = Enum.FillDirection.Vertical,
						HorizontalAlignment = Enum.HorizontalAlignment.Center,
						VerticalAlignment = Enum.VerticalAlignment.Center,
						contentPadding = if GetEnableCondenseRobuxUpsellModule() then UDim.new(0, State.isCondensed and ConstantsModule.MODAL_CONDENSED_CONTENT_PADDING or ConstantsModule.MODAL_NORMAL_CONTENT_PADDING) else UDim.new(0, ConstantsModule.MODAL_NORMAL_CONTENT_PADDING),
						[RoactModule.Ref] = p1.contentRef,
						[RoactModule.Change.AbsoluteSize] = p1.changeContentSize
					}, {
						ProductDetails = RoactModule.createElement(ProductDetailsModule, {
							layoutOrder = 1,
							model = Props.model,
							itemIcon = Props.itemIcon,
							itemName = Props.itemName,
							itemRobuxCost = Props.itemRobuxCost,
							itemIconWidth = GetEnableCondenseRobuxUpsellModule() and (State.isCondensed and ConstantsModule.CONDENSED_ICON_SIZE) or nil,
							itemIconHeight = GetEnableCondenseRobuxUpsellModule() and (State.isCondensed and ConstantsModule.CONDENSED_ICON_SIZE) or nil
						}),
						Underline = RoactModule.createElement("Frame", {
							LayoutOrder = 2,
							BorderSizePixel = 0,
							BackgroundColor3 = Theme.Divider.Color,
							BackgroundTransparency = Theme.Divider.Transparency,
							Size = UDim2.new(1, 0, 0, 1)
						}),
						AdditionalBuyText = RoactModule.createElement("TextLabel", {
							LayoutOrder = 3,
							BackgroundTransparency = 1,
							RichText = true,
							TextWrapped = true,
							Size = UDim2.new(0, p1.state.contentSize.X, 0, 0),
							AutomaticSize = Enum.AutomaticSize.Y,
							Font = _Font.Body.Font,
							Text = if p1.props.isQuest then Robux else Robux .. " " .. Robux1,
							TextSize = ScaledBaseSize,
							TextColor3 = Theme.TextDefault.Color,
							TextTransparency = Theme.TextDefault.Transparency
						}),
						Underline2 = RoactModule.createElement("Frame", {
							LayoutOrder = 4,
							BorderSizePixel = 0,
							BackgroundColor3 = Theme.Divider.Color,
							BackgroundTransparency = Theme.Divider.Transparency,
							Size = UDim2.new(1, 0, 0, 1)
						}),
						DisclosureFrame = RoactModule.createElement(FitFrameVertical, {
							LayoutOrder = 5,
							BackgroundTransparency = 1,
							width = UDim.new(1, 0),
							FillDirection = Enum.FillDirection.Vertical,
							HorizontalAlignment = Enum.HorizontalAlignment.Center,
							VerticalAlignment = Enum.VerticalAlignment.Center,
							contentPadding = UDim.new(0, 1)
						}, {
							DisclosurePayment = RoactModule.createElement("TextLabel", {
								LayoutOrder = 1,
								BackgroundTransparency = 1,
								TextWrapped = true,
								AutomaticSize = Enum.AutomaticSize.XY,
								Font = _Font.Body.Font,
								Text = if p1.props.isQuest then p2.PurchaseNotAvailableOnHeadSet else p2.DisclosurePayment,
								TextSize = ScaledBaseSize1,
								TextColor3 = Theme.TextDefault.Color,
								TextTransparency = Theme.TextDefault.Transparency
							}),
							DisclosureTermsFrame = if p1.props.isQuest then nil else RoactModule.createElement(FitFrameVertical, {
								LayoutOrder = 2,
								BackgroundTransparency = 1,
								width = UDim.new(1, 0),
								FillDirection = Enum.FillDirection.Horizontal,
								HorizontalAlignment = Enum.HorizontalAlignment.Center,
								VerticalAlignment = Enum.VerticalAlignment.Center,
								contentPadding = UDim.new(0, 1)
							}, {
								BeforeDisclosureText = RoactModule.createElement("TextLabel", {
									LayoutOrder = 0,
									BackgroundTransparency = 1,
									AutomaticSize = Enum.AutomaticSize.XY,
									Font = _Font.Body.Font,
									Text = Parts[1],
									TextSize = ScaledBaseSize1,
									TextColor3 = Theme.TextDefault.Color,
									TextTransparency = Theme.TextDefault.Transparency
								}),
								TermsOfUse = RoactModule.createElement("TextButton", {
									LayoutOrder = 1,
									BackgroundTransparency = 1,
									RichText = true,
									AutomaticSize = Enum.AutomaticSize.XY,
									Font = _Font.Body.Font,
									Text = TermsOfUse,
									TextSize = ScaledBaseSize1,
									TextColor3 = Theme.TextDefault.Color,
									TextTransparency = Theme.TextDefault.Transparency,
									Selectable = Props.termsOfUseActivated ~= nil,
									[RoactModule.Event.Activated] = Props.termsOfUseActivated
								}),
								AfterDisclosureText = RoactModule.createElement("TextLabel", {
									LayoutOrder = 2,
									BackgroundTransparency = 1,
									AutomaticSize = Enum.AutomaticSize.XY,
									Font = _Font.Body.Font,
									Text = Parts[2],
									TextSize = ScaledBaseSize1,
									TextColor3 = Theme.TextDefault.Color,
									TextTransparency = Theme.TextDefault.Transparency
								})
							})
						})
					})
				end,
				buttonStackInfo = {
					forcedFillDirection = Enum.FillDirection.Vertical,
					marginBetween = GetEnableCondenseRobuxUpsellModule() and (State.isCondensed and ConstantsModule.MODAL_CONDENSED_BUTTON_MARGIN) or ConstantsModule.MODAL_NORMAL_BUTTON_MARGIN,
					buttons = if p1.props.isQuest then {
						{
							props = {
								isDisabled = Props.isDisabled,
								onActivated = Props.cancelPurchaseActivated,
								text = p2.ButtonCancel,
								inputIcon = Props.cancelControllerIcon
							}
						}
					} else {
						{
							props = {
								isDisabled = Props.isDisabled,
								onActivated = Props.cancelPurchaseActivated,
								text = p2.ButtonCancel,
								inputIcon = Props.cancelControllerIcon
							}
						},
						{
							buttonType = ButtonType.PrimarySystem,
							props = {
								isLoading = Props.isLoading,
								isDisabled = Props.isDisabled,
								isDelayedInput = Props.isDelayedInput,
								enableInputDelayed = Props.enableInputDelayed,
								delayInputSeconds = Props.inputDelaySec,
								onActivated = Props.buyItemActivated,
								text = if Props.enableInputDelayed then p2.LoadingText else p2.BuyRobuxButton,
								inputIcon = Props.buyItemControllerIcon
							}
						}
					}
				},
				footerContent = function()
					-- upvalues: p1 (upval), p3 (copy), Robux2 (ref), p2 (upval)
					return p1:renderFooterExperiment(p3, Robux2, p2.BonusBannerInfo)
				end
			})
		end)
	end)
end

function ExtendResult.renderFooterExperiment(p1, p2, Text, Text1)
	-- upvalues: Colors (copy), RoactModule (copy), FitFrameVertical (copy), FFlagLowCogsBannerInfoIconModule (copy), InfoIconWithTooltipModule (copy)
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
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = Rect.new(8, 0, 24, 16),
			AutomaticSize = Enum.AutomaticSize.Y
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
					TextWrapped = true,
					AutomaticSize = Enum.AutomaticSize.XY,
					Font = _Font.Footer.Font,
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