local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local AppStorageService = game:GetService("AppStorageService")
local Parent = ProfilePlatform.Parent
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local TextKeysModule = require(ProfilePlatform.Common.TextKeys)
local ProfileActionBarModule = require(ProfilePlatform.Components.ProfileActionBar.ProfileActionBar)
local GetFIntProfilePlatformCurrencyTransferTooltipMaxImpressionsModule = require(ProfilePlatform.Flags.GetFIntProfilePlatformCurrencyTransferTooltipMaxImpressions)
local _ = require(ProfilePlatform.Types.UpsellTooltipProps)

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), TextKeysModule (copy), ReactModule (copy), GetFIntProfilePlatformCurrencyTransferTooltipMaxImpressionsModule (copy), AppStorageService (copy), ProfileActionBarModule (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		plusMoreMenuTooltipBody = TextKeysModule.CurrencyTransferTooltipBody
	})
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseRefResult = ReactModule.useRef(false)
	local CurrencyTransferProfileActionTooltipStorageKeyEngineFeature = game:GetEngineFeature("CurrencyTransferProfileActionTooltipStorageKey")
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy), CurrencyTransferProfileActionTooltipStorageKeyEngineFeature (copy), GetFIntProfilePlatformCurrencyTransferTooltipMaxImpressionsModule (upval), AppStorageService (upval), UseStateResult2 (copy)
		if UseRefResult.current then return end
		if CurrencyTransferProfileActionTooltipStorageKeyEngineFeature then
			local Number: number = tonumber(AppStorageService:GetItem("CurrencyTransferProfileActionTooltipImpressionsCount")) or 0
			
			if GetFIntProfilePlatformCurrencyTransferTooltipMaxImpressionsModule() <= Number then return end
			AppStorageService:SetItem("CurrencyTransferProfileActionTooltipImpressionsCount", (tostring(Number + 1)))
			AppStorageService:Flush()
		end
		UseRefResult.current = true
		UseStateResult2(true)
	end, {
		CurrencyTransferProfileActionTooltipStorageKeyEngineFeature
	})
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: CurrencyTransferProfileActionTooltipStorageKeyEngineFeature (copy), GetFIntProfilePlatformCurrencyTransferTooltipMaxImpressionsModule (upval), AppStorageService (upval), UseStateResult2 (copy)
		if CurrencyTransferProfileActionTooltipStorageKeyEngineFeature then
			AppStorageService:SetItem("CurrencyTransferProfileActionTooltipImpressionsCount", (tostring((GetFIntProfilePlatformCurrencyTransferTooltipMaxImpressionsModule()))))
			AppStorageService:Flush()
		end
		UseStateResult2(false)
	end, {
		CurrencyTransferProfileActionTooltipStorageKeyEngineFeature
	})
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(false)
	end, {})
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseLocalizationResult (copy), UseResult (copy), UseResult1 (copy)
		return {
			plusMoreMenuTooltipTitle = nil,
			plusMoreMenuTooltipBody = UseLocalizationResult.plusMoreMenuTooltipBody,
			onPlusMoreMenuTooltipClose = UseResult,
			onPlusMoreMenuTooltipDismiss = UseResult1
		}
	end, {
		UseLocalizationResult.plusMoreMenuTooltipBody,
		UseResult,
		UseResult1
	})
	
	return ReactModule.createElement(ProfileActionBarModule, {
		isContextualMenuOpen = p1.isContextualMenuOpen,
		layoutOrder = p1.layoutOrder,
		openContextualMenu = p1.openContextualMenu,
		profileActions = p1.profileActions,
		primaryButtonRef = p1.primaryButtonRef,
		moreButtonRef = p1.moreButtonRef,
		showPlusMoreMenuTooltip = UseStateResult,
		upsellTooltipProps = if UseStateResult then UseMemoResult else nil
	})
end