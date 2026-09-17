local corePackagesService = game:GetService("CorePackages")
local guiService = game:GetService("GuiService")
local coreGuiService = game:GetService("CoreGui")
local parent = script.Parent.Parent
local reactModule = require(corePackagesService.Packages.React)
local avatarExperienceFlagsModule = require(corePackagesService.Workspace.Packages.AvatarExperienceFlags)
local avatarViewportModule = require(parent.Components.AvatarViewport)
local avatarExperienceInspectAndBuyModule = require(corePackagesService.Workspace.Packages.AvatarExperienceInspectAndBuy)
local popoverFocusRestorationContext = require(corePackagesService.Workspace.Packages.AvatarExperienceTimedOptions).PopoverFocusRestorationContext
local useViewBreakpoints = avatarExperienceInspectAndBuyModule.Hooks.useViewBreakpoints
local responsivePanelLayout = avatarExperienceInspectAndBuyModule.Components.ResponsivePanelLayout
local useResponsivePanelLayoutProps = avatarExperienceInspectAndBuyModule.Hooks.useResponsivePanelLayoutProps
local applyTryOnItemToHumanoidDescription = avatarExperienceInspectAndBuyModule.Utils.applyTryOnItemToHumanoidDescription
local useInspectAndBuyFocusNavigation = avatarExperienceInspectAndBuyModule.Hooks.useInspectAndBuyFocusNavigation
local buildBulkPurchaseAnalyticsPayload = avatarExperienceInspectAndBuyModule.Utils.buildBulkPurchaseAnalyticsPayload
local updateBulkPuchaseResultsModule = require(parent.Actions.UpdateBulkPuchaseResults)
local getProductInfoModule = require(parent.Thunks.GetProductInfo)
local getFavoriteForAssetModule = require(parent.Thunks.GetFavoriteForAsset)
local getFavoriteForBundleModule = require(parent.Thunks.GetFavoriteForBundle)
local createFavoriteForAssetModule = require(parent.Thunks.CreateFavoriteForAsset)
local deleteFavoriteForAssetModule = require(parent.Thunks.DeleteFavoriteForAsset)
local createFavoriteForBundleModule = require(parent.Thunks.CreateFavoriteForBundle)
local deleteFavoriteForBundleModule = require(parent.Thunks.DeleteFavoriteForBundle)
local promptPurchaseModule = require(parent.Thunks.PromptPurchase)
local getItemDetailsModule = require(parent.Thunks.GetItemDetails)
local roactUtilsModule = require(corePackagesService.Workspace.Packages.RoactUtils)
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local useSelector = roactUtilsModule.Hooks.RoactRodux.useSelector
local itemTypeEnum = require(corePackagesService.Workspace.Packages.AvatarExperienceModel).Enums.ItemTypeEnum
local openOverlayModule = require(parent.Actions.OpenOverlay)
local overlayModule = require(parent.Enums.Overlay)
local overlayModule_1 = require(parent.Components.Overlay)
local useUnifiedEventListenerInExperience = require(corePackagesService.Workspace.Packages.AvatarExperienceAnalytics).useUnifiedEventListener.useUnifiedEventListenerInExperience
local useSignalState = require(corePackagesService.Packages.SignalsReact).useSignalState
local foundationModule = require(corePackagesService.Packages.Foundation)
local useTokens = foundationModule.Hooks.useTokens
local modules = coreGuiService.RobloxGui.Modules
local themeModule = require(modules.Settings.Theme)
local constantsModule = require(modules.TopBar.Constants)
local tutilsModule = require(corePackagesService.Packages.tutils)
local enableAvatarViewportAutoRotation = game:DefineFastFlag("EnableAvatarViewportAutoRotation", false)
local AXViewportCameraFieldOfView = game:DefineFastInt("AXViewportCameraFieldOfView", 68)
local fFlagAXEnableBatchItemDetailsFetchV2 = avatarExperienceFlagsModule.FFlagAXEnableBatchItemDetailsFetchV2
local fFlagAXEnableInspectAndBuyFocusNavigation = avatarExperienceFlagsModule.FFlagAXEnableInspectAndBuyFocusNavigation
local itemSelectionStoreContext = avatarExperienceInspectAndBuyModule.Contexts.ItemSelectionStoreContext
local provider = itemSelectionStoreContext.Provider
local useItemSelectionStore = itemSelectionStoreContext.useItemSelectionStore

local var1 = function(p1)
	return p1.assets
end

local var2 = function(p1)
	return p1.collectibleResellableInstances
end

local var3 = function(p1)
	return p1.bundles
end

local function InspectAndBuyBaseContainer(p1)
	-- upvalues: useViewBreakpoints (ref), constantsModule (ref), useTokens (ref), useDispatch (ref), useItemSelectionStore (ref), useSignalState (ref), useSelector (ref), var1 (ref), tutilsModule (ref), var2 (ref), var3 (ref), reactModule (ref), guiService (ref), updateBulkPuchaseResultsModule (ref), itemTypeEnum (ref), buildBulkPurchaseAnalyticsPayload (ref), getItemDetailsModule (ref), getFavoriteForAssetModule (ref), getProductInfoModule (ref), fFlagAXEnableBatchItemDetailsFetchV2 (ref), getFavoriteForBundleModule (ref), deleteFavoriteForAssetModule (ref), createFavoriteForAssetModule (ref), deleteFavoriteForBundleModule (ref), createFavoriteForBundleModule (ref), openOverlayModule (ref), overlayModule (ref), promptPurchaseModule (ref), applyTryOnItemToHumanoidDescription (ref), avatarViewportModule (ref), enableAvatarViewportAutoRotation (ref), AXViewportCameraFieldOfView (ref), useResponsivePanelLayoutProps (ref), useUnifiedEventListenerInExperience (ref), fFlagAXEnableInspectAndBuyFocusNavigation (ref), useInspectAndBuyFocusNavigation (ref), foundationModule (ref), themeModule (ref), responsivePanelLayout (ref), overlayModule_1 (ref), popoverFocusRestorationContext (ref)
	local var4 = useViewBreakpoints(constantsModule.TopBarHeight)
	local var5 = useTokens()
	local var6 = useDispatch()
	local var7 = useSignalState(useItemSelectionStore().getItemDataMap)
	local var8 = useSelector(var1, tutilsModule.deepEqual)
	local var9 = useSelector(var2, tutilsModule.deepEqual)
	local var10 = useSelector(var3, tutilsModule.deepEqual)
	local var11 = useResponsivePanelLayoutProps({
		onInspectMenuClosed = reactModule.useCallback(function()
			-- upvalues: guiService (copy)
			guiService:CloseInspectMenu()
		end, {}),
		onBulkPurchaseFinished = reactModule.useCallback(function(_, _, p2)
			-- upvalues: var6 (ref), updateBulkPuchaseResultsModule (copy), itemTypeEnum (copy), var7 (ref), buildBulkPurchaseAnalyticsPayload (copy), var8 (ref), var10 (ref), var9 (ref), p1 (ref), getItemDetailsModule (copy)
			var6(updateBulkPuchaseResultsModule(p2))
			
			for i, v in p2.Items do
				if v.status == Enum.MarketplaceItemPurchaseStatus.Success then
					local var12 = v.type == Enum.MarketplaceProductType.AvatarAsset
					local id = v.id
					local var13 = if var12 then Enum.AvatarItemType.Asset else Enum.AvatarItemType.Bundle
					local var14 = if var12 then itemTypeEnum.Asset else itemTypeEnum.Bundle
					local var15 = buildBulkPurchaseAnalyticsPayload({
						itemId = tostring(id),
						itemType = var14,
						assetsMap = var8,
						bundlesMap = var10,
						collectibleResellableInstances = var9,
						storedData = var7[tostring(id)]
					})
					
					if var15 then
						p1.analytics.reportPurchaseSuccessUnifiedEvent(var14, id, var15)
					end
					var6(getItemDetailsModule(id, var13))
				end
			end
		end, {
			var6, var8, var10, var9, var7,
			p1.analytics.reportPurchaseSuccessUnifiedEvent
		}),
		onItemDetailsOpened = reactModule.useCallback(function(p3)
			-- upvalues: itemTypeEnum (copy), var6 (ref), getFavoriteForAssetModule (copy), getProductInfoModule (copy), fFlagAXEnableBatchItemDetailsFetchV2 (copy), getItemDetailsModule (copy), getFavoriteForBundleModule (copy)
			if p3.itemType == itemTypeEnum.Asset then
				var6(getFavoriteForAssetModule(p3.id))
				var6(getProductInfoModule(p3.id))
				
				if fFlagAXEnableBatchItemDetailsFetchV2 then
					var6(getItemDetailsModule(p3.id, Enum.AvatarItemType.Asset))
					
					return
				end
			elseif p3.itemType == itemTypeEnum.Bundle then
				var6(getFavoriteForBundleModule(p3.id))
			end
		end, { var6 }),
		onToggleFavorite = reactModule.useCallback(function(p3, p4)
			-- upvalues: itemTypeEnum (copy), var6 (ref), deleteFavoriteForAssetModule (copy), createFavoriteForAssetModule (copy), deleteFavoriteForBundleModule (copy), createFavoriteForBundleModule (copy)
			if p3.itemType == itemTypeEnum.Asset then
				if p4 then
					var6(deleteFavoriteForAssetModule(p3.id))
					
					return
				end
				var6(createFavoriteForAssetModule(p3.id))
				
				return
			elseif p3.itemType == itemTypeEnum.Bundle then
				if p4 then
					var6(deleteFavoriteForBundleModule(p3.id))
					
					return
				end
				var6(createFavoriteForBundleModule(p3.id))
			end
		end, { var6 }),
		openAttributionOverlay = reactModule.useCallback(function(p3)
			-- upvalues: var6 (ref), openOverlayModule (copy), overlayModule (copy)
			var6(openOverlayModule(overlayModule.AttributionTraversal, p3))
		end, { var6 }),
		onPromptPurchase = function(p3, p4, p5, p6, p7, p8, p9)
			-- upvalues: var6 (ref), promptPurchaseModule (copy)
			var6(promptPurchaseModule(p3, p4, p5, p6, p7, p8, p9))
		end,
		renderTryOnViewport = reactModule.useCallback(function(p3)
			-- upvalues: p1 (ref), applyTryOnItemToHumanoidDescription (copy), reactModule (copy), avatarViewportModule (copy), enableAvatarViewportAutoRotation (copy), AXViewportCameraFieldOfView (copy)
			if p1.localPlayerModel and p1.localPlayerModel.Humanoid then
				local var16 = p1.localPlayerModel.Humanoid.HumanoidDescription:Clone()
				applyTryOnItemToHumanoidDescription(p3, var16)
				
				return reactModule.createElement(avatarViewportModule, {
					visible = true,
					backgroundTransparency = 1,
					resetCameraAndAutoRotationOnModelChange = true,
					size = UDim2.new(1, 0, 1, 0),
					position = UDim2.new(0.5, 0, 0.5, 0),
					humanoidDescription = var16,
					model = p1.localPlayerModel,
					disableAutoRotation = not enableAvatarViewportAutoRotation,
					offsetOptions = {
						defaultCameraOffset = CFrame.new(0, 0.5, -5),
						toolOffset = CFrame.new(0, 2, -8)
					},
					cameraFieldOfView = AXViewportCameraFieldOfView
				})
			end
			return nil
		end, { p1.localPlayerModel }),
		localPlayerModel = p1.localPlayerModel,
		analytics = p1.analytics
	})
	useUnifiedEventListenerInExperience()
	
	if fFlagAXEnableInspectAndBuyFocusNavigation then
		local var16 = useInspectAndBuyFocusNavigation()
		
		return reactModule.createElement(popoverFocusRestorationContext.Provider, { value = true }, {
			InspectAndBuyContent = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ref = var16.setFocusRef,
				Size = UDim2.fromScale(1, 1),
				SelectionGroup = var16.focusNavigationProps.SelectionGroup,
				SelectionBehaviorDown = var16.focusNavigationProps.SelectionBehaviorDown,
				SelectionBehaviorLeft = var16.focusNavigationProps.SelectionBehaviorLeft,
				SelectionBehaviorRight = var16.focusNavigationProps.SelectionBehaviorRight,
				SelectionBehaviorUp = var16.focusNavigationProps.SelectionBehaviorUp
			}, {
				Content = reactModule.createElement(foundationModule.View, {
					Size = var4.OverlaySize,
					Position = var4.OverlayPosition,
					backgroundStyle = var5.Color.Common.Shadow,
					stateLayer = {
						affordance = foundationModule.Enums.StateLayerAffordance.None
					},
					onActivated = function()
						-- upvalues: guiService (copy)
						guiService:CloseInspectMenu()
					end
				}, {
					ContainerView = reactModule.createElement(foundationModule.View, {
						ClipsDescendants = true,
						AnchorPoint = var4.ContainerAnchorPoint,
						Size = var4.ContainerSize,
						Position = var4.ContainerPosition,
						backgroundStyle = {
							Color3 = themeModule.color("MenuContainer"),
							Transparency = themeModule.transparency("MenuContainer", 1) * guiService.PreferredTransparency
						},
						stateLayer = {
							affordance = foundationModule.Enums.StateLayerAffordance.None
						},
						onActivated = function() end
					}, {
						UICorner = reactModule.createElement("UICorner", { CornerRadius = themeModule.DefaultCornerRadius }),
						ResponsivePanelLayout = reactModule.createElement(responsivePanelLayout, var11)
					}),
					Overlay = reactModule.createElement(overlayModule_1)
				})
			})
		})
	end
	return reactModule.createElement(foundationModule.View, {
		Size = var4.OverlaySize,
		Position = var4.OverlayPosition,
		backgroundStyle = var5.Color.Common.Shadow,
		stateLayer = {
			affordance = foundationModule.Enums.StateLayerAffordance.None
		},
		onActivated = function()
			-- upvalues: guiService (copy)
			guiService:CloseInspectMenu()
		end
	}, {
		ContainerView = reactModule.createElement(foundationModule.View, {
			ClipsDescendants = true,
			AnchorPoint = var4.ContainerAnchorPoint,
			Size = var4.ContainerSize,
			Position = var4.ContainerPosition,
			backgroundStyle = {
				Color3 = themeModule.color("MenuContainer"),
				Transparency = themeModule.transparency("MenuContainer", 1) * guiService.PreferredTransparency
			},
			stateLayer = {
				affordance = foundationModule.Enums.StateLayerAffordance.None
			},
			onActivated = function() end
		}, {
			UICorner = reactModule.createElement("UICorner", { CornerRadius = themeModule.DefaultCornerRadius }),
			ResponsivePanelLayout = reactModule.createElement(responsivePanelLayout, var11)
		}),
		Overlay = reactModule.createElement(overlayModule_1)
	})
end

return function(value)
	-- upvalues: reactModule (ref), provider (ref), InspectAndBuyBaseContainer (ref)
	return reactModule.createElement(provider, {}, {
		Inner = reactModule.createElement(InspectAndBuyBaseContainer, value)
	})
end