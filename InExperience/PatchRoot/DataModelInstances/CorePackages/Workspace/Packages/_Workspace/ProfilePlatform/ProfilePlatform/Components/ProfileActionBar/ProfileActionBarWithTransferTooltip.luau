local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local appStorageService = game:GetService("AppStorageService")
local parent = profilePlatform.Parent
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local textKeysModule = require(profilePlatform.Common.TextKeys)
local profileActionBarModule = require(profilePlatform.Components.ProfileActionBar.ProfileActionBar)
local getFIntProfilePlatformCurrencyTransferTooltipMaxImpressionsModule = require(profilePlatform.Flags.GetFIntProfilePlatformCurrencyTransferTooltipMaxImpressions)
local _ = require(profilePlatform.Types.UpsellTooltipProps)

return function(p0) --[[ line: 26 | named "ProfileActionBarWithTransferTooltip" ]]
	-- upvalues: useLocalization (ref), textKeysModule (ref), reactModule (ref), getFIntProfilePlatformCurrencyTransferTooltipMaxImpressionsModule (ref), appStorageService (ref), profileActionBarModule (ref)
	local var6 = useLocalization({
		plusMoreMenuTooltipBody = textKeysModule.CurrencyTransferTooltipBody
	})
	local var7, var8 = reactModule.useState(false)
	local var9 = reactModule.useRef(false)
	local currencyTransferProfileActionTooltipStorageKeyEngineFeature = game:GetEngineFeature("CurrencyTransferProfileActionTooltipStorageKey")
	reactModule.useEffect(function() --[[ line: 34 ]]
		-- upvalues: var9 (ref), currencyTransferProfileActionTooltipStorageKeyEngineFeature (ref), getFIntProfilePlatformCurrencyTransferTooltipMaxImpressionsModule (copy), appStorageService (copy), var8 (ref)
		if var9.current then return end
		if currencyTransferProfileActionTooltipStorageKeyEngineFeature then
			local currencyTransferProfileActionTooltipImpressionsCount = tonumber(appStorageService:GetItem("CurrencyTransferProfileActionTooltipImpressionsCount")) or 0
			
			if getFIntProfilePlatformCurrencyTransferTooltipMaxImpressionsModule() <= currencyTransferProfileActionTooltipImpressionsCount then return end
			appStorageService:SetItem("CurrencyTransferProfileActionTooltipImpressionsCount", tostring(currencyTransferProfileActionTooltipImpressionsCount + 1))
			appStorageService:Flush()
		end
		var9.current = true
		var8(true)
	end, {
		currencyTransferProfileActionTooltipStorageKeyEngineFeature
	})
	local var11 = reactModule.useCallback(function() --[[ line: 54 ]]
		-- upvalues: currencyTransferProfileActionTooltipStorageKeyEngineFeature (ref), getFIntProfilePlatformCurrencyTransferTooltipMaxImpressionsModule (copy), appStorageService (copy), var8 (ref)
		if currencyTransferProfileActionTooltipStorageKeyEngineFeature then
			appStorageService:SetItem("CurrencyTransferProfileActionTooltipImpressionsCount", tostring(getFIntProfilePlatformCurrencyTransferTooltipMaxImpressionsModule()))
			appStorageService:Flush()
		end
		var8(false)
	end, {
		currencyTransferProfileActionTooltipStorageKeyEngineFeature
	})
	local var12 = reactModule.useCallback(function() --[[ line: 64 ]]
		-- upvalues: var8 (ref)
		var8(false)
	end, {})
	
	return reactModule.createElement(profileActionBarModule, {
		isContextualMenuOpen = p0.isContextualMenuOpen,
		layoutOrder = p0.layoutOrder,
		openContextualMenu = p0.openContextualMenu,
		profileActions = p0.profileActions,
		primaryButtonRef = p0.primaryButtonRef,
		moreButtonRef = p0.moreButtonRef,
		showPlusMoreMenuTooltip = var7,
		upsellTooltipProps = if var7 then reactModule.useMemo(function() --[[ line: 69 ]]
			-- upvalues: var6 (ref), var11 (ref), var12 (ref)
			return {
				plusMoreMenuTooltipTitle = nil,
				plusMoreMenuTooltipBody = var6.plusMoreMenuTooltipBody,
				onPlusMoreMenuTooltipClose = var11,
				onPlusMoreMenuTooltipDismiss = var12
			}
		end, { var6.plusMoreMenuTooltipBody, var11, var12 }) else nil
	})
end