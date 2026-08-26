local profileShareLinks = script:FindFirstAncestor("ProfileShareLinks")
local parent = profileShareLinks.Parent
local default = require(parent.ExternalContentSharingProtocol).ExternalContentSharingProtocol.default
local reactModule = require(parent.React)
local roactUtilsModule = require(parent.RoactUtils)
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local useEffectOnce = roactUtilsModule.Hooks.useEffectOnce
local setCurrentToastMessage = require(parent.ToastRodux).Actions.SetCurrentToastMessage
local _ = require(parent.SocialLuaAnalytics)
local profileSharePolicyEnumModule = require(profileShareLinks.Enums.ProfileSharePolicyEnum)
local useGetOrGenerateLinkUrlModule = require(profileShareLinks.Hooks.useGetOrGenerateLinkUrl)
local useShortUrlModule = require(profileShareLinks.Hooks.useShortUrl)
local useProfileSharePolicyModule = require(profileShareLinks.Hooks.useProfileSharePolicy)
local useAnalyticsModule = require(profileShareLinks.Analytics.useAnalytics)
local eventNamesModule = require(profileShareLinks.Analytics.EventNames)
local textKeysModule = require(profileShareLinks.Common.TextKeys)

return function(p1)
	-- upvalues: useAnalyticsModule (ref), useDispatch (ref), useProfileSharePolicyModule (ref), useGetOrGenerateLinkUrlModule (ref), useShortUrlModule (ref), useEffectOnce (ref), profileSharePolicyEnumModule (ref), reactModule (ref), eventNamesModule (ref), default (ref), setCurrentToastMessage (ref), textKeysModule (ref)
	local var1 = p1.enableFetch == nil or p1.enableFetch
	local var2 = useAnalyticsModule()
	local var3 = useDispatch()
	local var4 = useProfileSharePolicyModule()
	local var5 = useGetOrGenerateLinkUrlModule()
	local var6 = useShortUrlModule()
	local var7 = var6 ~= nil
	useEffectOnce(var5, not var7 and (var4 ~= profileSharePolicyEnumModule.Disabled and var1))
	
	return {
		hasLoaded = var7,
		policy = var4,
		onActivated = reactModule.useCallback(function()
			-- upvalues: var4 (ref), profileSharePolicyEnumModule (copy), var6 (ref), var2 (ref), eventNamesModule (copy), p1 (ref), default (copy), var3 (ref), setCurrentToastMessage (copy), textKeysModule (copy)
			if var4 == profileSharePolicyEnumModule.Disabled or var6 == nil then return end
			local var8 = tostring(DateTime.now().UnixTimestampMillis)
			local var9 = `{var6}&source=ProfileShare&stamp={var8}`
			var2.fireAnalyticsEvent(eventNamesModule.ProfileShareLinkActivated, { context = p1.context, shareType = var4, stamp = var8 })
			default:shareUrl({ context = p1.context, url = var9 })
			
			if var4 == profileSharePolicyEnumModule.Copy then
				var3(setCurrentToastMessage({ toastMessage = textKeysModule.LinkCopied }))
			end
		end, {
			var4,
			var6,
			p1.context,
			var2,
			var3
		})
	}
end