local CorePackages = game:GetService("CorePackages")
local GuiService = game:GetService("GuiService")
local Parent = script.Parent.Parent
local ReactModule = require(CorePackages.Packages.React)
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local AvatarViewportModule = require(Parent.Components.AvatarViewport)
local AvatarExperienceInspectAndBuyModule = require(CorePackages.Workspace.Packages.AvatarExperienceInspectAndBuy)
local PopoverFocusRestorationContext = require(CorePackages.Workspace.Packages.AvatarExperienceTimedOptions).PopoverFocusRestorationContext
local UseViewBreakpointsFunction = AvatarExperienceInspectAndBuyModule.Hooks.useViewBreakpoints
local ResponsivePanelLayout = AvatarExperienceInspectAndBuyModule.Components.ResponsivePanelLayout
local UseResponsivePanelLayoutPropsFunction = AvatarExperienceInspectAndBuyModule.Hooks.useResponsivePanelLayoutProps
local ApplyTryOnItemToHumanoidDescriptionFunction = AvatarExperienceInspectAndBuyModule.Utils.applyTryOnItemToHumanoidDescription
local UseInspectAndBuyFocusNavigationFunction = AvatarExperienceInspectAndBuyModule.Hooks.useInspectAndBuyFocusNavigation
local BuildBulkPurchaseAnalyticsPayloadFunction = AvatarExperienceInspectAndBuyModule.Utils.buildBulkPurchaseAnalyticsPayload
local UpdateBulkPuchaseResultsModule = require(Parent.Actions.UpdateBulkPuchaseResults)
local GetProductInfoModule = require(Parent.Thunks.GetProductInfo)
local GetFavoriteForAssetModule = require(Parent.Thunks.GetFavoriteForAsset)
local GetFavoriteForBundleModule = require(Parent.Thunks.GetFavoriteForBundle)
local CreateFavoriteForAssetModule = require(Parent.Thunks.CreateFavoriteForAsset)
local DeleteFavoriteForAssetModule = require(Parent.Thunks.DeleteFavoriteForAsset)
local CreateFavoriteForBundleModule = require(Parent.Thunks.CreateFavoriteForBundle)
local DeleteFavoriteForBundleModule = require(Parent.Thunks.DeleteFavoriteForBundle)
local PromptPurchaseModule = require(Parent.Thunks.PromptPurchase)
local GetItemDetailsModule = require(Parent.Thunks.GetItemDetails)
local RoactUtilsModule = require(CorePackages.Workspace.Packages.RoactUtils)
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector
local ItemTypeEnum = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Enums.ItemTypeEnum
local OpenOverlayModule = require(Parent.Actions.OpenOverlay)
local OverlayModule = require(Parent.Enums.Overlay)
local OverlayModule1 = require(Parent.Components.Overlay)
local UseUnifiedEventListenerInExperienceFunction = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).useUnifiedEventListener.useUnifiedEventListenerInExperience
local UseSignalStateFunction = require(CorePackages.Packages.SignalsReact).useSignalState
local FoundationModule = require(CorePackages.Packages.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ThemeModule = require(Modules.Settings.Theme)
local ConstantsModule = require(Modules.TopBar.Constants)
local TutilsModule = require(CorePackages.Packages.tutils)
local EnableAvatarViewportAutoRotation = game:DefineFastFlag("EnableAvatarViewportAutoRotation", false)
local AXViewportCameraFieldOfView = game:DefineFastInt("AXViewportCameraFieldOfView", 68)
local FFlagAXEnableBatchItemDetailsFetchV2 = AvatarExperienceFlagsModule.FFlagAXEnableBatchItemDetailsFetchV2
local FFlagAXEnableInspectAndBuyFocusNavigation = AvatarExperienceFlagsModule.FFlagAXEnableInspectAndBuyFocusNavigation
local FFlagAXEnableIaBTimedOptionsBulkPurchase = AvatarExperienceFlagsModule.FFlagAXEnableIaBTimedOptionsBulkPurchase
local FFlagAXFixIaBTimedOptionsPopoverFocus = AvatarExperienceFlagsModule.FFlagAXFixIaBTimedOptionsPopoverFocus
local ItemSelectionStoreContext = if FFlagAXEnableIaBTimedOptionsBulkPurchase then AvatarExperienceInspectAndBuyModule.Contexts.ItemSelectionStoreContext else nil
local Provider = if ItemSelectionStoreContext then ItemSelectionStoreContext.Provider else nil
local UseItemSelectionStore = if ItemSelectionStoreContext then ItemSelectionStoreContext.useItemSelectionStore else nil

local function v38(p1)
	return p1.assets
end

local function v39(p1)
	return p1.collectibleResellableInstances
end

local function v40(p1)
	return p1.bundles
end

local function InspectAndBuyBaseContainer(p1)
	-- upvalues: UseViewBreakpointsFunction (copy), ConstantsModule (copy), UseTokensFunction (copy), UseDispatchFunction (copy), FFlagAXEnableIaBTimedOptionsBulkPurchase (copy), UseItemSelectionStore (copy), UseSignalStateFunction (copy), UseSelectorFunction (copy), v38 (copy), TutilsModule (copy), v39 (copy), v40 (copy), ReactModule (copy), GuiService (copy), UpdateBulkPuchaseResultsModule (copy), ItemTypeEnum (copy), BuildBulkPurchaseAnalyticsPayloadFunction (copy), GetItemDetailsModule (copy), GetFavoriteForAssetModule (copy), GetProductInfoModule (copy), FFlagAXEnableBatchItemDetailsFetchV2 (copy), GetFavoriteForBundleModule (copy), DeleteFavoriteForAssetModule (copy), CreateFavoriteForAssetModule (copy), DeleteFavoriteForBundleModule (copy), CreateFavoriteForBundleModule (copy), OpenOverlayModule (copy), OverlayModule (copy), PromptPurchaseModule (copy), ApplyTryOnItemToHumanoidDescriptionFunction (copy), AvatarViewportModule (copy), EnableAvatarViewportAutoRotation (copy), AXViewportCameraFieldOfView (copy), UseResponsivePanelLayoutPropsFunction (copy), UseUnifiedEventListenerInExperienceFunction (copy), FFlagAXEnableInspectAndBuyFocusNavigation (copy), UseInspectAndBuyFocusNavigationFunction (copy), FoundationModule (copy), ThemeModule (copy), ResponsivePanelLayout (copy), OverlayModule1 (copy), FFlagAXFixIaBTimedOptionsPopoverFocus (copy), PopoverFocusRestorationContext (copy)
	local UseViewBreakpointsResult = UseViewBreakpointsFunction(ConstantsModule.TopBarHeight)
	local UseTokensResult = UseTokensFunction()
	local UseDispatchResult = UseDispatchFunction()
	local UseItemSelectionStoreResult = if FFlagAXEnableIaBTimedOptionsBulkPurchase then UseItemSelectionStore() else nil
	local UseSignalStateResult = if FFlagAXEnableIaBTimedOptionsBulkPurchase then UseSignalStateFunction(UseItemSelectionStoreResult.getItemDataMap) else nil
	local UseSelectorResult = if FFlagAXEnableIaBTimedOptionsBulkPurchase then UseSelectorFunction(v38, TutilsModule.deepEqual) else nil
	local UseSelectorResult1 = if FFlagAXEnableIaBTimedOptionsBulkPurchase then UseSelectorFunction(v39, TutilsModule.deepEqual) else nil
	local UseSelectorResult2 = if FFlagAXEnableIaBTimedOptionsBulkPurchase then UseSelectorFunction(v40, TutilsModule.deepEqual) else nil
	local UseResponsivePanelLayoutPropsResult = UseResponsivePanelLayoutPropsFunction({
		onInspectMenuClosed = ReactModule.useCallback(function()
			-- upvalues: GuiService (upval)
			GuiService:CloseInspectMenu()
		end, {}),
		onBulkPurchaseFinished = ReactModule.useCallback(function(_, _, p2)
			-- upvalues: UseDispatchResult (copy), UpdateBulkPuchaseResultsModule (upval), FFlagAXEnableIaBTimedOptionsBulkPurchase (upval), UseSignalStateResult (copy), ItemTypeEnum (upval), BuildBulkPurchaseAnalyticsPayloadFunction (upval), UseSelectorResult (copy), UseSelectorResult2 (copy), UseSelectorResult1 (copy), p1 (copy), GetItemDetailsModule (upval)
			UseDispatchResult(UpdateBulkPuchaseResultsModule(p2))
			
			for _, item in p2.Items do
				if item.status == Enum.MarketplaceItemPurchaseStatus.Success then
					if FFlagAXEnableIaBTimedOptionsBulkPurchase and UseSignalStateResult then
						local IsTypeMatch = item.type == Enum.MarketplaceProductType.AvatarAsset
						local Id = item.id
						local Asset = if IsTypeMatch then Enum.AvatarItemType.Asset else Enum.AvatarItemType.Bundle
						local Asset1 = if IsTypeMatch then ItemTypeEnum.Asset else ItemTypeEnum.Bundle
						local BulkPurchaseAnalyticsPayload = BuildBulkPurchaseAnalyticsPayloadFunction({
							itemId = tostring(Id),
							itemType = Asset1,
							assetsMap = UseSelectorResult,
							bundlesMap = UseSelectorResult2,
							collectibleResellableInstances = UseSelectorResult1,
							storedData = UseSignalStateResult[tostring(Id)]
						})
						
						if BulkPurchaseAnalyticsPayload then
							p1.analytics.reportPurchaseSuccessUnifiedEvent(Asset1, Id, BulkPurchaseAnalyticsPayload)
						end
						UseDispatchResult(GetItemDetailsModule(Id, Asset))
					elseif item.type == Enum.MarketplaceProductType.AvatarAsset then
						p1.analytics.reportPurchaseSuccess(ItemTypeEnum.Asset, item.id)
						UseDispatchResult(GetItemDetailsModule(item.id, Enum.AvatarItemType.Asset))
					elseif item.type == Enum.MarketplaceProductType.AvatarBundle then
						p1.analytics.reportPurchaseSuccess(ItemTypeEnum.Bundle, item.id)
						UseDispatchResult(GetItemDetailsModule(item.id, Enum.AvatarItemType.Bundle))
					end
				end
			end
		end, {
			UseDispatchResult,
			if FFlagAXEnableIaBTimedOptionsBulkPurchase then UseSelectorResult else nil,
			if FFlagAXEnableIaBTimedOptionsBulkPurchase then UseSelectorResult2 else nil,
			if FFlagAXEnableIaBTimedOptionsBulkPurchase then UseSelectorResult1 else nil,
			if FFlagAXEnableIaBTimedOptionsBulkPurchase then UseSignalStateResult else nil,
			if FFlagAXEnableIaBTimedOptionsBulkPurchase then p1.analytics.reportPurchaseSuccess else nil,
			if FFlagAXEnableIaBTimedOptionsBulkPurchase then p1.analytics.reportPurchaseSuccessUnifiedEvent else nil
		}),
		onItemDetailsOpened = ReactModule.useCallback(function(p3)
			-- upvalues: ItemTypeEnum (upval), UseDispatchResult (copy), GetFavoriteForAssetModule (upval), GetProductInfoModule (upval), FFlagAXEnableBatchItemDetailsFetchV2 (upval), GetItemDetailsModule (upval), GetFavoriteForBundleModule (upval)
			if p3.itemType == ItemTypeEnum.Asset then
				UseDispatchResult(GetFavoriteForAssetModule(p3.id))
				UseDispatchResult(GetProductInfoModule(p3.id))
				
				if FFlagAXEnableBatchItemDetailsFetchV2 then
					UseDispatchResult(GetItemDetailsModule(p3.id, Enum.AvatarItemType.Asset))
					
					return
				end
			elseif p3.itemType == ItemTypeEnum.Bundle then
				UseDispatchResult(GetFavoriteForBundleModule(p3.id))
			end
		end, { UseDispatchResult }),
		onToggleFavorite = ReactModule.useCallback(function(p3, p4)
			-- upvalues: ItemTypeEnum (upval), UseDispatchResult (copy), DeleteFavoriteForAssetModule (upval), CreateFavoriteForAssetModule (upval), DeleteFavoriteForBundleModule (upval), CreateFavoriteForBundleModule (upval)
			if p3.itemType == ItemTypeEnum.Asset then
				if p4 then
					UseDispatchResult(DeleteFavoriteForAssetModule(p3.id))
					
					return
				else
					UseDispatchResult(CreateFavoriteForAssetModule(p3.id))
					
					return
				end
			elseif p3.itemType == ItemTypeEnum.Bundle then
				if p4 then
					UseDispatchResult(DeleteFavoriteForBundleModule(p3.id))
					
					return
				end
				UseDispatchResult(CreateFavoriteForBundleModule(p3.id))
			end
		end, { UseDispatchResult }),
		openAttributionOverlay = ReactModule.useCallback(function(p3)
			-- upvalues: UseDispatchResult (copy), OpenOverlayModule (upval), OverlayModule (upval)
			UseDispatchResult(OpenOverlayModule(OverlayModule.AttributionTraversal, p3))
		end, { UseDispatchResult }),
		onPromptPurchase = function(p3, p4, p5, p6, p7, p8, p9)
			-- upvalues: UseDispatchResult (copy), PromptPurchaseModule (upval)
			UseDispatchResult(PromptPurchaseModule(p3, p4, p5, p6, p7, p8, p9))
		end,
		renderTryOnViewport = ReactModule.useCallback(function(p3)
			-- upvalues: p1 (copy), ApplyTryOnItemToHumanoidDescriptionFunction (upval), ReactModule (upval), AvatarViewportModule (upval), EnableAvatarViewportAutoRotation (upval), AXViewportCameraFieldOfView (upval)
			if p1.localPlayerModel and p1.localPlayerModel.Humanoid then
				local HumanoidDescription = p1.localPlayerModel.Humanoid.HumanoidDescription:Clone()
				ApplyTryOnItemToHumanoidDescriptionFunction(p3, HumanoidDescription)
				
				return ReactModule.createElement(AvatarViewportModule, {
					visible = true,
					backgroundTransparency = 1,
					resetCameraAndAutoRotationOnModelChange = true,
					size = UDim2.new(1, 0, 1, 0),
					position = UDim2.new(0.5, 0, 0.5, 0),
					humanoidDescription = HumanoidDescription,
					model = p1.localPlayerModel,
					disableAutoRotation = not EnableAvatarViewportAutoRotation,
					offsetOptions = {
						defaultCameraOffset = CFrame.new(0, 0.5, -5),
						toolOffset = CFrame.new(0, 2, -8)
					},
					cameraFieldOfView = AXViewportCameraFieldOfView
				})
			else
				return nil
			end
		end, { p1.localPlayerModel }),
		localPlayerModel = p1.localPlayerModel,
		analytics = p1.analytics
	})
	UseUnifiedEventListenerInExperienceFunction()
	
	if FFlagAXEnableInspectAndBuyFocusNavigation then
		local UseInspectAndBuyFocusNavigationResult = UseInspectAndBuyFocusNavigationFunction()
		local Frame = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ref = UseInspectAndBuyFocusNavigationResult.setFocusRef,
			Size = UDim2.fromScale(1, 1),
			SelectionGroup = UseInspectAndBuyFocusNavigationResult.focusNavigationProps.SelectionGroup,
			SelectionBehaviorDown = UseInspectAndBuyFocusNavigationResult.focusNavigationProps.SelectionBehaviorDown,
			SelectionBehaviorLeft = UseInspectAndBuyFocusNavigationResult.focusNavigationProps.SelectionBehaviorLeft,
			SelectionBehaviorRight = UseInspectAndBuyFocusNavigationResult.focusNavigationProps.SelectionBehaviorRight,
			SelectionBehaviorUp = UseInspectAndBuyFocusNavigationResult.focusNavigationProps.SelectionBehaviorUp
		}, {
			Content = ReactModule.createElement(FoundationModule.View, {
				Size = UseViewBreakpointsResult.OverlaySize,
				Position = UseViewBreakpointsResult.OverlayPosition,
				backgroundStyle = UseTokensResult.Color.Common.Shadow,
				stateLayer = {
					affordance = FoundationModule.Enums.StateLayerAffordance.None
				},
				onActivated = function()
					-- upvalues: GuiService (upval)
					GuiService:CloseInspectMenu()
				end
			}, {
				ContainerView = ReactModule.createElement(FoundationModule.View, {
					ClipsDescendants = true,
					AnchorPoint = UseViewBreakpointsResult.ContainerAnchorPoint,
					Size = UseViewBreakpointsResult.ContainerSize,
					Position = UseViewBreakpointsResult.ContainerPosition,
					backgroundStyle = {
						Color3 = ThemeModule.color("MenuContainer"),
						Transparency = ThemeModule.transparency("MenuContainer", 1) * GuiService.PreferredTransparency
					},
					stateLayer = {
						affordance = FoundationModule.Enums.StateLayerAffordance.None
					},
					onActivated = function() end
				}, {
					UICorner = ReactModule.createElement("UICorner", { CornerRadius = ThemeModule.DefaultCornerRadius }),
					ResponsivePanelLayout = ReactModule.createElement(ResponsivePanelLayout, UseResponsivePanelLayoutPropsResult)
				}),
				Overlay = ReactModule.createElement(OverlayModule1)
			})
		})
		
		return if FFlagAXFixIaBTimedOptionsPopoverFocus then ReactModule.createElement(PopoverFocusRestorationContext.Provider, { value = true }, { InspectAndBuyContent = Frame }) else Frame
	else
		return (ReactModule.createElement(FoundationModule.View, {
			Size = UseViewBreakpointsResult.OverlaySize,
			Position = UseViewBreakpointsResult.OverlayPosition,
			backgroundStyle = UseTokensResult.Color.Common.Shadow,
			stateLayer = {
				affordance = FoundationModule.Enums.StateLayerAffordance.None
			},
			onActivated = function()
				-- upvalues: GuiService (upval)
				GuiService:CloseInspectMenu()
			end
		}, {
			ContainerView = ReactModule.createElement(FoundationModule.View, {
				ClipsDescendants = true,
				AnchorPoint = UseViewBreakpointsResult.ContainerAnchorPoint,
				Size = UseViewBreakpointsResult.ContainerSize,
				Position = UseViewBreakpointsResult.ContainerPosition,
				backgroundStyle = {
					Color3 = ThemeModule.color("MenuContainer"),
					Transparency = ThemeModule.transparency("MenuContainer", 1) * GuiService.PreferredTransparency
				},
				stateLayer = {
					affordance = FoundationModule.Enums.StateLayerAffordance.None
				},
				onActivated = function() end
			}, {
				UICorner = ReactModule.createElement("UICorner", { CornerRadius = ThemeModule.DefaultCornerRadius }),
				ResponsivePanelLayout = ReactModule.createElement(ResponsivePanelLayout, UseResponsivePanelLayoutPropsResult)
			}),
			Overlay = ReactModule.createElement(OverlayModule1)
		}))
	end
end

local function InspectAndBuyBaseContainerWithSignalsProvider(p2)
	-- upvalues: ReactModule (copy), Provider (copy), InspectAndBuyBaseContainer (copy)
	return ReactModule.createElement(Provider, {}, {
		Inner = ReactModule.createElement(InspectAndBuyBaseContainer, p2)
	})
end

return if FFlagAXEnableIaBTimedOptionsBulkPurchase then InspectAndBuyBaseContainerWithSignalsProvider else InspectAndBuyBaseContainer