local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local RoactModule = require(Parent1.Roact)
local TModule = require(Parent1.t)
local RoactFitComponentsModule = require(Parent1.RoactFitComponents)
local FitFrameVertical = RoactFitComponentsModule.FitFrameVertical
local FitTextLabel = RoactFitComponentsModule.FitTextLabel
local UIBloxModule = require(Parent1.UIBlox)
local InteractiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local WithStyleFunction = UIBloxModule.Core.Style.withStyle
local UseDefaultFocusBehavior = require(Parent1.ReactFocusNavigation).useDefaultFocusBehavior
local CryoModule = require(Parent1.Cryo)
local ModelViewportModule = require(script.Parent.Parent.Generic.ModelViewport)
local MultiTextLocalizerModule = require(Parent.Locale.MultiTextLocalizer)
local ShouldShowNewUpsellModalExperimentModule = require(Parent.Utility.Experiments.shouldShowNewUpsellModalExperiment)
local DesktopUpsellExperimentModule = require(Parent.Utility.Experiments.DesktopUpsellExperiment)
local ProductPurchaseModalModule = require(script.Parent.v2.ProductPurchaseModal)
local IconsCommonRobux = UIBloxModule.App.ImageSet.Images["icons/common/robux"]
local Character = utf8.char(57346)
local Default = require(Parent1.LoggingProtocol).default
local PurchaseModalV1ShownCounter = require(Parent.Generic.Events.PurchaseModalCounter).PurchaseModalV1ShownCounter
local LoggerModule = require(Parent.Utility.logger)
local GetAppContextModule = require(Parent.Utility.getAppContext)
local FFlagAddDefaultFocusNavSelectorsOnBuyPurchasePromptModule = require(Parent.Flags.FFlagAddDefaultFocusNavSelectorsOnBuyPurchasePrompt)
local ExtendResult: (any) -> any = RoactModule.Component:extend(script.Name)
ExtendResult.validateProps = TModule.strictInterface({
	anchorPoint = TModule.optional(TModule.Vector2),
	position = TModule.optional(TModule.UDim2),
	screenSize = TModule.Vector2,
	isLoading = TModule.optional(TModule.boolean),
	isDisabled = TModule.optional(TModule.boolean),
	isDelayedInput = TModule.optional(TModule.boolean),
	enableInputDelayed = TModule.optional(TModule.boolean),
	itemIcon = TModule.union(TModule.string, TModule.table),
	model = TModule.optional(TModule.table),
	itemName = TModule.string,
	itemRobuxCost = TModule.number,
	currentBalance = TModule.number,
	currentBalanceValid = TModule.optional(TModule.boolean),
	isGamePass = TModule.optional(TModule.boolean),
	testPurchase = TModule.optional(TModule.boolean),
	buyItemControllerIcon = TModule.optional(TModule.table),
	cancelControllerIcon = TModule.optional(TModule.table),
	buyItemActivated = TModule.callback,
	cancelPurchaseActivated = TModule.callback,
	isLuobu = TModule.optional(TModule.boolean),
	defaultFocusRef = if FFlagAddDefaultFocusNavSelectorsOnBuyPurchasePromptModule then TModule.callback else nil,
	containerRef = if FFlagAddDefaultFocusNavSelectorsOnBuyPurchasePromptModule then TModule.callback else nil
})
ExtendResult.defaultProps = {
	isLoading = false,
	isDisabled = false,
	testPurchase = false,
	isDelayedInput = false,
	enableInputDelayed = false,
	isLuobu = false,
	isGamePass = false,
	currentBalanceValid = true,
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

function ExtendResult.render(p1)
	-- upvalues: ShouldShowNewUpsellModalExperimentModule (copy), DesktopUpsellExperimentModule (copy), RoactModule (copy), ProductPurchaseModalModule (copy), MultiTextLocalizerModule (copy)
	local IAPExperiencePurchasePromptTextBuyItemQuestionIncludingWarning: string = if p1.props.isLuobu then "IAPExperience.PurchasePrompt.Text.BuyItemQuestionIncludingWarning" else "IAPExperience.PurchasePrompt.Text.BuyItemQuestion"
	local IsGamePass = p1.props.isGamePass
	
	return if ShouldShowNewUpsellModalExperimentModule() or DesktopUpsellExperimentModule.shouldShowNewModal() then RoactModule.createElement(ProductPurchaseModalModule, {
		product = {
			itemIcon = p1.props.itemIcon,
			itemName = p1.props.itemName,
			itemRobuxCost = p1.props.itemRobuxCost
		},
		balanceAmount = p1.props.currentBalance,
		balanceAmountValid = p1.props.currentBalanceValid,
		buttons = {
			buyItemActivated = p1.props.buyItemActivated,
			buyItemControllerIcon = p1.props.buyItemControllerIcon,
			buyItemIsDelayedInput = p1.props.isDelayedInput,
			buyItemEnableInputDelayed = p1.props.enableInputDelayed,
			cancelActivated = p1.props.cancelPurchaseActivated,
			isDisabled = p1.props.isDisabled
		},
		screenSize = p1.props.screenSize
	}) else RoactModule.createElement(MultiTextLocalizerModule, {
		keys = {
			BuyItemTitle = {
				key = if IsGamePass then "IAPExperience.PurchasePrompt.Title.BuyGamepass" else "IAPExperience.PurchasePrompt.Title.BuyItem"
			},
			BuyItemQuestion = {
				key = IAPExperiencePurchasePromptTextBuyItemQuestionIncludingWarning,
				params = { name = p1.props.itemName }
			},
			RemainingBalance = {
				key = "IAPExperience.PurchasePrompt.Text.RemainingBalance"
			},
			TestPurchaseText = { key = "IAPExperience.PurchasePrompt.Text.TestPurchase" },
			ButtonCancel = { key = "IAPExperience.PurchasePrompt.Action.Cancel" },
			LoadingText = { key = "IAPExperience.PurchasePrompt.Text.Loading" }
		},
		render = function(p2)
			-- upvalues: p1 (copy)
			return p1:renderAlert(p2)
		end
	})
end

function ExtendResult.renderAlert(p1, p2)
	-- upvalues: LoggerModule (copy), GetAppContextModule (copy), Default (copy), PurchaseModalV1ShownCounter (copy), WithStyleFunction (copy), Character (copy), RoactModule (copy), ModelViewportModule (copy), ImageSetLabel (copy), InteractiveAlert (copy), FFlagAddDefaultFocusNavSelectorsOnBuyPurchasePromptModule (copy), FitFrameVertical (copy), FitTextLabel (copy), ButtonType (copy), IconsCommonRobux (copy)
	local Props = p1.props
	LoggerModule.debug({
		message = "Purchase Modal V1 Shown",
		screenHeight = Props.screenSize.Y,
		screenWidth = Props.screenSize.X,
		portrait = Props.screenSize.X < Props.screenSize.Y,
		appContext = GetAppContextModule()
	})
	Default:logRobloxTelemetryCounter(PurchaseModalV1ShownCounter, 1, {
		screenHeight = Props.screenSize.Y,
		screenWidth = Props.screenSize.X,
		portrait = Props.screenSize.X < Props.screenSize.Y,
		appContext = GetAppContextModule()
	})
	
	return WithStyleFunction(function(p3)
		-- upvalues: p1 (copy), p2 (copy), Character (upval), RoactModule (upval), ModelViewportModule (upval), ImageSetLabel (upval), InteractiveAlert (upval), FFlagAddDefaultFocusNavSelectorsOnBuyPurchasePromptModule (upval), FitFrameVertical (upval), FitTextLabel (upval), ButtonType (upval), IconsCommonRobux (upval)
		local Theme = p3.Theme
		local _Font = p3.Font
		local Color = Theme.IconEmphasis.Color
		local ScaledX = p1.state.contentSize.X * 0.85
		local Formatted = string.format("%s <font color=\"%s\">%s</font>%d", p2.RemainingBalance, string.format("rgb(%d,%d,%d)", math.round(Color.R * 255), math.round(Color.G * 255), (math.round(Color.B * 255))), Character, p1.props.currentBalance - p1.props.itemRobuxCost)
		local Element = if p1.props.model then RoactModule.createElement(ModelViewportModule, {
			LayoutOrder = 1,
			model = p1.props.model,
			Size = UDim2.fromOffset(85, 85),
			Position = UDim2.fromOffset(5, 5)
		}) else RoactModule.createElement(ImageSetLabel, {
			LayoutOrder = 1,
			BackgroundTransparency = 1,
			ImageTransparency = 0,
			Position = UDim2.new(0, 5, 0, 5),
			Size = UDim2.new(0, 85, 0, 85),
			ScaleType = Enum.ScaleType.Stretch,
			Image = p1.props.itemIcon
		})
		
		return RoactModule.createElement(InteractiveAlert, {
			defaultChildRef = if FFlagAddDefaultFocusNavSelectorsOnBuyPurchasePromptModule then p1.props.containerRef else nil,
			screenSize = p1.props.screenSize,
			position = p1.props.position,
			anchorPoint = p1.props.anchorPoint,
			title = p2.BuyItemTitle,
			middleContent = function()
				-- upvalues: RoactModule (upval), FitFrameVertical (upval), p1 (upval), Element (copy), FitTextLabel (upval), _Font (copy), p2 (upval), Theme (copy)
				return RoactModule.createElement(FitFrameVertical, {
					BackgroundTransparency = 1,
					width = UDim.new(1, 0),
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					contentPadding = UDim.new(0, 24),
					[RoactModule.Ref] = p1.contentRef,
					[RoactModule.Change.AbsoluteSize] = p1.changeContentSize
				}, {
					ItemIcon = Element,
					ItemName = RoactModule.createElement(FitTextLabel, {
						LayoutOrder = 2,
						BackgroundTransparency = 1,
						TextWrapped = true,
						width = FitTextLabel.Width.FitToText,
						maximumWidth = p1.state.contentSize.X,
						Font = _Font.Footer.Font,
						Text = p2.BuyItemQuestion,
						TextSize = _Font.BaseSize * _Font.Body.RelativeSize,
						TextColor3 = Theme.TextDefault.Color
					})
				})
			end,
			buttonStackInfo = {
				disableGamepadRefs = if FFlagAddDefaultFocusNavSelectorsOnBuyPurchasePromptModule then true else nil,
				buttons = {
					{
						props = {
							isDisabled = p1.props.isDisabled or p1.props.isLoading,
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
							icon = IconsCommonRobux,
							text = tostring(p1.props.itemRobuxCost),
							inputIcon = p1.props.buyItemControllerIcon,
							buttonRef = if FFlagAddDefaultFocusNavSelectorsOnBuyPurchasePromptModule then p1.props.defaultFocusRef else nil
						}
					}
				}
			},
			footerContent = function()
				-- upvalues: p1 (upval), RoactModule (upval), FitFrameVertical (upval), ScaledX (copy), _Font (copy), Formatted (copy), Theme (copy), FitTextLabel (upval), p2 (upval)
				return if p1.props.currentBalanceValid then if p1.props.testPurchase then RoactModule.createElement(FitFrameVertical, {
					BackgroundTransparency = 1,
					width = UDim.new(1, 0),
					FillDirection = Enum.FillDirection.Horizontal,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					contentPadding = UDim.new(0, 2),
					[RoactModule.Ref] = p1.footerRef,
					[RoactModule.Change.AbsoluteSize] = p1.changeFooterSize
				}, {
					TestPurchaseTest = RoactModule.createElement(FitTextLabel, {
						LayoutOrder = 1,
						BackgroundTransparency = 1,
						width = FitTextLabel.Width.FitToText,
						Font = _Font.Footer.Font,
						Text = p2.TestPurchaseText,
						TextSize = _Font.BaseSize * _Font.Footer.RelativeSize,
						TextColor3 = Theme.TextDefault.Color
					})
				}) else RoactModule.createElement(FitFrameVertical, {
					BackgroundTransparency = 1,
					width = UDim.new(1, 0),
					FillDirection = Enum.FillDirection.Horizontal,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					contentPadding = UDim.new(0, 2),
					[RoactModule.Ref] = p1.footerRef,
					[RoactModule.Change.AbsoluteSize] = p1.changeFooterSize
				}, {
					RemainingBalanceText = RoactModule.createElement("TextLabel", {
						LayoutOrder = 1,
						BackgroundTransparency = 1,
						RichText = true,
						TextWrapped = true,
						Position = UDim2.fromScale(0, 0.5),
						Size = UDim2.fromOffset(ScaledX, 0),
						AutomaticSize = Enum.AutomaticSize.Y,
						Font = _Font.Footer.Font,
						Text = Formatted,
						TextSize = _Font.BaseSize * _Font.Footer.RelativeSize,
						TextColor3 = Theme.TextDefault.Color
					})
				}) else RoactModule.None
			end
		})
	end)
end

if FFlagAddDefaultFocusNavSelectorsOnBuyPurchasePromptModule then
	ExtendResult = function(p1)
		-- upvalues: UseDefaultFocusBehavior (copy), RoactModule (copy), ExtendResult (copy), CryoModule (copy)
		local DefaultFocusRef, ContainerRef = UseDefaultFocusBehavior()
		
		return RoactModule.createElement(ExtendResult, CryoModule.Dictionary.join(p1, {
			defaultFocusRef = DefaultFocusRef,
			containerRef = ContainerRef
		}))
	end
end
return ExtendResult