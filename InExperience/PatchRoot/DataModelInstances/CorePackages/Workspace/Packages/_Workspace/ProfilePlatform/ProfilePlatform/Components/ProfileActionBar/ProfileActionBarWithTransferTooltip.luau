local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local appStorageService = game:GetService("AppStorageService")
local parent = profilePlatform.Parent
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local textKeysModule = require(profilePlatform.Common.TextKeys)
local profileActionBarModule = require(profilePlatform.Components.ProfileActionBar.ProfileActionBar)
local getFIntProfilePlatformCurrencyTransferTooltipMaxImpressionsModule = require(profilePlatform.Flags.GetFIntProfilePlatformCurrencyTransferTooltipMaxImpressions)
local _ = require(profilePlatform.Types.UpsellTooltipProps)

return function(p1)
	-- upvalues: useLocalization (ref), textKeysModule (ref), reactModule (ref), getFIntProfilePlatformCurrencyTransferTooltipMaxImpressionsModule (ref), appStorageService (ref), profileActionBarModule (ref)
	local var1 = useLocalization({
		plusMoreMenuTooltipBody = textKeysModule.CurrencyTransferTooltipBody
	})
	local var2, var3 = reactModule.useState(false)
	local var4 = reactModule.useRef(false)
	local currencyTransferProfileActionTooltipStorageKeyEngineFeature = game:GetEngineFeature("CurrencyTransferProfileActionTooltipStorageKey")
	reactModule.useEffect(function()
		-- upvalues: var4 (ref), currencyTransferProfileActionTooltipStorageKeyEngineFeature (ref), getFIntProfilePlatformCurrencyTransferTooltipMaxImpressionsModule (copy), appStorageService (copy), var3 (ref)
		if var4.current then return end
		if currencyTransferProfileActionTooltipStorageKeyEngineFeature then
			local currencyTransferProfileActionTooltipImpressionsCount = tonumber(appStorageService:GetItem("CurrencyTransferProfileActionTooltipImpressionsCount")) or 0
			
			if getFIntProfilePlatformCurrencyTransferTooltipMaxImpressionsModule() <= currencyTransferProfileActionTooltipImpressionsCount then return end
			appStorageService:SetItem("CurrencyTransferProfileActionTooltipImpressionsCount", tostring(currencyTransferProfileActionTooltipImpressionsCount + 1))
			appStorageService:Flush()
		end
		var4.current = true
		var3(true)
	end, {
		currencyTransferProfileActionTooltipStorageKeyEngineFeature
	})
	local var5 = reactModule.useCallback(function()
		-- upvalues: currencyTransferProfileActionTooltipStorageKeyEngineFeature (ref), getFIntProfilePlatformCurrencyTransferTooltipMaxImpressionsModule (copy), appStorageService (copy), var3 (ref)
		if currencyTransferProfileActionTooltipStorageKeyEngineFeature then
			appStorageService:SetItem("CurrencyTransferProfileActionTooltipImpressionsCount", tostring(getFIntProfilePlatformCurrencyTransferTooltipMaxImpressionsModule()))
			appStorageService:Flush()
		end
		var3(false)
	end, {
		currencyTransferProfileActionTooltipStorageKeyEngineFeature
	})
	local var6 = reactModule.useCallback(function()
		-- upvalues: var3 (ref)
		var3(false)
	end, {})
	
	return reactModule.createElement(profileActionBarModule, {
		isContextualMenuOpen = p1.isContextualMenuOpen,
		layoutOrder = p1.layoutOrder,
		openContextualMenu = p1.openContextualMenu,
		profileActions = p1.profileActions,
		primaryButtonRef = p1.primaryButtonRef,
		moreButtonRef = p1.moreButtonRef,
		showPlusMoreMenuTooltip = var2,
		upsellTooltipProps = if var2 then reactModule.useMemo(function()
			-- upvalues: var1 (ref), var5 (ref), var6 (ref)
			return {
				plusMoreMenuTooltipTitle = nil,
				plusMoreMenuTooltipBody = var1.plusMoreMenuTooltipBody,
				onPlusMoreMenuTooltipClose = var5,
				onPlusMoreMenuTooltipDismiss = var6
			}
		end, { var1.plusMoreMenuTooltipBody, var5, var6 }) else nil
	})
end