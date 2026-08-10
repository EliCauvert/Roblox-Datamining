local authCommon = script:FindFirstAncestor("AuthCommon")
local parent = authCommon.Parent
local reactModule = require(parent.React)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local useRoactService = require(parent.RobloxAppHooks).useRoactService
local useAppPolicy = require(parent.UniversalAppPolicy).useAppPolicy
local appLinking = require(parent.RoactServiceTags).AppLinking
local navigateDown = require(parent.NavigationRodux).Thunks.NavigateDown
local fFlagSignalsNavP3Dispatch = require(parent.SharedFlags).FFlagSignalsNavP3Dispatch
local var2 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil
local appPage = require(parent.RobloxAppEnums).AppPage
local urlBuilder = require(parent.UrlBuilder).UrlBuilder
local authAnalyticsModule = require(parent.AuthAnalytics)
local authFormInteraction = authAnalyticsModule.Events.authFormInteraction
local eventStreamConstants = authAnalyticsModule.EventStreamConstants
local openExternalBrowserModule = require(authCommon.Thunks.OpenExternalBrowser)
local transitionAnimationModule = require(authCommon.Enums.TransitionAnimation)

return function(p0) --[[ line: 48 | named "useOpenDisclaimerLinks" ]]
	-- upvalues: useDispatch (ref), useRoactService (ref), appLinking (ref), useAppPolicy (ref), reactModule (ref), openExternalBrowserModule (ref), appPage (ref), transitionAnimationModule (ref), fFlagSignalsNavP3Dispatch (ref), var2 (ref), navigateDown (ref), authFormInteraction (ref), eventStreamConstants (ref), urlBuilder (ref)
	local var6 = useDispatch()
	local var7 = useRoactService(appLinking)
	local var8 = useAppPolicy(function(p1) --[[ line: 51 ]]
		return p1.shouldUseExternalBrowserForDisclaimerLinks()
	end)
	local var9 = reactModule.useCallback(function(p2, p3) --[[ line: 55 ]]
		-- upvalues: var8 (ref), openExternalBrowserModule (copy), var7 (ref), appPage (copy), transitionAnimationModule (copy), fFlagSignalsNavP3Dispatch (copy), var2 (copy), var6 (ref), navigateDown (copy)
		if var8 then
			openExternalBrowserModule(var7, p2)
			
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
			var2.down(var2.fromLegacyPage(t))
			
			return
		end
		var6(navigateDown(t))
	end, { var8, var7, var6 })
	local var10 = if p0 then p0.ctx else nil
	local var11 = if p0 then p0.state else nil
	local var12 = reactModule.useCallback(function() --[[ line: 81 ]]
		-- upvalues: var10 (ref), authFormInteraction (copy), eventStreamConstants (copy), var11 (ref), var9 (ref), urlBuilder (copy)
		if var10 then
			authFormInteraction(var10, eventStreamConstants.Field.TermsOfService, var11)
		end
		var9(urlBuilder.static.about.terms())
	end, { var9, var10, var11 })
	local var13 = reactModule.useCallback(function() --[[ line: 88 ]]
		-- upvalues: var10 (ref), authFormInteraction (copy), eventStreamConstants (copy), var11 (ref), var9 (ref), urlBuilder (copy)
		if var10 then
			authFormInteraction(var10, eventStreamConstants.Field.PrivacyPolicy, var11)
		end
		var9(urlBuilder.static.about.privacy())
	end, { var9, var10, var11 })
	
	return reactModule.useMemo(function() --[[ line: 97 ]]
		-- upvalues: var12 (ref), var13 (ref), var9 (ref)
		return { openTerms = var12, openPrivacy = var13, openLink = var9 }
	end, { var12, var13, var9 })
end