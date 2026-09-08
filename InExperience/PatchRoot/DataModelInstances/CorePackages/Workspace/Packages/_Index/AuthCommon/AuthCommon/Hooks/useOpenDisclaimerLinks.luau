local authCommon = script:FindFirstAncestor("AuthCommon")
local parent = authCommon.Parent
local reactModule = require(parent.React)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local useRoactService = require(parent.RobloxAppHooks).useRoactService
local useAppPolicy = require(parent.UniversalAppPolicy).useAppPolicy
local appLinking = require(parent.RoactServiceTags).AppLinking
local navigateDown = require(parent.NavigationRodux).Thunks.NavigateDown
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagEnablePioneerLandingPageLayout = sharedFlagsModule.FFlagEnablePioneerLandingPageLayout
local fFlagSignalsNavP3Dispatch = sharedFlagsModule.FFlagSignalsNavP3Dispatch
local var1 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil
local appPage = require(parent.RobloxAppEnums).AppPage
local urlBuilder = require(parent.UrlBuilder).UrlBuilder
local authAnalyticsModule = require(parent.AuthAnalytics)
local authFormInteraction = authAnalyticsModule.Events.authFormInteraction
local eventStreamConstants = authAnalyticsModule.EventStreamConstants
local openExternalBrowserModule = require(authCommon.Thunks.OpenExternalBrowser)
local transitionAnimationModule = require(authCommon.Enums.TransitionAnimation)

return function(p1)
	-- upvalues: useDispatch (ref), useRoactService (ref), appLinking (ref), useAppPolicy (ref), fFlagEnablePioneerLandingPageLayout (ref), openExternalBrowserModule (ref), appPage (ref), transitionAnimationModule (ref), fFlagSignalsNavP3Dispatch (ref), var1 (ref), navigateDown (ref), reactModule (ref), authFormInteraction (ref), eventStreamConstants (ref), urlBuilder (ref)
	local var2 = useDispatch()
	local var3 = useRoactService(appLinking)
	local var4 = useAppPolicy(function(p2)
		return p2.shouldUseExternalBrowserForDisclaimerLinks()
	end)
	local var5 = nil
	
	if fFlagEnablePioneerLandingPageLayout then
		if p1 then
			var5 = p1.disableExternalLinks == true
			var5 = nil
		else
			var5 = false
		end
	end
	local var6 = reactModule.useCallback(function(p2, p3)
		-- upvalues: var4 (ref), var5 (write), openExternalBrowserModule (copy), var3 (ref), appPage (copy), transitionAnimationModule (copy), fFlagSignalsNavP3Dispatch (copy), var1 (copy), var2 (ref), navigateDown (copy)
		if var4 and not var5 then
			openExternalBrowserModule(var3, p2)
			
			return
		end
		local t = {
			name = appPage.GenericWebPage,
			detail = p2,
			extraProps = {
				title = if p3 and p3.title ~= nil then p3.title else "",
				transitionAnimation = if p3 and p3.transitionAnimation ~= nil then p3.transitionAnimation else transitionAnimationModule.SlideInFromRight
			}
		}
		
		if fFlagSignalsNavP3Dispatch then
			var1.down(var1.fromLegacyPage(t))
			
			return
		end
		var2(navigateDown(t))
	end, {
		var4,
		var3,
		var2,
		if fFlagEnablePioneerLandingPageLayout then var5 else nil
	})
	local var7 = if p1 then p1.ctx else nil
	local var8 = if p1 then p1.state else nil
	local var9 = reactModule.useCallback(function()
		-- upvalues: var7 (ref), authFormInteraction (copy), eventStreamConstants (copy), var8 (ref), var6 (ref), urlBuilder (copy)
		if var7 then
			authFormInteraction(var7, eventStreamConstants.Field.TermsOfService, var8)
		end
		var6(urlBuilder.static.about.terms())
	end, { var6, var7, var8 })
	local var10 = reactModule.useCallback(function()
		-- upvalues: var7 (ref), authFormInteraction (copy), eventStreamConstants (copy), var8 (ref), var6 (ref), urlBuilder (copy)
		if var7 then
			authFormInteraction(var7, eventStreamConstants.Field.PrivacyPolicy, var8)
		end
		var6(urlBuilder.static.about.privacy())
	end, { var6, var7, var8 })
	
	return reactModule.useMemo(function()
		-- upvalues: var9 (ref), var10 (ref), var6 (ref)
		return { openTerms = var9, openPrivacy = var10, openLink = var6 }
	end, { var9, var10, var6 })
end