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
local var27 = if fFlagAXEnableIaBTimedOptionsBulkPurchase then avatarExperienceInspectAndBuyModule.Contexts.ItemSelectionStoreContext else nil
local var28 = if var27 then var27.Provider else nil
local var29 = if var27 then var27.useItemSelectionStore else nil

local var30 = function(p0)
	return p0.assets
end

local var31 = function(p1)
	return p1.collectibleResellableInstances
end

local var32 = function(p2)
	return p2.bundles
end

local function InspectAndBuyBaseContainer(p3)
	-- upvalues: useViewBreakpoints (ref), constantsModule (ref), useTokens (ref), useDispatch (ref), fFlagAXEnableIaBTimedOptionsBulkPurchase (ref), var29 (ref), useSignalState (ref), useSelector (ref), var30 (ref), tutilsModule (ref), var31 (ref), var32 (ref), reactModule (ref), guiService (ref), updateBulkPuchaseResultsModule (ref), itemTypeEnum (ref), buildBulkPurchaseAnalyticsPayload (ref), getItemDetailsModule (ref), getFavoriteForAssetModule (ref), getProductInfoModule (ref), fFlagAXEnableBatchItemDetailsFetchV2 (ref), getFavoriteForBundleModule (ref), deleteFavoriteForAssetModule (ref), createFavoriteForAssetModule (ref), deleteFavoriteForBundleModule (ref), createFavoriteForBundleModule (ref), openOverlayModule (ref), overlayModule (ref), promptPurchaseModule (ref), applyTryOnItemToHumanoidDescription (ref), avatarViewportModule (ref), enableAvatarViewportAutoRotation (ref), AXViewportCameraFieldOfView (ref), useResponsivePanelLayoutProps (ref), useUnifiedEventListenerInExperience (ref), fFlagAXEnableInspectAndBuyFocusNavigation (ref), useInspectAndBuyFocusNavigation (ref), foundationModule (ref), themeModule (ref), responsivePanelLayout (ref), overlayModule_1 (ref), fFlagAXFixIaBTimedOptionsPopoverFocus (ref), popoverFocusRestorationContext (ref)
	local var34 = useViewBreakpoints(constantsModule.TopBarHeight)
	local var35 = useTokens()
	local var36 = useDispatch()
	local var37 = if fFlagAXEnableIaBTimedOptionsBulkPurchase then useSignalState((if fFlagAXEnableIaBTimedOptionsBulkPurchase then var29() else nil).getItemDataMap) else nil
	local var38 = if fFlagAXEnableIaBTimedOptionsBulkPurchase then useSelector(var30, tutilsModule.deepEqual) else nil
	local var39 = if fFlagAXEnableIaBTimedOptionsBulkPurchase then useSelector(var31, tutilsModule.deepEqual) else nil
	local var40 = if fFlagAXEnableIaBTimedOptionsBulkPurchase then useSelector(var32, tutilsModule.deepEqual) else nil
	local var41 = useResponsivePanelLayoutProps({
		onInspectMenuClosed = reactModule.useCallback(function()
			-- upvalues: guiService (copy)
			guiService:CloseInspectMenu()
		end, {}),
		onBulkPurchaseFinished = reactModule.useCallback(function(_, _, p4)
			-- upvalues: var36 (ref), updateBulkPuchaseResultsModule (copy), fFlagAXEnableIaBTimedOptionsBulkPurchase (copy), var37 (ref), itemTypeEnum (copy), buildBulkPurchaseAnalyticsPayload (copy), var38 (ref), var40 (ref), var39 (ref), p3 (ref), getItemDetailsModule (copy)
			var36(updateBulkPuchaseResultsModule(p4))
			
			for i, v in p4.Items do
				if v.status == Enum.MarketplaceItemPurchaseStatus.Success then
					if fFlagAXEnableIaBTimedOptionsBulkPurchase and var37 then
						local var44 = v.type == Enum.MarketplaceProductType.AvatarAsset
						local id = v.id
						local var45 = if var44 then Enum.AvatarItemType.Asset else Enum.AvatarItemType.Bundle
						local var46 = if var44 then itemTypeEnum.Asset else itemTypeEnum.Bundle
						local var47 = buildBulkPurchaseAnalyticsPayload({
							itemId = tostring(id),
							itemType = var46,
							assetsMap = var38,
							bundlesMap = var40,
							collectibleResellableInstances = var39,
							storedData = var37[tostring(id)]
						})
						
						if var47 then
							p3.analytics.reportPurchaseSuccessUnifiedEvent(var46, id, var47)
						end
						var36(getItemDetailsModule(id, var45))
					elseif v.type == Enum.MarketplaceProductType.AvatarAsset then
						p3.analytics.reportPurchaseSuccess(itemTypeEnum.Asset, v.id)
						var36(getItemDetailsModule(v.id, Enum.AvatarItemType.Asset))
					elseif v.type == Enum.MarketplaceProductType.AvatarBundle then
						p3.analytics.reportPurchaseSuccess(itemTypeEnum.Bundle, v.id)
						var36(getItemDetailsModule(v.id, Enum.AvatarItemType.Bundle))
					end
				end
			end
		end, {
			var36, if fFlagAXEnableIaBTimedOptionsBulkPurchase then var38 else nil,
			if fFlagAXEnableIaBTimedOptionsBulkPurchase then var40 else nil,
			if fFlagAXEnableIaBTimedOptionsBulkPurchase then var39 else nil,
			if fFlagAXEnableIaBTimedOptionsBulkPurchase then var37 else nil,
			if fFlagAXEnableIaBTimedOptionsBulkPurchase then p3.analytics.reportPurchaseSuccess else nil,
			if fFlagAXEnableIaBTimedOptionsBulkPurchase then p3.analytics.reportPurchaseSuccessUnifiedEvent else nil
		}),
		onItemDetailsOpened = reactModule.useCallback(function(p5)
			-- upvalues: itemTypeEnum (copy), var36 (ref), getFavoriteForAssetModule (copy), getProductInfoModule (copy), fFlagAXEnableBatchItemDetailsFetchV2 (copy), getItemDetailsModule (copy), getFavoriteForBundleModule (copy)
			if p5.itemType == itemTypeEnum.Asset then
				var36(getFavoriteForAssetModule(p5.id))
				var36(getProductInfoModule(p5.id))
				
				if fFlagAXEnableBatchItemDetailsFetchV2 then
					var36(getItemDetailsModule(p5.id, Enum.AvatarItemType.Asset))
					
					return
				end
			elseif p5.itemType == itemTypeEnum.Bundle then
				var36(getFavoriteForBundleModule(p5.id))
			end
		end, { var36 }),
		onToggleFavorite = reactModule.useCallback(function(p6, p7)
			-- upvalues: itemTypeEnum (copy), var36 (ref), deleteFavoriteForAssetModule (copy), createFavoriteForAssetModule (copy), deleteFavoriteForBundleModule (copy), createFavoriteForBundleModule (copy)
			if p6.itemType == itemTypeEnum.Asset then
				if p7 then
					var36(deleteFavoriteForAssetModule(p6.id))
					
					return
				end
				var36(createFavoriteForAssetModule(p6.id))
				
				return
			elseif p6.itemType == itemTypeEnum.Bundle then
				if p7 then
					var36(deleteFavoriteForBundleModule(p6.id))
					
					return
				end
				var36(createFavoriteForBundleModule(p6.id))
			end
		end, { var36 }),
		openAttributionOverlay = reactModule.useCallback(function(p8)
			-- upvalues: var36 (ref), openOverlayModule (copy), overlayModule (copy)
			var36(openOverlayModule(overlayModule.AttributionTraversal, p8))
		end, { var36 }),
		onPromptPurchase = function(p9, p10, p11, p12, p13, p14, p15)
			-- upvalues: var36 (ref), promptPurchaseModule (copy)
			var36(promptPurchaseModule(p9, p10, p11, p12, p13, p14, p15))
		end,
		renderTryOnViewport = reactModule.useCallback(function(p16)
			-- upvalues: p3 (ref), applyTryOnItemToHumanoidDescription (copy), reactModule (copy), avatarViewportModule (copy), enableAvatarViewportAutoRotation (copy), AXViewportCameraFieldOfView (copy)
			if p3.localPlayerModel and p3.localPlayerModel.Humanoid then
				local var48 = p3.localPlayerModel.Humanoid.HumanoidDescription:Clone()
				applyTryOnItemToHumanoidDescription(p16, var48)
				
				return reactModule.createElement(avatarViewportModule, {
					visible = true,
					backgroundTransparency = 1,
					resetCameraAndAutoRotationOnModelChange = true,
					size = UDim2.new(1, 0, 1, 0),
					position = UDim2.new(0.5, 0, 0.5, 0),
					humanoidDescription = var48,
					model = p3.localPlayerModel,
					disableAutoRotation = not enableAvatarViewportAutoRotation,
					offsetOptions = {
						defaultCameraOffset = CFrame.new(0, 0.5, -5),
						toolOffset = CFrame.new(0, 2, -8)
					},
					cameraFieldOfView = AXViewportCameraFieldOfView
				})
			end
			return nil
		end, { p3.localPlayerModel }),
		localPlayerModel = p3.localPlayerModel,
		analytics = p3.analytics
	})
	useUnifiedEventListenerInExperience()
	
	if not fFlagAXEnableInspectAndBuyFocusNavigation then
		return reactModule.createElement(foundationModule.View, {
			Size = var34.OverlaySize,
			Position = var34.OverlayPosition,
			backgroundStyle = var35.Color.Common.Shadow,
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
				AnchorPoint = var34.ContainerAnchorPoint,
				Size = var34.ContainerSize,
				Position = var34.ContainerPosition,
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
				ResponsivePanelLayout = reactModule.createElement(responsivePanelLayout, var41)
			}),
			Overlay = reactModule.createElement(overlayModule_1)
		})
	end
	local var42 = useInspectAndBuyFocusNavigation()
	local frame = reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ref = var42.setFocusRef,
		Size = UDim2.fromScale(1, 1),
		SelectionGroup = var42.focusNavigationProps.SelectionGroup,
		SelectionBehaviorDown = var42.focusNavigationProps.SelectionBehaviorDown,
		SelectionBehaviorLeft = var42.focusNavigationProps.SelectionBehaviorLeft,
		SelectionBehaviorRight = var42.focusNavigationProps.SelectionBehaviorRight,
		SelectionBehaviorUp = var42.focusNavigationProps.SelectionBehaviorUp
	}, {
		Content = reactModule.createElement(foundationModule.View, {
			Size = var34.OverlaySize,
			Position = var34.OverlayPosition,
			backgroundStyle = var35.Color.Common.Shadow,
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
				AnchorPoint = var34.ContainerAnchorPoint,
				Size = var34.ContainerSize,
				Position = var34.ContainerPosition,
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
				ResponsivePanelLayout = reactModule.createElement(responsivePanelLayout, var41)
			}),
			Overlay = reactModule.createElement(overlayModule_1)
		})
	})
	
	return if fFlagAXFixIaBTimedOptionsPopoverFocus then reactModule.createElement(popoverFocusRestorationContext.Provider, { value = true }, { InspectAndBuyContent = frame }) else frame
end

return if fFlagAXEnableIaBTimedOptionsBulkPurchase then function(value)
	-- upvalues: reactModule (ref), var28 (ref), InspectAndBuyBaseContainer (ref)
	return reactModule.createElement(var28, {}, {
		Inner = reactModule.createElement(InspectAndBuyBaseContainer, value)
	})
end else InspectAndBuyBaseContainer