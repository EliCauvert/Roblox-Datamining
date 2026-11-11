local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local RoactGamepadModule = require(CorePackages.Packages.RoactGamepad)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local RetrievalStatus = require(CorePackages.Workspace.Packages.Http).Enum.RetrievalStatus
local PerformFetch = require(CorePackages.Workspace.Packages.Http).PerformFetch
local PeekView = require(CorePackages.Workspace.Packages.PeekView).PeekView
local PeekViewState = require(CorePackages.Workspace.Packages.PeekView).PeekViewState
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local UseNavigationFunction = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local UsePropertyFunction = require(CorePackages.Workspace.Packages.GuiObjectUtils).useProperty
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local Focusable = RoactGamepadModule.Focusable
local SellItemInfoModule = require(Modules.AvatarExperience.Common.Components.ItemDetails.SellPage.SellItemInfo)
local SellItemSetPriceModule = require(Modules.AvatarExperience.Common.Components.ItemDetails.SellPage.SellItemSetPrice)
local SellItemOverviewModule = require(Modules.AvatarExperience.Common.Components.ItemDetails.SellPage.SellItemOverview)
local CatalogConstantsModule = require(Modules.AvatarExperience.Catalog.CatalogConstants)
local GetMarketplaceFeeModule = require(Modules.AvatarExperience.Catalog.Thunks.GetMarketplaceFee)
local GetCollectibleMarketplaceResaleParametersModule = require(Modules.AvatarExperience.Catalog.Thunks.GetCollectibleMarketplaceResaleParameters)
local RemoveAvailableToSellAssetModule = require(Modules.AvatarExperience.Catalog.Thunks.RemoveAvailableToSellAsset)
local UpdateCollectibleInstanceResaleStateModule = require(Modules.AvatarExperience.Catalog.Thunks.UpdateCollectibleInstanceResaleState)
local CenteredModalViewModule = require(Modules.AvatarExperience.Common.Components.CenteredModalView)
local GamepadFocusHandlerForPageModule = require(Modules.AvatarExperience.Common.Components.GamepadFocusHandlerForPage)
local ItemDataModule = require(Modules.AvatarExperience.Common.Selectors.ItemData)
local _ = require(Modules.AvatarExperience.Common.Types)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local CatalogUtilsModule = require(Modules.AvatarExperience.Catalog.CatalogUtils)
local UseLocalizationModule = require(Modules.LuaApp.Hooks.useLocalization)
local NavigationUtilsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils)
local UseRoactServiceModule = require(Modules.LuaApp.Hooks.useRoactService)
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local ReactFocusNavigationModule = require(CorePackages.Packages.ReactFocusNavigation)
local InputHandlersModule = require(CorePackages.Packages.InputHandlers)
local FocusNavigationEventNameEnum = require(CorePackages.Workspace.Packages.FocusNavigationUtils).FocusNavigationEventNameEnum
local GetFFlagL2ControllerSupportModule = require(Modules.AvatarExperience.Flags.GetFFlagL2ControllerSupport)
local FFlagAXMigrateItemOwnershipSellPagesInputBindingsToFocusNavigation = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateItemOwnershipSellPagesInputBindingsToFocusNavigation
local ButtonStack = UIBloxModule.App.Button.ButtonStack
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local LoadingStateContainer = UIBloxModule.App.Container.LoadingStateContainer
local RetrievalStatus1 = UIBloxModule.App.Loading.Enum.RetrievalStatus
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local GetUseSelectorDeepEqualsFunction = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Utils.getUseSelectorDeepEquals
local FFlagAXMigrateAXToGlobalAutofocus = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus
local config = {
	[Enum.KeyCode.ButtonB] = FocusNavigationEventNameEnum.NavigateBack,
	[Enum.KeyCode.Escape] = FocusNavigationEventNameEnum.NavigateBack
}

local function useSellItemPeekViewFocusNavigationBindings(p1, Callback)
	-- upvalues: ReactFocusNavigationModule (copy), config (copy), ReactModule (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy)
	return ReactFocusNavigationModule.useEventHandlerMap(ReactModule.useMemo(function()
		-- upvalues: FocusNavigationEventNameEnum (upval), InputHandlersModule (upval), Callback (copy)
		return {
			[FocusNavigationEventNameEnum.NavigateBack] = {
				handler = InputHandlersModule.onRelease(function(p2)
					-- upvalues: Callback (upval)
					p2.cancelled = true
					Callback()
				end)
			}
		}
	end, { Callback }), (ReactFocusNavigationModule.useEventMap(config, p1)))
end

local function _(p1, p2): boolean
	if p1 then
		local Number: number? = tonumber(p1)
		
		return not Number or Number < (p2 or 0)
	else
		return true
	end
end

local _ = function(p1, p2, p3, p4): number
	local v1: boolean = p1 ~= nil and (p2 ~= nil and p3 ~= nil)
	
	return if v1 then p1.Y * math.clamp(if p4 == nil then 0.8 else p4, 0, 1) - 25 - 20 - p2.Y - 30 - p3.Y - 30 - 30 else -1
end

local _ = function(Asset, p1)
	-- upvalues: ConstantsModule (copy)
	return if p1 then if Asset == ConstantsModule.ItemType.Bundle then ConstantsModule.BundleTypeIdStringToNameForBackend[p1] or ConstantsModule.BundleTypeIdStringToName[p1] elseif Asset == ConstantsModule.ItemType.Asset then ConstantsModule.AssetTypeIdStringToName[p1] else nil else nil
end

return function(_)
	-- upvalues: UseLocalizationModule (copy), UseStyleFunction (copy), UseDispatchFunction (copy), UseRoactServiceModule (copy), RoactNetworkingModule (copy), UseNavigationFunction (copy), ReactModule (copy), FFlagAXMigrateAXToGlobalAutofocus (copy), RoactGamepadModule (copy), UsePropertyFunction (copy), UseSelectorFunction (copy), ItemDataModule (copy), GetUseSelectorDeepEqualsFunction (copy), CatalogUtilsModule (copy), ConstantsModule (copy), PerformFetch (copy), CatalogConstantsModule (copy), RetrievalStatus (copy), GetCollectibleMarketplaceResaleParametersModule (copy), GetMarketplaceFeeModule (copy), PeekViewState (copy), FFlagAXMigrateItemOwnershipSellPagesInputBindingsToFocusNavigation (copy), useSellItemPeekViewFocusNavigationBindings (copy), UpdateCollectibleInstanceResaleStateModule (copy), RemoveAvailableToSellAssetModule (copy), SellItemInfoModule (copy), SellItemSetPriceModule (copy), GetFFlagL2ControllerSupportModule (copy), SellItemOverviewModule (copy), ButtonType (copy), CenteredModalViewModule (copy), Focusable (copy), NavigationUtilsModule (copy), GamepadFocusHandlerForPageModule (copy), PeekView (copy), LoadingStateContainer (copy), RetrievalStatus1 (copy), ButtonStack (copy)
	local UseLocalizationModuleResult = UseLocalizationModule({
		sellItemText = "Feature.Catalog.Heading.SellItem",
		sellButtonText = "Feature.Catalog.Action.Sell",
		cancelButtonText = "Feature.Catalog.Action.Cancel"
	})
	local UseStyleResult = UseStyleFunction()
	local Theme = UseStyleResult.Theme
	local UseDispatchResult = UseDispatchFunction()
	local UseRoactServiceModuleResult = UseRoactServiceModule(RoactNetworkingModule)
	local UseNavigationResult = UseNavigationFunction()
	local Params = UseNavigationResult.state.params
	local UseStateResult, UseStateResult2 = ReactModule.useState("")
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseRefResult2 = ReactModule.useRef(nil)
	local UseRefResult3 = ReactModule.useRef(nil)
	local UseRootFocusControllerResult = if FFlagAXMigrateAXToGlobalAutofocus then nil else RoactGamepadModule.useRootFocusController()
	local AbsoluteSize = UsePropertyFunction(UseRefResult, "AbsoluteSize") or nil
	local AbsoluteSize1 = UsePropertyFunction(UseRefResult1, "AbsoluteSize") or nil
	local AbsoluteSize2 = UsePropertyFunction(UseRefResult2, "AbsoluteSize") or nil
	local PeekViewFillPercentage = UseNavigationResult.state.params.peekViewFillPercentage
	local HasAbsoluteSize: boolean = AbsoluteSize ~= nil and (AbsoluteSize1 ~= nil and AbsoluteSize2 ~= nil)
	local YDelta: number = if HasAbsoluteSize then AbsoluteSize.Y * math.clamp(if PeekViewFillPercentage == nil then 0.8 else PeekViewFillPercentage, 0, 1) - 25 - 20 - AbsoluteSize1.Y - 30 - AbsoluteSize2.Y - 30 - 30 else -1
	local CollectibleItemId = UseNavigationResult.state.params.collectibleItemId
	local ItemSubType = CatalogUtilsModule.GetItemSubType(Params.itemType, (UseSelectorFunction(function(p1)
		-- upvalues: ItemDataModule (upval), Params (copy)
		return ItemDataModule(p1.AvatarExperience.Common, Params.itemId, Params.itemType)
	end, GetUseSelectorDeepEqualsFunction())))
	local ItemType = Params.itemType
	local BundleTypeIdStringToNameForBackendEntry = if ItemSubType then if ItemType == ConstantsModule.ItemType.Bundle then ConstantsModule.BundleTypeIdStringToNameForBackend[ItemSubType] or ConstantsModule.BundleTypeIdStringToName[ItemSubType] elseif ItemType == ConstantsModule.ItemType.Asset then ConstantsModule.AssetTypeIdStringToName[ItemSubType] else nil else nil
	local UseSelectorResult = UseSelectorFunction(function(p1)
		-- upvalues: UseNavigationResult (copy), ItemDataModule (upval)
		local ItemId = UseNavigationResult.state.params.itemId
		local UserAssetId = UseNavigationResult.state.params.userAssetId
		local ItemDataModuleResult = ItemDataModule(p1.AvatarExperience.Common, ItemId, UseNavigationResult.state.params.itemType)
		local UserAsset = p1.AvatarExperience.Catalog.UserAssets[UserAssetId]
		
		return {
			id = ItemId,
			averagePrice = ItemDataModuleResult and ItemDataModuleResult.averagePrice,
			serialNumber = if UserAsset == nil then nil else UserAsset.serialNumber
		}
	end, GetUseSelectorDeepEqualsFunction())
	local UseSelectorResult1 = UseSelectorFunction(function(p1)
		-- upvalues: CollectibleItemId (copy), CollectibleItemId (copy)
		if CollectibleItemId then
			local CollectiblesMarketplaceResaleParameter = p1.AvatarExperience.Common.Collectibles.CollectiblesMarketplaceResaleParameters[CollectibleItemId]
			
			return if CollectiblesMarketplaceResaleParameter == nil then {} else {
				taxRate = CollectiblesMarketplaceResaleParameter.resalePercentageFee / 100,
				minimumFee = CollectiblesMarketplaceResaleParameter.minimumFee
			}
		else
			return p1.AvatarExperience.Catalog.MarketplaceFee
		end
	end, GetUseSelectorDeepEqualsFunction())
	local UseSelectorResult2 = UseSelectorFunction(function(p1)
		-- upvalues: UseNavigationResult (copy), PerformFetch (upval), CatalogConstantsModule (upval)
		return PerformFetch.GetStatus(p1, CatalogConstantsModule.RemoveAvailableToSellAssetKey .. tostring(UseNavigationResult.state.params.userAssetId))
	end, GetUseSelectorDeepEqualsFunction())
	local UseSelectorResult3 = UseSelectorFunction(function(p1)
		-- upvalues: PerformFetch (upval), CatalogConstantsModule (upval)
		return PerformFetch.GetStatus(p1, CatalogConstantsModule.GetMarketplaceFeeKey)
	end, GetUseSelectorDeepEqualsFunction())
	local UseSelectorResult4 = UseSelectorFunction(function(p1)
		-- upvalues: CatalogConstantsModule (upval), CollectibleItemId (copy), PerformFetch (upval)
		return PerformFetch.GetStatus(p1, CatalogConstantsModule.GetCollectibleMarketplaceResaleParametersKey .. tostring(CollectibleItemId))
	end, GetUseSelectorDeepEqualsFunction())
	local UseSelectorResult5 = UseSelectorFunction(function(p1)
		-- upvalues: CollectibleItemId (copy)
		local CollectiblesMarketplaceResaleParameter = p1.AvatarExperience.Common.Collectibles.CollectiblesMarketplaceResaleParameters[CollectibleItemId]
		
		return CollectiblesMarketplaceResaleParameter and CollectiblesMarketplaceResaleParameter.priceFloor or 0
	end, GetUseSelectorDeepEqualsFunction())
	ReactModule.useEffect(function()
		-- upvalues: CollectibleItemId (copy), UseSelectorResult4 (copy), RetrievalStatus (upval), UseDispatchResult (copy), GetCollectibleMarketplaceResaleParametersModule (upval), UseRoactServiceModuleResult (copy), CollectibleItemId (copy), BundleTypeIdStringToNameForBackendEntry (copy), UseSelectorResult3 (copy), GetMarketplaceFeeModule (upval)
		if CollectibleItemId and (UseSelectorResult4 == RetrievalStatus.NotStarted or UseSelectorResult4 == RetrievalStatus.Failed) then
			UseDispatchResult(GetCollectibleMarketplaceResaleParametersModule(UseRoactServiceModuleResult, CollectibleItemId, BundleTypeIdStringToNameForBackendEntry))
			
			return
		end
		if UseSelectorResult3 == RetrievalStatus.NotStarted or UseSelectorResult3 == RetrievalStatus.Failed then
			UseDispatchResult(GetMarketplaceFeeModule(UseRoactServiceModuleResult))
		end
	end, {
		UseSelectorResult3,
		UseSelectorResult4,
		CollectibleItemId,
		BundleTypeIdStringToNameForBackendEntry
	})
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseNavigationResult (copy)
		UseNavigationResult.goBack()
		local OnPeekViewClosedFunction: () -> () = UseNavigationResult.state.params.onPeekViewClosed
		
		if OnPeekViewClosedFunction then
			OnPeekViewClosedFunction()
		end
	end, { UseNavigationResult })
	local UseResult1 = ReactModule.useCallback(function(Closed, _)
		-- upvalues: PeekViewState (upval), UseResult (copy)
		if Closed == PeekViewState.Closed then
			UseResult()
		end
	end, { UseResult })
	local UseSellItemPeekViewFocusNavigationBindingsResult = if FFlagAXMigrateItemOwnershipSellPagesInputBindingsToFocusNavigation then useSellItemPeekViewFocusNavigationBindings(nil, UseResult) else nil
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult (copy), UseSelectorResult5 (copy), UseSelectorResult (copy), UseNavigationResult (copy), CollectibleItemId (copy), UseDispatchResult (copy), UpdateCollectibleInstanceResaleStateModule (upval), UseRoactServiceModuleResult (copy), CollectibleItemId (copy), RemoveAvailableToSellAssetModule (upval), UseResult (copy)
		local NoNumber = nil
		if UseStateResult then
			local Number: number? = tonumber(UseStateResult)
			NoNumber = not Number or Number < (UseSelectorResult5 or 0)
		else
			NoNumber = true
		end
		if NoNumber then return end
		local Id = UseSelectorResult.id
		local UserAssetId = UseNavigationResult.state.params.userAssetId
		local Number: number? = tonumber(UseStateResult)
		
		if CollectibleItemId then
			UseDispatchResult(UpdateCollectibleInstanceResaleStateModule(UseRoactServiceModuleResult, CollectibleItemId, UserAssetId, true, Number))
		else
			UseDispatchResult(RemoveAvailableToSellAssetModule(UseRoactServiceModuleResult, Id, UserAssetId, Number))
		end
		UseResult()
	end, {
		UseResult, UseStateResult, UseSelectorResult, UseNavigationResult,
		UseRoactServiceModuleResult, CollectibleItemId, UseSelectorResult5
	})
	local UseResult3 = ReactModule.useCallback(function()
		-- upvalues: UseStyleResult (copy), ReactModule (upval), UseLocalizationModuleResult (copy), Theme (copy), SellItemInfoModule (upval), UseSelectorResult (copy), SellItemSetPriceModule (upval), UseSelectorResult5 (copy), UseStateResult (copy), UseStateResult2 (copy), GetFFlagL2ControllerSupportModule (upval), UseRefResult3 (copy), UseRefResult2 (copy), SellItemOverviewModule (upval), UseSelectorResult1 (copy)
		local UseStyleResultFont = UseStyleResult.Font
		local Header1 = UseStyleResultFont.Header1
		
		return ReactModule.createElement("Frame", {
			LayoutOrder = 1,
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.fromScale(1, 0)
		}, {
			UIListLayout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				VerticalAlignment = Enum.VerticalAlignment.Top,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, 30)
			}),
			SellItemHeader = ReactModule.createElement("TextLabel", {
				LayoutOrder = 1,
				TextWrapped = true,
				BackgroundTransparency = 1,
				AutomaticSize = Enum.AutomaticSize.Y,
				Text = UseLocalizationModuleResult.sellItemText,
				Font = Header1.Font,
				Size = UDim2.fromScale(1, 0),
				TextSize = Header1.RelativeSize * UseStyleResultFont.BaseSize,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Top,
				TextColor3 = Theme.TextEmphasis.Color,
				TextTransparency = Theme.TextEmphasis.Transparency
			}),
			ItemInfoContent = ReactModule.createElement(SellItemInfoModule, {
				layoutOrder = 2,
				itemIdPriceSerialNumber = UseSelectorResult
			}),
			SetPriceContent = ReactModule.createElement(SellItemSetPriceModule, {
				layoutOrder = 3,
				priceFloor = UseSelectorResult5,
				priceInRobux = UseStateResult,
				setPriceInRobux = UseStateResult2,
				ref = if GetFFlagL2ControllerSupportModule() then UseRefResult3 else nil,
				NextSelectionDown = if GetFFlagL2ControllerSupportModule() then UseRefResult2 else nil
			}),
			OverviewContent = ReactModule.createElement(SellItemOverviewModule, {
				layoutOrder = 4,
				marketplaceFee = UseSelectorResult1,
				priceInRobux = UseStateResult
			})
		})
	end, {
		UseStyleResult, Theme, UseLocalizationModuleResult, UseSelectorResult,
		UseStateResult, UseStateResult2, UseSelectorResult1
	})
	local UseResult4 = ReactModule.useCallback(function()
		-- upvalues: UseSelectorResult3 (copy), RetrievalStatus (upval), UseDispatchResult (copy), GetMarketplaceFeeModule (upval), UseRoactServiceModuleResult (copy)
		if UseSelectorResult3 ~= RetrievalStatus.Fetching then
			UseDispatchResult(GetMarketplaceFeeModule(UseRoactServiceModuleResult))
		end
	end, { UseSelectorResult3, UseRoactServiceModuleResult })
	local UseResult5 = ReactModule.useCallback(function()
		-- upvalues: UseSelectorResult4 (copy), RetrievalStatus (upval), UseDispatchResult (copy), GetCollectibleMarketplaceResaleParametersModule (upval), UseRoactServiceModuleResult (copy), CollectibleItemId (copy), BundleTypeIdStringToNameForBackendEntry (copy)
		if UseSelectorResult4 ~= RetrievalStatus.Fetching then
			UseDispatchResult(GetCollectibleMarketplaceResaleParametersModule(UseRoactServiceModuleResult, CollectibleItemId, BundleTypeIdStringToNameForBackendEntry))
		end
	end, {
		UseSelectorResult4,
		UseRoactServiceModuleResult,
		CollectibleItemId,
		BundleTypeIdStringToNameForBackendEntry
	})
	local t = {}
	local Buttons = {}
	local config = {
		isDefaultChild = true,
		props = {
			onActivated = UseResult,
			text = UseLocalizationModuleResult.cancelButtonText
		}
	}
	local config1 = {
		isDefaultChild = false,
		buttonType = ButtonType.PrimarySystem
	}
	local Props = {}
	local NoNumber = nil
	
	if UseStateResult then
		local Number: number? = tonumber(UseStateResult)
		NoNumber = not Number or Number < (UseSelectorResult5 or 0)
	else
		NoNumber = true
	end
	Props.isDisabled = NoNumber
	Props.isLoading = UseSelectorResult2 == RetrievalStatus.Fetching or (UseSelectorResult3 == RetrievalStatus.Fetching or UseSelectorResult4 == RetrievalStatus.Fetching)
	Props.onActivated = UseResult2
	Props.text = UseLocalizationModuleResult.sellButtonText
	config1.props = Props
	Buttons[1] = config
	Buttons[2] = config1
	t.buttons = Buttons
	
	return ReactModule.createElement(CenteredModalViewModule, { backgroundTransparency = 1 }, {
		FullSizeFrame = ReactModule.createElement(if GetFFlagL2ControllerSupportModule() then Focusable.Frame else "Frame", {
			LayoutOrder = 1,
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			focusController = if FFlagAXMigrateAXToGlobalAutofocus then nil elseif GetFFlagL2ControllerSupportModule() then UseRootFocusControllerResult else nil,
			defaultChild = if GetFFlagL2ControllerSupportModule() then UseRefResult3 else nil,
			inputBindings = if FFlagAXMigrateItemOwnershipSellPagesInputBindingsToFocusNavigation or not GetFFlagL2ControllerSupportModule() then nil else {
				NavigateBack = RoactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonB, function()
					-- upvalues: NavigationUtilsModule (upval), UseNavigationResult (copy)
					NavigationUtilsModule.closeFocusedScreen(UseNavigationResult)
				end)
			},
			ref = UseRefResult
		}, {
			GamepadFocusHandlerForPage = if FFlagAXMigrateAXToGlobalAutofocus then nil else GetFFlagL2ControllerSupportModule() and ReactModule.createElement(GamepadFocusHandlerForPageModule, {
				captureFocusOnMount = true,
				focusController = UseRootFocusControllerResult
			}),
			PeekView = ReactModule.createElement(PeekView, {
				mountAsFullView = true,
				isScrollingEnabled = false,
				showDraggerInClosedState = false,
				peekHeaderClose = true,
				canDragFullViewToBrief = false,
				thumbstickScrollEnabled = false,
				viewStateChanged = UseResult1,
				backgroundColor3 = Theme.BackgroundDefault.Color,
				backgroundTransparency = Theme.BackgroundUIDefault.Transparency,
				shouldCaptureFocus = not FFlagAXMigrateAXToGlobalAutofocus and nil
			}, {
				ContentContainer = ReactModule.createElement("Frame", {
					LayoutOrder = 1,
					BackgroundTransparency = 1,
					AutomaticSize = Enum.AutomaticSize.Y,
					Size = UDim2.fromScale(1, 0),
					ref = if FFlagAXMigrateItemOwnershipSellPagesInputBindingsToFocusNavigation then UseSellItemPeekViewFocusNavigationBindingsResult else nil
				}, {
					UIListLayout = ReactModule.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Vertical,
						HorizontalAlignment = Enum.HorizontalAlignment.Left,
						VerticalAlignment = Enum.VerticalAlignment.Top,
						SortOrder = Enum.SortOrder.LayoutOrder,
						Padding = UDim.new(0, 30)
					}),
					UIPadding = ReactModule.createElement("UIPadding", {
						PaddingLeft = UDim.new(0, 20),
						PaddingRight = UDim.new(0, 20),
						PaddingTop = UDim.new(0, 20),
						PaddingBottom = UDim.new(0, 30)
					}),
					ItemInfoContentFrame = ReactModule.createElement("Frame", {
						LayoutOrder = 1,
						BackgroundTransparency = 1,
						AutomaticSize = Enum.AutomaticSize.Y,
						Size = UDim2.fromScale(1, 0),
						ref = UseRefResult1
					}, {
						Content = ReactModule.createElement(LoadingStateContainer, {
							dataStatus = if CollectibleItemId then RetrievalStatus1.fromRawValue(UseSelectorResult4) else RetrievalStatus1.fromRawValue(UseSelectorResult3),
							onRetry = if CollectibleItemId then UseResult5 else UseResult4,
							renderOnLoaded = UseResult3
						})
					}),
					WhiteSpaceFrame = YDelta >= 0 and ReactModule.createElement("Frame", {
						LayoutOrder = 2,
						BackgroundTransparency = 1,
						AutomaticSize = Enum.AutomaticSize.Y,
						Size = UDim2.new(1, 0, 0, YDelta)
					}),
					Footer = ReactModule.createElement(Focusable.Frame, {
						LayoutOrder = 3,
						BackgroundTransparency = 1,
						AutomaticSize = Enum.AutomaticSize.Y,
						Size = UDim2.fromScale(1, 0),
						ref = UseRefResult2,
						NextSelectionUp = if GetFFlagL2ControllerSupportModule() then UseRefResult3 else nil
					}, {
						Buttons = t and ReactModule.createElement(ButtonStack, t)
					})
				})
			})
		})
	})
end