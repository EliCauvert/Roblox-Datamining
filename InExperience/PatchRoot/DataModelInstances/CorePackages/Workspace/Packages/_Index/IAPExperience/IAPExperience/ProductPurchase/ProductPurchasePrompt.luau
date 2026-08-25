local parent = script.Parent.Parent
local parent_1 = parent.Parent
local roactModule = require(parent_1.Roact)
local tModule = require(parent_1.t)
local roactFitComponentsModule = require(parent_1.RoactFitComponents)
local fitFrameVertical = roactFitComponentsModule.FitFrameVertical
local fitTextLabel = roactFitComponentsModule.FitTextLabel
local UIBloxModule = require(parent_1.UIBlox)
local interactiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local images = UIBloxModule.App.ImageSet.Images
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local withStyle = UIBloxModule.Core.Style.withStyle
local useDefaultFocusBehavior = require(parent_1.ReactFocusNavigation).useDefaultFocusBehavior
local cryoModule = require(parent_1.Cryo)
local modelViewportModule = require(script.Parent.Parent.Generic.ModelViewport)
local multiTextLocalizerModule = require(parent.Locale.MultiTextLocalizer)
local shouldShowNewUpsellModalExperimentModule = require(parent.Utility.Experiments.shouldShowNewUpsellModalExperiment)
local desktopUpsellExperimentModule = require(parent.Utility.Experiments.DesktopUpsellExperiment)
local productPurchaseModalModule = require(script.Parent.v2.ProductPurchaseModal)
local robux = images["icons/common/robux"]
local char = utf8.char(57346)
local default = require(parent_1.LoggingProtocol).default
local purchaseModalV1ShownCounter = require(parent.Generic.Events.PurchaseModalCounter).PurchaseModalV1ShownCounter
local loggerModule = require(parent.Utility.logger)
local getAppContextModule = require(parent.Utility.getAppContext)
local fFlagAddDefaultFocusNavSelectorsOnBuyPurchasePromptModule = require(parent.Flags.FFlagAddDefaultFocusNavSelectorsOnBuyPurchasePrompt)
local name = roactModule.Component:extend(script.Name)
name.validateProps = tModule.strictInterface({
	anchorPoint = tModule.optional(tModule.Vector2),
	position = tModule.optional(tModule.UDim2),
	screenSize = tModule.Vector2,
	isLoading = tModule.optional(tModule.boolean),
	isDisabled = tModule.optional(tModule.boolean),
	isDelayedInput = tModule.optional(tModule.boolean),
	enableInputDelayed = tModule.optional(tModule.boolean),
	itemIcon = tModule.union(tModule.string, tModule.table),
	model = tModule.optional(tModule.table),
	itemName = tModule.string,
	itemRobuxCost = tModule.number,
	currentBalance = tModule.number,
	currentBalanceValid = tModule.optional(tModule.boolean),
	isGamePass = tModule.optional(tModule.boolean),
	testPurchase = tModule.optional(tModule.boolean),
	buyItemControllerIcon = tModule.optional(tModule.table),
	cancelControllerIcon = tModule.optional(tModule.table),
	buyItemActivated = tModule.callback,
	cancelPurchaseActivated = tModule.callback,
	isLuobu = tModule.optional(tModule.boolean),
	defaultFocusRef = if fFlagAddDefaultFocusNavSelectorsOnBuyPurchasePromptModule then tModule.callback else nil,
	containerRef = if fFlagAddDefaultFocusNavSelectorsOnBuyPurchasePromptModule then tModule.callback else nil
})
name.defaultProps = {
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

function name.render(p3)
	-- upvalues: shouldShowNewUpsellModalExperimentModule (ref), desktopUpsellExperimentModule (ref), roactModule (ref), productPurchaseModalModule (ref), multiTextLocalizerModule (ref)
	return if shouldShowNewUpsellModalExperimentModule() or desktopUpsellExperimentModule.shouldShowNewModal() then roactModule.createElement(productPurchaseModalModule, {
		product = {
			itemIcon = p3.props.itemIcon,
			itemName = p3.props.itemName,
			itemRobuxCost = p3.props.itemRobuxCost
		},
		balanceAmount = p3.props.currentBalance,
		balanceAmountValid = p3.props.currentBalanceValid,
		buttons = {
			buyItemActivated = p3.props.buyItemActivated,
			buyItemControllerIcon = p3.props.buyItemControllerIcon,
			buyItemIsDelayedInput = p3.props.isDelayedInput,
			buyItemEnableInputDelayed = p3.props.enableInputDelayed,
			cancelActivated = p3.props.cancelPurchaseActivated,
			isDisabled = p3.props.isDisabled
		},
		screenSize = p3.props.screenSize
	}) else roactModule.createElement(multiTextLocalizerModule, {
		keys = {
			BuyItemTitle = {
				key = if p3.props.isGamePass then "IAPExperience.PurchasePrompt.Title.BuyGamepass" else "IAPExperience.PurchasePrompt.Title.BuyItem"
			},
			BuyItemQuestion = {
				key = if p3.props.isLuobu then "IAPExperience.PurchasePrompt.Text.BuyItemQuestionIncludingWarning" else "IAPExperience.PurchasePrompt.Text.BuyItemQuestion",
				params = { name = p3.props.itemName }
			},
			RemainingBalance = {
				key = "IAPExperience.PurchasePrompt.Text.RemainingBalance"
			},
			TestPurchaseText = { key = "IAPExperience.PurchasePrompt.Text.TestPurchase" },
			ButtonCancel = { key = "IAPExperience.PurchasePrompt.Action.Cancel" },
			LoadingText = { key = "IAPExperience.PurchasePrompt.Text.Loading" }
		},
		render = function(p4)
			-- upvalues: p3 (ref)
			return p3:renderAlert(p4)
		end
	})
end

function name.renderAlert(p5, p6)
	-- upvalues: loggerModule (ref), getAppContextModule (ref), default (ref), purchaseModalV1ShownCounter (ref), withStyle (ref), char (ref), roactModule (ref), modelViewportModule (ref), imageSetLabel (ref), interactiveAlert (ref), fFlagAddDefaultFocusNavSelectorsOnBuyPurchasePromptModule (ref), fitFrameVertical (ref), fitTextLabel (ref), buttonType (ref), robux (ref)
	local props = p5.props
	loggerModule.debug({
		message = "Purchase Modal V1 Shown",
		screenHeight = props.screenSize.Y,
		screenWidth = props.screenSize.X,
		portrait = props.screenSize.X < props.screenSize.Y,
		appContext = getAppContextModule()
	})
	default:logRobloxTelemetryCounter(purchaseModalV1ShownCounter, 1, {
		screenHeight = props.screenSize.Y,
		screenWidth = props.screenSize.X,
		portrait = props.screenSize.X < props.screenSize.Y,
		appContext = getAppContextModule()
	})
	
	return withStyle(function(p7)
		-- upvalues: p5 (ref), p6 (ref), char (copy), roactModule (copy), modelViewportModule (copy), imageSetLabel (copy), interactiveAlert (copy), fFlagAddDefaultFocusNavSelectorsOnBuyPurchasePromptModule (copy), fitFrameVertical (copy), fitTextLabel (copy), buttonType (copy), robux (copy)
		local theme = p7.Theme
		local font = p7.Font
		local color = theme.IconEmphasis.Color
		local var16 = p5.state.contentSize.X * 0.85
		local formattedText = string.format("%s <font color=\"%s\">%s</font>%d", p6.RemainingBalance, string.format("rgb(%d,%d,%d)", math.round(color.R * 255), math.round(color.G * 255), math.round(color.B * 255)), char, p5.props.currentBalance - p5.props.itemRobuxCost)
		local var18 = if p5.props.model then roactModule.createElement(modelViewportModule, {
			LayoutOrder = 1,
			model = p5.props.model,
			Size = UDim2.fromOffset(85, 85),
			Position = UDim2.fromOffset(5, 5)
		}) else roactModule.createElement(imageSetLabel, {
			LayoutOrder = 1,
			BackgroundTransparency = 1,
			ImageTransparency = 0,
			Position = UDim2.new(0, 5, 0, 5),
			Size = UDim2.new(0, 85, 0, 85),
			ScaleType = Enum.ScaleType.Stretch,
			Image = p5.props.itemIcon
		})
		
		return roactModule.createElement(interactiveAlert, {
			defaultChildRef = if fFlagAddDefaultFocusNavSelectorsOnBuyPurchasePromptModule then p5.props.containerRef else nil,
			screenSize = p5.props.screenSize,
			position = p5.props.position,
			anchorPoint = p5.props.anchorPoint,
			title = p6.BuyItemTitle,
			middleContent = function()
				-- upvalues: roactModule (copy), fitFrameVertical (copy), p5 (copy), var18 (ref), fitTextLabel (copy), font (ref), p6 (copy), theme (ref)
				return roactModule.createElement(fitFrameVertical, {
					BackgroundTransparency = 1,
					width = UDim.new(1, 0),
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					contentPadding = UDim.new(0, 24),
					[roactModule.Ref] = p5.contentRef,
					[roactModule.Change.AbsoluteSize] = p5.changeContentSize
				}, {
					ItemIcon = var18,
					ItemName = roactModule.createElement(fitTextLabel, {
						LayoutOrder = 2,
						BackgroundTransparency = 1,
						TextWrapped = true,
						width = fitTextLabel.Width.FitToText,
						maximumWidth = p5.state.contentSize.X,
						Font = font.Footer.Font,
						Text = p6.BuyItemQuestion,
						TextSize = font.BaseSize * font.Body.RelativeSize,
						TextColor3 = theme.TextDefault.Color
					})
				})
			end,
			buttonStackInfo = {
				disableGamepadRefs = if fFlagAddDefaultFocusNavSelectorsOnBuyPurchasePromptModule then true else nil,
				buttons = {
					{
						props = {
							isDisabled = p5.props.isDisabled or p5.props.isLoading,
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
							icon = robux,
							text = tostring(p5.props.itemRobuxCost),
							inputIcon = p5.props.buyItemControllerIcon,
							buttonRef = if fFlagAddDefaultFocusNavSelectorsOnBuyPurchasePromptModule then p5.props.defaultFocusRef else nil
						}
					}
				}
			},
			footerContent = function()
				-- upvalues: p5 (copy), roactModule (copy), fitFrameVertical (copy), var16 (ref), font (ref), formattedText (ref), theme (ref), fitTextLabel (copy), p6 (copy)
				return if p5.props.currentBalanceValid then if p5.props.testPurchase then roactModule.createElement(fitFrameVertical, {
					BackgroundTransparency = 1,
					width = UDim.new(1, 0),
					FillDirection = Enum.FillDirection.Horizontal,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					contentPadding = UDim.new(0, 2),
					[roactModule.Ref] = p5.footerRef,
					[roactModule.Change.AbsoluteSize] = p5.changeFooterSize
				}, {
					TestPurchaseTest = roactModule.createElement(fitTextLabel, {
						LayoutOrder = 1,
						BackgroundTransparency = 1,
						width = fitTextLabel.Width.FitToText,
						Font = font.Footer.Font,
						Text = p6.TestPurchaseText,
						TextSize = font.BaseSize * font.Footer.RelativeSize,
						TextColor3 = theme.TextDefault.Color
					})
				}) else roactModule.createElement(fitFrameVertical, {
					BackgroundTransparency = 1,
					width = UDim.new(1, 0),
					FillDirection = Enum.FillDirection.Horizontal,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					contentPadding = UDim.new(0, 2),
					[roactModule.Ref] = p5.footerRef,
					[roactModule.Change.AbsoluteSize] = p5.changeFooterSize
				}, {
					RemainingBalanceText = roactModule.createElement("TextLabel", {
						LayoutOrder = 1,
						BackgroundTransparency = 1,
						RichText = true,
						TextWrapped = true,
						Position = UDim2.fromScale(0, 0.5),
						Size = UDim2.fromOffset(var16, 0),
						AutomaticSize = Enum.AutomaticSize.Y,
						Font = font.Footer.Font,
						Text = formattedText,
						TextSize = font.BaseSize * font.Footer.RelativeSize,
						TextColor3 = theme.TextDefault.Color
					})
				}) else roactModule.None
			end
		})
	end)
end

if fFlagAddDefaultFocusNavSelectorsOnBuyPurchasePromptModule then
	local var15 = name
	
	name = function(p8)
		-- upvalues: useDefaultFocusBehavior (ref), roactModule (ref), var15 (ref), cryoModule (ref)
		local var19, var20 = useDefaultFocusBehavior()
		
		return roactModule.createElement(var15, cryoModule.Dictionary.join(p8, { defaultFocusRef = var19, containerRef = var20 }))
	end
end
return name