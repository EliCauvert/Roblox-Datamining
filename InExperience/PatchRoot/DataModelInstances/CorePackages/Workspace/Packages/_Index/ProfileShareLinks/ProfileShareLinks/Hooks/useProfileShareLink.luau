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

return function(p0) --[[ line: 31 ]]
	-- upvalues: useAnalyticsModule (ref), useDispatch (ref), useProfileSharePolicyModule (ref), useGetOrGenerateLinkUrlModule (ref), useShortUrlModule (ref), useEffectOnce (ref), profileSharePolicyEnumModule (ref), reactModule (ref), eventNamesModule (ref), default (ref), setCurrentToastMessage (ref), textKeysModule (ref)
	local var10 = p0.enableFetch == nil or p0.enableFetch
	local var11 = useAnalyticsModule()
	local var12 = useDispatch()
	local var13 = useProfileSharePolicyModule()
	local var14 = useGetOrGenerateLinkUrlModule()
	local var15 = useShortUrlModule()
	local var16 = var15 ~= nil
	useEffectOnce(var14, not var16 and (var13 ~= profileSharePolicyEnumModule.Disabled and var10))
	
	return {
		hasLoaded = var16,
		policy = var13,
		onActivated = reactModule.useCallback(function() --[[ line: 45 ]]
			-- upvalues: var13 (ref), profileSharePolicyEnumModule (copy), var15 (ref), var11 (ref), eventNamesModule (copy), p0 (ref), default (copy), var12 (ref), setCurrentToastMessage (copy), textKeysModule (copy)
			if var13 == profileSharePolicyEnumModule.Disabled or var15 == nil then return end
			local var17 = tostring(DateTime.now().UnixTimestampMillis)
			local var18 = `{var15}&source=ProfileShare&stamp={var17}`
			var11.fireAnalyticsEvent(eventNamesModule.ProfileShareLinkActivated, { context = p0.context, shareType = var13, stamp = var17 })
			default:shareUrl({ context = p0.context, url = var18 })
			
			if var13 == profileSharePolicyEnumModule.Copy then
				var12(setCurrentToastMessage({ toastMessage = textKeysModule.LinkCopied }))
			end
		end, {
			var13,
			var15,
			p0.context,
			var11,
			var12
		})
	}
end