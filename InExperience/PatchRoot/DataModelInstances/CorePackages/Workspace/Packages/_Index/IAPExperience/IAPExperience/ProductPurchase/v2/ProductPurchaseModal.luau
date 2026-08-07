local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local textService = game:GetService("TextService")
local UIBloxModule = require(parent_1.UIBlox)
local interactiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local foundationModule = require(parent_1.Foundation)
local text = foundationModule.Text
local useTokens = foundationModule.Hooks.useTokens
local useTextSizeOffset = foundationModule.Hooks.useTextSizeOffset
local useDefaultFocusBehavior = require(parent_1.ReactFocusNavigation).useDefaultFocusBehavior
local productDetailsModule = require(parent.Generic.ProductDetails)
local localizationService = game:GetService("LocalizationService")
local localization = require(parent_1.AppLocales).Localization
local localizationModule = require(parent_1.Localization)
local localizationProvider = localizationModule.LocalizationProvider
local useLocalization = localizationModule.Hooks.useLocalization
local formatNumberModule = require(parent.Utility.formatNumber)
local loggerModule = require(parent.Utility.logger)
local getAppContextModule = require(parent.Utility.getAppContext)
local default = require(parent_1.LoggingProtocol).default
local purchaseModalV2ShownCounter = require(parent.Generic.Events.PurchaseModalCounter).PurchaseModalV2ShownCounter
local fFlagAddDefaultFocusNavSelectorsOnBuyPurchasePromptModule = require(parent.Flags.FFlagAddDefaultFocusNavSelectorsOnBuyPurchasePrompt)

local function ProductPurchaseModal(p0) --[[ line: 67 ]]
	-- upvalues: fFlagAddDefaultFocusNavSelectorsOnBuyPurchasePromptModule (ref), useDefaultFocusBehavior (ref), reactModule (ref), loggerModule (ref), getAppContextModule (ref), default (ref), purchaseModalV2ShownCounter (ref), useLocalization (ref), formatNumberModule (ref), localizationService (ref), useTokens (ref), useTextSizeOffset (ref), textService (ref), interactiveAlert (ref), productDetailsModule (ref), buttonType (ref), text (ref)
	local var12 = nil
	local var13 = nil
	
	if fFlagAddDefaultFocusNavSelectorsOnBuyPurchasePromptModule then
		local var14, var15 = useDefaultFocusBehavior()
		var12 = var14
		var13 = var15
	end
	reactModule.useEffect(function() --[[ line: 72 ]]
		-- upvalues: loggerModule (copy), p0 (ref), getAppContextModule (copy), default (copy), purchaseModalV2ShownCounter (copy)
		loggerModule.debug({
			message = "Purchase Modal V2 Shown",
			screenHeight = p0.screenSize.Y,
			screenWidth = p0.screenSize.X,
			portrait = p0.screenSize.X < p0.screenSize.Y,
			appContext = getAppContextModule()
		})
		default:logRobloxTelemetryCounter(purchaseModalV2ShownCounter, 1, {
			screenHeight = p0.screenSize.Y,
			screenWidth = p0.screenSize.X,
			portrait = p0.screenSize.X < p0.screenSize.Y,
			appContext = getAppContextModule()
		})
	end, {})
	local var16 = useLocalization({
		BuyItem = "IAPExperience.PurchasePrompt.Title.BuyItem",
		RemainingBalance = "IAPExperience.PurchasePrompt.Text.RemainingBalanceV2"
	})
	local text_1 = utf8.char(57346) .. " " .. formatNumberModule(localizationService.RobloxLocaleId, p0.balanceAmount - p0.product.itemRobuxCost)
	local text_2 = utf8.char(57346) .. " " .. formatNumberModule(localizationService.RobloxLocaleId, p0.product.itemRobuxCost)
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local var19 = useTokens()
	local var20 = useTextSizeOffset()
	local var21, var22 = reactModule.useState(0)
	local var23 = var21
	local var24 = var22
	var19 = var19.Typography.CaptionSmall
	local var25 = var16.RemainingBalance:gsub("{robux}", text_1)
	local var26 = reactModule.useCallback(function(p1) --[[ line: 110 ]]
		-- upvalues: var23 (write), var24 (write)
		if var23 ~= p1.AbsoluteSize.X then
			var24(p1.AbsoluteSize.X)
		end
	end, { p0 })
	local var27 = reactModule.useMemo(function() --[[ line: 116 ]]
		-- upvalues: var19 (ref), textService (copy), var25 (write), var23 (write)
		return var19.LineHeight * textService:GetTextSize(var25, var19.FontSize, var19.Font, Vector2.new(var23, 1e999)).Y
	end, { var23, var20, var25 })
	
	return reactModule.createElement(interactiveAlert, {
		bottomMargin = 12,
		defaultChildRef = if fFlagAddDefaultFocusNavSelectorsOnBuyPurchasePromptModule then var13 else nil,
		screenSize = p0.screenSize,
		anchorPoint = Vector2.new(0.5, 0.5),
		position = UDim2.new(0.5, 0, 0.5, 0),
		title = var16.BuyItem,
		onCloseClicked = function() --[[ line: 133 ]]
			-- upvalues: p0 (ref)
			if not p0.buttons.isDisabled then
				p0.buttons.cancelActivated()
			end
		end,
		onAbsoluteSizeChanged = var26,
		middleContent = function() --[[ line: 139 ]]
			-- upvalues: reactModule (copy), productDetailsModule (copy), p0 (ref)
			return reactModule.createElement(productDetailsModule, {
				isPortrait = false,
				layoutOrder = 1,
				itemIcon = p0.product.itemIcon,
				itemName = p0.product.itemName
			})
		end,
		buttonStackInfo = {
			forcedFillDirection = Enum.FillDirection.Vertical,
			disableGamepadRefs = if fFlagAddDefaultFocusNavSelectorsOnBuyPurchasePromptModule then true else nil,
			buttons = {
				{
					buttonType = buttonType.PrimaryContextual,
					props = {
						isDisabled = p0.buttons.isDisabled,
						isDelayedInput = p0.buttons.buyItemIsDelayedInput,
						enableInputDelayed = p0.buttons.buyItemEnableInputDelayed,
						onActivated = p0.buttons.buyItemActivated,
						text = text_2,
						inputIcon = p0.buttons.buyItemControllerIcon,
						buttonRef = if fFlagAddDefaultFocusNavSelectorsOnBuyPurchasePromptModule then var12 else nil
					}
				}
			}
		},
		footerContent = function() --[[ line: 167 ]]
			-- upvalues: p0 (ref), reactModule (copy), text (copy), var25 (write), var27 (write), var26 (write)
			return if p0.balanceAmountValid then reactModule.createElement(text, {
				tag = "content-muted text-caption-small align-x-center text-wrap",
				Text = var25,
				Size = UDim2.new(1, 0, 0, var27),
				onAbsoluteSizeChanged = var26
			}) else reactModule.None
		end
	})
end

return function(p2) --[[ line: 182 | named "ProductPurchaseModalContainer" ]]
	-- upvalues: reactModule (ref), localizationProvider (ref), localization (ref), localizationService (ref), ProductPurchaseModal (ref)
	return reactModule.createElement(localizationProvider, {
		localization = localization.new(localizationService.RobloxLocaleId)
	}, {
		ProductPurchaseModal = reactModule.createElement(ProductPurchaseModal, p2)
	})
end