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

return function(p0) --[[ line: 24 | named "useNavigateToServers" ]]
	-- upvalues: useAppPolicy (ref), useNavigation (ref), fFlagEnableBlackbirdPageCloseCallback (ref), reactModule (ref), getSubscriptionPurchaseCloseCallback (ref), urlBuilder (ref), default (ref), appPage (ref)
	local var6 = useAppPolicy(function(p1) --[[ line: 25 ]]
		return p1.getWebViewSupport()
	end)
	local var7 = useNavigation()
	local var8 = if fFlagEnableBlackbirdPageCloseCallback then reactModule.useMemo(function() --[[ line: 32 ]]
		-- upvalues: getSubscriptionPurchaseCloseCallback (copy)
		return if getSubscriptionPurchaseCloseCallback then getSubscriptionPurchaseCloseCallback() else nil
	end, {}) else nil
	
	return reactModule.useCallback(function() --[[ line: 37 ]]
		-- upvalues: urlBuilder (copy), p0 (ref), default (copy), var6 (ref), var7 (ref), appPage (copy), fFlagEnableBlackbirdPageCloseCallback (copy), var8 (write)
		local var9 = urlBuilder.game.info.servers({ universeId = p0 })
		pcall(function() --[[ line: 42 ]]
			-- upvalues: default (copy), var9 (ref), var6 (copy), var7 (copy), appPage (copy), fFlagEnableBlackbirdPageCloseCallback (copy), var8 (copy)
			default:isURLRegistered(var9):andThen(function(p2) --[[ line: 43 ]]
				-- upvalues: default (copy), var9 (copy), var6 (copy), var7 (copy), appPage (copy), fFlagEnableBlackbirdPageCloseCallback (copy), var8 (copy)
				if p2 then
					default:detectURL(var9)
					
					return
				elseif var6 then
					var7.navigate(appPage.GenericWebPage, {
						detail = var9,
						extraProps = if fFlagEnableBlackbirdPageCloseCallback then { onClose = var8 } else nil
					})
				end
			end)
		end)
	end, {
		p0,
		var6,
		var7,
		default,
		var8
	})
end