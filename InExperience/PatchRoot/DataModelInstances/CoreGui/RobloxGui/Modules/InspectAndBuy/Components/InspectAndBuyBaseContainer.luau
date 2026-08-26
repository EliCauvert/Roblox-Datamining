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
local itemTypeEnum = require(corePackagesService.Workspace.Packages.AvatarExperienceCommon).Enums.ItemTypeEnum
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
local fFlagAXEnableIaBTimedOptionsBulkPurchase = avatarExperienceFlagsModule.FFlagAXEnableIaBTimedOptionsBulkPurchase
local fFlagAXFixIaBTimedOptionsPopoverFocus = avatarExperienceFlagsModule.FFlagAXFixIaBTimedOptionsPopoverFocus
local var1 = if fFlagAXEnableIaBTimedOptionsBulkPurchase then avatarExperienceInspectAndBuyModule.Contexts.ItemSelectionStoreContext else nil
local var2 = if var1 then var1.Provider else nil
local var3 = if var1 then var1.useItemSelectionStore else nil

local var4 = function(p1)
	return p1.assets
end

local var5 = function(p1)
	return p1.collectibleResellableInstances
end

local var6 = function(p1)
	return p1.bundles
end

local function InspectAndBuyBaseContainer(p1)
	-- upvalues: useViewBreakpoints (ref), constantsModule (ref), useTokens (ref), useDispatch (ref), fFlagAXEnableIaBTimedOptionsBulkPurchase (ref), var3 (ref), useSignalState (ref), useSelector (ref), var4 (ref), tutilsModule (ref), var5 (ref), var6 (ref), reactModule (ref), guiService (ref), updateBulkPuchaseResultsModule (ref), itemTypeEnum (ref), buildBulkPurchaseAnalyticsPayload (ref), getItemDetailsModule (ref), getFavoriteForAssetModule (ref), getProductInfoModule (ref), fFlagAXEnableBatchItemDetailsFetchV2 (ref), getFavoriteForBundleModule (ref), deleteFavoriteForAssetModule (ref), createFavoriteForAssetModule (ref), deleteFavoriteForBundleModule (ref), createFavoriteForBundleModule (ref), openOverlayModule (ref), overlayModule (ref), promptPurchaseModule (ref), applyTryOnItemToHumanoidDescription (ref), avatarViewportModule (ref), enableAvatarViewportAutoRotation (ref), AXViewportCameraFieldOfView (ref), useResponsivePanelLayoutProps (ref), useUnifiedEventListenerInExperience (ref), fFlagAXEnableInspectAndBuyFocusNavigation (ref), useInspectAndBuyFocusNavigation (ref), foundationModule (ref), themeModule (ref), responsivePanelLayout (ref), overlayModule_1 (ref), fFlagAXFixIaBTimedOptionsPopoverFocus (ref), popoverFocusRestorationContext (ref)
	local var7 = useViewBreakpoints(constantsModule.TopBarHeight)
	local var8 = useTokens()
	local var9 = useDispatch()
	local var10 = if fFlagAXEnableIaBTimedOptionsBulkPurchase then useSignalState((if fFlagAXEnableIaBTimedOptionsBulkPurchase then var3() else nil).getItemDataMap) else nil
	local var11 = if fFlagAXEnableIaBTimedOptionsBulkPurchase then useSelector(var4, tutilsModule.deepEqual) else nil
	local var12 = if fFlagAXEnableIaBTimedOptionsBulkPurchase then useSelector(var5, tutilsModule.deepEqual) else nil
	local var13 = if fFlagAXEnableIaBTimedOptionsBulkPurchase then useSelector(var6, tutilsModule.deepEqual) else nil
	local var14 = useResponsivePanelLayoutProps({
		onInspectMenuClosed = reactModule.useCallback(function()
			-- upvalues: guiService (copy)
			guiService:CloseInspectMenu()
		end, {}),
		onBulkPurchaseFinished = reactModule.useCallback(function(_, _, p2)
			-- upvalues: var9 (ref), updateBulkPuchaseResultsModule (copy), fFlagAXEnableIaBTimedOptionsBulkPurchase (copy), var10 (ref), itemTypeEnum (copy), buildBulkPurchaseAnalyticsPayload (copy), var11 (ref), var13 (ref), var12 (ref), p1 (ref), getItemDetailsModule (copy)
			var9(updateBulkPuchaseResultsModule(p2))
			
			for i, v in p2.Items do
				if v.status == Enum.MarketplaceItemPurchaseStatus.Success then
					if fFlagAXEnableIaBTimedOptionsBulkPurchase and var10 then
						local var15 = v.type == Enum.MarketplaceProductType.AvatarAsset
						local id = v.id
						local var16 = if var15 then Enum.AvatarItemType.Asset else Enum.AvatarItemType.Bundle
						local var17 = if var15 then itemTypeEnum.Asset else itemTypeEnum.Bundle
						local var18 = buildBulkPurchaseAnalyticsPayload({
							itemId = tostring(id),
							itemType = var17,
							assetsMap = var11,
							bundlesMap = var13,
							collectibleResellableInstances = var12,
							storedData = var10[tostring(id)]
						})
						
						if var18 then
							p1.analytics.reportPurchaseSuccessUnifiedEvent(var17, id, var18)
						end
						var9(getItemDetailsModule(id, var16))
					elseif v.type == Enum.MarketplaceProductType.AvatarAsset then
						p1.analytics.reportPurchaseSuccess(itemTypeEnum.Asset, v.id)
						var9(getItemDetailsModule(v.id, Enum.AvatarItemType.Asset))
					elseif v.type == Enum.MarketplaceProductType.AvatarBundle then
						p1.analytics.reportPurchaseSuccess(itemTypeEnum.Bundle, v.id)
						var9(getItemDetailsModule(v.id, Enum.AvatarItemType.Bundle))
					end
				end
			end
		end, {
			var9, if fFlagAXEnableIaBTimedOptionsBulkPurchase then var11 else nil,
			if fFlagAXEnableIaBTimedOptionsBulkPurchase then var13 else nil,
			if fFlagAXEnableIaBTimedOptionsBulkPurchase then var12 else nil,
			if fFlagAXEnableIaBTimedOptionsBulkPurchase then var10 else nil,
			if fFlagAXEnableIaBTimedOptionsBulkPurchase then p1.analytics.reportPurchaseSuccess else nil,
			if fFlagAXEnableIaBTimedOptionsBulkPurchase then p1.analytics.reportPurchaseSuccessUnifiedEvent else nil
		}),
		onItemDetailsOpened = reactModule.useCallback(function(p3)
			-- upvalues: itemTypeEnum (copy), var9 (ref), getFavoriteForAssetModule (copy), getProductInfoModule (copy), fFlagAXEnableBatchItemDetailsFetchV2 (copy), getItemDetailsModule (copy), getFavoriteForBundleModule (copy)
			if p3.itemType == itemTypeEnum.Asset then
				var9(getFavoriteForAssetModule(p3.id))
				var9(getProductInfoModule(p3.id))
				
				if fFlagAXEnableBatchItemDetailsFetchV2 then
					var9(getItemDetailsModule(p3.id, Enum.AvatarItemType.Asset))
					
					return
				end
			elseif p3.itemType == itemTypeEnum.Bundle then
				var9(getFavoriteForBundleModule(p3.id))
			end
		end, { var9 }),
		onToggleFavorite = reactModule.useCallback(function(p3, p4)
			-- upvalues: itemTypeEnum (copy), var9 (ref), deleteFavoriteForAssetModule (copy), createFavoriteForAssetModule (copy), deleteFavoriteForBundleModule (copy), createFavoriteForBundleModule (copy)
			if p3.itemType == itemTypeEnum.Asset then
				if p4 then
					var9(deleteFavoriteForAssetModule(p3.id))
					
					return
				end
				var9(createFavoriteForAssetModule(p3.id))
				
				return
			elseif p3.itemType == itemTypeEnum.Bundle then
				if p4 then
					var9(deleteFavoriteForBundleModule(p3.id))
					
					return
				end
				var9(createFavoriteForBundleModule(p3.id))
			end
		end, { var9 }),
		openAttributionOverlay = reactModule.useCallback(function(p3)
			-- upvalues: var9 (ref), openOverlayModule (copy), overlayModule (copy)
			var9(openOverlayModule(overlayModule.AttributionTraversal, p3))
		end, { var9 }),
		onPromptPurchase = function(p3, p4, p5, p6, p7, p8, p9)
			-- upvalues: var9 (ref), promptPurchaseModule (copy)
			var9(promptPurchaseModule(p3, p4, p5, p6, p7, p8, p9))
		end,
		renderTryOnViewport = reactModule.useCallback(function(p3)
			-- upvalues: p1 (ref), applyTryOnItemToHumanoidDescription (copy), reactModule (copy), avatarViewportModule (copy), enableAvatarViewportAutoRotation (copy), AXViewportCameraFieldOfView (copy)
			if p1.localPlayerModel and p1.localPlayerModel.Humanoid then
				local var19 = p1.localPlayerModel.Humanoid.HumanoidDescription:Clone()
				applyTryOnItemToHumanoidDescription(p3, var19)
				
				return reactModule.createElement(avatarViewportModule, {
					visible = true,
					backgroundTransparency = 1,
					resetCameraAndAutoRotationOnModelChange = true,
					size = UDim2.new(1, 0, 1, 0),
					position = UDim2.new(0.5, 0, 0.5, 0),
					humanoidDescription = var19,
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
	
	if not fFlagAXEnableInspectAndBuyFocusNavigation then
		return reactModule.createElement(foundationModule.View, {
			Size = var7.OverlaySize,
			Position = var7.OverlayPosition,
			backgroundStyle = var8.Color.Common.Shadow,
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
				AnchorPoint = var7.ContainerAnchorPoint,
				Size = var7.ContainerSize,
				Position = var7.ContainerPosition,
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
				ResponsivePanelLayout = reactModule.createElement(responsivePanelLayout, var14)
			}),
			Overlay = reactModule.createElement(overlayModule_1)
		})
	end
	local var19 = useInspectAndBuyFocusNavigation()
	local frame = reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ref = var19.setFocusRef,
		Size = UDim2.fromScale(1, 1),
		SelectionGroup = var19.focusNavigationProps.SelectionGroup,
		SelectionBehaviorDown = var19.focusNavigationProps.SelectionBehaviorDown,
		SelectionBehaviorLeft = var19.focusNavigationProps.SelectionBehaviorLeft,
		SelectionBehaviorRight = var19.focusNavigationProps.SelectionBehaviorRight,
		SelectionBehaviorUp = var19.focusNavigationProps.SelectionBehaviorUp
	}, {
		Content = reactModule.createElement(foundationModule.View, {
			Size = var7.OverlaySize,
			Position = var7.OverlayPosition,
			backgroundStyle = var8.Color.Common.Shadow,
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
				AnchorPoint = var7.ContainerAnchorPoint,
				Size = var7.ContainerSize,
				Position = var7.ContainerPosition,
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
				ResponsivePanelLayout = reactModule.createElement(responsivePanelLayout, var14)
			}),
			Overlay = reactModule.createElement(overlayModule_1)
		})
	})
	
	return if fFlagAXFixIaBTimedOptionsPopoverFocus then reactModule.createElement(popoverFocusRestorationContext.Provider, { value = true }, { InspectAndBuyContent = frame }) else frame
end

return if fFlagAXEnableIaBTimedOptionsBulkPurchase then function(value)
	-- upvalues: reactModule (ref), var2 (ref), InspectAndBuyBaseContainer (ref)
	return reactModule.createElement(var2, {}, {
		Inner = reactModule.createElement(InspectAndBuyBaseContainer, value)
	})
end else InspectAndBuyBaseContainer