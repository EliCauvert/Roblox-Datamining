local corePackagesService = game:GetService("CorePackages")
local guiService = game:GetService("GuiService")
local coreGuiService = game:GetService("CoreGui")
local parent = script.Parent.Parent
local reactModule = require(corePackagesService.Packages.React)
local sharedFlagsModule = require(corePackagesService.Workspace.Packages.SharedFlags)
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
local fFlagIBV2Attribution = sharedFlagsModule.FFlagIBV2Attribution
local fFlagAXEnableBatchItemDetailsFetchV2 = avatarExperienceFlagsModule.FFlagAXEnableBatchItemDetailsFetchV2
local fFlagAXEnableInspectAndBuyFocusNavigation = avatarExperienceFlagsModule.FFlagAXEnableInspectAndBuyFocusNavigation
local fFlagAXEnableIaBTimedOptionsBulkPurchase = avatarExperienceFlagsModule.FFlagAXEnableIaBTimedOptionsBulkPurchase
local fFlagAXFixIaBTimedOptionsPopoverFocus = avatarExperienceFlagsModule.FFlagAXFixIaBTimedOptionsPopoverFocus
local var28 = if fFlagAXEnableIaBTimedOptionsBulkPurchase then avatarExperienceInspectAndBuyModule.Contexts.ItemSelectionStoreContext else nil
local var29 = if var28 then var28.Provider else nil
local var30 = if var28 then var28.useItemSelectionStore else nil

local var31 = function(p0) --[[ line: 87 ]]
	return p0.assets
end

local var32 = function(p1) --[[ line: 91 ]]
	return p1.collectibleResellableInstances
end

local var33 = function(p2) --[[ line: 95 ]]
	return p2.bundles
end

local function InspectAndBuyBaseContainer(p3) --[[ line: 99 ]]
	-- upvalues: useViewBreakpoints (ref), constantsModule (ref), useTokens (ref), useDispatch (ref), fFlagAXEnableIaBTimedOptionsBulkPurchase (ref), var30 (ref), useSignalState (ref), useSelector (ref), var31 (ref), tutilsModule (ref), var32 (ref), var33 (ref), reactModule (ref), guiService (ref), updateBulkPuchaseResultsModule (ref), itemTypeEnum (ref), buildBulkPurchaseAnalyticsPayload (ref), getItemDetailsModule (ref), getFavoriteForAssetModule (ref), getProductInfoModule (ref), fFlagIBV2Attribution (ref), fFlagAXEnableBatchItemDetailsFetchV2 (ref), getFavoriteForBundleModule (ref), deleteFavoriteForAssetModule (ref), createFavoriteForAssetModule (ref), deleteFavoriteForBundleModule (ref), createFavoriteForBundleModule (ref), openOverlayModule (ref), overlayModule (ref), promptPurchaseModule (ref), applyTryOnItemToHumanoidDescription (ref), avatarViewportModule (ref), enableAvatarViewportAutoRotation (ref), AXViewportCameraFieldOfView (ref), useResponsivePanelLayoutProps (ref), useUnifiedEventListenerInExperience (ref), fFlagAXEnableInspectAndBuyFocusNavigation (ref), useInspectAndBuyFocusNavigation (ref), foundationModule (ref), themeModule (ref), responsivePanelLayout (ref), overlayModule_1 (ref), fFlagAXFixIaBTimedOptionsPopoverFocus (ref), popoverFocusRestorationContext (ref)
	local var35 = useViewBreakpoints(constantsModule.TopBarHeight)
	local var36 = useTokens()
	local var37 = useDispatch()
	local var38 = if fFlagAXEnableIaBTimedOptionsBulkPurchase then useSignalState((if fFlagAXEnableIaBTimedOptionsBulkPurchase then var30() else nil).getItemDataMap) else nil
	local var39 = if fFlagAXEnableIaBTimedOptionsBulkPurchase then useSelector(var31, tutilsModule.deepEqual) else nil
	local var40 = if fFlagAXEnableIaBTimedOptionsBulkPurchase then useSelector(var32, tutilsModule.deepEqual) else nil
	local var41 = if fFlagAXEnableIaBTimedOptionsBulkPurchase then useSelector(var33, tutilsModule.deepEqual) else nil
	local var42 = useResponsivePanelLayoutProps({
		onInspectMenuClosed = reactModule.useCallback(function() --[[ line: 124 ]]
			-- upvalues: guiService (copy)
			guiService:CloseInspectMenu()
		end, {}),
		onBulkPurchaseFinished = reactModule.useCallback(function(_, _, p4) --[[ line: 132 ]]
			-- upvalues: var37 (ref), updateBulkPuchaseResultsModule (copy), fFlagAXEnableIaBTimedOptionsBulkPurchase (copy), var38 (ref), itemTypeEnum (copy), buildBulkPurchaseAnalyticsPayload (copy), var39 (ref), var41 (ref), var40 (ref), p3 (ref), getItemDetailsModule (copy)
			var37(updateBulkPuchaseResultsModule(p4))
			
			for i, v in p4.Items do
				if v.status == Enum.MarketplaceItemPurchaseStatus.Success then
					if fFlagAXEnableIaBTimedOptionsBulkPurchase and var38 then
						local var45 = v.type == Enum.MarketplaceProductType.AvatarAsset
						local id = v.id
						local var46 = if var45 then Enum.AvatarItemType.Asset else Enum.AvatarItemType.Bundle
						local var47 = if var45 then itemTypeEnum.Asset else itemTypeEnum.Bundle
						local var48 = buildBulkPurchaseAnalyticsPayload({
							itemId = tostring(id),
							itemType = var47,
							assetsMap = var39,
							bundlesMap = var41,
							collectibleResellableInstances = var40,
							storedData = var38[tostring(id)]
						})
						
						if var48 then
							p3.analytics.reportPurchaseSuccessUnifiedEvent(var47, id, var48)
						end
						var37(getItemDetailsModule(id, var46))
					elseif v.type == Enum.MarketplaceProductType.AvatarAsset then
						p3.analytics.reportPurchaseSuccess(itemTypeEnum.Asset, v.id)
						var37(getItemDetailsModule(v.id, Enum.AvatarItemType.Asset))
					elseif v.type == Enum.MarketplaceProductType.AvatarBundle then
						p3.analytics.reportPurchaseSuccess(itemTypeEnum.Bundle, v.id)
						var37(getItemDetailsModule(v.id, Enum.AvatarItemType.Bundle))
					end
				end
			end
		end, {
			var37, if fFlagAXEnableIaBTimedOptionsBulkPurchase then var39 else nil,
			if fFlagAXEnableIaBTimedOptionsBulkPurchase then var41 else nil,
			if fFlagAXEnableIaBTimedOptionsBulkPurchase then var40 else nil,
			if fFlagAXEnableIaBTimedOptionsBulkPurchase then var38 else nil,
			if fFlagAXEnableIaBTimedOptionsBulkPurchase then p3.analytics.reportPurchaseSuccess else nil,
			if fFlagAXEnableIaBTimedOptionsBulkPurchase then p3.analytics.reportPurchaseSuccessUnifiedEvent else nil
		}),
		onItemDetailsOpened = reactModule.useCallback(function(p5) --[[ line: 189 ]]
			-- upvalues: itemTypeEnum (copy), var37 (ref), getFavoriteForAssetModule (copy), getProductInfoModule (copy), fFlagIBV2Attribution (copy), fFlagAXEnableBatchItemDetailsFetchV2 (copy), getItemDetailsModule (copy), getFavoriteForBundleModule (copy)
			if p5.itemType == itemTypeEnum.Asset then
				var37(getFavoriteForAssetModule(p5.id))
				var37(getProductInfoModule(p5.id))
				
				if fFlagIBV2Attribution and fFlagAXEnableBatchItemDetailsFetchV2 then
					var37(getItemDetailsModule(p5.id, Enum.AvatarItemType.Asset))
					
					return
				end
			elseif p5.itemType == itemTypeEnum.Bundle then
				var37(getFavoriteForBundleModule(p5.id))
			end
		end, { var37 }),
		onToggleFavorite = reactModule.useCallback(function(p6, p7) --[[ line: 208 ]]
			-- upvalues: itemTypeEnum (copy), var37 (ref), deleteFavoriteForAssetModule (copy), createFavoriteForAssetModule (copy), deleteFavoriteForBundleModule (copy), createFavoriteForBundleModule (copy)
			if p6.itemType == itemTypeEnum.Asset then
				if p7 then
					var37(deleteFavoriteForAssetModule(p6.id))
					
					return
				end
				var37(createFavoriteForAssetModule(p6.id))
				
				return
			elseif p6.itemType == itemTypeEnum.Bundle then
				if p7 then
					var37(deleteFavoriteForBundleModule(p6.id))
					
					return
				end
				var37(createFavoriteForBundleModule(p6.id))
			end
		end, { var37 }),
		openAttributionOverlay = if fFlagIBV2Attribution then if fFlagIBV2Attribution then reactModule.useCallback(function(p8) --[[ line: 225 ]]
			-- upvalues: var37 (ref), openOverlayModule (copy), overlayModule (copy)
			var37(openOverlayModule(overlayModule.AttributionTraversal, p8))
		end, { var37 }) else nil else nil,
		onPromptPurchase = function(p9, p10, p11, p12, p13, p14, p15) --[[ line: 263 ]]
			-- upvalues: var37 (ref), promptPurchaseModule (copy)
			var37(promptPurchaseModule(p9, p10, p11, p12, p13, p14, p15))
		end,
		renderTryOnViewport = reactModule.useCallback(function(p16) --[[ line: 285 ]]
			-- upvalues: p3 (ref), applyTryOnItemToHumanoidDescription (copy), reactModule (copy), avatarViewportModule (copy), enableAvatarViewportAutoRotation (copy), AXViewportCameraFieldOfView (copy)
			if p3.localPlayerModel and p3.localPlayerModel.Humanoid then
				local var49 = p3.localPlayerModel.Humanoid.HumanoidDescription:Clone()
				applyTryOnItemToHumanoidDescription(p16, var49)
				
				return reactModule.createElement(avatarViewportModule, {
					visible = true,
					backgroundTransparency = 1,
					resetCameraAndAutoRotationOnModelChange = true,
					size = UDim2.new(1, 0, 1, 0),
					position = UDim2.new(0.5, 0, 0.5, 0),
					humanoidDescription = var49,
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
			Size = var35.OverlaySize,
			Position = var35.OverlayPosition,
			backgroundStyle = var36.Color.Common.Shadow,
			stateLayer = {
				affordance = foundationModule.Enums.StateLayerAffordance.None
			},
			onActivated = function() --[[ line: 392 ]]
				-- upvalues: guiService (copy)
				guiService:CloseInspectMenu()
			end
		}, {
			ContainerView = reactModule.createElement(foundationModule.View, {
				ClipsDescendants = true,
				AnchorPoint = var35.ContainerAnchorPoint,
				Size = var35.ContainerSize,
				Position = var35.ContainerPosition,
				backgroundStyle = {
					Color3 = themeModule.color("MenuContainer"),
					Transparency = themeModule.transparency("MenuContainer", 1) * guiService.PreferredTransparency
				},
				stateLayer = {
					affordance = foundationModule.Enums.StateLayerAffordance.None
				},
				onActivated = function() --[[ line: 408 ]] end
			}, {
				UICorner = reactModule.createElement("UICorner", { CornerRadius = themeModule.DefaultCornerRadius }),
				ResponsivePanelLayout = reactModule.createElement(responsivePanelLayout, var42)
			}),
			Overlay = if fFlagIBV2Attribution then reactModule.createElement(overlayModule_1) else nil
		})
	end
	local var43 = useInspectAndBuyFocusNavigation()
	local frame = reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ref = var43.setFocusRef,
		Size = UDim2.fromScale(1, 1),
		SelectionGroup = var43.focusNavigationProps.SelectionGroup,
		SelectionBehaviorDown = var43.focusNavigationProps.SelectionBehaviorDown,
		SelectionBehaviorLeft = var43.focusNavigationProps.SelectionBehaviorLeft,
		SelectionBehaviorRight = var43.focusNavigationProps.SelectionBehaviorRight,
		SelectionBehaviorUp = var43.focusNavigationProps.SelectionBehaviorUp
	}, {
		Content = reactModule.createElement(foundationModule.View, {
			Size = var35.OverlaySize,
			Position = var35.OverlayPosition,
			backgroundStyle = var36.Color.Common.Shadow,
			stateLayer = {
				affordance = foundationModule.Enums.StateLayerAffordance.None
			},
			onActivated = function() --[[ line: 345 ]]
				-- upvalues: guiService (copy)
				guiService:CloseInspectMenu()
			end
		}, {
			ContainerView = reactModule.createElement(foundationModule.View, {
				ClipsDescendants = true,
				AnchorPoint = var35.ContainerAnchorPoint,
				Size = var35.ContainerSize,
				Position = var35.ContainerPosition,
				backgroundStyle = {
					Color3 = themeModule.color("MenuContainer"),
					Transparency = themeModule.transparency("MenuContainer", 1) * guiService.PreferredTransparency
				},
				stateLayer = {
					affordance = foundationModule.Enums.StateLayerAffordance.None
				},
				onActivated = function() --[[ line: 361 ]] end
			}, {
				UICorner = reactModule.createElement("UICorner", { CornerRadius = themeModule.DefaultCornerRadius }),
				ResponsivePanelLayout = reactModule.createElement(responsivePanelLayout, var42)
			}),
			Overlay = if fFlagIBV2Attribution then reactModule.createElement(overlayModule_1) else nil
		})
	})
	
	return if fFlagAXFixIaBTimedOptionsPopoverFocus then reactModule.createElement(popoverFocusRestorationContext.Provider, { value = true }, { InspectAndBuyContent = frame }) else frame
end

return if fFlagAXEnableIaBTimedOptionsBulkPurchase then function(value) --[[ line: 420 | named "InspectAndBuyBaseContainerWithSignalsProvider" ]]
	-- upvalues: reactModule (ref), var29 (ref), InspectAndBuyBaseContainer (ref)
	return reactModule.createElement(var29, {}, {
		Inner = reactModule.createElement(InspectAndBuyBaseContainer, value)
	})
end else InspectAndBuyBaseContainer