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

return function()
	-- upvalues: useProfileWrapperContextModule (ref), getDeepValueModule (ref), useAreWebViewsSupportedModule (ref), useIsProfileQrCodeEnabledModule (ref), useCanRenderTransferOnProfileModule (ref), useCanSeeChatTabModule (ref), useLocalUserId (ref), reactModule (ref), buildUserActionsComponentModule (ref), fFlagProfilePlatformEnableCurrencyTransfer (ref)
	local var1 = useProfileWrapperContextModule()
	local var2 = getDeepValueModule(var1, "sourceInfo.contextualInfoType")
	local var3 = useAreWebViewsSupportedModule()
	local var4 = useIsProfileQrCodeEnabledModule()
	local var5 = useCanRenderTransferOnProfileModule()
	local var6 = useCanSeeChatTabModule()
	local var7 = tostring(var1.profileId) == tostring(useLocalUserId())
	
	return reactModule.useMemo(function()
		-- upvalues: buildUserActionsComponentModule (copy), var2 (ref), var3 (ref), var4 (ref), fFlagProfilePlatformEnableCurrencyTransfer (copy), var5 (ref), var6 (ref), var7 (ref)
		return buildUserActionsComponentModule(var2, {
			areWebViewsSupported = var3,
			isProfileQrCodeEnabled = var4,
			canRenderTransferInProfile = if fFlagProfilePlatformEnableCurrencyTransfer then var5 else false,
			canSeeChatTab = var6,
			isSelfView = var7
		})
	end, {
		var2, var3, var4,
		if fFlagProfilePlatformEnableCurrencyTransfer then var5 else nil, var6, var7
	})
end