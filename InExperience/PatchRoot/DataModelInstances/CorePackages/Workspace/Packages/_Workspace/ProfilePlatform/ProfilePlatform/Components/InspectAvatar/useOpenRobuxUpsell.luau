local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local ReactModule = require(Parent.React)
local PromiseModule = require(Parent.Promise)
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseProfileWrapperContextModule = require(ProfilePlatform.Contexts.useProfileWrapperContext)
local FFlagProfileInspectAndBuyKeepUpsellDialogOpenModule = require(ProfilePlatform.Flags.FFlagProfileInspectAndBuyKeepUpsellDialogOpen)
local FFlagSocialEnableProfileInspectAndBuyAnalyticsV2Module = require(ProfilePlatform.Flags.FFlagSocialEnableProfileInspectAndBuyAnalyticsV2)
local FFlagEnableRecentActivityInspectAndBuy = require(Parent.SharedFlags).FFlagEnableRecentActivityInspectAndBuy

return function(PriceInRobux, Callback) --[[ Line: 20 | Named "useOpenRobuxUpsell" ]]
	-- upvalues: UseDispatchFunction (copy), UseNavigationFunction (copy), UseProfileWrapperContextModule (copy), ReactModule (copy), Parent (copy), FFlagSocialEnableProfileInspectAndBuyAnalyticsV2Module (copy), FFlagEnableRecentActivityInspectAndBuy (copy), FFlagProfileInspectAndBuyKeepUpsellDialogOpenModule (copy), PromiseModule (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseNavigationResult = UseNavigationFunction()
	local UseProfileWrapperContextModuleResult = UseProfileWrapperContextModule()
	
	return ReactModule.useCallback(function() --[[ Line: 26 ]]
		-- upvalues: Parent (upval), UseDispatchResult (copy), FFlagSocialEnableProfileInspectAndBuyAnalyticsV2Module (upval), UseProfileWrapperContextModuleResult (copy), FFlagEnableRecentActivityInspectAndBuy (upval), Callback (copy), FFlagProfileInspectAndBuyKeepUpsellDialogOpenModule (upval), UseNavigationResult (copy), PromiseModule (upval), PriceInRobux (copy)
		local PurchasePromptLiteModule = require(Parent.PurchasePromptLite)
		local CloseCentralOverlayFunction = require(Parent.CentralOverlay).Thunks.CloseCentralOverlay
		UseDispatchResult(PurchasePromptLiteModule.Thunks.OpenCentralOverlayForUnifiedPurchasePrompt({
			productPayload = { kind = "RobuxUpsell" },
			purchaseAnalyticsMetadata = if FFlagSocialEnableProfileInspectAndBuyAnalyticsV2Module then {
				surface = PurchasePromptLiteModule.Enums.ProductPurchaseSurface.Profile
			} else nil,
			purchaseCallbacks = {
				onFlowComplete = function() --[[ Line: 38 ]]
					-- upvalues: UseDispatchResult (upval), CloseCentralOverlayFunction (copy), UseProfileWrapperContextModuleResult (upval), FFlagEnableRecentActivityInspectAndBuy (upval), Callback (upval), FFlagProfileInspectAndBuyKeepUpsellDialogOpenModule (upval), UseNavigationResult (upval)
					UseDispatchResult(CloseCentralOverlayFunction())
					local RefreshRobuxBalance: () -> () = if UseProfileWrapperContextModuleResult.postPurchase then UseProfileWrapperContextModuleResult.postPurchase.refreshRobuxBalance else nil
					
					if RefreshRobuxBalance then
						RefreshRobuxBalance()
					end
					if FFlagEnableRecentActivityInspectAndBuy and Callback then
						Callback()
						
						return
					end
					if not FFlagProfileInspectAndBuyKeepUpsellDialogOpenModule then
						UseNavigationResult.goBack()
					end
				end,
				fetchProductInfo = function() --[[ Line: 52 ]]
					-- upvalues: PromiseModule (upval), PriceInRobux (upval)
					return PromiseModule.resolve({
						IsForSale = true,
						Name = "RobuxUpsell",
						PriceInRobux = PriceInRobux
					})
				end
			}
		}))
	end, {
		UseDispatchResult,
		UseNavigationResult,
		UseProfileWrapperContextModuleResult.postPurchase,
		PriceInRobux,
		if FFlagEnableRecentActivityInspectAndBuy then Callback else nil
	})
end