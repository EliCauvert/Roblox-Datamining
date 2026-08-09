local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local reactModule = require(parent.React)
local _ = require(parent.SocialCommon)
local _ = require(profilePlatform.Types.Component)
local buildUserActionsComponentModule = require(profilePlatform.Hooks.buildUserActionsComponent)
local getDeepValueModule = require(profilePlatform.Utils.getDeepValue)
local useProfileWrapperContextModule = require(profilePlatform.Contexts.useProfileWrapperContext)
local useAreWebViewsSupportedModule = require(profilePlatform.Hooks.useAreWebViewsSupported)
local useIsProfileQrCodeEnabledModule = require(profilePlatform.Hooks.useIsProfileQrCodeEnabled)
local useCanRenderTransferOnProfileModule = require(profilePlatform.Hooks.useCanRenderTransferOnProfile)
local useCanSeeChatTabModule = require(profilePlatform.Hooks.useCanSeeChatTab)
local useLocalUserId = require(parent.RobloxAppHooks).useLocalUserId
local fFlagProfilePlatformEnableCurrencyTransfer = require(parent.SharedFlags).FFlagProfilePlatformEnableCurrencyTransfer
local fFlagProfilePlatformCTAsRefactorModule = require(profilePlatform.Flags.FFlagProfilePlatformCTAsRefactor)
local fFlagProfilePlatformFilterChatActionByPolicyModule = require(profilePlatform.Flags.FFlagProfilePlatformFilterChatActionByPolicy)

return function() --[[ line: 23 ]]
	-- upvalues: useProfileWrapperContextModule (ref), getDeepValueModule (ref), useAreWebViewsSupportedModule (ref), useIsProfileQrCodeEnabledModule (ref), useCanRenderTransferOnProfileModule (ref), fFlagProfilePlatformFilterChatActionByPolicyModule (ref), useCanSeeChatTabModule (ref), fFlagProfilePlatformCTAsRefactorModule (ref), useLocalUserId (ref), reactModule (ref), buildUserActionsComponentModule (ref), fFlagProfilePlatformEnableCurrencyTransfer (ref)
	local var18
	local var11 = useProfileWrapperContextModule()
	local var12 = getDeepValueModule(var11, "sourceInfo.contextualInfoType")
	local var13 = useAreWebViewsSupportedModule()
	local var14 = useIsProfileQrCodeEnabledModule()
	local var15 = useCanRenderTransferOnProfileModule()
	local var16 = if fFlagProfilePlatformFilterChatActionByPolicyModule then useCanSeeChatTabModule() else nil
	local var17 = if fFlagProfilePlatformCTAsRefactorModule then useLocalUserId() else nil
	
	if fFlagProfilePlatformCTAsRefactorModule then
		var18 = tostring(var11.profileId) == tostring(var17)
		var18 = nil
	else
		var18 = false
	end
	return reactModule.useMemo(function() --[[ line: 36 ]]
		-- upvalues: buildUserActionsComponentModule (copy), var12 (ref), var13 (ref), var14 (ref), fFlagProfilePlatformEnableCurrencyTransfer (copy), var15 (ref), fFlagProfilePlatformFilterChatActionByPolicyModule (copy), var16 (ref), fFlagProfilePlatformCTAsRefactorModule (copy), var18 (ref)
		return buildUserActionsComponentModule(var12, {
			areWebViewsSupported = var13,
			isProfileQrCodeEnabled = var14,
			canRenderTransferInProfile = if fFlagProfilePlatformEnableCurrencyTransfer then var15 else false,
			canSeeChatTab = if fFlagProfilePlatformFilterChatActionByPolicyModule then var16 else nil,
			isSelfView = if fFlagProfilePlatformCTAsRefactorModule then var18 else nil
		})
	end, {
		var12, var13, var14,
		if fFlagProfilePlatformEnableCurrencyTransfer then var15 else nil,
		if fFlagProfilePlatformFilterChatActionByPolicyModule then var16 else nil,
		if fFlagProfilePlatformCTAsRefactorModule then var18 else nil
	})
end