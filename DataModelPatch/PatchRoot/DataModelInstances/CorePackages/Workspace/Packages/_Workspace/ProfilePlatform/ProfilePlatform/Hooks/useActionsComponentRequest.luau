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
local FFlagProfilePlatformCTAsRefactorModule = require(ProfilePlatform.Flags.FFlagProfilePlatformCTAsRefactor)
local FFlagProfilePlatformFilterChatActionByPolicyModule = require(ProfilePlatform.Flags.FFlagProfilePlatformFilterChatActionByPolicy)

return function()
	-- upvalues: UseProfileWrapperContextModule (copy), GetDeepValueModule (copy), UseAreWebViewsSupportedModule (copy), UseIsProfileQrCodeEnabledModule (copy), UseCanRenderTransferOnProfileModule (copy), FFlagProfilePlatformFilterChatActionByPolicyModule (copy), UseCanSeeChatTabModule (copy), FFlagProfilePlatformCTAsRefactorModule (copy), UseLocalUserIdFunction (copy), ReactModule (copy), BuildUserActionsComponentModule (copy), FFlagProfilePlatformEnableCurrencyTransfer (copy)
	local UseProfileWrapperContextModuleResult = UseProfileWrapperContextModule()
	local SourceInfoContextualInfoType = GetDeepValueModule(UseProfileWrapperContextModuleResult, "sourceInfo.contextualInfoType")
	local UseAreWebViewsSupportedModuleResult = UseAreWebViewsSupportedModule()
	local UseIsProfileQrCodeEnabledModuleResult = UseIsProfileQrCodeEnabledModule()
	local UseCanRenderTransferOnProfileModuleResult = UseCanRenderTransferOnProfileModule()
	local UseCanSeeChatTabModuleResult = if FFlagProfilePlatformFilterChatActionByPolicyModule then UseCanSeeChatTabModule() else nil
	local UseLocalUserIdResult = if FFlagProfilePlatformCTAsRefactorModule then UseLocalUserIdFunction() else nil
	local IsTextMatch: boolean = if FFlagProfilePlatformCTAsRefactorModule then tostring(UseProfileWrapperContextModuleResult.profileId) == tostring(UseLocalUserIdResult) else false
	
	return ReactModule.useMemo(function()
		-- upvalues: BuildUserActionsComponentModule (upval), SourceInfoContextualInfoType (copy), UseAreWebViewsSupportedModuleResult (copy), UseIsProfileQrCodeEnabledModuleResult (copy), FFlagProfilePlatformEnableCurrencyTransfer (upval), UseCanRenderTransferOnProfileModuleResult (copy), FFlagProfilePlatformFilterChatActionByPolicyModule (upval), UseCanSeeChatTabModuleResult (copy), FFlagProfilePlatformCTAsRefactorModule (upval), IsTextMatch (copy)
		return BuildUserActionsComponentModule(SourceInfoContextualInfoType, {
			areWebViewsSupported = UseAreWebViewsSupportedModuleResult,
			isProfileQrCodeEnabled = UseIsProfileQrCodeEnabledModuleResult,
			canRenderTransferInProfile = if FFlagProfilePlatformEnableCurrencyTransfer then UseCanRenderTransferOnProfileModuleResult else false,
			canSeeChatTab = if FFlagProfilePlatformFilterChatActionByPolicyModule then UseCanSeeChatTabModuleResult else nil,
			isSelfView = if FFlagProfilePlatformCTAsRefactorModule then IsTextMatch else nil
		})
	end, {
		SourceInfoContextualInfoType, UseAreWebViewsSupportedModuleResult,
		UseIsProfileQrCodeEnabledModuleResult,
		if FFlagProfilePlatformEnableCurrencyTransfer then UseCanRenderTransferOnProfileModuleResult else nil,
		if FFlagProfilePlatformFilterChatActionByPolicyModule then UseCanSeeChatTabModuleResult else nil,
		if FFlagProfilePlatformCTAsRefactorModule then IsTextMatch else nil
	})
end