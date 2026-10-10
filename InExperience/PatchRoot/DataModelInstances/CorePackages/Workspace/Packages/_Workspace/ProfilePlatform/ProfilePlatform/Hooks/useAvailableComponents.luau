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

return function()
	-- upvalues: useProfileWrapperContextModule (ref), getDeepValueModule (ref), useAreWebViewsSupportedModule (ref), useIsProfileQrCodeEnabledModule (ref), useCanRenderTransferOnProfileModule (ref), useCanSeeChatTabModule (ref), useLocalUserId (ref), reactModule (ref), enumsModule (ref), getAvailableUserComponentsModule (ref), fFlagProfilePlatformEnableVRModule (ref), fFlagProfilePlatformEnableCurrencyTransfer (ref), getAvailableCommunityComponentsModule (ref), getAvailableContactComponentsModule (ref)
	local var1 = useProfileWrapperContextModule()
	local profileType = var1.profileType
	local var2 = getDeepValueModule(var1, "sourceInfo.contextualInfoType")
	local var3 = useAreWebViewsSupportedModule()
	local var4 = useIsProfileQrCodeEnabledModule()
	local var5 = useCanRenderTransferOnProfileModule()
	local var6 = useCanSeeChatTabModule()
	local var7 = tostring(var1.profileId) == tostring(useLocalUserId())
	
	return reactModule.useMemo(function()
		-- upvalues: profileType (ref), enumsModule (copy), getAvailableUserComponentsModule (copy), var2 (ref), fFlagProfilePlatformEnableVRModule (copy), var3 (ref), var4 (ref), fFlagProfilePlatformEnableCurrencyTransfer (copy), var5 (ref), var6 (ref), var7 (ref), getAvailableCommunityComponentsModule (copy), getAvailableContactComponentsModule (copy)
		return if profileType == enumsModule.ProfileTypes.User then getAvailableUserComponentsModule(var2, if fFlagProfilePlatformEnableVRModule then {
			areWebViewsSupported = var3,
			isProfileQrCodeEnabled = var4,
			canRenderTransferInProfile = if fFlagProfilePlatformEnableCurrencyTransfer then var5 else false,
			canSeeChatTab = var6,
			isSelfView = var7
		} else {
			canRenderTransferInProfile = if fFlagProfilePlatformEnableCurrencyTransfer then var5 else false,
			canSeeChatTab = var6,
			isSelfView = var7
		}) elseif profileType == enumsModule.ProfileTypes.Community then getAvailableCommunityComponentsModule() elseif profileType == enumsModule.ProfileTypes.Contact then getAvailableContactComponentsModule() else {}
	end, if fFlagProfilePlatformEnableVRModule then {
		profileType,
		var2,
		var7,
		if fFlagProfilePlatformEnableCurrencyTransfer then var5 else nil,
		var6
	} else {
		profileType, var2, var3, var4, var7,
		if fFlagProfilePlatformEnableCurrencyTransfer then var5 else nil, var6
	})
end