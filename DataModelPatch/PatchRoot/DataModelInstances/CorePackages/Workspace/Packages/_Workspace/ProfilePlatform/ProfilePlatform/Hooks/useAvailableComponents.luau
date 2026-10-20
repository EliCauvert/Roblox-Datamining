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
local FFlagProfilePlatformCTAsRefactorModule = require(ProfilePlatform.Flags.FFlagProfilePlatformCTAsRefactor)
local FFlagProfilePlatformFilterChatActionByPolicyModule = require(ProfilePlatform.Flags.FFlagProfilePlatformFilterChatActionByPolicy)

return function()
	-- upvalues: UseProfileWrapperContextModule (copy), GetDeepValueModule (copy), UseAreWebViewsSupportedModule (copy), UseIsProfileQrCodeEnabledModule (copy), UseCanRenderTransferOnProfileModule (copy), FFlagProfilePlatformFilterChatActionByPolicyModule (copy), UseCanSeeChatTabModule (copy), FFlagProfilePlatformCTAsRefactorModule (copy), UseLocalUserIdFunction (copy), ReactModule (copy), EnumsModule (copy), GetAvailableUserComponentsModule (copy), FFlagProfilePlatformEnableVRModule (copy), FFlagProfilePlatformEnableCurrencyTransfer (copy), GetAvailableCommunityComponentsModule (copy), GetAvailableContactComponentsModule (copy)
	local UseProfileWrapperContextModuleResult = UseProfileWrapperContextModule()
	local ProfileType = UseProfileWrapperContextModuleResult.profileType
	local SourceInfoContextualInfoType = GetDeepValueModule(UseProfileWrapperContextModuleResult, "sourceInfo.contextualInfoType")
	local UseAreWebViewsSupportedModuleResult = UseAreWebViewsSupportedModule()
	local UseIsProfileQrCodeEnabledModuleResult = UseIsProfileQrCodeEnabledModule()
	local UseCanRenderTransferOnProfileModuleResult = UseCanRenderTransferOnProfileModule()
	local UseCanSeeChatTabModuleResult = if FFlagProfilePlatformFilterChatActionByPolicyModule then UseCanSeeChatTabModule() else nil
	local UseLocalUserIdResult = if FFlagProfilePlatformCTAsRefactorModule then UseLocalUserIdFunction() else nil
	local IsTextMatch: boolean = if FFlagProfilePlatformCTAsRefactorModule then tostring(UseProfileWrapperContextModuleResult.profileId) == tostring(UseLocalUserIdResult) else false
	
	return (ReactModule.useMemo(function()
		-- upvalues: ProfileType (copy), EnumsModule (upval), GetAvailableUserComponentsModule (upval), SourceInfoContextualInfoType (copy), FFlagProfilePlatformEnableVRModule (upval), UseAreWebViewsSupportedModuleResult (copy), UseIsProfileQrCodeEnabledModuleResult (copy), FFlagProfilePlatformEnableCurrencyTransfer (upval), UseCanRenderTransferOnProfileModuleResult (copy), FFlagProfilePlatformFilterChatActionByPolicyModule (upval), UseCanSeeChatTabModuleResult (copy), FFlagProfilePlatformCTAsRefactorModule (upval), IsTextMatch (copy), GetAvailableCommunityComponentsModule (upval), GetAvailableContactComponentsModule (upval)
		return if ProfileType == EnumsModule.ProfileTypes.User then GetAvailableUserComponentsModule(SourceInfoContextualInfoType, if FFlagProfilePlatformEnableVRModule then {
			areWebViewsSupported = UseAreWebViewsSupportedModuleResult,
			isProfileQrCodeEnabled = UseIsProfileQrCodeEnabledModuleResult,
			canRenderTransferInProfile = if FFlagProfilePlatformEnableCurrencyTransfer then UseCanRenderTransferOnProfileModuleResult else false,
			canSeeChatTab = if FFlagProfilePlatformFilterChatActionByPolicyModule then UseCanSeeChatTabModuleResult else nil,
			isSelfView = if FFlagProfilePlatformCTAsRefactorModule then IsTextMatch else nil
		} else {
			canRenderTransferInProfile = if FFlagProfilePlatformEnableCurrencyTransfer then UseCanRenderTransferOnProfileModuleResult else false,
			canSeeChatTab = if FFlagProfilePlatformFilterChatActionByPolicyModule then UseCanSeeChatTabModuleResult else nil,
			isSelfView = if FFlagProfilePlatformCTAsRefactorModule then IsTextMatch else nil
		}) elseif ProfileType == EnumsModule.ProfileTypes.Community then GetAvailableCommunityComponentsModule() elseif ProfileType == EnumsModule.ProfileTypes.Contact then GetAvailableContactComponentsModule() else {}
	end, if FFlagProfilePlatformEnableVRModule then {
		ProfileType,
		SourceInfoContextualInfoType,
		if FFlagProfilePlatformCTAsRefactorModule then IsTextMatch else nil,
		if FFlagProfilePlatformEnableCurrencyTransfer then UseCanRenderTransferOnProfileModuleResult else nil,
		if FFlagProfilePlatformFilterChatActionByPolicyModule then UseCanSeeChatTabModuleResult else nil
	} else {
		ProfileType, SourceInfoContextualInfoType, UseAreWebViewsSupportedModuleResult,
		UseIsProfileQrCodeEnabledModuleResult,
		if FFlagProfilePlatformCTAsRefactorModule then IsTextMatch else nil,
		if FFlagProfilePlatformEnableCurrencyTransfer then UseCanRenderTransferOnProfileModuleResult else nil,
		if FFlagProfilePlatformFilterChatActionByPolicyModule then UseCanSeeChatTabModuleResult else nil
	}))
end