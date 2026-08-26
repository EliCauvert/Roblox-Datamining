local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local reactModule = require(parent.React)
local promiseModule = require(parent.Promise)
local useNavigation = require(parent.Navigation).useNavigation
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local useProfileWrapperContextModule = require(profilePlatform.Contexts.useProfileWrapperContext)
local fFlagProfileInspectAndBuyKeepUpsellDialogOpenModule = require(profilePlatform.Flags.FFlagProfileInspectAndBuyKeepUpsellDialogOpen)
local fFlagSocialEnableProfileInspectAndBuyAnalyticsV2Module = require(profilePlatform.Flags.FFlagSocialEnableProfileInspectAndBuyAnalyticsV2)
local fFlagEnableRecentActivityInspectAndBuy = require(parent.SharedFlags).FFlagEnableRecentActivityInspectAndBuy

return function(p1, p2)
	-- upvalues: useDispatch (ref), useNavigation (ref), useProfileWrapperContextModule (ref), reactModule (ref), parent (ref), fFlagSocialEnableProfileInspectAndBuyAnalyticsV2Module (ref), fFlagEnableRecentActivityInspectAndBuy (ref), fFlagProfileInspectAndBuyKeepUpsellDialogOpenModule (ref), promiseModule (ref)
	local var1 = useDispatch()
	local var2 = useNavigation()
	local var3 = useProfileWrapperContextModule()
	
	return reactModule.useCallback(function()
		-- upvalues: parent (copy), var1 (ref), fFlagSocialEnableProfileInspectAndBuyAnalyticsV2Module (copy), var3 (ref), fFlagEnableRecentActivityInspectAndBuy (copy), p2 (ref), fFlagProfileInspectAndBuyKeepUpsellDialogOpenModule (copy), var2 (ref), promiseModule (copy), p1 (ref)
		local purchasePromptLiteModule = require(parent.PurchasePromptLite)
		local closeCentralOverlay = require(parent.CentralOverlay).Thunks.CloseCentralOverlay
		var1(purchasePromptLiteModule.Thunks.OpenCentralOverlayForUnifiedPurchasePrompt({
			productPayload = { kind = "RobuxUpsell" },
			purchaseAnalyticsMetadata = if fFlagSocialEnableProfileInspectAndBuyAnalyticsV2Module then {
				surface = purchasePromptLiteModule.Enums.ProductPurchaseSurface.Profile
			} else nil,
			purchaseCallbacks = {
				onFlowComplete = function()
					-- upvalues: var1 (copy), closeCentralOverlay (ref), var3 (copy), fFlagEnableRecentActivityInspectAndBuy (copy), p2 (copy), fFlagProfileInspectAndBuyKeepUpsellDialogOpenModule (copy), var2 (copy)
					var1(closeCentralOverlay())
					local var4 = if var3.postPurchase then var3.postPurchase.refreshRobuxBalance else nil
					
					if var4 then
						var4()
					end
					if fFlagEnableRecentActivityInspectAndBuy and p2 then
						p2()
						
						return
					elseif not fFlagProfileInspectAndBuyKeepUpsellDialogOpenModule then
						var2.goBack()
					end
				end,
				fetchProductInfo = function()
					-- upvalues: promiseModule (copy), p1 (copy)
					return promiseModule.resolve({
						IsForSale = true,
						Name = "RobuxUpsell",
						PriceInRobux = p1
					})
				end
			}
		}))
	end, {
		var1,
		var2,
		var3.postPurchase,
		p1,
		if fFlagEnableRecentActivityInspectAndBuy then p2 else nil
	})
end