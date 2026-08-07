local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local reactModule = require(parent.React)
local promiseModule = require(parent.Promise)
local useNavigation = require(parent.Navigation).useNavigation
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local useProfileWrapperContextModule = require(profilePlatform.Contexts.useProfileWrapperContext)

return function(p0) --[[ line: 13 | named "useOpenRobuxUpsell" ]]
	-- upvalues: useDispatch (ref), useNavigation (ref), useProfileWrapperContextModule (ref), reactModule (ref), parent (ref), promiseModule (ref)
	local var4 = useDispatch()
	local var5 = useNavigation()
	local var6 = useProfileWrapperContextModule()
	
	return reactModule.useCallback(function() --[[ line: 18 ]]
		-- upvalues: parent (copy), var4 (ref), var6 (ref), var5 (ref), promiseModule (copy), p0 (ref)
		local closeCentralOverlay = require(parent.CentralOverlay).Thunks.CloseCentralOverlay
		var4(require(parent.PurchasePromptLite).Thunks.OpenCentralOverlayForUnifiedPurchasePrompt({
			productPayload = { kind = "RobuxUpsell" },
			purchaseCallbacks = {
				onFlowComplete = function() --[[ line: 27 ]]
					-- upvalues: var4 (copy), closeCentralOverlay (ref), var6 (copy), var5 (copy)
					var4(closeCentralOverlay())
					local var7 = if var6.postPurchase then var6.postPurchase.refreshRobuxBalance else nil
					
					if var7 then
						var7()
					end
					var5.goBack()
				end,
				fetchProductInfo = function() --[[ line: 37 ]]
					-- upvalues: promiseModule (copy), p0 (copy)
					return promiseModule.resolve({
						IsForSale = true,
						Name = "RobuxUpsell",
						PriceInRobux = p0
					})
				end
			}
		}))
	end, { var4, var5, var6.postPurchase, p0 })
end