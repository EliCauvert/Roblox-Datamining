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

return function()
	-- upvalues: useProfileWrapperContextModule (ref), getDeepValueModule (ref), useAreWebViewsSupportedModule (ref), useIsProfileQrCodeEnabledModule (ref), useCanRenderTransferOnProfileModule (ref), useCanSeeChatTabModule (ref), fFlagProfilePlatformCTAsRefactorModule (ref), useLocalUserId (ref), reactModule (ref), buildUserActionsComponentModule (ref), fFlagProfilePlatformEnableCurrencyTransfer (ref)
	local var1
	local var2 = useProfileWrapperContextModule()
	local var3 = getDeepValueModule(var2, "sourceInfo.contextualInfoType")
	local var4 = useAreWebViewsSupportedModule()
	local var5 = useIsProfileQrCodeEnabledModule()
	local var6 = useCanRenderTransferOnProfileModule()
	local var7 = useCanSeeChatTabModule()
	local var8 = if fFlagProfilePlatformCTAsRefactorModule then useLocalUserId() else nil
	
	if fFlagProfilePlatformCTAsRefactorModule then
		var1 = tostring(var2.profileId) == tostring(var8)
		var1 = nil
	else
		var1 = false
	end
	return reactModule.useMemo(function()
		-- upvalues: buildUserActionsComponentModule (copy), var3 (ref), var4 (ref), var5 (ref), fFlagProfilePlatformEnableCurrencyTransfer (copy), var6 (ref), var7 (ref), fFlagProfilePlatformCTAsRefactorModule (copy), var1 (ref)
		return buildUserActionsComponentModule(var3, {
			areWebViewsSupported = var4,
			isProfileQrCodeEnabled = var5,
			canRenderTransferInProfile = if fFlagProfilePlatformEnableCurrencyTransfer then var6 else false,
			canSeeChatTab = var7,
			isSelfView = if fFlagProfilePlatformCTAsRefactorModule then var1 else nil
		})
	end, {
		var3, var4, var5,
		if fFlagProfilePlatformEnableCurrencyTransfer then var6 else nil, var7,
		if fFlagProfilePlatformCTAsRefactorModule then var1 else nil
	})
end