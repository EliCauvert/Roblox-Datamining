local authCommon = script:FindFirstAncestor("AuthCommon")
local parent = authCommon.Parent
local reactModule = require(parent.React)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local useRoactService = require(parent.RobloxAppHooks).useRoactService
local useAppPolicy = require(parent.UniversalAppPolicy).useAppPolicy
local appLinking = require(parent.RoactServiceTags).AppLinking
local navigateDown = require(parent.NavigationRodux).Thunks.NavigateDown
local fFlagSignalsNavP3Dispatch = require(parent.SharedFlags).FFlagSignalsNavP3Dispatch
local var1 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil
local appPage = require(parent.RobloxAppEnums).AppPage
local urlBuilder = require(parent.UrlBuilder).UrlBuilder
local authAnalyticsModule = require(parent.AuthAnalytics)
local authFormInteraction = authAnalyticsModule.Events.authFormInteraction
local eventStreamConstants = authAnalyticsModule.EventStreamConstants
local openExternalBrowserModule = require(authCommon.Thunks.OpenExternalBrowser)
local transitionAnimationModule = require(authCommon.Enums.TransitionAnimation)

return function(p1)
	-- upvalues: useDispatch (ref), useRoactService (ref), appLinking (ref), useAppPolicy (ref), reactModule (ref), openExternalBrowserModule (ref), appPage (ref), transitionAnimationModule (ref), fFlagSignalsNavP3Dispatch (ref), var1 (ref), navigateDown (ref), authFormInteraction (ref), eventStreamConstants (ref), urlBuilder (ref)
	local var2 = useDispatch()
	local var3 = useRoactService(appLinking)
	local var4 = useAppPolicy(function(p2)
		return p2.shouldUseExternalBrowserForDisclaimerLinks()
	end)
	local var5 = reactModule.useCallback(function(p2, p3)
		-- upvalues: var4 (ref), openExternalBrowserModule (copy), var3 (ref), appPage (copy), transitionAnimationModule (copy), fFlagSignalsNavP3Dispatch (copy), var1 (copy), var2 (ref), navigateDown (copy)
		if var4 then
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
	end, { var4, var3, var2 })
	local var6 = if p1 then p1.ctx else nil
	local var7 = if p1 then p1.state else nil
	local var8 = reactModule.useCallback(function()
		-- upvalues: var6 (ref), authFormInteraction (copy), eventStreamConstants (copy), var7 (ref), var5 (ref), urlBuilder (copy)
		if var6 then
			authFormInteraction(var6, eventStreamConstants.Field.TermsOfService, var7)
		end
		var5(urlBuilder.static.about.terms())
	end, { var5, var6, var7 })
	local var9 = reactModule.useCallback(function()
		-- upvalues: var6 (ref), authFormInteraction (copy), eventStreamConstants (copy), var7 (ref), var5 (ref), urlBuilder (copy)
		if var6 then
			authFormInteraction(var6, eventStreamConstants.Field.PrivacyPolicy, var7)
		end
		var5(urlBuilder.static.about.privacy())
	end, { var5, var6, var7 })
	
	return reactModule.useMemo(function()
		-- upvalues: var8 (ref), var9 (ref), var5 (ref)
		return { openTerms = var8, openPrivacy = var9, openLink = var5 }
	end, { var8, var9, var5 })
end