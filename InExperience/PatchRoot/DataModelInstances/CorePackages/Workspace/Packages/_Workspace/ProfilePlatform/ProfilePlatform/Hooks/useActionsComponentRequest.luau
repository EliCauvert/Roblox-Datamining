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

return function() --[[ line: 21 ]]
	-- upvalues: useProfileWrapperContextModule (ref), getDeepValueModule (ref), useAreWebViewsSupportedModule (ref), useIsProfileQrCodeEnabledModule (ref), useCanRenderTransferOnProfileModule (ref), useCanSeeChatTabModule (ref), fFlagProfilePlatformCTAsRefactorModule (ref), useLocalUserId (ref), reactModule (ref), buildUserActionsComponentModule (ref), fFlagProfilePlatformEnableCurrencyTransfer (ref)
	local var17
	local var10 = useProfileWrapperContextModule()
	local var11 = getDeepValueModule(var10, "sourceInfo.contextualInfoType")
	local var12 = useAreWebViewsSupportedModule()
	local var13 = useIsProfileQrCodeEnabledModule()
	local var14 = useCanRenderTransferOnProfileModule()
	local var15 = useCanSeeChatTabModule()
	local var16 = if fFlagProfilePlatformCTAsRefactorModule then useLocalUserId() else nil
	
	if fFlagProfilePlatformCTAsRefactorModule then
		var17 = tostring(var10.profileId) == tostring(var16)
		var17 = nil
	else
		var17 = false
	end
	return reactModule.useMemo(function() --[[ line: 34 ]]
		-- upvalues: buildUserActionsComponentModule (copy), var11 (ref), var12 (ref), var13 (ref), fFlagProfilePlatformEnableCurrencyTransfer (copy), var14 (ref), var15 (ref), fFlagProfilePlatformCTAsRefactorModule (copy), var17 (ref)
		return buildUserActionsComponentModule(var11, {
			areWebViewsSupported = var12,
			isProfileQrCodeEnabled = var13,
			canRenderTransferInProfile = if fFlagProfilePlatformEnableCurrencyTransfer then var14 else false,
			canSeeChatTab = var15,
			isSelfView = if fFlagProfilePlatformCTAsRefactorModule then var17 else nil
		})
	end, {
		var11, var12, var13,
		if fFlagProfilePlatformEnableCurrencyTransfer then var14 else nil, var15,
		if fFlagProfilePlatformCTAsRefactorModule then var17 else nil
	})
end