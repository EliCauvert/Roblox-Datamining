local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local ReactModule = require(Parent.React)
local _ = require(Parent.SocialCommon)
local _ = require(ProfilePlatform.Types.Component)
local EnumsModule = require(ProfilePlatform.Common.Enums)
local GetAvailableUserComponentsModule = require(ProfilePlatform.Hooks.getAvailableUserComponents)
local GetAvailableCommunityComponentsModule = require(ProfilePlatform.Hooks.getAvailableCommunityComponents)
local GetAvailableContactComponentsModule = require(ProfilePlatform.Hooks.getAvailableContactComponents)
local GetDeepValueModule = require(ProfilePlatform.Utils.getDeepValue)
local UseProfileWrapperContextModule = require(ProfilePlatform.Contexts.useProfileWrapperContext)
local UseAreWebViewsSupportedModule = require(ProfilePlatform.Hooks.useAreWebViewsSupported)
local UseIsProfileQrCodeEnabledModule = require(ProfilePlatform.Hooks.useIsProfileQrCodeEnabled)
local UseCanRenderTransferOnProfileModule = require(ProfilePlatform.Hooks.useCanRenderTransferOnProfile)
local UseCanSeeChatTabModule = require(ProfilePlatform.Hooks.useCanSeeChatTab)
local UseLocalUserIdFunction = require(Parent.RobloxAppHooks).useLocalUserId
local FFlagProfilePlatformEnableVRModule = require(ProfilePlatform.Flags.FFlagProfilePlatformEnableVR)
local FFlagProfilePlatformEnableCurrencyTransfer = require(Parent.SharedFlags).FFlagProfilePlatformEnableCurrencyTransfer

return function() --[[ Line: 22 ]]
	-- upvalues: UseProfileWrapperContextModule (copy), GetDeepValueModule (copy), UseAreWebViewsSupportedModule (copy), UseIsProfileQrCodeEnabledModule (copy), UseCanRenderTransferOnProfileModule (copy), UseCanSeeChatTabModule (copy), UseLocalUserIdFunction (copy), ReactModule (copy), EnumsModule (copy), GetAvailableUserComponentsModule (copy), FFlagProfilePlatformEnableVRModule (copy), FFlagProfilePlatformEnableCurrencyTransfer (copy), GetAvailableCommunityComponentsModule (copy), GetAvailableContactComponentsModule (copy)
	local UseProfileWrapperContextModuleResult = UseProfileWrapperContextModule()
	local ProfileType = UseProfileWrapperContextModuleResult.profileType
	local SourceInfoContextualInfoType = GetDeepValueModule(UseProfileWrapperContextModuleResult, "sourceInfo.contextualInfoType")
	local UseAreWebViewsSupportedModuleResult = UseAreWebViewsSupportedModule()
	local UseIsProfileQrCodeEnabledModuleResult = UseIsProfileQrCodeEnabledModule()
	local UseCanRenderTransferOnProfileModuleResult = UseCanRenderTransferOnProfileModule()
	local UseCanSeeChatTabModuleResult = UseCanSeeChatTabModule()
	local IsTextMatch = tostring(UseProfileWrapperContextModuleResult.profileId) == tostring((UseLocalUserIdFunction()))
	
	return (ReactModule.useMemo(function() --[[ Line: 35 ]]
		-- upvalues: ProfileType (copy), EnumsModule (upval), GetAvailableUserComponentsModule (upval), SourceInfoContextualInfoType (copy), FFlagProfilePlatformEnableVRModule (upval), UseAreWebViewsSupportedModuleResult (copy), UseIsProfileQrCodeEnabledModuleResult (copy), FFlagProfilePlatformEnableCurrencyTransfer (upval), UseCanRenderTransferOnProfileModuleResult (copy), UseCanSeeChatTabModuleResult (copy), IsTextMatch (copy), GetAvailableCommunityComponentsModule (upval), GetAvailableContactComponentsModule (upval)
		return if ProfileType == EnumsModule.ProfileTypes.User then GetAvailableUserComponentsModule(SourceInfoContextualInfoType, if FFlagProfilePlatformEnableVRModule then {
			areWebViewsSupported = UseAreWebViewsSupportedModuleResult,
			isProfileQrCodeEnabled = UseIsProfileQrCodeEnabledModuleResult,
			canRenderTransferInProfile = if FFlagProfilePlatformEnableCurrencyTransfer then UseCanRenderTransferOnProfileModuleResult else false,
			canSeeChatTab = UseCanSeeChatTabModuleResult,
			isSelfView = IsTextMatch
		} else {
			canRenderTransferInProfile = if FFlagProfilePlatformEnableCurrencyTransfer then UseCanRenderTransferOnProfileModuleResult else false,
			canSeeChatTab = UseCanSeeChatTabModuleResult,
			isSelfView = IsTextMatch
		}) elseif ProfileType == EnumsModule.ProfileTypes.Community then GetAvailableCommunityComponentsModule() elseif ProfileType == EnumsModule.ProfileTypes.Contact then GetAvailableContactComponentsModule() else {}
	end, if FFlagProfilePlatformEnableVRModule then {
		ProfileType,
		SourceInfoContextualInfoType,
		IsTextMatch,
		if FFlagProfilePlatformEnableCurrencyTransfer then UseCanRenderTransferOnProfileModuleResult else nil,
		UseCanSeeChatTabModuleResult
	} else {
		ProfileType, SourceInfoContextualInfoType, UseAreWebViewsSupportedModuleResult,
		UseIsProfileQrCodeEnabledModuleResult, IsTextMatch,
		if FFlagProfilePlatformEnableCurrencyTransfer then UseCanRenderTransferOnProfileModuleResult else nil,
		UseCanSeeChatTabModuleResult
	}))
end