local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local ReactModule = require(Parent.React)
local _ = require(Parent.SocialCommon)
local _ = require(ProfilePlatform.Types.Component)
local BuildUserActionsComponentModule = require(ProfilePlatform.Hooks.buildUserActionsComponent)
local GetDeepValueModule = require(ProfilePlatform.Utils.getDeepValue)
local UseProfileWrapperContextModule = require(ProfilePlatform.Contexts.useProfileWrapperContext)
local UseAreWebViewsSupportedModule = require(ProfilePlatform.Hooks.useAreWebViewsSupported)
local UseIsProfileQrCodeEnabledModule = require(ProfilePlatform.Hooks.useIsProfileQrCodeEnabled)
local UseCanRenderTransferOnProfileModule = require(ProfilePlatform.Hooks.useCanRenderTransferOnProfile)
local UseCanSeeChatTabModule = require(ProfilePlatform.Hooks.useCanSeeChatTab)
local UseLocalUserIdFunction = require(Parent.RobloxAppHooks).useLocalUserId
local FFlagProfilePlatformEnableCurrencyTransfer = require(Parent.SharedFlags).FFlagProfilePlatformEnableCurrencyTransfer

return function() --[[ Line: 20 ]]
	-- upvalues: UseProfileWrapperContextModule (copy), GetDeepValueModule (copy), UseAreWebViewsSupportedModule (copy), UseIsProfileQrCodeEnabledModule (copy), UseCanRenderTransferOnProfileModule (copy), UseCanSeeChatTabModule (copy), UseLocalUserIdFunction (copy), ReactModule (copy), BuildUserActionsComponentModule (copy), FFlagProfilePlatformEnableCurrencyTransfer (copy)
	local UseProfileWrapperContextModuleResult = UseProfileWrapperContextModule()
	local SourceInfoContextualInfoType = GetDeepValueModule(UseProfileWrapperContextModuleResult, "sourceInfo.contextualInfoType")
	local UseAreWebViewsSupportedModuleResult = UseAreWebViewsSupportedModule()
	local UseIsProfileQrCodeEnabledModuleResult = UseIsProfileQrCodeEnabledModule()
	local UseCanRenderTransferOnProfileModuleResult = UseCanRenderTransferOnProfileModule()
	local UseCanSeeChatTabModuleResult = UseCanSeeChatTabModule()
	local IsTextMatch = tostring(UseProfileWrapperContextModuleResult.profileId) == tostring((UseLocalUserIdFunction()))
	
	return ReactModule.useMemo(function() --[[ Line: 31 ]]
		-- upvalues: BuildUserActionsComponentModule (upval), SourceInfoContextualInfoType (copy), UseAreWebViewsSupportedModuleResult (copy), UseIsProfileQrCodeEnabledModuleResult (copy), FFlagProfilePlatformEnableCurrencyTransfer (upval), UseCanRenderTransferOnProfileModuleResult (copy), UseCanSeeChatTabModuleResult (copy), IsTextMatch (copy)
		return BuildUserActionsComponentModule(SourceInfoContextualInfoType, {
			areWebViewsSupported = UseAreWebViewsSupportedModuleResult,
			isProfileQrCodeEnabled = UseIsProfileQrCodeEnabledModuleResult,
			canRenderTransferInProfile = if FFlagProfilePlatformEnableCurrencyTransfer then UseCanRenderTransferOnProfileModuleResult else false,
			canSeeChatTab = UseCanSeeChatTabModuleResult,
			isSelfView = IsTextMatch
		})
	end, {
		SourceInfoContextualInfoType, UseAreWebViewsSupportedModuleResult,
		UseIsProfileQrCodeEnabledModuleResult,
		if FFlagProfilePlatformEnableCurrencyTransfer then UseCanRenderTransferOnProfileModuleResult else nil,
		UseCanSeeChatTabModuleResult, IsTextMatch
	})
end