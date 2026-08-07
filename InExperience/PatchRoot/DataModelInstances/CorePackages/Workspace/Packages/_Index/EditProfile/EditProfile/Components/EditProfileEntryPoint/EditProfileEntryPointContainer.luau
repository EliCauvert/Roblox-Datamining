local editProfile = script:FindFirstAncestor("EditProfile")
local playersService = game:GetService("Players")
local parent = editProfile.Parent
local navigationRoduxModule = require(parent.NavigationRodux)
local navigateToRoute = navigationRoduxModule.Thunks.NavigateToRoute
local appPage = require(parent.RobloxAppEnums).AppPage
local reactModule = require(parent.React)
local userProfilesModule = require(parent.UserProfiles)
local roactUtilsModule = require(parent.RoactUtils)
local editProfileEntryPointModule = require(script.Parent.EditProfileEntryPoint)
local useLocalUserId = require(parent.RobloxAppHooks).useLocalUserId
local useLocalRobuxBalance = require(parent.RobloxAppHooks).useLocalRobuxBalance
local useSelector = roactUtilsModule.Hooks.RoactRodux.useSelector
local profileScreens = require(editProfile.Common.Constants).ProfileScreens
local usersNetworkingModule = require(editProfile.Networking.UsersNetworking)
local socialLuaAnalyticsModule = require(parent.SocialLuaAnalytics)
local socialStopwatchModule = require(parent.SocialStopwatch)
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local useEffectOnMount = roactUtilsModule.Hooks.useEffectOnMount
local images = require(parent.UIBlox).App.ImageSet.Images
local getDeepValue = require(parent.LuaSocialLibrariesDeps).SocialLibraries.config({}).Dictionary.getDeepValue
local useEffectOnce = roactUtilsModule.Hooks.useEffectOnce
local navigateDown = navigationRoduxModule.Thunks.NavigateDown
local fFlagSignalsNavP3Dispatch = require(parent.SharedFlags).FFlagSignalsNavP3Dispatch
local fFlagAXEnableProfileTab = require(parent.SharedFlags).FFlagAXEnableProfileTab
local var10 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil
local socialNetworksInEditProfileIXPModule = require(editProfile.Flags.SocialNetworksInEditProfileIXP)
local socialLinksNetworkingModule = require(editProfile.Networking.SocialLinksNetworking)
local socialToastModule = require(parent.SocialToast)
local loadingStages = socialLuaAnalyticsModule.Analytics.Enums.LoadingStages
local useUserExperiment = require(parent.RoactAppExperiment).useUserExperiment
local fStringEditProfileToAvatarLayerNameModule = require(editProfile.Flags.FStringEditProfileToAvatarLayerName)
local fFlagEditProfileFixFocusNavigationModule = require(editProfile.Flags.FFlagEditProfileFixFocusNavigation)
local focusNavigatorWrapperModule = require(editProfile.Utils.FocusNavigatorWrapper)
local fFlagEditProfileNavigateToAvatarModule = require(editProfile.Flags.FFlagEditProfileNavigateToAvatar)
local analyticsModule = require(editProfile.Analytics)
local eventNames = analyticsModule.EventNames
local useAnalytics = analyticsModule.useAnalytics
local fFlagMoveInExperienceModeToEditProfile = require(parent.SharedFlags).FFlagMoveInExperienceModeToEditProfile
local fFlagEditProfileBackgroundEnabled = require(parent.SharedFlags).FFlagEditProfileBackgroundEnabled

return function(p0) --[[ line: 63 | named "EditProfileEntryPointContainer" ]]
	-- upvalues: useDispatch (ref), useLocalUserId (ref), profileScreens (ref), reactModule (ref), useSelector (ref), getDeepValue (ref), fFlagMoveInExperienceModeToEditProfile (ref), socialNetworksInEditProfileIXPModule (ref), playersService (ref), useLocalRobuxBalance (ref), appPage (ref), fFlagSignalsNavP3Dispatch (ref), var10 (ref), navigateDown (ref), useEffectOnMount (ref), usersNetworkingModule (ref), useAnalytics (ref), useUserExperiment (ref), fStringEditProfileToAvatarLayerNameModule (ref), eventNames (ref), socialLinksNetworkingModule (ref), socialToastModule (ref), images (ref), navigateToRoute (ref), userProfilesModule (ref), socialStopwatchModule (ref), loadingStages (ref), useEffectOnce (ref), fFlagAXEnableProfileTab (ref), fFlagEditProfileFixFocusNavigationModule (ref), focusNavigatorWrapperModule (ref), editProfileEntryPointModule (ref), fFlagEditProfileNavigateToAvatarModule (ref), fFlagEditProfileBackgroundEnabled (ref)
	local var19 = useDispatch()
	local var20 = useLocalUserId()
	local var21 = ""
	local var22 = ""
	local var23 = true
	local param = p0.navigation.getParam(profileScreens)
	local var25, var26 = reactModule.useState(false)
	local _ = useSelector(function(p1) --[[ line: 71 ]]
		-- upvalues: getDeepValue (copy), var20 (ref)
		return getDeepValue(p1, `Profile.AdditionalUserFields.{var20}.description`)
	end)
	local var27 = if fFlagMoveInExperienceModeToEditProfile then useSelector(function(p2) --[[ line: 75 ]]
		-- upvalues: getDeepValue (copy), var20 (ref)
		return getDeepValue(p2, `Profile.AdditionalUserFields.{var20}.userProfileSettings`)
	end) else nil
	local isInExperienceNameEnabled = nil
	local inExperienceName = nil
	local inExperienceNameExpirationTime = nil
	
	if fFlagMoveInExperienceModeToEditProfile and var27 ~= nil then
		isInExperienceNameEnabled = var27.isInExperienceNameEnabled
		inExperienceName = var27.inExperienceName
		inExperienceNameExpirationTime = var27.inExperienceNameExpirationTime
	end
	local fFlagSocialNetworksInEditProfileIXPSetupEnabled = socialNetworksInEditProfileIXPModule.GetFFlagSocialNetworksInEditProfileIXPSetupEnabled()
	local var29 = socialNetworksInEditProfileIXPModule.useGetExperimentVariant({ isExposureEnabled = true })
	local var30 = var29 and var29 ~= socialNetworksInEditProfileIXPModule.Variants.Control
	local var31 = if fFlagSocialNetworksInEditProfileIXPSetupEnabled then useSelector(function(p3) --[[ line: 93 ]]
		-- upvalues: getDeepValue (copy)
		return getDeepValue(p3, "Profile.SocialLinks.selfSocialLinks") or {}
	end) else nil
	local var32 = if fFlagSocialNetworksInEditProfileIXPSetupEnabled and var30 and playersService.LocalPlayer then playersService.LocalPlayer:GetUnder13() else false
	local var33 = ""
	local var34 = useLocalRobuxBalance()
	local navigateToEditUsername = p0.navigation.getParam("navigateToEditUsername")
	
	local var36 = function() --[[ line: 107 ]]
		-- upvalues: appPage (copy), fFlagSignalsNavP3Dispatch (copy), var10 (copy), var19 (ref), navigateDown (copy)
		local list = { { name = appPage.PurchaseRobux } }
		
		if fFlagSignalsNavP3Dispatch then
			var10.down(var10.fromLegacyPage(list[#list]))
			
			return
		end
		var19(navigateDown(list))
	end
	
	local var37, var38 = reactModule.useState(var33)
	useEffectOnMount(function() --[[ line: 123 ]]
		-- upvalues: var19 (ref), usersNetworkingModule (copy), var20 (ref), var38 (ref)
		var19(usersNetworkingModule.GetUserV2FromUserId.API(var20)):andThen(function(p4) --[[ line: 125 ]]
			-- upvalues: var38 (copy)
			var38(p4.responseBody.description or "")
		end):catch(function() --[[ line: 128 ]]
			-- upvalues: var38 (copy)
			var38("")
		end)
	end)
	local var39 = useAnalytics()
	local onIdentityChange = p0.navigation.getParam("onIdentityChange")
	local var41 = reactModule.useCallback(function(p5) --[[ line: 136 ]]
		-- upvalues: var38 (ref), onIdentityChange (ref)
		var38(p5)
		
		if onIdentityChange then
			onIdentityChange()
		end
	end, { var38, onIdentityChange })
	local var42 = reactModule.useCallback(function(p6) --[[ line: 143 ]]
		-- upvalues: var26 (ref), onIdentityChange (ref)
		var26(p6)
		
		if onIdentityChange then
			onIdentityChange()
		end
	end, { var26, onIdentityChange })
	local var43 = useUserExperiment({ fStringEditProfileToAvatarLayerNameModule }, function(p7) --[[ line: 150 ]]
		-- upvalues: fStringEditProfileToAvatarLayerNameModule (copy)
		return (p7[fStringEditProfileToAvatarLayerNameModule] or {}).profile_picture_on
	end)
	useEffectOnMount(function() --[[ line: 155 ]]
		-- upvalues: var39 (ref), eventNames (copy), var19 (ref), usersNetworkingModule (copy), var20 (ref), var26 (ref), fFlagSocialNetworksInEditProfileIXPSetupEnabled (ref), var30 (ref), socialLinksNetworkingModule (copy)
		var39.fireAnalyticsEvent(eventNames.EditProfileOpened)
		var19(usersNetworkingModule.GetDisplayNameValidation.API(var20, "Test")):andThen(function(_) --[[ line: 160 ]]
			-- upvalues: var26 (copy)
			var26(true)
		end):catch(function(_) --[[ line: 163 ]] end)
		
		if fFlagSocialNetworksInEditProfileIXPSetupEnabled and var30 then
			var19(socialLinksNetworkingModule.GetSelfSocialLinks.API({ alwaysReturnUrls = false, filterLink = false })):catch(function(_) --[[ line: 167 ]] end)
		end
	end)
	local var44 = socialToastModule.useOpenToast()
	
	local function showToast(p8) --[[ line: 174 ]]
		-- upvalues: var44 (ref), images (copy)
		var44({
			toastTitle = p8,
			iconImage = images["icons/actions/accept"]
		})
	end
	
	local testPropOpenEditProfilePicture = p0.testProp_openEditProfilePicture or function() --[[ line: 182 ]]
		-- upvalues: var39 (ref), eventNames (copy), appPage (copy), fFlagSignalsNavP3Dispatch (copy), var10 (copy), var19 (ref), navigateToRoute (copy)
		var39.fireAnalyticsEvent(eventNames.OpenAvatarMarketplace)
		local list = { { name = appPage.Catalog } }
		
		if fFlagSignalsNavP3Dispatch then
			var10.to(var10.fromLegacyPage(list[#list]))
			
			return
		end
		var19(navigateToRoute(list))
	end
	local var47 = userProfilesModule.Hooks.useUserProfilesFetch({
		userIds = { var20 },
		query = userProfilesModule.Queries.userProfilesDisplayNameAndUsernameByUserIds
	})
	
	if var47.data then
		var21 = userProfilesModule.Selectors.getUsernameFromId(var47.data, var20)
		var22 = userProfilesModule.Selectors.getDisplayNameFromId(var47.data, var20)
		var23 = false
	end
	reactModule.useEffect(function() --[[ line: 206 ]]
		-- upvalues: socialStopwatchModule (copy), var39 (ref), eventNames (copy), loadingStages (copy)
		local var63 = socialStopwatchModule.Stopwatch.get(socialStopwatchModule.Events.EditProfileOpened)
		var39.fireAnalyticsEvent(eventNames.EditProfileLoadingStage, {
			status = loadingStages.Fetching,
			statValue = var63 and var63.timeElapsed
		})
		
		return function() --[[ line: 213 ]]
			-- upvalues: socialStopwatchModule (copy)
			socialStopwatchModule.Stopwatch.stop(socialStopwatchModule.Events.EditProfileOpened)
		end
	end, {})
	useEffectOnce(function() --[[ line: 218 ]]
		-- upvalues: socialStopwatchModule (copy), var39 (ref), eventNames (copy), var47 (ref), loadingStages (copy)
		local var64 = socialStopwatchModule.Stopwatch.get(socialStopwatchModule.Events.EditProfileOpened)
		var39.fireAnalyticsEvent(eventNames.EditProfileLoadingStage, {
			status = if var47.data then loadingStages.Done else loadingStages.Failed,
			statValue = var64 and var64.timeElapsed
		})
	end, var47.data or var47.error)
	
	local function onClose() --[[ line: 226 ]]
		-- upvalues: p0 (ref)
		p0.navigation.pop()
	end
	
	local var49 = fFlagAXEnableProfileTab and p0.navigation.getParam("fullBleed") == true
	
	local function openDisplayNameModal() --[[ line: 235 ]]
		-- upvalues: var39 (ref), eventNames (copy), var25 (ref), p0 (ref), param (ref), var42 (ref), var22 (write)
		if var39 then
			var39.fireAnalyticsEvent(eventNames.DisplayNameModalOpened)
		end
		if var25 then
			p0.navigation.navigate(param.EditDisplayNameModal, { setDisplayNameAvailable = var42, displayName = var22 })
			
			return
		end
		p0.navigation.navigate(param.EditDisplayNameErrorModal)
	end
	
	local function openEditUsername() --[[ line: 250 ]]
		-- upvalues: var39 (ref), eventNames (copy), var34 (ref), navigateToEditUsername (ref), showToast (ref), p0 (ref), param (ref), var36 (ref)
		var39.fireAnalyticsEvent(eventNames.EditUsernameOpened)
		
		if var34 >= 1000 then
			navigateToEditUsername(showToast)
			
			return
		end
		p0.navigation.navigate(param.UsernameInsufficientFundsModal, {
			robux = 1000 - var34,
			navigateDownToPurchaseRobux = var36
		})
	end
	
	local function openEditDescription() --[[ line: 264 ]]
		-- upvalues: p0 (ref), param (ref), var37 (ref), var41 (ref)
		p0.navigation.navigate(param.EditDescriptionModal, { initialText = var37, setDescription = var41 })
	end
	
	local function openEditSocialLinksModal(p9) --[[ line: 271 ]]
		-- upvalues: fFlagSocialNetworksInEditProfileIXPSetupEnabled (ref), appPage (copy), fFlagSignalsNavP3Dispatch (copy), var10 (copy), var19 (ref), navigateDown (copy)
		if fFlagSocialNetworksInEditProfileIXPSetupEnabled then
			local t = {
				name = appPage.EditSocialNetworks,
				extraProps = { focusOn = p9 }
			}
			
			if fFlagSignalsNavP3Dispatch then
				var10.down(var10.fromLegacyPage(t))
				
				return
			end
			var19(navigateDown(t))
		end
	end
	
	if fFlagEditProfileFixFocusNavigationModule then
		local var58
		local t = { onClose = onClose }
		local t_1 = {}
		local createElement = reactModule.createElement
		local var56 = editProfileEntryPointModule
		local t_2 = {
			shouldShimmerName = var23,
			username = var21,
			displayName = var22,
			description = var37,
			localUserId = var20,
			onClose = onClose,
			openDisplayNameModal = openDisplayNameModal,
			navigateToEditUsername = openEditUsername,
			openEditDescription = openEditDescription,
			openEditProfilePicture = if fFlagEditProfileNavigateToAvatarModule or var43 then testPropOpenEditProfilePicture else nil,
			socialInfo = if fFlagSocialNetworksInEditProfileIXPSetupEnabled and var30 then var31 else nil,
			openEditSocialLinksModal = if fFlagSocialNetworksInEditProfileIXPSetupEnabled and var30 then openEditSocialLinksModal else nil,
			isUnder13 = if fFlagSocialNetworksInEditProfileIXPSetupEnabled and var30 then var32 else nil
		}
		
		if fFlagMoveInExperienceModeToEditProfile then
			var58 = var27 ~= nil
			var58 = nil
		else
			var58 = false
		end
		t_2.canSeeInExperienceMode = var58
		t_2.isInExperienceNameEnabled = if fFlagMoveInExperienceModeToEditProfile then isInExperienceNameEnabled else false
		t_2.inExperienceName = if fFlagMoveInExperienceModeToEditProfile then inExperienceName else nil
		t_2.inExperienceNameExpirationTime = if fFlagMoveInExperienceModeToEditProfile then inExperienceNameExpirationTime else nil
		t_2.onToggleInExperienceMode = if fFlagMoveInExperienceModeToEditProfile then p0.navigation.getParam("onToggleInExperienceMode") else nil
		t_2.profileScreens = if fFlagEditProfileBackgroundEnabled then param else nil
		t_2.fullBleed = var49
		-- Unknown statement at pc 7: <SetList>
		
		return focusNavigatorWrapperModule(t, t_1)
	else
		local var60
		local createElement = reactModule.createElement
		local t = {
			shouldShimmerName = var23,
			username = var21,
			displayName = var22,
			description = var37,
			localUserId = var20,
			onClose = onClose,
			openDisplayNameModal = openDisplayNameModal,
			navigateToEditUsername = openEditUsername,
			openEditDescription = openEditDescription,
			openEditProfilePicture = if fFlagEditProfileNavigateToAvatarModule or var43 then testPropOpenEditProfilePicture else nil,
			socialInfo = if fFlagSocialNetworksInEditProfileIXPSetupEnabled and var30 then var31 else nil,
			openEditSocialLinksModal = if fFlagSocialNetworksInEditProfileIXPSetupEnabled and var30 then openEditSocialLinksModal else nil,
			isUnder13 = if fFlagSocialNetworksInEditProfileIXPSetupEnabled and var30 then var32 else nil
		}
		
		if fFlagMoveInExperienceModeToEditProfile then
			var60 = var27 ~= nil
			var60 = nil
		else
			var60 = false
		end
		t.canSeeInExperienceMode = var60
		t.isInExperienceNameEnabled = if fFlagMoveInExperienceModeToEditProfile then isInExperienceNameEnabled else false
		t.inExperienceName = if fFlagMoveInExperienceModeToEditProfile then inExperienceName else nil
		t.inExperienceNameExpirationTime = if fFlagMoveInExperienceModeToEditProfile then inExperienceNameExpirationTime else nil
		t.onToggleInExperienceMode = if fFlagMoveInExperienceModeToEditProfile then p0.navigation.getParam("onToggleInExperienceMode") else nil
		t.profileScreens = if fFlagEditProfileBackgroundEnabled then param else nil
		t.fullBleed = var49
		
		return createElement(editProfileEntryPointModule, t)
	end
end