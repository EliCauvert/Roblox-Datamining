local EditProfile = script:FindFirstAncestor("EditProfile")
local Players = game:GetService("Players")
local Parent = EditProfile.Parent
local NavigationRoduxModule = require(Parent.NavigationRodux)
local NavigateToRouteFunction = NavigationRoduxModule.Thunks.NavigateToRoute
local AppPage = require(Parent.RobloxAppEnums).AppPage
local ReactModule = require(Parent.React)
local UserProfilesModule = require(Parent.UserProfiles)
local RoactUtilsModule = require(Parent.RoactUtils)
local EditProfileEntryPointModule = require(script.Parent.EditProfileEntryPoint)
local UseLocalUserIdFunction = require(Parent.RobloxAppHooks).useLocalUserId
local UseLocalRobuxBalanceFunction = require(Parent.RobloxAppHooks).useLocalRobuxBalance
local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector
local ProfileScreens = require(EditProfile.Common.Constants).ProfileScreens
local UsersNetworkingModule = require(EditProfile.Networking.UsersNetworking)
local SocialStopwatchModule = require(Parent.SocialStopwatch)
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local UseEffectOnMountFunction = RoactUtilsModule.Hooks.useEffectOnMount
local Images = require(Parent.UIBlox).App.ImageSet.Images
local GetDeepValueFunction = require(Parent.LuaSocialLibrariesDeps).SocialLibraries.config({}).Dictionary.getDeepValue
local UseEffectOnceFunction = RoactUtilsModule.Hooks.useEffectOnce
local NavigateDownFunction = NavigationRoduxModule.Thunks.NavigateDown
local FFlagSignalsNavP3Dispatch = require(Parent.SharedFlags).FFlagSignalsNavP3Dispatch
local FFlagAXEnableProfileTab = require(Parent.SharedFlags).FFlagAXEnableProfileTab
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(Parent.RobloxAppNavigation).NavigationCommands else nil
local SocialNetworksInEditProfileIXPModule = require(EditProfile.Flags.SocialNetworksInEditProfileIXP)
local SocialLinksNetworkingModule = require(EditProfile.Networking.SocialLinksNetworking)
local SocialToastModule = require(Parent.SocialToast)
local LoadingStages = require(Parent.SocialLuaAnalytics).Analytics.Enums.LoadingStages
local UseUserExperimentFunction = require(Parent.RoactAppExperiment).useUserExperiment
local FStringEditProfileToAvatarLayerNameModule = require(EditProfile.Flags.FStringEditProfileToAvatarLayerName)
local FFlagEditProfileFixFocusNavigationModule = require(EditProfile.Flags.FFlagEditProfileFixFocusNavigation)
local FocusNavigatorWrapperModule = require(EditProfile.Utils.FocusNavigatorWrapper)
local FFlagEditProfileNavigateToAvatarModule = require(EditProfile.Flags.FFlagEditProfileNavigateToAvatar)
local AnalyticsModule = require(EditProfile.Analytics)
local EventNames = AnalyticsModule.EventNames
local UseAnalyticsFunction = AnalyticsModule.useAnalytics
local FFlagMoveInExperienceModeToEditProfile = require(Parent.SharedFlags).FFlagMoveInExperienceModeToEditProfile
local FFlagEditProfileBackgroundEnabled = require(Parent.SharedFlags).FFlagEditProfileBackgroundEnabled

return function(p1)
	-- upvalues: UseDispatchFunction (copy), UseLocalUserIdFunction (copy), ProfileScreens (copy), ReactModule (copy), UseSelectorFunction (copy), GetDeepValueFunction (copy), FFlagMoveInExperienceModeToEditProfile (copy), SocialNetworksInEditProfileIXPModule (copy), Players (copy), UseLocalRobuxBalanceFunction (copy), AppPage (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownFunction (copy), UseEffectOnMountFunction (copy), UsersNetworkingModule (copy), UseAnalyticsFunction (copy), UseUserExperimentFunction (copy), FStringEditProfileToAvatarLayerNameModule (copy), EventNames (copy), SocialLinksNetworkingModule (copy), SocialToastModule (copy), Images (copy), NavigateToRouteFunction (copy), UserProfilesModule (copy), SocialStopwatchModule (copy), LoadingStages (copy), UseEffectOnceFunction (copy), FFlagAXEnableProfileTab (copy), FFlagEditProfileFixFocusNavigationModule (copy), FocusNavigatorWrapperModule (copy), EditProfileEntryPointModule (copy), FFlagEditProfileNavigateToAvatarModule (copy), FFlagEditProfileBackgroundEnabled (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseLocalUserIdResult = UseLocalUserIdFunction()
	local Username = ""
	local DisplayName = ""
	local ShouldShimmerName = true
	local Param = p1.navigation.getParam(ProfileScreens)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local _ = UseSelectorFunction(function(p2)
		-- upvalues: GetDeepValueFunction (upval), UseLocalUserIdResult (copy)
		return GetDeepValueFunction(p2, `Profile.AdditionalUserFields.{UseLocalUserIdResult}.description`)
	end)
	local UseSelectorResult = if FFlagMoveInExperienceModeToEditProfile then UseSelectorFunction(function(p2)
		-- upvalues: GetDeepValueFunction (upval), UseLocalUserIdResult (copy)
		return GetDeepValueFunction(p2, `Profile.AdditionalUserFields.{UseLocalUserIdResult}.userProfileSettings`)
	end) else nil
	local IsInExperienceNameEnabled = nil
	local InExperienceName = nil
	local InExperienceNameExpirationTime = nil
	
	if FFlagMoveInExperienceModeToEditProfile and UseSelectorResult ~= nil then
		IsInExperienceNameEnabled = UseSelectorResult.isInExperienceNameEnabled
		InExperienceName = UseSelectorResult.inExperienceName
		InExperienceNameExpirationTime = UseSelectorResult.inExperienceNameExpirationTime
	end
	local FFlagSocialNetworksInEditProfileIXPSetupEnabled = SocialNetworksInEditProfileIXPModule.GetFFlagSocialNetworksInEditProfileIXPSetupEnabled()
	local UseGetExperimentVariantResult = SocialNetworksInEditProfileIXPModule.useGetExperimentVariant({ isExposureEnabled = true })
	local IsNotUseGetExperimentVariantResultMatch: boolean = UseGetExperimentVariantResult and UseGetExperimentVariantResult ~= SocialNetworksInEditProfileIXPModule.Variants.Control
	local UseSelectorResult1 = if FFlagSocialNetworksInEditProfileIXPSetupEnabled then UseSelectorFunction(function(p2)
		-- upvalues: GetDeepValueFunction (upval)
		return GetDeepValueFunction(p2, "Profile.SocialLinks.selfSocialLinks") or {}
	end) else nil
	local Under13 = if FFlagSocialNetworksInEditProfileIXPSetupEnabled and IsNotUseGetExperimentVariantResultMatch and Players.LocalPlayer then Players.LocalPlayer:GetUnder13() else false
	local UseLocalRobuxBalanceResult = UseLocalRobuxBalanceFunction()
	local NavigateToEditUsernameParam = p1.navigation.getParam("navigateToEditUsername")
	
	local function NavigateDownToPurchaseRobux()
		-- upvalues: AppPage (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (copy), NavigateDownFunction (upval)
		local list = { { name = AppPage.PurchaseRobux } }
		
		if FFlagSignalsNavP3Dispatch then
			NavigationCommands.down(NavigationCommands.fromLegacyPage(list[#list]))
			
			return
		else
			UseDispatchResult(NavigateDownFunction(list))
		end
	end
	
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState("")
	UseEffectOnMountFunction(function()
		-- upvalues: UseDispatchResult (copy), UsersNetworkingModule (upval), UseLocalUserIdResult (copy), UseStateResult2_1 (copy)
		UseDispatchResult(UsersNetworkingModule.GetUserV2FromUserId.API(UseLocalUserIdResult)):andThen(function(Result)
			-- upvalues: UseStateResult2_1 (upval)
			UseStateResult2_1(Result.responseBody.description or "")
		end):catch(function()
			-- upvalues: UseStateResult2_1 (upval)
			UseStateResult2_1("")
		end)
	end)
	local UseAnalyticsResult = UseAnalyticsFunction()
	local OnIdentityChangeParam = p1.navigation.getParam("onIdentityChange")
	local UseResult = ReactModule.useCallback(function(p2)
		-- upvalues: UseStateResult2_1 (copy), OnIdentityChangeParam (copy)
		UseStateResult2_1(p2)
		
		if OnIdentityChangeParam then
			OnIdentityChangeParam()
		end
	end, { UseStateResult2_1, OnIdentityChangeParam })
	local UseResult1 = ReactModule.useCallback(function(p2)
		-- upvalues: UseStateResult2 (copy), OnIdentityChangeParam (copy)
		UseStateResult2(p2)
		
		if OnIdentityChangeParam then
			OnIdentityChangeParam()
		end
	end, { UseStateResult2, OnIdentityChangeParam })
	local UseUserExperimentResult = UseUserExperimentFunction({ FStringEditProfileToAvatarLayerNameModule }, function(p2)
		-- upvalues: FStringEditProfileToAvatarLayerNameModule (upval)
		return (p2[FStringEditProfileToAvatarLayerNameModule] or {}).profile_picture_on
	end)
	UseEffectOnMountFunction(function()
		-- upvalues: UseAnalyticsResult (copy), EventNames (upval), UseDispatchResult (copy), UsersNetworkingModule (upval), UseLocalUserIdResult (copy), UseStateResult2 (copy), FFlagSocialNetworksInEditProfileIXPSetupEnabled (copy), IsNotUseGetExperimentVariantResultMatch (copy), SocialLinksNetworkingModule (upval)
		UseAnalyticsResult.fireAnalyticsEvent(EventNames.EditProfileOpened)
		UseDispatchResult(UsersNetworkingModule.GetDisplayNameValidation.API(UseLocalUserIdResult, "Test")):andThen(function(_)
			-- upvalues: UseStateResult2 (upval)
			UseStateResult2(true)
		end):catch(function(_) end)
		
		if FFlagSocialNetworksInEditProfileIXPSetupEnabled and IsNotUseGetExperimentVariantResultMatch then
			UseDispatchResult(SocialLinksNetworkingModule.GetSelfSocialLinks.API({ alwaysReturnUrls = false, filterLink = false })):catch(function(_) end)
		end
	end)
	local UseOpenToastResult = SocialToastModule.useOpenToast()
	
	local function showToast(ToastTitle)
		-- upvalues: UseOpenToastResult (copy), Images (upval)
		UseOpenToastResult({
			toastTitle = ToastTitle,
			iconImage = Images["icons/actions/accept"]
		})
	end
	
	local TestPropOpenEditProfilePicture = p1.testProp_openEditProfilePicture or function()
		-- upvalues: UseAnalyticsResult (copy), EventNames (upval), AppPage (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (copy), NavigateToRouteFunction (upval)
		UseAnalyticsResult.fireAnalyticsEvent(EventNames.OpenAvatarMarketplace)
		local list = { { name = AppPage.Catalog } }
		
		if FFlagSignalsNavP3Dispatch then
			NavigationCommands.to(NavigationCommands.fromLegacyPage(list[#list]))
			
			return
		else
			UseDispatchResult(NavigateToRouteFunction(list))
		end
	end
	local UseUserProfilesFetchResult = UserProfilesModule.Hooks.useUserProfilesFetch({
		userIds = { UseLocalUserIdResult },
		query = UserProfilesModule.Queries.userProfilesDisplayNameAndUsernameByUserIds
	})
	
	if UseUserProfilesFetchResult.data then
		Username = UserProfilesModule.Selectors.getUsernameFromId(UseUserProfilesFetchResult.data, UseLocalUserIdResult)
		DisplayName = UserProfilesModule.Selectors.getDisplayNameFromId(UseUserProfilesFetchResult.data, UseLocalUserIdResult)
		ShouldShimmerName = false
	end
	ReactModule.useEffect(function()
		-- upvalues: SocialStopwatchModule (upval), UseAnalyticsResult (copy), EventNames (upval), LoadingStages (upval)
		local GetResult = SocialStopwatchModule.Stopwatch.get(SocialStopwatchModule.Events.EditProfileOpened)
		UseAnalyticsResult.fireAnalyticsEvent(EventNames.EditProfileLoadingStage, {
			status = LoadingStages.Fetching,
			statValue = GetResult and GetResult.timeElapsed
		})
		
		return function()
			-- upvalues: SocialStopwatchModule (upval)
			SocialStopwatchModule.Stopwatch.stop(SocialStopwatchModule.Events.EditProfileOpened)
		end
	end, {})
	UseEffectOnceFunction(function()
		-- upvalues: SocialStopwatchModule (upval), UseAnalyticsResult (copy), EventNames (upval), UseUserProfilesFetchResult (copy), LoadingStages (upval)
		local GetResult = SocialStopwatchModule.Stopwatch.get(SocialStopwatchModule.Events.EditProfileOpened)
		UseAnalyticsResult.fireAnalyticsEvent(EventNames.EditProfileLoadingStage, {
			status = if UseUserProfilesFetchResult.data then LoadingStages.Done else LoadingStages.Failed,
			statValue = GetResult and GetResult.timeElapsed
		})
	end, UseUserProfilesFetchResult.data or UseUserProfilesFetchResult.error)
	
	local function onClose()
		-- upvalues: p1 (copy)
		p1.navigation.pop()
	end
	
	local IsFullBleedParam: boolean = FFlagAXEnableProfileTab and p1.navigation.getParam("fullBleed") == true
	
	local function openDisplayNameModal()
		-- upvalues: UseAnalyticsResult (copy), EventNames (upval), UseStateResult (copy), p1 (copy), Param (copy), UseResult1 (copy), DisplayName (ref)
		if UseAnalyticsResult then
			UseAnalyticsResult.fireAnalyticsEvent(EventNames.DisplayNameModalOpened)
		end
		if UseStateResult then
			p1.navigation.navigate(Param.EditDisplayNameModal, {
				setDisplayNameAvailable = UseResult1,
				displayName = DisplayName
			})
			
			return
		else
			p1.navigation.navigate(Param.EditDisplayNameErrorModal)
		end
	end
	
	local function openEditUsername()
		-- upvalues: UseAnalyticsResult (copy), EventNames (upval), UseLocalRobuxBalanceResult (copy), NavigateToEditUsernameParam (copy), showToast (copy), p1 (copy), Param (copy), NavigateDownToPurchaseRobux (copy)
		UseAnalyticsResult.fireAnalyticsEvent(EventNames.EditUsernameOpened)
		
		if UseLocalRobuxBalanceResult >= 1000 then
			NavigateToEditUsernameParam(showToast)
			
			return
		else
			p1.navigation.navigate(Param.UsernameInsufficientFundsModal, {
				robux = 1000 - UseLocalRobuxBalanceResult,
				navigateDownToPurchaseRobux = NavigateDownToPurchaseRobux
			})
		end
	end
	
	local function openEditDescription()
		-- upvalues: p1 (copy), Param (copy), UseStateResult1 (copy), UseResult (copy)
		p1.navigation.navigate(Param.EditDescriptionModal, {
			initialText = UseStateResult1,
			setDescription = UseResult
		})
	end
	
	local function openEditSocialLinksModal(FocusOn)
		-- upvalues: FFlagSocialNetworksInEditProfileIXPSetupEnabled (copy), AppPage (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (copy), NavigateDownFunction (upval)
		if FFlagSocialNetworksInEditProfileIXPSetupEnabled then
			local config = {
				name = AppPage.EditSocialNetworks,
				extraProps = { focusOn = FocusOn }
			}
			
			if FFlagSignalsNavP3Dispatch then
				NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
				
				return
			end
			UseDispatchResult(NavigateDownFunction(config))
		end
	end
	
	return if FFlagEditProfileFixFocusNavigationModule then FocusNavigatorWrapperModule({ onClose = onClose }, {
		ReactModule.createElement(EditProfileEntryPointModule, {
			shouldShimmerName = ShouldShimmerName,
			username = Username,
			displayName = DisplayName,
			description = UseStateResult1,
			localUserId = UseLocalUserIdResult,
			onClose = onClose,
			openDisplayNameModal = openDisplayNameModal,
			navigateToEditUsername = openEditUsername,
			openEditDescription = openEditDescription,
			openEditProfilePicture = if FFlagEditProfileNavigateToAvatarModule or UseUserExperimentResult then TestPropOpenEditProfilePicture else nil,
			socialInfo = if FFlagSocialNetworksInEditProfileIXPSetupEnabled and IsNotUseGetExperimentVariantResultMatch then UseSelectorResult1 else nil,
			openEditSocialLinksModal = if FFlagSocialNetworksInEditProfileIXPSetupEnabled and IsNotUseGetExperimentVariantResultMatch then openEditSocialLinksModal else nil,
			isUnder13 = if FFlagSocialNetworksInEditProfileIXPSetupEnabled and IsNotUseGetExperimentVariantResultMatch then Under13 else nil,
			canSeeInExperienceMode = if FFlagMoveInExperienceModeToEditProfile then UseSelectorResult ~= nil else false,
			isInExperienceNameEnabled = if FFlagMoveInExperienceModeToEditProfile then IsInExperienceNameEnabled else false,
			inExperienceName = if FFlagMoveInExperienceModeToEditProfile then InExperienceName else nil,
			inExperienceNameExpirationTime = if FFlagMoveInExperienceModeToEditProfile then InExperienceNameExpirationTime else nil,
			onToggleInExperienceMode = if FFlagMoveInExperienceModeToEditProfile then p1.navigation.getParam("onToggleInExperienceMode") else nil,
			profileScreens = if FFlagEditProfileBackgroundEnabled then Param else nil,
			fullBleed = IsFullBleedParam
		})
	}) else ReactModule.createElement(EditProfileEntryPointModule, {
		shouldShimmerName = ShouldShimmerName,
		username = Username,
		displayName = DisplayName,
		description = UseStateResult1,
		localUserId = UseLocalUserIdResult,
		onClose = onClose,
		openDisplayNameModal = openDisplayNameModal,
		navigateToEditUsername = openEditUsername,
		openEditDescription = openEditDescription,
		openEditProfilePicture = if FFlagEditProfileNavigateToAvatarModule or UseUserExperimentResult then TestPropOpenEditProfilePicture else nil,
		socialInfo = if FFlagSocialNetworksInEditProfileIXPSetupEnabled and IsNotUseGetExperimentVariantResultMatch then UseSelectorResult1 else nil,
		openEditSocialLinksModal = if FFlagSocialNetworksInEditProfileIXPSetupEnabled and IsNotUseGetExperimentVariantResultMatch then openEditSocialLinksModal else nil,
		isUnder13 = if FFlagSocialNetworksInEditProfileIXPSetupEnabled and IsNotUseGetExperimentVariantResultMatch then Under13 else nil,
		canSeeInExperienceMode = if FFlagMoveInExperienceModeToEditProfile then UseSelectorResult ~= nil else false,
		isInExperienceNameEnabled = if FFlagMoveInExperienceModeToEditProfile then IsInExperienceNameEnabled else false,
		inExperienceName = if FFlagMoveInExperienceModeToEditProfile then InExperienceName else nil,
		inExperienceNameExpirationTime = if FFlagMoveInExperienceModeToEditProfile then InExperienceNameExpirationTime else nil,
		onToggleInExperienceMode = if FFlagMoveInExperienceModeToEditProfile then p1.navigation.getParam("onToggleInExperienceMode") else nil,
		profileScreens = if FFlagEditProfileBackgroundEnabled then Param else nil,
		fullBleed = IsFullBleedParam
	})
end