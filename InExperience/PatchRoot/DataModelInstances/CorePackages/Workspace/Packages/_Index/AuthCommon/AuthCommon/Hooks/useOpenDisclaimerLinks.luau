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
local var3 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil
local appPage = require(parent.RobloxAppEnums).AppPage
local urlBuilder = require(parent.UrlBuilder).UrlBuilder
local authAnalyticsModule = require(parent.AuthAnalytics)
local authFormInteraction = authAnalyticsModule.Events.authFormInteraction
local eventStreamConstants = authAnalyticsModule.EventStreamConstants
local openExternalBrowserModule = require(authCommon.Thunks.OpenExternalBrowser)
local transitionAnimationModule = require(authCommon.Enums.TransitionAnimation)

return function(p0)
	-- upvalues: useDispatch (ref), useRoactService (ref), appLinking (ref), useAppPolicy (ref), fFlagEnablePioneerLandingPageLayout (ref), openExternalBrowserModule (ref), appPage (ref), transitionAnimationModule (ref), fFlagSignalsNavP3Dispatch (ref), var3 (ref), navigateDown (ref), reactModule (ref), authFormInteraction (ref), eventStreamConstants (ref), urlBuilder (ref)
	local var7 = useDispatch()
	local var8 = useRoactService(appLinking)
	local var9 = useAppPolicy(function(p1)
		return p1.shouldUseExternalBrowserForDisclaimerLinks()
	end)
	local var10 = nil
	
	if fFlagEnablePioneerLandingPageLayout then
		if p0 then
			var10 = p0.disableExternalLinks == true
			var10 = nil
		else
			var10 = false
		end
	end
	local var11 = reactModule.useCallback(function(p2, p3)
		-- upvalues: var9 (ref), var10 (write), openExternalBrowserModule (copy), var8 (ref), appPage (copy), transitionAnimationModule (copy), fFlagSignalsNavP3Dispatch (copy), var3 (copy), var7 (ref), navigateDown (copy)
		if var9 and not var10 then
			openExternalBrowserModule(var8, p2)
			
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
			var3.down(var3.fromLegacyPage(t))
			
			return
		end
		var7(navigateDown(t))
	end, {
		var9,
		var8,
		var7,
		if fFlagEnablePioneerLandingPageLayout then var10 else nil
	})
	local var12 = if p0 then p0.ctx else nil
	local var13 = if p0 then p0.state else nil
	local var14 = reactModule.useCallback(function()
		-- upvalues: var12 (ref), authFormInteraction (copy), eventStreamConstants (copy), var13 (ref), var11 (ref), urlBuilder (copy)
		if var12 then
			authFormInteraction(var12, eventStreamConstants.Field.TermsOfService, var13)
		end
		var11(urlBuilder.static.about.terms())
	end, { var11, var12, var13 })
	local var15 = reactModule.useCallback(function()
		-- upvalues: var12 (ref), authFormInteraction (copy), eventStreamConstants (copy), var13 (ref), var11 (ref), urlBuilder (copy)
		if var12 then
			authFormInteraction(var12, eventStreamConstants.Field.PrivacyPolicy, var13)
		end
		var11(urlBuilder.static.about.privacy())
	end, { var11, var12, var13 })
	
	return reactModule.useMemo(function()
		-- upvalues: var14 (ref), var15 (ref), var11 (ref)
		return { openTerms = var14, openPrivacy = var15, openLink = var11 }
	end, { var14, var15, var11 })
end