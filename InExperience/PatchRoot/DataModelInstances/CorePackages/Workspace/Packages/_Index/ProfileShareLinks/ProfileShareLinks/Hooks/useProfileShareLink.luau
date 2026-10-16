local ProfileShareLinks = script:FindFirstAncestor("ProfileShareLinks")
local Parent = ProfileShareLinks.Parent
local Default = require(Parent.ExternalContentSharingProtocol).ExternalContentSharingProtocol.default
local ReactModule = require(Parent.React)
local RoactUtilsModule = require(Parent.RoactUtils)
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local UseEffectOnceFunction = RoactUtilsModule.Hooks.useEffectOnce
local SetCurrentToastMessageFunction = require(Parent.ToastRodux).Actions.SetCurrentToastMessage
local _ = require(Parent.SocialLuaAnalytics)
local ProfileSharePolicyEnumModule = require(ProfileShareLinks.Enums.ProfileSharePolicyEnum)
local UseGetOrGenerateLinkUrlModule = require(ProfileShareLinks.Hooks.useGetOrGenerateLinkUrl)
local UseShortUrlModule = require(ProfileShareLinks.Hooks.useShortUrl)
local UseProfileSharePolicyModule = require(ProfileShareLinks.Hooks.useProfileSharePolicy)
local UseAnalyticsModule = require(ProfileShareLinks.Analytics.useAnalytics)
local EventNamesModule = require(ProfileShareLinks.Analytics.EventNames)
local TextKeysModule = require(ProfileShareLinks.Common.TextKeys)

return function(p1) --[[ Line: 31 ]]
	-- upvalues: UseAnalyticsModule (copy), UseDispatchFunction (copy), UseProfileSharePolicyModule (copy), UseGetOrGenerateLinkUrlModule (copy), UseShortUrlModule (copy), UseEffectOnceFunction (copy), ProfileSharePolicyEnumModule (copy), ReactModule (copy), EventNamesModule (copy), Default (copy), SetCurrentToastMessageFunction (copy), TextKeysModule (copy)
	local NoEnableFetch = p1.enableFetch == nil or p1.enableFetch
	local UseAnalyticsModuleResult = UseAnalyticsModule()
	local UseDispatchResult = UseDispatchFunction()
	local UseProfileSharePolicyModuleResult = UseProfileSharePolicyModule()
	local UseGetOrGenerateLinkUrlModuleResult = UseGetOrGenerateLinkUrlModule()
	local UseShortUrlModuleResult = UseShortUrlModule()
	local HasUseShortUrlModuleResult = UseShortUrlModuleResult ~= nil
	UseEffectOnceFunction(UseGetOrGenerateLinkUrlModuleResult, not HasUseShortUrlModuleResult and (UseProfileSharePolicyModuleResult ~= ProfileSharePolicyEnumModule.Disabled and NoEnableFetch))
	
	return {
		hasLoaded = HasUseShortUrlModuleResult,
		policy = UseProfileSharePolicyModuleResult,
		onActivated = ReactModule.useCallback(function() --[[ Line: 45 ]]
			-- upvalues: UseProfileSharePolicyModuleResult (copy), ProfileSharePolicyEnumModule (upval), UseShortUrlModuleResult (copy), UseAnalyticsModuleResult (copy), EventNamesModule (upval), p1 (copy), Default (upval), UseDispatchResult (copy), SetCurrentToastMessageFunction (upval), TextKeysModule (upval)
			if UseProfileSharePolicyModuleResult == ProfileSharePolicyEnumModule.Disabled or UseShortUrlModuleResult == nil then return end
			local Text = tostring(DateTime.now().UnixTimestampMillis)
			local ProfileShareName: string = `{UseShortUrlModuleResult}&source=ProfileShare&stamp={Text}`
			UseAnalyticsModuleResult.fireAnalyticsEvent(EventNamesModule.ProfileShareLinkActivated, {
				context = p1.context,
				shareType = UseProfileSharePolicyModuleResult,
				stamp = Text
			})
			Default:shareUrl({ context = p1.context, url = ProfileShareName })
			
			if UseProfileSharePolicyModuleResult == ProfileSharePolicyEnumModule.Copy then
				UseDispatchResult(SetCurrentToastMessageFunction({ toastMessage = TextKeysModule.LinkCopied }))
			end
		end, {
			UseProfileSharePolicyModuleResult,
			UseShortUrlModuleResult,
			p1.context,
			UseAnalyticsModuleResult,
			UseDispatchResult
		})
	}
end