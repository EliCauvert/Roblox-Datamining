local SocialCarousel = script:FindFirstAncestor("SocialCarousel")
local Parent = SocialCarousel.Parent
local CanViewBuildModule = require(Parent.BuildExperiencePlaytestLaunch.canViewBuild)
local FoundationModule = require(Parent.Foundation)
local GameJoinCardModule = require(Parent.GameJoinCard)
local ReactModule = require(Parent.React)
local ResponsiveModule = require(Parent.Responsive)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local UseAppPolicyFunction = require(Parent.UniversalAppPolicy).useAppPolicy
local AppPage = require(Parent.RobloxAppEnums).AppPage
local FFlagMobileGameJoinCardGamepadSupport = require(Parent.SharedFlags).FFlagMobileGameJoinCardGamepadSupport
local UseSocialCarouselContextModule = require(SocialCarousel.Contexts.useSocialCarouselContext)
local IsPresenceInBuildFunction = require(Parent.DataHydration).Presence.isPresenceInBuild

return function(p1)
	-- upvalues: UseNavigationFunction (copy), UseSocialCarouselContextModule (copy), UseAppPolicyFunction (copy), CanViewBuildModule (copy), IsPresenceInBuildFunction (copy), UseLocalizationFunction (copy), ResponsiveModule (copy), FFlagMobileGameJoinCardGamepadSupport (copy), ReactModule (copy), AppPage (copy), FoundationModule (copy), GameJoinCardModule (copy)
	local UseNavigationResult = UseNavigationFunction()
	local UseSocialCarouselContextModuleResult = UseSocialCarouselContextModule()
	local OpenBuildCardUserId = UseSocialCarouselContextModuleResult.openBuildCardUserId
	local SetOpenBuildCardUserIdFunction = UseSocialCarouselContextModuleResult.setOpenBuildCardUserId
	local SetOpenGameJoinCardUserIdFunction = UseSocialCarouselContextModuleResult.setOpenGameJoinCardUserId
	local HasOpenGameJoinCardUserId = UseSocialCarouselContextModuleResult.openGameJoinCardUserId ~= nil
	local UserId = p1.userId
	local IsPresenceInBuild = UseAppPolicyFunction(CanViewBuildModule) and IsPresenceInBuildFunction(p1.presence)
	local UseLocalizationResult = UseLocalizationFunction({ build = "CommonUI.Features.NavBar.Build" })
	local IsPreferredInputMatch = p1.preferredInput == ResponsiveModule.Input.Touch or FFlagMobileGameJoinCardGamepadSupport and p1.isPhoneOrTablet
	local IsPreferredInputMatch1 = IsPreferredInputMatch or p1.preferredInput ~= ResponsiveModule.Input.Directional
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: SetOpenBuildCardUserIdFunction (copy), UserId (copy)
		SetOpenBuildCardUserIdFunction(function(UserId1)
			-- upvalues: UserId (upval)
			return if UserId1 == UserId then nil else UserId1
		end)
	end, { UserId, SetOpenBuildCardUserIdFunction })
	local NoIsPresenceInBuild: boolean = OpenBuildCardUserId == UserId and (not IsPresenceInBuild or HasOpenGameJoinCardUserId)
	ReactModule.useEffect(function()
		-- upvalues: NoIsPresenceInBuild (copy), UseResult (copy)
		if NoIsPresenceInBuild then
			UseResult()
		end
	end, { NoIsPresenceInBuild, UseResult })
	local NoHasOpenGameJoinCardUserId: boolean = IsPresenceInBuild and (OpenBuildCardUserId == UserId and not HasOpenGameJoinCardUserId)
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: IsPreferredInputMatch (copy), UseNavigationResult (copy), AppPage (upval), UserId (copy), SetOpenBuildCardUserIdFunction (copy), NoHasOpenGameJoinCardUserId (copy), SetOpenGameJoinCardUserIdFunction (copy)
		if IsPreferredInputMatch then
			UseNavigationResult.navigate(AppPage.BuildJoinCard, { userId = UserId })
			
			return
		end
		SetOpenBuildCardUserIdFunction(if NoHasOpenGameJoinCardUserId then nil else UserId)
		
		if SetOpenGameJoinCardUserIdFunction then
			SetOpenGameJoinCardUserIdFunction(nil)
		end
	end, {
		UseNavigationResult, UserId, IsPreferredInputMatch,
		NoHasOpenGameJoinCardUserId, SetOpenBuildCardUserIdFunction,
		SetOpenGameJoinCardUserIdFunction
	})
	
	return ReactModule.useMemo(function()
		-- upvalues: IsPresenceInBuild (copy), IsPreferredInputMatch1 (copy), UseResult1 (copy), UseLocalizationResult (copy), FoundationModule (upval), ReactModule (upval), GameJoinCardModule (upval), UserId (copy), NoHasOpenGameJoinCardUserId (copy), p1 (copy), UseResult (copy)
		return {
			isInBuild = IsPresenceInBuild,
			canOpen = IsPreferredInputMatch1,
			onActivated = UseResult1,
			contextualInfo = if IsPresenceInBuild then {
				text = UseLocalizationResult.build,
				icon = FoundationModule.Enums.IconName.Nebula
			} else nil,
			popover = if IsPresenceInBuild then ReactModule.createElement(GameJoinCardModule.BuildJoinCardPopover, {
				userId = UserId,
				isOpen = NoHasOpenGameJoinCardUserId,
				anchorRef = p1.anchorRef,
				onClose = UseResult,
				playerName = p1.playerName
			}) else nil
		}
	end, {
		IsPresenceInBuild, IsPreferredInputMatch1, UseResult1,
		UseLocalizationResult.build, UserId, NoHasOpenGameJoinCardUserId, p1.anchorRef,
		UseResult, p1.playerName
	})
end