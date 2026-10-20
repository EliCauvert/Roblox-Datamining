local AuthCommon = script:FindFirstAncestor("AuthCommon")
local Parent = AuthCommon.Parent
local ReactModule = require(Parent.React)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local UseAppPolicyFunction = require(Parent.UniversalAppPolicy).useAppPolicy
local AppLinking = require(Parent.RoactServiceTags).AppLinking
local NavigateDownFunction = require(Parent.NavigationRodux).Thunks.NavigateDown
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagEnablePioneerLandingPageLayout = SharedFlagsModule.FFlagEnablePioneerLandingPageLayout
local FFlagSignalsNavP3Dispatch = SharedFlagsModule.FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(Parent.RobloxAppNavigation).NavigationCommands else nil
local AppPage = require(Parent.RobloxAppEnums).AppPage
local UrlBuilder = require(Parent.UrlBuilder).UrlBuilder
local AuthAnalyticsModule = require(Parent.AuthAnalytics)
local AuthFormInteractionFunction = AuthAnalyticsModule.Events.authFormInteraction
local EventStreamConstants = AuthAnalyticsModule.EventStreamConstants
local OpenExternalBrowserModule = require(AuthCommon.Thunks.OpenExternalBrowser)
local TransitionAnimationModule = require(AuthCommon.Enums.TransitionAnimation)

return function(p1)
	-- upvalues: UseDispatchFunction (copy), UseRoactServiceFunction (copy), AppLinking (copy), UseAppPolicyFunction (copy), FFlagEnablePioneerLandingPageLayout (copy), OpenExternalBrowserModule (copy), AppPage (copy), TransitionAnimationModule (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownFunction (copy), ReactModule (copy), AuthFormInteractionFunction (copy), EventStreamConstants (copy), UrlBuilder (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseRoactServiceResult = UseRoactServiceFunction(AppLinking)
	local UseAppPolicyResult = UseAppPolicyFunction(function(p2)
		return p2.shouldUseExternalBrowserForDisclaimerLinks()
	end)
	local IsDisableExternalLinks = if FFlagEnablePioneerLandingPageLayout then if p1 then p1.disableExternalLinks == true else false else nil
	local UseResult = ReactModule.useCallback(function(Detail, p2)
		-- upvalues: UseAppPolicyResult (copy), IsDisableExternalLinks (ref), OpenExternalBrowserModule (upval), UseRoactServiceResult (copy), AppPage (upval), TransitionAnimationModule (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (copy), NavigateDownFunction (upval)
		if UseAppPolicyResult and not IsDisableExternalLinks then
			OpenExternalBrowserModule(UseRoactServiceResult, Detail)
			
			return
		end
		local config = {
			name = AppPage.GenericWebPage,
			detail = Detail,
			extraProps = {
				title = if p2 and p2.title ~= nil then p2.title else "",
				transitionAnimation = if p2 and p2.transitionAnimation ~= nil then p2.transitionAnimation else TransitionAnimationModule.SlideInFromRight
			}
		}
		
		if FFlagSignalsNavP3Dispatch then
			NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
			
			return
		else
			UseDispatchResult(NavigateDownFunction(config))
		end
	end, {
		UseAppPolicyResult,
		UseRoactServiceResult,
		UseDispatchResult,
		if FFlagEnablePioneerLandingPageLayout then IsDisableExternalLinks else nil
	})
	local Ctx = if p1 then p1.ctx else nil
	local State = if p1 then p1.state else nil
	local Origin = if p1 then p1.origin else nil
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: Ctx (copy), AuthFormInteractionFunction (upval), EventStreamConstants (upval), State (copy), Origin (copy), UseResult (copy), UrlBuilder (upval)
		if Ctx then
			AuthFormInteractionFunction(Ctx, EventStreamConstants.Field.TermsOfService, State, Origin)
		end
		UseResult(UrlBuilder.static.about.terms())
	end, { UseResult, Ctx, State, Origin })
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: Ctx (copy), AuthFormInteractionFunction (upval), EventStreamConstants (upval), State (copy), Origin (copy), UseResult (copy), UrlBuilder (upval)
		if Ctx then
			AuthFormInteractionFunction(Ctx, EventStreamConstants.Field.PrivacyPolicy, State, Origin)
		end
		UseResult(UrlBuilder.static.about.privacy())
	end, { UseResult, Ctx, State, Origin })
	
	return ReactModule.useMemo(function()
		-- upvalues: UseResult1 (copy), UseResult2 (copy), UseResult (copy)
		return {
			openTerms = UseResult1,
			openPrivacy = UseResult2,
			openLink = UseResult
		}
	end, { UseResult1, UseResult2, UseResult })
end