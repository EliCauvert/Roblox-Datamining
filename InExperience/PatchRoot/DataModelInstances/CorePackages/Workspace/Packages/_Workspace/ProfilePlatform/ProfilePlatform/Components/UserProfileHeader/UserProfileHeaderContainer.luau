local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local ReactModule = require(Parent.React)
local UserLibModule = require(Parent.UserLib)
local RoactUtilsModule = require(Parent.RoactUtils)
local SetAliasModule = require(Parent.SetAlias)
local NetworkingUsersModule = require(ProfilePlatform.Networking.NetworkingUsers)
local UseEffectOnceFunction = RoactUtilsModule.Hooks.useEffectOnce
local Constants = UserLibModule.Utils.Constants
local GetRbxthumbWithTypeSizeAndOptionsFunction = UserLibModule.Utils.getRbxthumbWithTypeSizeAndOptions
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local _ = require(ProfilePlatform.Contexts.ProfileWrapperContext)
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local SocialStopwatchModule = require(Parent.SocialStopwatch)
local ConstantsModule = require(ProfilePlatform.Common.Constants)
local EnumsModule = require(ProfilePlatform.Common.Enums)
local UseProfileAnalyticsContextModule = require(ProfilePlatform.Contexts.useProfileAnalyticsContext)
local EventNamesModule = require(ProfilePlatform.Analytics.EventNames)
local UseProfileJsonComponentModule = require(ProfilePlatform.Hooks.useProfileJsonComponent)
local UseProfileWrapperContextModule = require(ProfilePlatform.Contexts.useProfileWrapperContext)
local UserProfileHeaderModule = require(ProfilePlatform.Components.UserProfileHeader.UserProfileHeader)
local FFlagMoveInExperienceModeToEditProfile = require(Parent.SharedFlags).FFlagMoveInExperienceModeToEditProfile
local EnumsModule1 = require(Parent.EditProfile.Enums)
local FFlagAddPlatformNameToProfileHeader = require(Parent.SharedFlags).FFlagAddPlatformNameToProfileHeader
local UserProfilesModule = require(Parent.UserProfiles)
local UseUserProfilesFetchFunction = UserProfilesModule.Hooks.useUserProfilesFetch

local function _(p1, p2, p3) --[[ Line: 67 ]]
	local PrimaryName = p1.names.primaryName or ""
	
	return if p2.profileUserNickname and p3 and p2.profileUserNickname ~= "" then p2.profileUserNickname .. " (" .. PrimaryName .. ")" else PrimaryName
end

return function(p1) --[[ Line: 84 | Named "UserProfileHeaderContainer" ]]
	-- upvalues: UseProfileWrapperContextModule (copy), UseNavigationFunction (copy), UseDispatchFunction (copy), ReactModule (copy), UseProfileAnalyticsContextModule (copy), GetRbxthumbWithTypeSizeAndOptionsFunction (copy), Constants (copy), ConstantsModule (copy), UseProfileJsonComponentModule (copy), EnumsModule (copy), FFlagAddPlatformNameToProfileHeader (copy), UseUserProfilesFetchFunction (copy), UserProfilesModule (copy), EventNamesModule (copy), EnumsModule1 (copy), SocialStopwatchModule (copy), SetAliasModule (copy), UseEffectOnceFunction (copy), NetworkingUsersModule (copy), FFlagMoveInExperienceModeToEditProfile (copy), UserProfileHeaderModule (copy)
	local UseProfileWrapperContextModuleResult = UseProfileWrapperContextModule()
	local UseNavigationResult = UseNavigationFunction()
	local UseDispatchResult = UseDispatchFunction()
	local UseRefResult = ReactModule.useRef(false)
	local UseProfileAnalyticsContextModuleResult = UseProfileAnalyticsContextModule()
	local ProfileId = UseProfileWrapperContextModuleResult.profileId
	local RbxthumbWithTypeSizeAndOptions = GetRbxthumbWithTypeSizeAndOptionsFunction(ProfileId, Constants.RbxthumbTypes.Avatar, ConstantsModule.AVATAR_THUMBNAIL_SIZE)
	local UseProfileJsonComponentModuleResult = UseProfileJsonComponentModule(EnumsModule.Components.UserProfileHeader)
	local v1 = nil
	
	if FFlagAddPlatformNameToProfileHeader then
		local UseUserProfilesFetchResult = UseUserProfilesFetchFunction({
			userIds = { ProfileId },
			query = UserProfilesModule.Queries.userProfilesDisplayUserPlatformNamesByUserIds
		})
		
		if UseUserProfilesFetchResult.data then
			local PlatformNameFromId = UserProfilesModule.Selectors.getPlatformNameFromId(UseUserProfilesFetchResult.data, ProfileId)
			
			if PlatformNameFromId and PlatformNameFromId ~= "" then
				v1 = PlatformNameFromId
			end
		end
	end
	local UseResult = ReactModule.useCallback(function() --[[ Line: 117 ]]
		-- upvalues: UseProfileJsonComponentModuleResult (copy), EnumsModule (upval), UseProfileAnalyticsContextModuleResult (copy), EventNamesModule (upval), UseRefResult (copy), UseNavigationResult (copy), EnumsModule1 (upval), SocialStopwatchModule (upval), ProfileId (copy), SetAliasModule (upval)
		if not UseProfileJsonComponentModuleResult.editName then return end
		if UseProfileJsonComponentModuleResult.editName.field ~= EnumsModule.NameTypes.DisplayName then
			SocialStopwatchModule.Stopwatch.start(SocialStopwatchModule.Events.CustomizeNameOpened)
			UseProfileAnalyticsContextModuleResult.fireAnalyticsEvent(EventNamesModule.SetAliasButton)
			UseNavigationResult.navigate(EnumsModule.Screens.SetAliasModal, {
				profileUserId = ProfileId,
				origin = SetAliasModule.Analytics.EntryPoints.ProfileCardName
			})
			
			return
		end
		UseProfileAnalyticsContextModuleResult.fireAnalyticsEvent(EventNamesModule.EditDisplayNameButton, { canSetDisplayName = UseRefResult.current })
		
		if UseRefResult.current then
			UseNavigationResult.navigate(EnumsModule1.Screens.EditProfileSubScreen, {
				screen = EnumsModule1.Screens.EditDisplayName,
				initialDisplayName = UseProfileJsonComponentModuleResult.names.primaryName
			})
			
			return
		else
			UseNavigationResult.navigate(EnumsModule.Screens.EditDisplayNameErrorModal)
		end
	end, {
		UseNavigationResult,
		UseProfileJsonComponentModuleResult.editName,
		UseProfileJsonComponentModuleResult.names
	})
	UseEffectOnceFunction(function() --[[ Line: 145 ]]
		-- upvalues: UseDispatchResult (copy), NetworkingUsersModule (upval), ProfileId (copy), UseRefResult (copy)
		local function _() --[[ Line: 146 ]]
			-- upvalues: UseDispatchResult (upval), NetworkingUsersModule (upval), ProfileId (upval)
			return UseDispatchResult(NetworkingUsersModule.GetDisplayNameValidation.API(ProfileId, "testName"))
		end
		
		UseDispatchResult(NetworkingUsersModule.GetDisplayNameValidation.API(ProfileId, "testName")):andThen(function() --[[ Line: 151 ]]
			-- upvalues: UseRefResult (upval)
			UseRefResult.current = true
		end):catch(function() --[[ Line: 154 ]]
			-- upvalues: UseRefResult (upval)
			UseRefResult.current = false
		end)
	end, UseProfileJsonComponentModuleResult.editName and UseProfileJsonComponentModuleResult.editName.field == EnumsModule.NameTypes.DisplayName)
	local HasCounts = UseProfileJsonComponentModuleResult.counts ~= nil
	local HasUserProfileSettings: boolean? = nil
	local IsInExperienceNameEnabled = nil
	
	if not FFlagMoveInExperienceModeToEditProfile then
		HasUserProfileSettings = UseProfileJsonComponentModuleResult.userProfileSettings ~= nil
		
		if HasUserProfileSettings then
			IsInExperienceNameEnabled = UseProfileJsonComponentModuleResult.userProfileSettings.isInExperienceNameEnabled
		end
	end
	local CreateElementFunction = ReactModule.createElement
	local config = {
		userThumbnail = RbxthumbWithTypeSizeAndOptions,
		layoutOrder = p1.layoutOrder,
		userId = tonumber(ProfileId),
		openEditName = if UseProfileJsonComponentModuleResult.editName then UseResult else nil
	}
	local PrimaryName = UseProfileJsonComponentModuleResult.names.primaryName or ""
	
	if UseProfileWrapperContextModuleResult.profileUserNickname then
	end
	config.primaryName = PrimaryName
	config.username = UseProfileJsonComponentModuleResult.names.username
	config.isPremium = UseProfileJsonComponentModuleResult.isPremium
	config.isVerified = UseProfileJsonComponentModuleResult.isVerified
	config.isRobloxAdmin = UseProfileJsonComponentModuleResult.isRobloxAdmin
	config.isEdited = UseProfileJsonComponentModuleResult.editName and UseProfileJsonComponentModuleResult.editName.isEdited
	config.shouldDisplayUserProfileSettings = if FFlagMoveInExperienceModeToEditProfile then nil else HasUserProfileSettings
	config.isInExperienceNameEnabled = if FFlagMoveInExperienceModeToEditProfile then nil else IsInExperienceNameEnabled
	config.shouldDisplayCounts = HasCounts
	config.platformName = if FFlagAddPlatformNameToProfileHeader then v1 else nil
	
	return CreateElementFunction(UserProfileHeaderModule, config)
end