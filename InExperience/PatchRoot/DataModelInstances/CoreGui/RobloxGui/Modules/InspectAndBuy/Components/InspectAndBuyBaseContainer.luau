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
local ItemTypeEnum = require(CorePackages.Workspace.Packages.AvatarExperienceModel).Enums.ItemTypeEnum
local OpenOverlayModule = require(Parent.Actions.OpenOverlay)
local OverlayModule = require(Parent.Enums.Overlay)
local OverlayModule1 = require(Parent.Components.Overlay)
local UseUnifiedEventListenerInExperienceFunction = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).useUnifiedEventListener.useUnifiedEventListenerInExperience
local SignalsModule = require(CorePackages.Packages.Signals)
local UseSignalStateFunction = require(CorePackages.Packages.SignalsReact).useSignalState
local AvatarBackgroundModule = require(CorePackages.Workspace.Packages.DataHydration.AvatarBackground)
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
local FFlagAXInspectAndBuyAvatarBackground = AvatarExperienceFlagsModule.FFlagAXInspectAndBuyAvatarBackground
local ItemSelectionStoreContext = AvatarExperienceInspectAndBuyModule.Contexts.ItemSelectionStoreContext
local Provider = ItemSelectionStoreContext.Provider
local UseItemSelectionStoreFunction = ItemSelectionStoreContext.useItemSelectionStore

local function v38(p1)
	return p1.assets
end

local function v39(p1)
	return p1.collectibleResellableInstances
end

local function v40(p1)
	return p1.bundles
end

local function useAvatarBackgroundImageUrl(PlayerId)
	-- upvalues: ReactModule (copy), AvatarBackgroundModule (copy), SignalsModule (copy), UseSignalStateFunction (copy)
	return UseSignalStateFunction((ReactModule.useMemo(function()
		-- upvalues: PlayerId (copy), AvatarBackgroundModule (upval), SignalsModule (upval)
		local AndFetchAvatarBackground = if PlayerId == nil then nil else AvatarBackgroundModule.getAvatarBackgroundStore(false).getAndFetchAvatarBackground(PlayerId)
		
		return SignalsModule.createComputed(function(p1)
			-- upvalues: AndFetchAvatarBackground (copy), AvatarBackgroundModule (upval)
			local DataResult = AndFetchAvatarBackground and AndFetchAvatarBackground.data(p1)
			local AssetId = DataResult and DataResult.assetId
			
			return if AssetId then AvatarBackgroundModule.getAvatarBackgroundImageUrl(AssetId) else nil
		end)
	end, { PlayerId })))
end

local function InspectAndBuyBaseContainer(p1)
	-- upvalues: UseViewBreakpointsFunction (copy), ConstantsModule (copy), UseTokensFunction (copy), UseDispatchFunction (copy), UseItemSelectionStoreFunction (copy), UseSignalStateFunction (copy), UseSelectorFunction (copy), v38 (copy), TutilsModule (copy), v39 (copy), v40 (copy), FFlagAXInspectAndBuyAvatarBackground (copy), useAvatarBackgroundImageUrl (copy), ReactModule (copy), GuiService (copy), UpdateBulkPuchaseResultsModule (copy), ItemTypeEnum (copy), BuildBulkPurchaseAnalyticsPayloadFunction (copy), GetItemDetailsModule (copy), GetFavoriteForAssetModule (copy), GetProductInfoModule (copy), FFlagAXEnableBatchItemDetailsFetchV2 (copy), GetFavoriteForBundleModule (copy), DeleteFavoriteForAssetModule (copy), CreateFavoriteForAssetModule (copy), DeleteFavoriteForBundleModule (copy), CreateFavoriteForBundleModule (copy), OpenOverlayModule (copy), OverlayModule (copy), PromptPurchaseModule (copy), ApplyTryOnItemToHumanoidDescriptionFunction (copy), AvatarViewportModule (copy), EnableAvatarViewportAutoRotation (copy), AXViewportCameraFieldOfView (copy), UseResponsivePanelLayoutPropsFunction (copy), UseUnifiedEventListenerInExperienceFunction (copy), FFlagAXEnableInspectAndBuyFocusNavigation (copy), UseInspectAndBuyFocusNavigationFunction (copy), FoundationModule (copy), ThemeModule (copy), ResponsivePanelLayout (copy), OverlayModule1 (copy), PopoverFocusRestorationContext (copy)
	local UseViewBreakpointsResult = UseViewBreakpointsFunction(ConstantsModule.TopBarHeight)
	local UseTokensResult = UseTokensFunction()
	local UseDispatchResult = UseDispatchFunction()
	local UseSignalStateResult = UseSignalStateFunction(UseItemSelectionStoreFunction().getItemDataMap)
	local UseSelectorResult = UseSelectorFunction(v38, TutilsModule.deepEqual)
	local UseSelectorResult1 = UseSelectorFunction(v39, TutilsModule.deepEqual)
	local UseSelectorResult2 = UseSelectorFunction(v40, TutilsModule.deepEqual)
	local UseResponsivePanelLayoutPropsResult = UseResponsivePanelLayoutPropsFunction({
		onInspectMenuClosed = ReactModule.useCallback(function()
			-- upvalues: GuiService (upval)
			GuiService:CloseInspectMenu()
		end, {}),
		onBulkPurchaseFinished = ReactModule.useCallback(function(_, _, p2)
			-- upvalues: UseDispatchResult (copy), UpdateBulkPuchaseResultsModule (upval), ItemTypeEnum (upval), UseSignalStateResult (copy), BuildBulkPurchaseAnalyticsPayloadFunction (upval), UseSelectorResult (copy), UseSelectorResult2 (copy), UseSelectorResult1 (copy), p1 (copy), GetItemDetailsModule (upval)
			UseDispatchResult(UpdateBulkPuchaseResultsModule(p2))
			
			for _, item in p2.Items do
				if item.status == Enum.MarketplaceItemPurchaseStatus.Success then
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
				end
			end
		end, {
			UseDispatchResult, UseSelectorResult, UseSelectorResult2, UseSelectorResult1,
			UseSignalStateResult, p1.analytics.reportPurchaseSuccessUnifiedEvent
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
		analytics = p1.analytics,
		avatarBackgroundImageUrl = if FFlagAXInspectAndBuyAvatarBackground then useAvatarBackgroundImageUrl(p1.playerId) else nil
	})
	UseUnifiedEventListenerInExperienceFunction()
	
	if FFlagAXEnableInspectAndBuyFocusNavigation then
		local UseInspectAndBuyFocusNavigationResult = UseInspectAndBuyFocusNavigationFunction()
		
		return (ReactModule.createElement(PopoverFocusRestorationContext.Provider, { value = true }, {
			InspectAndBuyContent = ReactModule.createElement("Frame", {
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
		}))
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

return function(p2)
	-- upvalues: ReactModule (copy), Provider (copy), InspectAndBuyBaseContainer (copy)
	return ReactModule.createElement(Provider, {}, {
		Inner = ReactModule.createElement(InspectAndBuyBaseContainer, p2)
	})
end