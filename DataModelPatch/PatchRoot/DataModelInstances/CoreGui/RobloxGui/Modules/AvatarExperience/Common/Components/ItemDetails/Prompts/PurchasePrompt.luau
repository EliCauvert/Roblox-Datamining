local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local ReactModule = require(CorePackages.Packages.React)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local CryoModule = require(CorePackages.Packages.Cryo)
local Focusable = require(CorePackages.Packages.RoactGamepad).Focusable
local WithOverlayFocusHandlingModule = require(Modules.AvatarExperience.Common.Components.withOverlayFocusHandling)
local WithMappedNavigationParamsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.withMappedNavigationParams)
local NavigationUtilsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils)
local WithTriggerFeedbackFunction = require(CorePackages.Workspace.Packages.InteractionFeedback).withTriggerFeedback
local WithNavigationFunction = require(CorePackages.Packages.RoactNavigation).withNavigation
local RoactFitComponents = require(CorePackages.Packages.AvatarExperienceDeps).RoactFitComponents
local FitFrameVertical = RoactFitComponents.FitFrameVertical
local FitTextLabel = RoactFitComponents.FitTextLabel
local RoactAppPolicy = require(CorePackages.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local WithLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).withLocalization
local RetrievalStatus = require(CorePackages.Workspace.Packages.Http).Enum.RetrievalStatus
local PerformFetch = require(CorePackages.Workspace.Packages.Http).PerformFetch
local AnalyticsModule = require(Modules.AvatarExperience.Catalog.Services.Analytics)
local PurchaseProductModule = require(Modules.AvatarExperience.Catalog.Thunks.PurchaseProduct)
local CatalogConstantsModule = require(Modules.AvatarExperience.Catalog.CatalogConstants)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local CatalogUtilsModule = require(Modules.AvatarExperience.Catalog.CatalogUtils)
local ItemDataModule = require(Modules.AvatarExperience.Common.Selectors.ItemData)
local RobuxAmountDisplayModule = require(Modules.AvatarExperience.Common.Components.ItemDetails.RobuxAmountDisplay)
local PurchasePromptInteractiveAlertModule = require(Modules.AvatarExperience.Common.Components.ItemDetails.Prompts.PurchasePromptInteractiveAlert)
local Checkbox = require(CorePackages.Packages.Foundation).Checkbox
local WithStyleFunction = require(CorePackages.Packages.UIBlox).Style.withStyle
local UtilsModule = require(Modules.AvatarExperience.Common.Utils)
local FFlagDisableWearAfterPurchaseForCollectiblesModule = require(Modules.AvatarExperience.Flags.FFlagDisableWearAfterPurchaseForCollectibles)
local UseAvatarSaveContextFunction = require(CorePackages.Workspace.Packages.AvatarExperienceSave).Context.useAvatarSaveContext
local IAPExperienceModule = require(CorePackages.Workspace.Packages.IAPExperience)
local Default = require(CorePackages.Workspace.Packages.LoggingProtocol).default
local EconomicRestrictionsCounter = IAPExperienceModule.Counters.EconomicRestrictionsCounter
local UniversalEconomicRestrictionsCounter = EconomicRestrictionsCounter.UniversalEconomicRestrictionsCounter
local EconomicRestrictionsSurface = EconomicRestrictionsCounter.EconomicRestrictionsSurface
local OpenCentralOverlayForEconomicRestrictionPromptModule = require(Modules.LuaApp.Thunks.Fraud.OpenCentralOverlayForEconomicRestrictionPrompt)
local ParseEconomicRestrictionsFailureReasonFunction = IAPExperienceModule.Utility.parseEconomicRestrictionsFailureReason
local ParseEconomicRestrictionsExpirationTimeInMinutesFunction = IAPExperienceModule.Utility.parseEconomicRestrictionsExpirationTimeInMinutes
local PurchasePrompt = RoactModule.PureComponent:extend("PurchasePrompt")
PurchasePrompt.defaultProps = { sellerName = "" }

function PurchasePrompt.getPolicySpecifiedSellerName(p1, SellerName)
	return if p1.props.robloxSellerNameShouldBeLuobu and string.lower((utf8.nfdnormalize(SellerName))) == "roblox" then "罗布乐思" else SellerName
end

function PurchasePrompt.init(p1)
	-- upvalues: RoactModule (copy), NavigationUtilsModule (copy), ParseEconomicRestrictionsFailureReasonFunction (copy), Default (copy), UniversalEconomicRestrictionsCounter (copy), EconomicRestrictionsSurface (copy)
	p1.checkboxRef = RoactModule.createRef()
	p1.state = { isWearAfterPurchaseChecked = true }
	
	function p1.onCancel()
		-- upvalues: p1 (copy)
		p1.closePrompt()
	end
	
	function p1.onConfirm()
		-- upvalues: p1 (copy)
		p1.props.triggerFeedback("MakePurchase", "Press")
		local Analytics = p1.props.analytics
		local ItemId = p1.props.itemId
		local ItemType = p1.props.itemType
		local PriceInRobux = p1.props.priceInRobux
		local SellerId = p1.props.sellerId
		local Networking = p1.props.networking
		local ItemData = p1.props.itemData
		local UserAssetId = p1.props.userAssetId
		local ItemSubType = p1.props.itemSubType
		local Navigation = p1.props.navigation
		local FromProfile = p1.props.fromProfile
		local FromAvatarRoute = p1.props.fromAvatarRoute
		local WidgetInfo = p1.props.widgetInfo
		local FromContentFeed = p1.props.fromContentFeed
		local Id = ItemData and (ItemData.product and ItemData.product.id)
		local CollectibleItemId = ItemData and ItemData.collectibleItemId
		local Type = ItemData and (ItemData.creator and ItemData.creator.type)
		local IsWearAfterPurchaseChecked = p1.state.isWearAfterPurchaseChecked
		local Name = if FromAvatarRoute then FromAvatarRoute.current.name else nil
		local CollectibleInstanceId = p1.props.collectibleInstanceId
		local AvatarSaveContext = p1.props.avatarSaveContext
		
		if AvatarSaveContext and AvatarSaveContext.autoSaveNextNewSaveData and IsWearAfterPurchaseChecked then
			AvatarSaveContext.autoSaveNextNewSaveData()
		end
		p1.props.purchaseProduct(Networking, Id, PriceInRobux or 0, SellerId, ItemId, ItemType, ItemSubType, IsWearAfterPurchaseChecked, UserAssetId, Analytics, Navigation, FromProfile, false, Name, CollectibleItemId, CollectibleInstanceId, Type, WidgetInfo, FromContentFeed, p1.economicRestrictionErrorHandler, p1.props.timedOptionDays)
	end
	
	function p1.toggleWearAfterPurchase()
		-- upvalues: p1 (copy)
		p1:setState({
			isWearAfterPurchaseChecked = not p1.state.isWearAfterPurchaseChecked
		})
	end
	
	function p1.closePrompt()
		-- upvalues: NavigationUtilsModule (upval), p1 (copy)
		NavigationUtilsModule.closeOverlay(p1.props.navigation)
	end
	
	function p1.economicRestrictionErrorHandler(p2)
		-- upvalues: ParseEconomicRestrictionsFailureReasonFunction (upval), Default (upval), UniversalEconomicRestrictionsCounter (upval), EconomicRestrictionsSurface (upval), p1 (copy)
		local ParseEconomicRestrictionsFailureReasonResult = ParseEconomicRestrictionsFailureReasonFunction(p2)
		Default:logRobloxTelemetryCounter(UniversalEconomicRestrictionsCounter, 1, {
			surface = EconomicRestrictionsSurface.AvatarExperience,
			failureReason = if p2 then tostring(ParseEconomicRestrictionsFailureReasonResult) else "null"
		})
		p1.closePrompt()
		p1.props.openEconomicRestrictionPrompt(p2)
	end
end

function PurchasePrompt.showWearAfterPurchase(p1): boolean
	-- upvalues: ConstantsModule (copy), FFlagDisableWearAfterPurchaseForCollectiblesModule (copy)
	local ItemSubType = p1.props.itemSubType
	local IsNotItemSubTypeMatch: boolean = p1.props.itemType == ConstantsModule.ItemType.Asset and ItemSubType ~= ConstantsModule.AssetTypeIdStrings.EmoteAnimation
	
	if FFlagDisableWearAfterPurchaseForCollectiblesModule then
		local ItemData = p1.props.itemData
		
		if ItemData and ItemData.collectibleItemId then
			IsNotItemSubTypeMatch = false
		end
	end
	return IsNotItemSubTypeMatch
end

function PurchasePrompt.willUpdate(p1, p2, _)
	-- upvalues: UtilsModule (copy)
	if UtilsModule.isFetchingDoneOrFailed(p1.props.fetchingState, p2.fetchingState) then
		p1.closePrompt()
	end
end

function PurchasePrompt.renderMiddle(p1, p2)
	-- upvalues: WithStyleFunction (copy), RoactModule (copy), Focusable (copy), FitFrameVertical (copy), RoactFitComponents (copy), FitTextLabel (copy), RobuxAmountDisplayModule (copy), Checkbox (copy)
	local PriceInRobux = p1.props.priceInRobux or ""
	local IsPriceInRobuxMatch = PriceInRobux == 0
	local NoIsPriceInRobuxMatch = not IsPriceInRobuxMatch
	
	return WithStyleFunction(function(p3)
		-- upvalues: NoIsPriceInRobuxMatch (copy), RoactModule (upval), Focusable (upval), FitFrameVertical (upval), p1 (copy), IsPriceInRobuxMatch (copy), RoactFitComponents (upval), FitTextLabel (upval), p2 (copy), RobuxAmountDisplayModule (upval), PriceInRobux (copy), Checkbox (upval)
		local _Font = p3.Font
		local Theme = p3.Theme
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
					Text = p2.priceLabel,
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
			CheckboxContainer = p1:showWearAfterPurchase() and RoactModule.createElement(Checkbox, {
				LayoutOrder = 2,
				label = p2.wearItemLabel,
				isChecked = p1.state.isWearAfterPurchaseChecked,
				onActivated = p1.toggleWearAfterPurchase,
				ref = p1.checkboxRef
			})
		})
	end)
end

function PurchasePrompt.renderAlertLocalized(p1, p2)
	-- upvalues: CryoModule (copy), RoactModule (copy), PurchasePromptInteractiveAlertModule (copy), RetrievalStatus (copy)
	local ItemData = p1.props.itemData
	local PriceInRobux = p1.props.priceInRobux
	local PolicySpecifiedSellerName = p1:getPolicySpecifiedSellerName(p1.props.sellerName)
	local Name = ItemData and ItemData.name or ""
	local FreeConfirmButtonText = nil
	local FreeDescriptionText = nil
	local FreeTitleText = nil
	
	if (PriceInRobux or "") == 0 then
		FreeTitleText = p2.freeTitleText
		FreeDescriptionText = p2.freeDescriptionText
		FreeConfirmButtonText = p2.freeConfirmButtonText
	else
		FreeTitleText = p2.titleText
		FreeDescriptionText = p2.descriptionText
		FreeConfirmButtonText = p2.confirmButtonText
	end
	return RoactModule.createElement(PurchasePromptInteractiveAlertModule, {
		priceInRobux = PriceInRobux,
		showWearAfterPurchase = p1:showWearAfterPurchase(),
		isWearAfterPurchaseChecked = p1.state.isWearAfterPurchaseChecked,
		toggleWearAfterPurchase = p1.toggleWearAfterPurchase,
		titleText = FreeTitleText,
		bodyText = FreeDescriptionText:gsub("({itemName})", function()
			-- upvalues: Name (copy)
			return Name
		end):gsub("({creatorName})", function()
			-- upvalues: PolicySpecifiedSellerName (copy)
			return PolicySpecifiedSellerName
		end),
		confirmButtonText = FreeConfirmButtonText,
		onConfirm = p1.onConfirm,
		onCancel = p1.onCancel,
		isLoading = p1.props.fetchingState == RetrievalStatus.Fetching,
		defaultChildRef = p1.props.defaultChildRef,
		analyticsInfo = CryoModule.Dictionary.join(p1.props.widgetInfo or {}, {
			itemId = p1.props.itemId,
			itemType = p1.props.itemType,
			assetType = if p1.props.itemData then p1.props.itemData.assetType else nil,
			bundleType = if p1.props.itemData then p1.props.itemData.bundleType else nil
		})
	})
end

function PurchasePrompt.render(p1)
	-- upvalues: WithLocalizationFunction (copy)
	return WithLocalizationFunction({
		freeConfirmButtonText = "Feature.Catalog.Label.Get",
		freeDescriptionText = "Feature.Catalog.Label.FreeItemConfirmation",
		freeTitleText = "Feature.Catalog.Heading.FreeItemConfirmation",
		titleText = "Feature.Catalog.Heading.BuyItem",
		priceLabel = "Feature.Catalog.Label.PriceColon",
		confirmButtonText = "Feature.Catalog.Heading.BuyItem",
		cancelButtonText = "Feature.Catalog.Action.Cancel",
		wearItemLabel = "Feature.Catalog.Label.WearAfterPurchase",
		descriptionText = if p1.props.enablePurchasePromptIncludingWarning then "Feature.Catalog.Label.BuyConfirmationIncludingWarning" else "Feature.Catalog.Label.BuyConfirmation"
	})(function(p2)
		-- upvalues: p1 (copy)
		return p1:renderAlertLocalized(p2)
	end)
end

local WithTriggerFeedbackResult = WithTriggerFeedbackFunction((WithNavigationFunction((WithMappedNavigationParamsModule((WithOverlayFocusHandlingModule((RoactServices.connect({
	networking = RoactNetworkingModule,
	analytics = AnalyticsModule
})((RoactRoduxModule.connect(function(p1, p2)
	-- upvalues: ItemDataModule (copy), CatalogUtilsModule (copy), PerformFetch (copy), CatalogConstantsModule (copy)
	local ItemType = p2.itemType
	local ItemDataModuleResult = ItemDataModule(p1.AvatarExperience.Common, p2.itemId, ItemType)
	
	return {
		itemData = ItemDataModuleResult,
		itemSubType = CatalogUtilsModule.GetItemSubType(ItemType, ItemDataModuleResult),
		fetchingState = PerformFetch.GetStatus(p1, CatalogConstantsModule.PurchaseProductKey .. tostring(ItemDataModuleResult and (ItemDataModuleResult.product and ItemDataModuleResult.product.id))),
		screenSize = p1.ScreenSize
	}
end, function(Callback)
	-- upvalues: PurchaseProductModule (copy), ParseEconomicRestrictionsFailureReasonFunction (copy), ParseEconomicRestrictionsExpirationTimeInMinutesFunction (copy), OpenCentralOverlayForEconomicRestrictionPromptModule (copy)
	return {
		purchaseProduct = function(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15, p16, p17, p18, p19, p20, p21)
			-- upvalues: Callback (copy), PurchaseProductModule (upval)
			return Callback(PurchaseProductModule(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15, p16, p17, p18, p19, p20, p21))
		end,
		openEconomicRestrictionPrompt = function(p1)
			-- upvalues: ParseEconomicRestrictionsFailureReasonFunction (upval), ParseEconomicRestrictionsExpirationTimeInMinutesFunction (upval), Callback (copy), OpenCentralOverlayForEconomicRestrictionPromptModule (upval)
			return Callback(OpenCentralOverlayForEconomicRestrictionPromptModule(ParseEconomicRestrictionsFailureReasonFunction(p1), (ParseEconomicRestrictionsExpirationTimeInMinutesFunction(p1))))
		end
	}
end)((RoactAppPolicy.connect(function(p1, _)
	return {
		robloxSellerNameShouldBeLuobu = p1.getRobloxCreatedItemsCreatedByLuobu(),
		enablePurchasePromptIncludingWarning = p1.getPurchasePromptIncludingWarning()
	}
end)(PurchasePrompt)))))))))))))

return function(p1)
	-- upvalues: UseAvatarSaveContextFunction (copy), ReactModule (copy), WithTriggerFeedbackResult (ref), CryoModule (copy)
	return ReactModule.createElement(WithTriggerFeedbackResult, CryoModule.Dictionary.join(p1, { avatarSaveContext = UseAvatarSaveContextFunction() }))
end