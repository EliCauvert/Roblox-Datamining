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

function name.init(p1)
	-- upvalues: roactModule (ref)
	p1.contentRef = roactModule.createRef()
	p1.footerRef = roactModule.createRef()
	p1.state = {
		contentSize = Vector2.new(0, 0),
		footerSize = Vector2.new(0, 0)
	}
	
	function p0.changeContentSize(p2)
		-- upvalues: p1 (ref)
		if p1.state.contentSize ~= p2.AbsoluteSize then
			p1:setState({ contentSize = p2.AbsoluteSize })
		end
	end
	
	function p0.changeFooterSize(p2)
		-- upvalues: p1 (ref)
		if p1.state.footerSize ~= p2.AbsoluteSize then
			p1:setState({ footerSize = p2.AbsoluteSize })
		end
	end
end

function name.render(p1)
	-- upvalues: shouldShowNewUpsellModalExperimentModule (ref), desktopUpsellExperimentModule (ref), roactModule (ref), productPurchaseModalModule (ref), multiTextLocalizerModule (ref)
	return if shouldShowNewUpsellModalExperimentModule() or desktopUpsellExperimentModule.shouldShowNewModal() then roactModule.createElement(productPurchaseModalModule, {
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
	}) else roactModule.createElement(multiTextLocalizerModule, {
		keys = {
			BuyItemTitle = {
				key = if p1.props.isGamePass then "IAPExperience.PurchasePrompt.Title.BuyGamepass" else "IAPExperience.PurchasePrompt.Title.BuyItem"
			},
			BuyItemQuestion = {
				key = if p1.props.isLuobu then "IAPExperience.PurchasePrompt.Text.BuyItemQuestionIncludingWarning" else "IAPExperience.PurchasePrompt.Text.BuyItemQuestion",
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
			-- upvalues: p1 (ref)
			return p1:renderAlert(p2)
		end
	})
end

function name.renderAlert(p1, p2)
	-- upvalues: loggerModule (ref), getAppContextModule (ref), default (ref), purchaseModalV1ShownCounter (ref), withStyle (ref), char (ref), roactModule (ref), modelViewportModule (ref), imageSetLabel (ref), interactiveAlert (ref), fFlagAddDefaultFocusNavSelectorsOnBuyPurchasePromptModule (ref), fitFrameVertical (ref), fitTextLabel (ref), buttonType (ref), robux (ref)
	local props = p1.props
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
	
	return withStyle(function(p3)
		-- upvalues: p1 (ref), p2 (ref), char (copy), roactModule (copy), modelViewportModule (copy), imageSetLabel (copy), interactiveAlert (copy), fFlagAddDefaultFocusNavSelectorsOnBuyPurchasePromptModule (copy), fitFrameVertical (copy), fitTextLabel (copy), buttonType (copy), robux (copy)
		local theme = p3.Theme
		local font = p3.Font
		local color = theme.IconEmphasis.Color
		local var1 = p1.state.contentSize.X * 0.85
		local formattedText = string.format("%s <font color=\"%s\">%s</font>%d", p2.RemainingBalance, string.format("rgb(%d,%d,%d)", math.round(color.R * 255), math.round(color.G * 255), math.round(color.B * 255)), char, p1.props.currentBalance - p1.props.itemRobuxCost)
		local var2 = if p1.props.model then roactModule.createElement(modelViewportModule, {
			LayoutOrder = 1,
			model = p1.props.model,
			Size = UDim2.fromOffset(85, 85),
			Position = UDim2.fromOffset(5, 5)
		}) else roactModule.createElement(imageSetLabel, {
			LayoutOrder = 1,
			BackgroundTransparency = 1,
			ImageTransparency = 0,
			Position = UDim2.new(0, 5, 0, 5),
			Size = UDim2.new(0, 85, 0, 85),
			ScaleType = Enum.ScaleType.Stretch,
			Image = p1.props.itemIcon
		})
		
		return roactModule.createElement(interactiveAlert, {
			defaultChildRef = if fFlagAddDefaultFocusNavSelectorsOnBuyPurchasePromptModule then p1.props.containerRef else nil,
			screenSize = p1.props.screenSize,
			position = p1.props.position,
			anchorPoint = p1.props.anchorPoint,
			title = p2.BuyItemTitle,
			middleContent = function()
				-- upvalues: roactModule (copy), fitFrameVertical (copy), p1 (copy), var2 (ref), fitTextLabel (copy), font (ref), p2 (copy), theme (ref)
				return roactModule.createElement(fitFrameVertical, {
					BackgroundTransparency = 1,
					width = UDim.new(1, 0),
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					contentPadding = UDim.new(0, 24),
					[roactModule.Ref] = p1.contentRef,
					[roactModule.Change.AbsoluteSize] = p1.changeContentSize
				}, {
					ItemIcon = var2,
					ItemName = roactModule.createElement(fitTextLabel, {
						LayoutOrder = 2,
						BackgroundTransparency = 1,
						TextWrapped = true,
						width = fitTextLabel.Width.FitToText,
						maximumWidth = p1.state.contentSize.X,
						Font = font.Footer.Font,
						Text = p2.BuyItemQuestion,
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
							isDisabled = p1.props.isDisabled or p1.props.isLoading,
							onActivated = p1.props.cancelPurchaseActivated,
							text = p2.ButtonCancel,
							inputIcon = p1.props.cancelControllerIcon
						}
					},
					{
						buttonType = buttonType.PrimarySystem,
						props = {
							delayInputSeconds = 3,
							isLoading = p1.props.isLoading,
							isDisabled = p1.props.isDisabled,
							isDelayedInput = p1.props.isDelayedInput,
							enableInputDelayed = p1.props.enableInputDelayed,
							onActivated = p1.props.buyItemActivated,
							icon = robux,
							text = tostring(p1.props.itemRobuxCost),
							inputIcon = p1.props.buyItemControllerIcon,
							buttonRef = if fFlagAddDefaultFocusNavSelectorsOnBuyPurchasePromptModule then p1.props.defaultFocusRef else nil
						}
					}
				}
			},
			footerContent = function()
				-- upvalues: p1 (copy), roactModule (copy), fitFrameVertical (copy), var1 (ref), font (ref), formattedText (ref), theme (ref), fitTextLabel (copy), p2 (copy)
				return if p1.props.currentBalanceValid then if p1.props.testPurchase then roactModule.createElement(fitFrameVertical, {
					BackgroundTransparency = 1,
					width = UDim.new(1, 0),
					FillDirection = Enum.FillDirection.Horizontal,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					contentPadding = UDim.new(0, 2),
					[roactModule.Ref] = p1.footerRef,
					[roactModule.Change.AbsoluteSize] = p1.changeFooterSize
				}, {
					TestPurchaseTest = roactModule.createElement(fitTextLabel, {
						LayoutOrder = 1,
						BackgroundTransparency = 1,
						width = fitTextLabel.Width.FitToText,
						Font = font.Footer.Font,
						Text = p2.TestPurchaseText,
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
					[roactModule.Ref] = p1.footerRef,
					[roactModule.Change.AbsoluteSize] = p1.changeFooterSize
				}, {
					RemainingBalanceText = roactModule.createElement("TextLabel", {
						LayoutOrder = 1,
						BackgroundTransparency = 1,
						RichText = true,
						TextWrapped = true,
						Position = UDim2.fromScale(0, 0.5),
						Size = UDim2.fromOffset(var1, 0),
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
	local var1 = name
	
	name = function(p1)
		-- upvalues: useDefaultFocusBehavior (ref), roactModule (ref), var1 (ref), cryoModule (ref)
		local var2, var3 = useDefaultFocusBehavior()
		
		return roactModule.createElement(var1, cryoModule.Dictionary.join(p1, { defaultFocusRef = var2, containerRef = var3 }))
	end
end
return name