local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local reactModule = require(parent.React)
local promiseModule = require(parent.Promise)
local useNavigation = require(parent.Navigation).useNavigation
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local useProfileWrapperContextModule = require(profilePlatform.Contexts.useProfileWrapperContext)
local fFlagProfileInspectAndBuyKeepUpsellDialogOpenModule = require(profilePlatform.Flags.FFlagProfileInspectAndBuyKeepUpsellDialogOpen)
local fFlagSocialEnableProfileInspectAndBuyAnalyticsV2Module = require(profilePlatform.Flags.FFlagSocialEnableProfileInspectAndBuyAnalyticsV2)

return function(p0) --[[ line: 18 | named "useOpenRobuxUpsell" ]]
	-- upvalues: useDispatch (ref), useNavigation (ref), useProfileWrapperContextModule (ref), reactModule (ref), parent (ref), fFlagSocialEnableProfileInspectAndBuyAnalyticsV2Module (ref), fFlagProfileInspectAndBuyKeepUpsellDialogOpenModule (ref), promiseModule (ref)
	local var6 = useDispatch()
	local var7 = useNavigation()
	local var8 = useProfileWrapperContextModule()
	
	return reactModule.useCallback(function() --[[ line: 23 ]]
		-- upvalues: parent (copy), var6 (ref), fFlagSocialEnableProfileInspectAndBuyAnalyticsV2Module (copy), var8 (ref), fFlagProfileInspectAndBuyKeepUpsellDialogOpenModule (copy), var7 (ref), promiseModule (copy), p0 (ref)
		local purchasePromptLiteModule = require(parent.PurchasePromptLite)
		local closeCentralOverlay = require(parent.CentralOverlay).Thunks.CloseCentralOverlay
		var6(purchasePromptLiteModule.Thunks.OpenCentralOverlayForUnifiedPurchasePrompt({
			productPayload = { kind = "RobuxUpsell" },
			purchaseAnalyticsMetadata = if fFlagSocialEnableProfileInspectAndBuyAnalyticsV2Module then {
				surface = purchasePromptLiteModule.Enums.ProductPurchaseSurface.Profile
			} else nil,
			purchaseCallbacks = {
				onFlowComplete = function() --[[ line: 35 ]]
					-- upvalues: var6 (copy), closeCentralOverlay (ref), var8 (copy), fFlagProfileInspectAndBuyKeepUpsellDialogOpenModule (copy), var7 (copy)
					var6(closeCentralOverlay())
					local var10 = if var8.postPurchase then var8.postPurchase.refreshRobuxBalance else nil
					
					if var10 then
						var10()
					end
					if not fFlagProfileInspectAndBuyKeepUpsellDialogOpenModule then
						var7.goBack()
					end
				end,
				fetchProductInfo = function() --[[ line: 47 ]]
					-- upvalues: promiseModule (copy), p0 (copy)
					return promiseModule.resolve({
						IsForSale = true,
						Name = "RobuxUpsell",
						PriceInRobux = p0
					})
				end
			}
		}))
	end, { var6, var7, var8.postPurchase, p0 })
end