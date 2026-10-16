local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local TextService = game:GetService("TextService")
local GetTextSizeFunction = require(Parent1.Style).GetTextSize
local UIBloxModule = require(Parent1.UIBlox)
local InteractiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local FoundationModule = require(Parent1.Foundation)
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local Text = FoundationModule.Text
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseTextSizeOffsetFunction = FoundationModule.Hooks.useTextSizeOffset
local UseDefaultFocusBehaviorFunction = require(Parent1.ReactFocusNavigation).useDefaultFocusBehavior
local ProductDetailsModule = require(Parent.Generic.ProductDetails)
local LocalizationService = game:GetService("LocalizationService")
local Localization = require(Parent1.AppLocales).Localization
local LocalizationModule = require(Parent1.Localization)
local LocalizationProvider = LocalizationModule.LocalizationProvider
local UseLocalizationFunction = LocalizationModule.Hooks.useLocalization
local FormatNumberModule = require(Parent.Utility.formatNumber)
local LoggerModule = require(Parent.Utility.logger)
local GetAppContextModule = require(Parent.Utility.getAppContext)
local Default = require(Parent1.LoggingProtocol).default
local PurchaseModalV2ShownCounter = require(Parent.Generic.Events.PurchaseModalCounter).PurchaseModalV2ShownCounter
local FFlagAddDefaultFocusNavSelectorsOnBuyPurchasePromptModule = require(Parent.Flags.FFlagAddDefaultFocusNavSelectorsOnBuyPurchasePrompt)

local function ProductPurchaseModal(p1) --[[ Line: 69 ]]
	-- upvalues: FFlagAddDefaultFocusNavSelectorsOnBuyPurchasePromptModule (copy), UseDefaultFocusBehaviorFunction (copy), ReactModule (copy), LoggerModule (copy), GetAppContextModule (copy), Default (copy), PurchaseModalV2ShownCounter (copy), UseLocalizationFunction (copy), FormatNumberModule (copy), LocalizationService (copy), UseTokensFunction (copy), UseTextSizeOffsetFunction (copy), FoundationFontFaceMigration (copy), GetTextSizeFunction (copy), TextService (copy), InteractiveAlert (copy), ProductDetailsModule (copy), ButtonType (copy), Text (copy)
	local v1 = nil
	local v2 = nil
	
	if FFlagAddDefaultFocusNavSelectorsOnBuyPurchasePromptModule then
		v1, v23 = UseDefaultFocusBehaviorFunction()
	end
	ReactModule.useEffect(function() --[[ Line: 74 ]]
		-- upvalues: LoggerModule (upval), p1 (copy), GetAppContextModule (upval), Default (upval), PurchaseModalV2ShownCounter (upval)
		LoggerModule.debug({
			message = "Purchase Modal V2 Shown",
			screenHeight = p1.screenSize.Y,
			screenWidth = p1.screenSize.X,
			portrait = p1.screenSize.X < p1.screenSize.Y,
			appContext = GetAppContextModule()
		})
		Default:logRobloxTelemetryCounter(PurchaseModalV2ShownCounter, 1, {
			screenHeight = p1.screenSize.Y,
			screenWidth = p1.screenSize.X,
			portrait = p1.screenSize.X < p1.screenSize.Y,
			appContext = GetAppContextModule()
		})
	end, {})
	local UseLocalizationResult = UseLocalizationFunction({
		BuyItem = "IAPExperience.PurchasePrompt.Title.BuyItem",
		RemainingBalance = "IAPExperience.PurchasePrompt.Text.RemainingBalanceV2"
	})
	local Text1 = utf8.char(57346) .. " " .. FormatNumberModule(LocalizationService.RobloxLocaleId, p1.balanceAmount - p1.product.itemRobuxCost)
	local Text2 = utf8.char(57346) .. " " .. FormatNumberModule(LocalizationService.RobloxLocaleId, p1.product.itemRobuxCost)
	local UseStateResult = nil
	local UseStateResult2 = nil
	local UseResult = nil
	local UseMemoResult = nil
	local Robux = nil
	local UseTokensResult = UseTokensFunction()
	local UseTextSizeOffsetResult = UseTextSizeOffsetFunction()
	UseStateResult, UseStateResult2 = ReactModule.useState(0)
	local CaptionSmall = UseTokensResult.Typography.CaptionSmall
	Robux = UseLocalizationResult.RemainingBalance:gsub("{robux}", Text1)
	UseResult = ReactModule.useCallback(function(Frame: Frame) --[[ Line: 112 ]]
		-- upvalues: UseStateResult (ref), UseStateResult2 (ref)
		if UseStateResult ~= Frame.AbsoluteSize.X then
			UseStateResult2(Frame.AbsoluteSize.X)
		end
	end, { p1 })
	UseMemoResult = ReactModule.useMemo(function() --[[ Line: 118 ]]
		-- upvalues: CaptionSmall (copy), FoundationFontFaceMigration (upval), GetTextSizeFunction (upval), Robux (ref), UseStateResult (ref), TextService (upval)
		return CaptionSmall.LineHeight * (if FoundationFontFaceMigration then GetTextSizeFunction(Robux, CaptionSmall.FontSize, CaptionSmall.Font, Vector2.new(UseStateResult, 1e999), { addTemporaryPadding = false }).Y else TextService:GetTextSize(Robux, CaptionSmall.FontSize, CaptionSmall.Font, Vector2.new(UseStateResult, 1e999)).Y)
	end, { UseStateResult, UseTextSizeOffsetResult, Robux })
	
	return ReactModule.createElement(InteractiveAlert, {
		bottomMargin = 12,
		defaultChildRef = if FFlagAddDefaultFocusNavSelectorsOnBuyPurchasePromptModule then v2 else nil,
		screenSize = p1.screenSize,
		anchorPoint = Vector2.new(0.5, 0.5),
		position = UDim2.new(0.5, 0, 0.5, 0),
		title = UseLocalizationResult.BuyItem,
		onCloseClicked = function() --[[ Line: 145 ]]
			-- upvalues: p1 (copy)
			if not p1.buttons.isDisabled then
				p1.buttons.cancelActivated()
			end
		end,
		onAbsoluteSizeChanged = UseResult,
		middleContent = function() --[[ Line: 151 ]]
			-- upvalues: ReactModule (upval), ProductDetailsModule (upval), p1 (copy)
			return ReactModule.createElement(ProductDetailsModule, {
				isPortrait = false,
				layoutOrder = 1,
				itemIcon = p1.product.itemIcon,
				itemName = p1.product.itemName
			})
		end,
		buttonStackInfo = {
			forcedFillDirection = Enum.FillDirection.Vertical,
			disableGamepadRefs = if FFlagAddDefaultFocusNavSelectorsOnBuyPurchasePromptModule then true else nil,
			buttons = {
				{
					buttonType = ButtonType.PrimaryContextual,
					props = {
						isDisabled = p1.buttons.isDisabled,
						isDelayedInput = p1.buttons.buyItemIsDelayedInput,
						enableInputDelayed = p1.buttons.buyItemEnableInputDelayed,
						onActivated = p1.buttons.buyItemActivated,
						text = Text2,
						inputIcon = p1.buttons.buyItemControllerIcon,
						buttonRef = if FFlagAddDefaultFocusNavSelectorsOnBuyPurchasePromptModule then v1 else nil
					}
				}
			}
		},
		footerContent = function() --[[ Line: 179 ]]
			-- upvalues: p1 (copy), ReactModule (upval), Text (upval), Robux (ref), UseMemoResult (ref), UseResult (ref)
			return if p1.balanceAmountValid then ReactModule.createElement(Text, {
				tag = "content-muted text-caption-small align-x-center text-wrap",
				Text = Robux,
				Size = UDim2.new(1, 0, 0, UseMemoResult),
				onAbsoluteSizeChanged = UseResult
			}) else ReactModule.None
		end
	})
end

return function(p1) --[[ Line: 194 | Named "ProductPurchaseModalContainer" ]]
	-- upvalues: ReactModule (copy), LocalizationProvider (copy), Localization (copy), LocalizationService (copy), ProductPurchaseModal (copy)
	return ReactModule.createElement(LocalizationProvider, {
		localization = Localization.new(LocalizationService.RobloxLocaleId)
	}, {
		ProductPurchaseModal = ReactModule.createElement(ProductPurchaseModal, p1)
	})
end