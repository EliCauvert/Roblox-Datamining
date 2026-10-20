local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local CryoModule = require(CorePackages.Packages.Cryo)
local TModule = require(CorePackages.Packages.t)
local RoactGamepadModule = require(CorePackages.Packages.RoactGamepad)
local Focusable = RoactGamepadModule.Focusable
local _ = require(Modules.AvatarExperience.Common.Types)
local ReactFocusNavigationModule = require(CorePackages.Packages.ReactFocusNavigation)
local InputHandlersModule = require(CorePackages.Packages.InputHandlers)
local FocusNavigationEventNameEnum = require(CorePackages.Workspace.Packages.FocusNavigationUtils).FocusNavigationEventNameEnum
local UseTableWrappedCallbackRefFunction = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Utils.RoactGamepadMigration.useTableWrappedCallbackRef
local IntervalPerformanceTracker = require(CorePackages.Workspace.Packages.IntervalPerformanceTracker).IntervalPerformanceTracker
local CartIdService = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).Lib.CartIdService
local RoactFitComponents = require(CorePackages.Packages.AvatarExperienceDeps).RoactFitComponents
local FitFrameVertical = RoactFitComponents.FitFrameVertical
local FitTextLabel = RoactFitComponents.FitTextLabel
local WithLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).withLocalization
local RobuxAmountDisplayModule = require(Modules.AvatarExperience.Common.Components.ItemDetails.RobuxAmountDisplay)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local AddUnifiedEventLoggingFunction = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).addUnifiedEventLogging
local UnifiedEventLogEnums = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).UnifiedEventLogEnums
local UnifiedEventLoggingUtils = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).Utils.UnifiedEventLoggingUtils
local UnifiedEventLogConstants = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).UnifiedEventLogConstants
local PurchasePromptLiteModule = require(CorePackages.Workspace.Packages.PurchasePromptLite)
local GetTTIEventNameFunction = PurchasePromptLiteModule.getTTIEventName
local TimeToInteractiveTracker = require(CorePackages.Workspace.Packages.TimeToInteractiveTracker).TimeToInteractiveTracker
local ProductPurchaseSurface = PurchasePromptLiteModule.Enums.ProductPurchaseSurface
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local Checkbox = require(CorePackages.Packages.Foundation).Checkbox
local WithStyleFunction = UIBloxModule.Style.withStyle
local InteractiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local AXFixPurchasePromptScrimClickThrough = game:DefineFastFlag("AXFixPurchasePromptScrimClickThrough", false)
local FFlagAXCatalogMakeupSupport = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXCatalogMakeupSupport
local FFlagAXMISEnableMultiShoppingUnifiedEvents = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXMISEnableMultiShoppingUnifiedEvents
local FFlagAddTypesToWidgetItems = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAddTypesToWidgetItems
local AXAddWearAndSaveToPurchaseLogging = game:DefineFastFlag("AXAddWearAndSaveToPurchaseLogging", false)
local FFlagAXMigratePurchasePromptInteractiveToFocusNavigation = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigratePurchasePromptInteractiveToFocusNavigation
local FFlagAddPerformanceMetricsToUnifiedPurchaseModal = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAddPerformanceMetricsToUnifiedPurchaseModal
local FIntLegacyPurchaseFPSTrackingTimeout = require(CorePackages.Workspace.Packages.SharedFlags).FIntLegacyPurchaseFPSTrackingTimeout
local FIntTTIUnifiedPurchaseSamplingRate = require(CorePackages.Workspace.Packages.SharedFlags).FIntTTIUnifiedPurchaseSamplingRate
local config = {
	[Enum.KeyCode.ButtonX] = FocusNavigationEventNameEnum.SaveAsCharacter,
	[Enum.KeyCode.ButtonY] = FocusNavigationEventNameEnum.WearAfterPurchase
}

local function useFocusNavigationBindings(p1, p2, p3)
	-- upvalues: ReactFocusNavigationModule (copy), config (copy), ReactModule (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy)
	return ReactFocusNavigationModule.useEventHandlerMap(ReactModule.useMemo(function()
		-- upvalues: FocusNavigationEventNameEnum (upval), p2 (copy), InputHandlersModule (upval), p3 (copy)
		return {
			[FocusNavigationEventNameEnum.SaveAsCharacter] = if p2 then { handler = InputHandlersModule.onRelease(p2) } else nil,
			[FocusNavigationEventNameEnum.WearAfterPurchase] = if p3 then { handler = InputHandlersModule.onRelease(p3) } else nil
		}
	end, { p2, p3 }), (ReactFocusNavigationModule.useEventMap(config, p1)))
end

local PurchasePromptInteractiveAlert = RoactModule.PureComponent:extend("PurchasePromptInteractiveAlert")
PurchasePromptInteractiveAlert.validateProps = TModule.strictInterface({
	priceInRobux = TModule.number,
	showSaveAsCharacter = TModule.optional(TModule.boolean),
	showWearAfterPurchase = TModule.boolean,
	isWearAfterPurchaseChecked = TModule.boolean,
	isSaveAsCharacterChecked = TModule.optional(TModule.boolean),
	toggleSaveAsCharacter = TModule.optional(TModule.callback),
	toggleWearAfterPurchase = TModule.callback,
	lookType = TModule.optional(TModule.string),
	analyticsInfo = TModule.optional(TModule.table),
	titleText = TModule.string,
	bodyText = TModule.string,
	confirmButtonText = TModule.string,
	onConfirm = TModule.callback,
	onCancel = TModule.callback,
	isLoading = TModule.boolean,
	defaultChildRef = TModule.optional(TModule.table),
	isPurchasingOutfit = TModule.optional(TModule.boolean),
	focusNavigationRef = if FFlagAXMigratePurchasePromptInteractiveToFocusNavigation then TModule.table else nil,
	saveIfWearAfterPurchase = TModule.optional(TModule.boolean),
	screenSize = TModule.Vector2
})

function PurchasePromptInteractiveAlert.init(p1)
	-- upvalues: RoactModule (copy)
	p1.checkboxRef = RoactModule.createRef()
	p1.textButtonRef = RoactModule.createRef()
end

function PurchasePromptInteractiveAlert.renderCheckboxContainer(p1, p2)
	-- upvalues: RoactModule (copy), Checkbox (copy)
	local ShowSaveAsCharacter = p1.props.showSaveAsCharacter
	local ShowWearAfterPurchase = p1.props.showWearAfterPurchase
	
	return if ShowSaveAsCharacter then RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		LayoutOrder = 2,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y
	}, {
		UIPadding = RoactModule.createElement("UIPadding", { PaddingLeft = UDim.new(0, -8) }),
		UIListLayout = RoactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			Padding = UDim.new(0, 12),
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		WearAfterPurchaseCheckbox = ShowWearAfterPurchase and RoactModule.createElement(Checkbox, {
			LayoutOrder = 1,
			label = if p1.props.isPurchasingOutfit then p2.wearOutfitLabel else p2.wearItemLabel,
			isChecked = p1.props.isWearAfterPurchaseChecked,
			onActivated = p1.props.toggleWearAfterPurchase,
			ref = p1.checkboxRef
		}),
		SaveAsCharacterCheckbox = ShowSaveAsCharacter and RoactModule.createElement(Checkbox, {
			LayoutOrder = 2,
			label = p2.saveAsCharacterLabel,
			isChecked = p1.props.isSaveAsCharacterChecked,
			onActivated = p1.props.toggleSaveAsCharacter,
			ref = p1.checkboxRef
		})
	}) else ShowWearAfterPurchase and RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		LayoutOrder = 2,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y
	}, {
		UIPadding = RoactModule.createElement("UIPadding", { PaddingLeft = UDim.new(0, -8) }),
		UIListLayout = RoactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			Padding = UDim.new(0, 12),
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		WearAfterPurchaseCheckbox = ShowWearAfterPurchase and RoactModule.createElement(Checkbox, {
			LayoutOrder = 1,
			label = if p1.props.isPurchasingOutfit then p2.wearOutfitLabel else p2.wearItemLabel,
			isChecked = p1.props.isWearAfterPurchaseChecked,
			onActivated = p1.props.toggleWearAfterPurchase,
			ref = p1.checkboxRef
		}),
		SaveAsCharacterCheckbox = ShowSaveAsCharacter and RoactModule.createElement(Checkbox, {
			LayoutOrder = 2,
			label = p2.saveAsCharacterLabel,
			isChecked = p1.props.isSaveAsCharacterChecked,
			onActivated = p1.props.toggleSaveAsCharacter,
			ref = p1.checkboxRef
		})
	})
end

function PurchasePromptInteractiveAlert.renderMiddle(p1, p2, p3)
	-- upvalues: RoactModule (copy), Focusable (copy), FitFrameVertical (copy), RoactFitComponents (copy), FitTextLabel (copy), RobuxAmountDisplayModule (copy)
	local PriceInRobux = p1.props.priceInRobux or ""
	local IsPriceInRobuxMatch = PriceInRobux == 0
	local NoIsPriceInRobuxMatch = not IsPriceInRobuxMatch
	local _Font = p2.Font
	local Theme = p2.Theme
	local ScaledBaseSize = _Font.BaseSize * _Font.Body.RelativeSize
	
	return RoactModule.createElement(Focusable[FitFrameVertical], {
		BackgroundTransparency = 1,
		width = UDim.new(1, 0),
		defaultChild = p1.checkboxRef
	}, {
		PriceContainer = not IsPriceInRobuxMatch and RoactModule.createElement(FitFrameVertical, {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			contentPadding = UDim.new(0, 6),
			VerticalAlignment = Enum.VerticalAlignment.Center,
			margin = RoactFitComponents.Rect.quad(0, 0, 24, 0),
			width = UDim.new(1, 0)
		}, {
			PriceLabel = RoactModule.createElement(FitTextLabel, {
				BackgroundTransparency = 1,
				LayoutOrder = 0,
				width = FitTextLabel.Width.FitToText,
				Font = _Font.Body.Font,
				Text = p3.priceLabel,
				TextColor3 = Theme.TextDefault.Color,
				TextTransparency = Theme.TextDefault.Transparency,
				TextSize = ScaledBaseSize
			}),
			RobuxContainer = RoactModule.createElement(RobuxAmountDisplayModule, {
				padding = 4,
				robuxAmountText = tostring(PriceInRobux),
				iconSize = NoIsPriceInRobuxMatch and ScaledBaseSize or 0,
				textSize = ScaledBaseSize,
				showRobuxIcon = NoIsPriceInRobuxMatch
			})
		}),
		CheckboxContainer = p1:renderCheckboxContainer(p3)
	})
end

function PurchasePromptInteractiveAlert.renderAlertLocalized(p1, p2, p3)
	-- upvalues: RoactModule (copy), AXFixPurchasePromptScrimClickThrough (copy), Focusable (copy), FFlagAXMigratePurchasePromptInteractiveToFocusNavigation (copy), RoactGamepadModule (copy), InteractiveAlert (copy), ButtonType (copy)
	return RoactModule.createElement(if AXFixPurchasePromptScrimClickThrough then Focusable.TextButton else Focusable.Frame, {
		Text = if AXFixPurchasePromptScrimClickThrough then "" else nil,
		AutoButtonColor = not AXFixPurchasePromptScrimClickThrough and nil,
		Selectable = not AXFixPurchasePromptScrimClickThrough and nil,
		[RoactModule.Event.Activated] = if AXFixPurchasePromptScrimClickThrough then function()
			-- upvalues: p1 (copy)
			p1.props.onCancel()
		end else nil,
		[RoactModule.Ref] = if FFlagAXMigratePurchasePromptInteractiveToFocusNavigation then p1.props.focusNavigationRef else nil,
		Size = UDim2.fromScale(1, 1),
		BackgroundTransparency = 1,
		SelectionGroup = true,
		SelectionBehaviorLeft = Enum.SelectionBehavior.Stop,
		SelectionBehaviorRight = Enum.SelectionBehavior.Stop,
		SelectionBehaviorUp = Enum.SelectionBehavior.Stop,
		SelectionBehaviorDown = Enum.SelectionBehavior.Stop,
		inputBindings = if FFlagAXMigratePurchasePromptInteractiveToFocusNavigation then nil else {
			SaveAsCharacter = if p1.props.toggleSaveAsCharacter == nil then nil else RoactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonX, p1.props.toggleSaveAsCharacter, { key = "Feature.Avatar.Heading.SaveCostume" }),
			WearAfterPurchase = RoactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonY, p1.props.toggleWearAfterPurchase, { key = "Feature.Avatar.Heading.WearConfirmation" }),
			Confirm = RoactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonA, function() end, { key = "CommonUI.Controls.Action.Confirm" })
		}
	}, {
		PurchasePrompt = RoactModule.createElement(InteractiveAlert, {
			isMiddleContentFocusable = true,
			title = p1.props.titleText,
			bodyText = p1.props.bodyText,
			buttonStackInfo = {
				buttons = {
					{
						isDefaultChild = true,
						props = {
							onActivated = p1.props.onCancel,
							text = p3.cancelButtonText
						}
					},
					{
						isDefaultChild = false,
						buttonType = ButtonType.PrimarySystem,
						props = {
							isLoading = p1.props.isLoading,
							onActivated = p1.props.onConfirm,
							text = p1.props.confirmButtonText,
							buttonRef = p1.textButtonRef
						}
					}
				}
			},
			middleContent = function()
				-- upvalues: p1 (copy), p2 (copy), p3 (copy)
				return p1:renderMiddle(p2, p3)
			end,
			screenSize = p1.props.screenSize,
			defaultChildRef = p1.props.defaultChildRef
		})
	})
end

function PurchasePromptInteractiveAlert.render(p1)
	-- upvalues: ConstantsModule (copy), FFlagAXCatalogMakeupSupport (copy), WithStyleFunction (copy), WithLocalizationFunction (copy)
	local Config = nil
	Config = if p1.props.lookType and p1.props.lookType == ConstantsModule.LookType.Avatar then {
		priceLabel = "Feature.Catalog.Label.PriceColon",
		cancelButtonText = "Feature.Catalog.Action.Cancel",
		saveAsCharacterLabel = "Feature.Avatar.Label.Title.AddToMyAvatars",
		wearItemLabel = if p1.props.saveIfWearAfterPurchase then "Feature.Avatar.Label.Title.WearAndSaveAfterPurchase" else "Feature.Catalog.Label.WearAfterPurchase",
		wearOutfitLabel = if p1.props.saveIfWearAfterPurchase then "Feature.Avatar.Label.Title.WearAndSaveAfterPurchase" else "Feature.Catalog.Label.WearAvatarAfterPurchase"
	} elseif FFlagAXCatalogMakeupSupport and p1.props.lookType and p1.props.lookType == ConstantsModule.LookType.Makeup then {
		priceLabel = "Feature.Catalog.Label.PriceColon",
		cancelButtonText = "Feature.Catalog.Action.Cancel",
		saveAsCharacterLabel = "Feature.Avatar.Label.Title.AddToMyMakeupLooks",
		wearItemLabel = "Feature.Catalog.Checkout.WearAfterPurchase",
		wearOutfitLabel = "Feature.Catalog.Checkout.WearAfterPurchase"
	} else {
		priceLabel = "Feature.Catalog.Label.PriceColon",
		cancelButtonText = "Feature.Catalog.Action.Cancel",
		saveAsCharacterLabel = "Feature.Avatar.Label.Title.AddToMyAvatars",
		wearItemLabel = if p1.props.saveIfWearAfterPurchase then "Feature.Avatar.Label.Title.WearAndSaveAfterPurchase" else "Feature.Catalog.Label.WearAfterPurchase",
		wearOutfitLabel = if p1.props.saveIfWearAfterPurchase then "Feature.Avatar.Label.Title.WearAndSaveAfterPurchase" else "Feature.Catalog.Label.WearOutfitAfterPurchase"
	}
	
	return WithStyleFunction(function(p2)
		-- upvalues: WithLocalizationFunction (upval), Config (ref), p1 (copy)
		return WithLocalizationFunction(Config)(function(p3)
			-- upvalues: p1 (upval), p2 (copy)
			return p1:renderAlertLocalized(p2, p3)
		end)
	end)
end

function PurchasePromptInteractiveAlert.addUnifiedEventLogging(p1)
	-- upvalues: AddUnifiedEventLoggingFunction (copy), CryoModule (copy), UnifiedEventLogEnums (copy), FFlagAXMISEnableMultiShoppingUnifiedEvents (copy), CartIdService (copy), UnifiedEventLoggingUtils (copy), AXAddWearAndSaveToPurchaseLogging (copy), FFlagAddTypesToWidgetItems (copy), UnifiedEventLogConstants (copy)
	local AnalyticsInfo = p1.props.analyticsInfo or {}
	AddUnifiedEventLoggingFunction(p1.textButtonRef, CryoModule.Dictionary.join(AnalyticsInfo, {
		action = UnifiedEventLogEnums.MarketplaceUnifiedAction.PURCHASE_ATTEMPT,
		cartId = if FFlagAXMISEnableMultiShoppingUnifiedEvents then CartIdService.getCartId() else nil,
		itemType = if AnalyticsInfo.itemType == "Asset" then UnifiedEventLogEnums.MarketplaceUnifiedItemType.ASSET elseif AnalyticsInfo.itemType == "Bundle" then UnifiedEventLogEnums.MarketplaceUnifiedItemType.BUNDLE else UnifiedEventLogEnums.MarketplaceUnifiedItemType.LOOK,
		organicLookType = if AnalyticsInfo.widgetType or not p1.props.lookType then nil else UnifiedEventLoggingUtils.formatLookTypeAttribute(p1.props.lookType),
		widgetLookType = if AnalyticsInfo.widgetType and p1.props.lookType then UnifiedEventLoggingUtils.formatLookTypeAttribute(p1.props.lookType) else nil,
		widgetItemPrice = if AnalyticsInfo.widgetType then p1.props.priceInRobux else nil,
		organicItemPrice = if AnalyticsInfo.widgetType then nil else p1.props.priceInRobux,
		widgetItemWearAfterPurchase = if AXAddWearAndSaveToPurchaseLogging and AnalyticsInfo.widgetType then p1.props.showWearAfterPurchase and p1.props.isWearAfterPurchaseChecked else nil,
		widgetItemSaveToMyAvatars = if AXAddWearAndSaveToPurchaseLogging and AnalyticsInfo.widgetType then p1.props.showSaveAsCharacter and p1.props.isSaveAsCharacterChecked else nil,
		organicItemWearAfterPurchase = if AXAddWearAndSaveToPurchaseLogging then if AnalyticsInfo.widgetType then nil else p1.props.showWearAfterPurchase and p1.props.isWearAfterPurchaseChecked else nil,
		organicItemSaveToMyAvatars = if AXAddWearAndSaveToPurchaseLogging then if AnalyticsInfo.widgetType then nil else p1.props.showSaveAsCharacter and p1.props.isSaveAsCharacterChecked else nil,
		widgetAssetType = if FFlagAddTypesToWidgetItems and AnalyticsInfo.widgetType then AnalyticsInfo.assetType else nil,
		widgetBundleType = if FFlagAddTypesToWidgetItems and AnalyticsInfo.widgetType then AnalyticsInfo.bundleType else nil
	}), {
		sessionTagName = UnifiedEventLogConstants.L2_SESSION_TAG_NAME
	})
end

function PurchasePromptInteractiveAlert.didMount(p1)
	-- upvalues: FFlagAddPerformanceMetricsToUnifiedPurchaseModal (copy), IntervalPerformanceTracker (copy), FIntLegacyPurchaseFPSTrackingTimeout (copy), GetTTIEventNameFunction (copy), ProductPurchaseSurface (copy), TimeToInteractiveTracker (copy), FIntTTIUnifiedPurchaseSamplingRate (copy)
	if FFlagAddPerformanceMetricsToUnifiedPurchaseModal then
		IntervalPerformanceTracker:startTracking("PurchaseModal_ProductPurchaseContainerShown_Catalog", FIntLegacyPurchaseFPSTrackingTimeout, nil, true, true)
		IntervalPerformanceTracker:startTracking("PurchaseModal_LegacyFlowShown_Catalog", 2, nil, true, true)
		TimeToInteractiveTracker.trackEnd(GetTTIEventNameFunction(ProductPurchaseSurface.Catalog), {
			samplingRateOverride = FIntTTIUnifiedPurchaseSamplingRate
		})
	end
	p1:addUnifiedEventLogging()
end

function PurchasePromptInteractiveAlert.didUpdate(p1)
	p1:addUnifiedEventLogging()
end

local v1 = RoactRoduxModule.connect(function(p1, _)
	return { screenSize = p1.ScreenSize }
end, nil)(PurchasePromptInteractiveAlert)

return if FFlagAXMigratePurchasePromptInteractiveToFocusNavigation then function(p1)
	-- upvalues: ReactModule (copy), useFocusNavigationBindings (copy), CryoModule (copy), UseTableWrappedCallbackRefFunction (copy), v1 (ref)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: p1 (copy)
		if p1.toggleSaveAsCharacter then
			p1.toggleSaveAsCharacter()
		end
	end, { p1.toggleSaveAsCharacter })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: p1 (copy)
		if p1.toggleWearAfterPurchase then
			p1.toggleWearAfterPurchase()
		end
	end, { p1.toggleWearAfterPurchase })
	
	return ReactModule.createElement(v1, (CryoModule.Dictionary.join(p1, {
		focusNavigationRef = UseTableWrappedCallbackRefFunction((useFocusNavigationBindings(nil, if p1.toggleSaveAsCharacter then UseResult else nil, if p1.toggleWearAfterPurchase then UseResult1 else nil)))
	})))
end else v1