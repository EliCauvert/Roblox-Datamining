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

return function(p0, p1)
	-- upvalues: useDispatch (ref), useNavigation (ref), useProfileWrapperContextModule (ref), reactModule (ref), parent (ref), fFlagSocialEnableProfileInspectAndBuyAnalyticsV2Module (ref), fFlagEnableRecentActivityInspectAndBuy (ref), fFlagProfileInspectAndBuyKeepUpsellDialogOpenModule (ref), promiseModule (ref)
	local var6 = useDispatch()
	local var7 = useNavigation()
	local var8 = useProfileWrapperContextModule()
	
	return reactModule.useCallback(function()
		-- upvalues: parent (copy), var6 (ref), fFlagSocialEnableProfileInspectAndBuyAnalyticsV2Module (copy), var8 (ref), fFlagEnableRecentActivityInspectAndBuy (copy), p1 (ref), fFlagProfileInspectAndBuyKeepUpsellDialogOpenModule (copy), var7 (ref), promiseModule (copy), p0 (ref)
		local purchasePromptLiteModule = require(parent.PurchasePromptLite)
		local closeCentralOverlay = require(parent.CentralOverlay).Thunks.CloseCentralOverlay
		var6(purchasePromptLiteModule.Thunks.OpenCentralOverlayForUnifiedPurchasePrompt({
			productPayload = { kind = "RobuxUpsell" },
			purchaseAnalyticsMetadata = if fFlagSocialEnableProfileInspectAndBuyAnalyticsV2Module then {
				surface = purchasePromptLiteModule.Enums.ProductPurchaseSurface.Profile
			} else nil,
			purchaseCallbacks = {
				onFlowComplete = function()
					-- upvalues: var6 (copy), closeCentralOverlay (ref), var8 (copy), fFlagEnableRecentActivityInspectAndBuy (copy), p1 (copy), fFlagProfileInspectAndBuyKeepUpsellDialogOpenModule (copy), var7 (copy)
					var6(closeCentralOverlay())
					local var10 = if var8.postPurchase then var8.postPurchase.refreshRobuxBalance else nil
					
					if var10 then
						var10()
					end
					if fFlagEnableRecentActivityInspectAndBuy and p1 then
						p1()
						
						return
					elseif not fFlagProfileInspectAndBuyKeepUpsellDialogOpenModule then
						var7.goBack()
					end
				end,
				fetchProductInfo = function()
					-- upvalues: promiseModule (copy), p0 (copy)
					return promiseModule.resolve({
						IsForSale = true,
						Name = "RobuxUpsell",
						PriceInRobux = p0
					})
				end
			}
		}))
	end, {
		var6,
		var7,
		var8.postPurchase,
		p0,
		if fFlagEnableRecentActivityInspectAndBuy then p1 else nil
	})
end