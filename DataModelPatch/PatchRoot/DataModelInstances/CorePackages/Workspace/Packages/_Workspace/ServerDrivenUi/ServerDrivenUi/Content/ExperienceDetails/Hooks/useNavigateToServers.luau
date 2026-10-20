local Parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local ReactModule = require(Parent.React)
local AppPage = require(Parent.RobloxAppEnums).AppPage
local UrlBuilder = require(Parent.UrlBuilder).UrlBuilder
local UseAppPolicyFunction = require(Parent.UniversalAppPolicy).useAppPolicy
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local Default = require(Parent.LinkingProtocol).LinkingProtocol.default
local FFlagEnableBlackbirdPageCloseCallback = require(Parent.SharedFlags).FFlagEnableBlackbirdPageCloseCallback
local GetSubscriptionPurchaseCloseCallbackFunction = require(Parent.RobloxSubscriptionPurchaseApp).Utils.getSubscriptionPurchaseCloseCallback

return function(UniverseId)
	-- upvalues: UseAppPolicyFunction (copy), UseNavigationFunction (copy), FFlagEnableBlackbirdPageCloseCallback (copy), ReactModule (copy), GetSubscriptionPurchaseCloseCallbackFunction (copy), UrlBuilder (copy), Default (copy), AppPage (copy)
	local UseAppPolicyResult = UseAppPolicyFunction(function(p1)
		return p1.getWebViewSupport()
	end)
	local UseNavigationResult = UseNavigationFunction()
	local UseMemoResult = if FFlagEnableBlackbirdPageCloseCallback then ReactModule.useMemo(function()
		-- upvalues: GetSubscriptionPurchaseCloseCallbackFunction (upval)
		return if GetSubscriptionPurchaseCloseCallbackFunction then GetSubscriptionPurchaseCloseCallbackFunction() else nil
	end, {}) else nil
	
	return ReactModule.useCallback(function()
		-- upvalues: UrlBuilder (upval), UniverseId (copy), Default (upval), UseAppPolicyResult (copy), UseNavigationResult (copy), AppPage (upval), FFlagEnableBlackbirdPageCloseCallback (upval), UseMemoResult (ref)
		local ServersResult = UrlBuilder.game.info.servers({ universeId = UniverseId })
		pcall(function()
			-- upvalues: Default (upval), ServersResult (copy), UseAppPolicyResult (upval), UseNavigationResult (upval), AppPage (upval), FFlagEnableBlackbirdPageCloseCallback (upval), UseMemoResult (upval)
			Default:isURLRegistered(ServersResult):andThen(function(Result)
				-- upvalues: Default (upval), ServersResult (upval), UseAppPolicyResult (upval), UseNavigationResult (upval), AppPage (upval), FFlagEnableBlackbirdPageCloseCallback (upval), UseMemoResult (upval)
				if Result then
					Default:detectURL(ServersResult)
					
					return
				end
				if UseAppPolicyResult then
					UseNavigationResult.navigate(AppPage.GenericWebPage, {
						detail = ServersResult,
						extraProps = if FFlagEnableBlackbirdPageCloseCallback then { onClose = UseMemoResult } else nil
					})
				end
			end)
		end)
	end, {
		UniverseId,
		UseAppPolicyResult,
		UseNavigationResult,
		Default,
		UseMemoResult
	})
end