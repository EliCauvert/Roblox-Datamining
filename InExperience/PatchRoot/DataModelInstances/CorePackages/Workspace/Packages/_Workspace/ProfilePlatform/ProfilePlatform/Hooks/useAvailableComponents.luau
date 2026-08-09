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
local fFlagProfilePlatformFilterChatActionByPolicyModule = require(profilePlatform.Flags.FFlagProfilePlatformFilterChatActionByPolicy)

return function() --[[ line: 25 ]]
	-- upvalues: useProfileWrapperContextModule (ref), getDeepValueModule (ref), useAreWebViewsSupportedModule (ref), useIsProfileQrCodeEnabledModule (ref), useCanRenderTransferOnProfileModule (ref), fFlagProfilePlatformFilterChatActionByPolicyModule (ref), useCanSeeChatTabModule (ref), fFlagProfilePlatformCTAsRefactorModule (ref), useLocalUserId (ref), reactModule (ref), enumsModule (ref), getAvailableUserComponentsModule (ref), fFlagProfilePlatformEnableVRModule (ref), fFlagProfilePlatformEnableCurrencyTransfer (ref), getAvailableCommunityComponentsModule (ref), getAvailableContactComponentsModule (ref)
	local var22
	local var15 = useProfileWrapperContextModule()
	local profileType = var15.profileType
	local var16 = getDeepValueModule(var15, "sourceInfo.contextualInfoType")
	local var17 = useAreWebViewsSupportedModule()
	local var18 = useIsProfileQrCodeEnabledModule()
	local var19 = useCanRenderTransferOnProfileModule()
	local var20 = if fFlagProfilePlatformFilterChatActionByPolicyModule then useCanSeeChatTabModule() else nil
	local var21 = if fFlagProfilePlatformCTAsRefactorModule then useLocalUserId() else nil
	
	if fFlagProfilePlatformCTAsRefactorModule then
		var22 = tostring(var15.profileId) == tostring(var21)
		var22 = nil
	else
		var22 = false
	end
	return reactModule.useMemo(function() --[[ line: 40 ]]
		-- upvalues: profileType (ref), enumsModule (copy), getAvailableUserComponentsModule (copy), var16 (ref), fFlagProfilePlatformEnableVRModule (copy), var17 (ref), var18 (ref), fFlagProfilePlatformEnableCurrencyTransfer (copy), var19 (ref), fFlagProfilePlatformFilterChatActionByPolicyModule (copy), var20 (ref), fFlagProfilePlatformCTAsRefactorModule (copy), var22 (ref), getAvailableCommunityComponentsModule (copy), getAvailableContactComponentsModule (copy)
		return if profileType == enumsModule.ProfileTypes.User then getAvailableUserComponentsModule(var16, if fFlagProfilePlatformEnableVRModule then {
			areWebViewsSupported = var17,
			isProfileQrCodeEnabled = var18,
			canRenderTransferInProfile = if fFlagProfilePlatformEnableCurrencyTransfer then var19 else false,
			canSeeChatTab = if fFlagProfilePlatformFilterChatActionByPolicyModule then var20 else nil,
			isSelfView = if fFlagProfilePlatformCTAsRefactorModule then var22 else nil
		} else {
			canRenderTransferInProfile = if fFlagProfilePlatformEnableCurrencyTransfer then var19 else false,
			canSeeChatTab = if fFlagProfilePlatformFilterChatActionByPolicyModule then var20 else nil,
			isSelfView = if fFlagProfilePlatformCTAsRefactorModule then var22 else nil
		}) elseif profileType == enumsModule.ProfileTypes.Community then getAvailableCommunityComponentsModule() elseif profileType == enumsModule.ProfileTypes.Contact then getAvailableContactComponentsModule() else {}
	end, if fFlagProfilePlatformEnableVRModule then {
		profileType,
		var16,
		if fFlagProfilePlatformCTAsRefactorModule then var22 else nil,
		if fFlagProfilePlatformEnableCurrencyTransfer then var19 else nil,
		if fFlagProfilePlatformFilterChatActionByPolicyModule then var20 else nil
	} else {
		profileType, var16, var17, var18,
		if fFlagProfilePlatformCTAsRefactorModule then var22 else nil,
		if fFlagProfilePlatformEnableCurrencyTransfer then var19 else nil,
		if fFlagProfilePlatformFilterChatActionByPolicyModule then var20 else nil
	})
end