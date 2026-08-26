local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local reactModule = require(parent.React)
local robloxAppEnumsModule = require(parent.RobloxAppEnums)
local urlBuilderModule = require(parent.UrlBuilder)
local universalAppPolicyModule = require(parent.UniversalAppPolicy)
local navigationModule = require(parent.Navigation)
local linkingProtocolModule = require(parent.LinkingProtocol)
local appPage = robloxAppEnumsModule.AppPage
local urlBuilder = urlBuilderModule.UrlBuilder
local useAppPolicy = universalAppPolicyModule.useAppPolicy
local useNavigation = navigationModule.useNavigation
local default = linkingProtocolModule.LinkingProtocol.default
local fFlagEnableBlackbirdPageCloseCallback = require(parent.SharedFlags).FFlagEnableBlackbirdPageCloseCallback
local getSubscriptionPurchaseCloseCallback = require(parent.RobloxSubscriptionPurchaseApp).Utils.getSubscriptionPurchaseCloseCallback

return function(p1)
	-- upvalues: useAppPolicy (ref), useNavigation (ref), fFlagEnableBlackbirdPageCloseCallback (ref), reactModule (ref), getSubscriptionPurchaseCloseCallback (ref), urlBuilder (ref), default (ref), appPage (ref)
	local var1 = useAppPolicy(function(p2)
		return p2.getWebViewSupport()
	end)
	local var2 = useNavigation()
	local var3 = if fFlagEnableBlackbirdPageCloseCallback then reactModule.useMemo(function()
		-- upvalues: getSubscriptionPurchaseCloseCallback (copy)
		return if getSubscriptionPurchaseCloseCallback then getSubscriptionPurchaseCloseCallback() else nil
	end, {}) else nil
	
	return reactModule.useCallback(function()
		-- upvalues: urlBuilder (copy), p1 (ref), default (copy), var1 (ref), var2 (ref), appPage (copy), fFlagEnableBlackbirdPageCloseCallback (copy), var3 (write)
		local var4 = urlBuilder.game.info.servers({ universeId = p1 })
		pcall(function()
			-- upvalues: default (copy), var4 (ref), var1 (copy), var2 (copy), appPage (copy), fFlagEnableBlackbirdPageCloseCallback (copy), var3 (copy)
			default:isURLRegistered(var4):andThen(function(p2)
				-- upvalues: default (copy), var4 (copy), var1 (copy), var2 (copy), appPage (copy), fFlagEnableBlackbirdPageCloseCallback (copy), var3 (copy)
				if p2 then
					default:detectURL(var4)
					
					return
				elseif var1 then
					var2.navigate(appPage.GenericWebPage, {
						detail = var4,
						extraProps = if fFlagEnableBlackbirdPageCloseCallback then { onClose = var3 } else nil
					})
				end
			end)
		end)
	end, {
		p1,
		var1,
		var2,
		default,
		var3
	})
end