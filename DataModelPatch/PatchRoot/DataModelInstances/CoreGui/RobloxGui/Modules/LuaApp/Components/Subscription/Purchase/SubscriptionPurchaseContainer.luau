local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local RoactRodux = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux
local UseDispatchFunction = RoactRodux.useDispatch
local UseSelectorFunction = RoactRodux.useSelector
local UseNavigationFunction = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagSduiSubscriptionCellPostPurchaseSync = SharedFlagsModule.FFlagSduiSubscriptionCellPostPurchaseSync
local FFlagSubscriptionPurchaseModalLiveStatus = SharedFlagsModule.FFlagSubscriptionPurchaseModalLiveStatus
local FFlagSignalsNavP3Dispatch = SharedFlagsModule.FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(CorePackages.Workspace.Packages.RobloxAppNavigation).NavigationCommands else nil
local AppPageModule = require(Modules.LuaApp.AppPage)
local UrlBuilderModule = require(Modules.LuaApp.Http.UrlBuilder)
local NavigateDownModule = require(Modules.LuaApp.Thunks.NavigateDown)
local SetSubscriptionStatusesModule = require(Modules.LuaApp.Actions.Subscription.SetSubscriptionStatuses)
local UseRoactServiceModule = require(Modules.LuaApp.Hooks.useRoactService)
local AppEventIngestServiceModule = require(Modules.LuaApp.Services.AppEventIngestService)
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local PerformSubscriptionPurchaseModule = require(Modules.LuaApp.Thunks.Subscription.PerformSubscriptionPurchase)
local SubscriptionPurchaseOverlayModule = require(script.Parent.SubscriptionPurchaseOverlay)
local _ = require(Modules.LuaApp.Models.SubscriptionApi.SubscriptionProductInfoModel)
local GetFFlagEnableDevSubsInRobuxModule = require(Modules.LuaApp.Flags.GetFFlagEnableDevSubsInRobux)
local GetFFlagEnableVpcSettingsForInAppSubscriptionPurchaseModule = require(Modules.LuaApp.Flags.GetFFlagEnableVpcSettingsForInAppSubscriptionPurchase)
local OpenCentralOverlayForUnifiedPurchasePromptModule = require(Modules.LuaApp.Thunks.OpenCentralOverlayForUnifiedPurchasePrompt)
local CloseCentralOverlayModule = require(Modules.LuaApp.Thunks.CloseCentralOverlay)
local ProductPurchaseSurface = require(CorePackages.Workspace.Packages.PurchasePromptLite).Enums.ProductPurchaseSurface
local PromiseModule = require(Modules.LuaApp.Promise)

return function(p1)
	-- upvalues: UseDispatchFunction (copy), UseNavigationFunction (copy), UseRoactServiceModule (copy), AppEventIngestServiceModule (copy), RoactNetworkingModule (copy), GetFFlagEnableDevSubsInRobuxModule (copy), FFlagSubscriptionPurchaseModalLiveStatus (copy), UseSelectorFunction (copy), ReactModule (copy), SubscriptionPurchaseOverlayModule (copy), OpenCentralOverlayForUnifiedPurchasePromptModule (copy), CloseCentralOverlayModule (copy), SetSubscriptionStatusesModule (copy), FFlagSduiSubscriptionCellPostPurchaseSync (copy), ProductPurchaseSurface (copy), PromiseModule (copy), GetFFlagEnableVpcSettingsForInAppSubscriptionPurchaseModule (copy), AppPageModule (copy), UrlBuilderModule (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownModule (copy), PerformSubscriptionPurchaseModule (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseNavigationResult = UseNavigationFunction()
	local UseRoactServiceModuleResult = UseRoactServiceModule(AppEventIngestServiceModule)
	local _ = UseRoactServiceModule(RoactNetworkingModule)
	local IsPriceInRobuxAbove: boolean = GetFFlagEnableDevSubsInRobuxModule() and (p1.subscriptionPurchaseProductInfo.priceInRobux ~= nil and p1.subscriptionPurchaseProductInfo.priceInRobux > 0)
	local UseSelectorResult = if FFlagSubscriptionPurchaseModalLiveStatus then UseSelectorFunction(function(p2)
		-- upvalues: p1 (copy)
		local SubscriptionTargetKey = p1.subscriptionPurchaseProductInfo.subscriptionTargetKey
		local SubscriptionStatuses = p2.SubscriptionStatuses
		local SubscriptionStatus = SubscriptionStatuses and SubscriptionStatuses[SubscriptionTargetKey]
		
		return if SubscriptionStatus == nil or SubscriptionStatus.isSubscribed == nil then p1.isSubscribed else SubscriptionStatus.isSubscribed
	end) else p1.isSubscribed
	
	return if GetFFlagEnableDevSubsInRobuxModule() then ReactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
		SubscriptionPurchaseOverlay = ReactModule.createElement(SubscriptionPurchaseOverlayModule, {
			subscriptionPurchaseProductInfo = p1.subscriptionPurchaseProductInfo,
			thumbnailString = p1.thumbnailString,
			isSubscribed = UseSelectorResult,
			isRobuxSubscription = IsPriceInRobuxAbove,
			shouldUseNewModalDesign = GetFFlagEnableDevSubsInRobuxModule(),
			creatorName = p1.creatorName,
			creatorVerified = p1.creatorVerified,
			promptSubscriptionPurchase = function(_, _)
				-- upvalues: UseDispatchResult (copy), OpenCentralOverlayForUnifiedPurchasePromptModule (upval), p1 (copy), IsPriceInRobuxAbove (copy), CloseCentralOverlayModule (upval), SetSubscriptionStatusesModule (upval), FFlagSduiSubscriptionCellPostPurchaseSync (upval), ProductPurchaseSurface (upval), PromiseModule (upval)
				UseDispatchResult(OpenCentralOverlayForUnifiedPurchasePromptModule({
					productPayload = {
						kind = "DeveloperSubscription",
						subscriptionId = p1.subscriptionPurchaseProductInfo.subscriptionTargetKey,
						name = p1.subscriptionPurchaseProductInfo.name,
						expectedPrice = p1.subscriptionPurchaseProductInfo.priceInRobux or 0,
						iconImageAssetId = p1.subscriptionPurchaseProductInfo.iconImageAssetId,
						isSubscriptionInRobux = IsPriceInRobuxAbove,
						displayPrice = p1.subscriptionPurchaseProductInfo.displayPrice
					},
					purchaseCallbacks = {
						onFlowComplete = function()
							-- upvalues: UseDispatchResult (upval), CloseCentralOverlayModule (upval)
							UseDispatchResult(CloseCentralOverlayModule())
						end,
						onPurchaseSuccess = function()
							-- upvalues: UseDispatchResult (upval), SetSubscriptionStatusesModule (upval), p1 (upval), FFlagSduiSubscriptionCellPostPurchaseSync (upval)
							UseDispatchResult(SetSubscriptionStatusesModule({
								[p1.subscriptionPurchaseProductInfo.subscriptionTargetKey] = { isSubscribed = true, isRenewing = true }
							}))
							
							if FFlagSduiSubscriptionCellPostPurchaseSync and p1.onPurchaseSuccess then
								p1.onPurchaseSuccess()
							end
						end
					},
					purchaseAnalyticsMetadata = {
						surface = ProductPurchaseSurface.EDP,
						productUniverseId = p1.subscriptionPurchaseProductInfo.subscriptionProviderId
					}
				}))
				
				return PromiseModule.new(function() end)
			end,
			endPurchase = function()
				-- upvalues: UseNavigationResult (copy)
				UseNavigationResult.goBack()
			end,
			onPurchaseSuccess = function()
				-- upvalues: UseDispatchResult (copy), SetSubscriptionStatusesModule (upval), p1 (copy), FFlagSduiSubscriptionCellPostPurchaseSync (upval), UseNavigationResult (copy)
				UseDispatchResult(SetSubscriptionStatusesModule({
					[p1.subscriptionPurchaseProductInfo.subscriptionTargetKey] = { isSubscribed = true, isRenewing = true }
				}))
				
				if FFlagSduiSubscriptionCellPostPurchaseSync and p1.onPurchaseSuccess then
					p1.onPurchaseSuccess()
				end
				UseNavigationResult.goBack()
			end,
			openSettingsPage = if GetFFlagEnableVpcSettingsForInAppSubscriptionPurchaseModule() then function()
				-- upvalues: AppPageModule (upval), UrlBuilderModule (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (copy), NavigateDownModule (upval)
				local config = {
					name = AppPageModule.SettingsSubPage,
					detail = UrlBuilderModule.static.settings.billing(),
					extraProps = {
						titleKey = "Feature.AccountSettings.Heading.Tab.Spending"
					}
				}
				
				if FFlagSignalsNavP3Dispatch then
					NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
					
					return
				else
					UseDispatchResult(NavigateDownModule(config))
				end
			end else nil,
			onAnalyticEvent = function(p2, p3, p4)
				-- upvalues: UseRoactServiceModuleResult (copy)
				UseRoactServiceModuleResult:sendEventDeferred(p2, p3, p4)
			end
		})
	}) else ReactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
		SubscriptionPurchaseOverlay = ReactModule.createElement(SubscriptionPurchaseOverlayModule, {
			subscriptionPurchaseProductInfo = p1.subscriptionPurchaseProductInfo,
			thumbnailString = p1.thumbnailString,
			isSubscribed = UseSelectorResult,
			shouldUseNewModalDesign = GetFFlagEnableDevSubsInRobuxModule(),
			creatorName = p1.creatorName,
			creatorVerified = p1.creatorVerified,
			promptSubscriptionPurchase = function(p2)
				-- upvalues: PerformSubscriptionPurchaseModule (upval)
				return PerformSubscriptionPurchaseModule(p2)
			end,
			endPurchase = function()
				-- upvalues: UseNavigationResult (copy)
				UseNavigationResult.goBack()
			end,
			onPurchaseSuccess = function()
				-- upvalues: UseDispatchResult (copy), SetSubscriptionStatusesModule (upval), p1 (copy), FFlagSduiSubscriptionCellPostPurchaseSync (upval), UseNavigationResult (copy)
				UseDispatchResult(SetSubscriptionStatusesModule({
					[p1.subscriptionPurchaseProductInfo.subscriptionTargetKey] = { isSubscribed = true, isRenewing = true }
				}))
				
				if FFlagSduiSubscriptionCellPostPurchaseSync and p1.onPurchaseSuccess then
					p1.onPurchaseSuccess()
				end
				UseNavigationResult.goBack()
			end,
			openSettingsPage = if GetFFlagEnableVpcSettingsForInAppSubscriptionPurchaseModule() then function()
				-- upvalues: AppPageModule (upval), UrlBuilderModule (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (copy), NavigateDownModule (upval)
				local config = {
					name = AppPageModule.SettingsSubPage,
					detail = UrlBuilderModule.static.settings.billing(),
					extraProps = {
						titleKey = "Feature.AccountSettings.Heading.Tab.Spending"
					}
				}
				
				if FFlagSignalsNavP3Dispatch then
					NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
					
					return
				else
					UseDispatchResult(NavigateDownModule(config))
				end
			end else nil,
			onAnalyticEvent = function(p2, p3, p4)
				-- upvalues: UseRoactServiceModuleResult (copy)
				UseRoactServiceModuleResult:sendEventDeferred(p2, p3, p4)
			end
		})
	})
end