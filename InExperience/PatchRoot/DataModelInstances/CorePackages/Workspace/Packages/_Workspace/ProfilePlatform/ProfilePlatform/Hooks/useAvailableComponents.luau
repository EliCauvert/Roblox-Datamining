local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local reactModule = require(parent.React)
local _ = require(parent.SocialCommon)
local _ = require(profilePlatform.Types.Component)
local enumsModule = require(profilePlatform.Common.Enums)
local getAvailableUserComponentsModule = require(profilePlatform.Hooks.getAvailableUserComponents)
local getAvailableCommunityComponentsModule = require(profilePlatform.Hooks.getAvailableCommunityComponents)
local getAvailableContactComponentsModule = require(profilePlatform.Hooks.getAvailableContactComponents)
local getDeepValueModule = require(profilePlatform.Utils.getDeepValue)
local useProfileWrapperContextModule = require(profilePlatform.Contexts.useProfileWrapperContext)
local useAreWebViewsSupportedModule = require(profilePlatform.Hooks.useAreWebViewsSupported)
local useIsProfileQrCodeEnabledModule = require(profilePlatform.Hooks.useIsProfileQrCodeEnabled)
local useCanRenderTransferOnProfileModule = require(profilePlatform.Hooks.useCanRenderTransferOnProfile)
local useCanSeeChatTabModule = require(profilePlatform.Hooks.useCanSeeChatTab)
local useLocalUserId = require(parent.RobloxAppHooks).useLocalUserId
local fFlagProfilePlatformEnableVRModule = require(profilePlatform.Flags.FFlagProfilePlatformEnableVR)
local fFlagProfilePlatformEnableCurrencyTransfer = require(parent.SharedFlags).FFlagProfilePlatformEnableCurrencyTransfer
local fFlagProfilePlatformCTAsRefactorModule = require(profilePlatform.Flags.FFlagProfilePlatformCTAsRefactor)

return function()
	-- upvalues: useProfileWrapperContextModule (ref), getDeepValueModule (ref), useAreWebViewsSupportedModule (ref), useIsProfileQrCodeEnabledModule (ref), useCanRenderTransferOnProfileModule (ref), useCanSeeChatTabModule (ref), fFlagProfilePlatformCTAsRefactorModule (ref), useLocalUserId (ref), reactModule (ref), enumsModule (ref), getAvailableUserComponentsModule (ref), fFlagProfilePlatformEnableVRModule (ref), fFlagProfilePlatformEnableCurrencyTransfer (ref), getAvailableCommunityComponentsModule (ref), getAvailableContactComponentsModule (ref)
	local var21
	local var14 = useProfileWrapperContextModule()
	local profileType = var14.profileType
	local var15 = getDeepValueModule(var14, "sourceInfo.contextualInfoType")
	local var16 = useAreWebViewsSupportedModule()
	local var17 = useIsProfileQrCodeEnabledModule()
	local var18 = useCanRenderTransferOnProfileModule()
	local var19 = useCanSeeChatTabModule()
	local var20 = if fFlagProfilePlatformCTAsRefactorModule then useLocalUserId() else nil
	
	if fFlagProfilePlatformCTAsRefactorModule then
		var21 = tostring(var14.profileId) == tostring(var20)
		var21 = nil
	else
		var21 = false
	end
	return reactModule.useMemo(function()
		-- upvalues: profileType (ref), enumsModule (copy), getAvailableUserComponentsModule (copy), var15 (ref), fFlagProfilePlatformEnableVRModule (copy), var16 (ref), var17 (ref), fFlagProfilePlatformEnableCurrencyTransfer (copy), var18 (ref), var19 (ref), fFlagProfilePlatformCTAsRefactorModule (copy), var21 (ref), getAvailableCommunityComponentsModule (copy), getAvailableContactComponentsModule (copy)
		return if profileType == enumsModule.ProfileTypes.User then getAvailableUserComponentsModule(var15, if fFlagProfilePlatformEnableVRModule then {
			areWebViewsSupported = var16,
			isProfileQrCodeEnabled = var17,
			canRenderTransferInProfile = if fFlagProfilePlatformEnableCurrencyTransfer then var18 else false,
			canSeeChatTab = var19,
			isSelfView = if fFlagProfilePlatformCTAsRefactorModule then var21 else nil
		} else {
			canRenderTransferInProfile = if fFlagProfilePlatformEnableCurrencyTransfer then var18 else false,
			canSeeChatTab = var19,
			isSelfView = if fFlagProfilePlatformCTAsRefactorModule then var21 else nil
		}) elseif profileType == enumsModule.ProfileTypes.Community then getAvailableCommunityComponentsModule() elseif profileType == enumsModule.ProfileTypes.Contact then getAvailableContactComponentsModule() else {}
	end, if fFlagProfilePlatformEnableVRModule then {
		profileType,
		var15,
		if fFlagProfilePlatformCTAsRefactorModule then var21 else nil,
		if fFlagProfilePlatformEnableCurrencyTransfer then var18 else nil,
		var19
	} else {
		profileType, var15, var16, var17,
		if fFlagProfilePlatformCTAsRefactorModule then var21 else nil,
		if fFlagProfilePlatformEnableCurrencyTransfer then var18 else nil, var19
	})
end