local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local reactModule = require(parent.React)
local userLibModule = require(parent.UserLib)
local navigationModule = require(parent.Navigation)
local roactUtilsModule = require(parent.RoactUtils)
local setAliasModule = require(parent.SetAlias)
local networkingUsersModule = require(profilePlatform.Networking.NetworkingUsers)
local useEffectOnce = roactUtilsModule.Hooks.useEffectOnce
local constants = userLibModule.Utils.Constants
local getRbxthumbWithTypeSizeAndOptions = userLibModule.Utils.getRbxthumbWithTypeSizeAndOptions
local useNavigation = navigationModule.useNavigation
local _ = require(profilePlatform.Contexts.ProfileWrapperContext)
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local socialStopwatchModule = require(parent.SocialStopwatch)
local constantsModule = require(profilePlatform.Common.Constants)
local enumsModule = require(profilePlatform.Common.Enums)
local useProfileAnalyticsContextModule = require(profilePlatform.Contexts.useProfileAnalyticsContext)
local eventNamesModule = require(profilePlatform.Analytics.EventNames)
local useProfileJsonComponentModule = require(profilePlatform.Hooks.useProfileJsonComponent)
local useProfileWrapperContextModule = require(profilePlatform.Contexts.useProfileWrapperContext)
local userProfileHeaderModule = require(profilePlatform.Components.UserProfileHeader.UserProfileHeader)
local useAppPolicy = require(parent.UniversalAppPolicy).useAppPolicy
local fFlagFriendRequestNicknames = require(parent.SharedFlags).FFlagFriendRequestNicknames
local fFlagMoveInExperienceModeToEditProfile = require(parent.SharedFlags).FFlagMoveInExperienceModeToEditProfile
local enumsModule_1 = require(parent.EditProfile.Enums)
local fFlagAddPlatformNameToProfileHeader = require(parent.SharedFlags).FFlagAddPlatformNameToProfileHeader
local userProfilesModule = require(parent.UserProfiles)
local useUserProfilesFetch = userProfilesModule.Hooks.useUserProfilesFetch

local _ = function(p0, p1, p2)
	local primaryName = p0.names.primaryName or ""
	
	return if p1.profileUserNickname and p2 and p1.profileUserNickname ~= "" then p1.profileUserNickname .. " (" .. primaryName .. ")" else primaryName
end

return function(p3)
	-- upvalues: useProfileWrapperContextModule (ref), useNavigation (ref), useDispatch (ref), reactModule (ref), useProfileAnalyticsContextModule (ref), fFlagFriendRequestNicknames (ref), useAppPolicy (ref), getRbxthumbWithTypeSizeAndOptions (ref), constants (ref), constantsModule (ref), useProfileJsonComponentModule (ref), enumsModule (ref), fFlagAddPlatformNameToProfileHeader (ref), useUserProfilesFetch (ref), userProfilesModule (ref), eventNamesModule (ref), enumsModule_1 (ref), socialStopwatchModule (ref), setAliasModule (ref), useEffectOnce (ref), networkingUsersModule (ref), fFlagMoveInExperienceModeToEditProfile (ref), userProfileHeaderModule (ref)
	local var18 = useProfileWrapperContextModule()
	local var19 = useNavigation()
	local var20 = useDispatch()
	local var21 = reactModule.useRef(false)
	local var22 = useProfileAnalyticsContextModule()
	local profileId = var18.profileId
	local var23 = if fFlagFriendRequestNicknames then useAppPolicy(function(p4)
		return p4.getFriendRequestNicknamesEnabled()
	end) else false
	local var24 = getRbxthumbWithTypeSizeAndOptions(profileId, constants.RbxthumbTypes.Avatar, constantsModule.AVATAR_THUMBNAIL_SIZE)
	local var25 = useProfileJsonComponentModule(enumsModule.Components.UserProfileHeader)
	local var26 = nil
	
	if fFlagAddPlatformNameToProfileHeader then
		local var27 = useUserProfilesFetch({
			userIds = { profileId },
			query = userProfilesModule.Queries.userProfilesDisplayUserPlatformNamesByUserIds
		})
		
		if var27.data then
			local platformNameFromId = userProfilesModule.Selectors.getPlatformNameFromId(var27.data, profileId)
			
			if platformNameFromId and platformNameFromId ~= "" then
				var26 = platformNameFromId
			end
		end
	end
	local var29 = reactModule.useCallback(function()
		-- upvalues: var25 (ref), enumsModule (copy), var22 (ref), eventNamesModule (copy), var21 (ref), var19 (ref), enumsModule_1 (copy), socialStopwatchModule (copy), profileId (ref), setAliasModule (copy)
		if not var25.editName then return end
		if var25.editName.field ~= enumsModule.NameTypes.DisplayName then
			socialStopwatchModule.Stopwatch.start(socialStopwatchModule.Events.CustomizeNameOpened)
			var22.fireAnalyticsEvent(eventNamesModule.SetAliasButton)
			var19.navigate(enumsModule.Screens.SetAliasModal, {
				profileUserId = profileId,
				origin = setAliasModule.Analytics.EntryPoints.ProfileCardName
			})
			
			return
		end
		var22.fireAnalyticsEvent(eventNamesModule.EditDisplayNameButton, { canSetDisplayName = var21.current })
		
		if var21.current then
			var19.navigate(enumsModule_1.Screens.EditProfileSubScreen, {
				screen = enumsModule_1.Screens.EditDisplayName,
				initialDisplayName = var25.names.primaryName
			})
			
			return
		end
		var19.navigate(enumsModule.Screens.EditDisplayNameErrorModal)
	end, { var19, var25.editName, var25.names })
	useEffectOnce(function()
		-- upvalues: var20 (ref), networkingUsersModule (copy), profileId (ref), var21 (ref)
		local _ = function()
			-- upvalues: var20 (copy), networkingUsersModule (copy), profileId (copy)
			return var20(networkingUsersModule.GetDisplayNameValidation.API(profileId, "testName"))
		end
		
		var20(networkingUsersModule.GetDisplayNameValidation.API(profileId, "testName")):andThen(function()
			-- upvalues: var21 (copy)
			var21.current = true
		end):catch(function()
			-- upvalues: var21 (copy)
			var21.current = false
		end)
	end, var25.editName and var25.editName.field == enumsModule.NameTypes.DisplayName)
	local var30 = var25.counts ~= nil
	local var31 = nil
	local isInExperienceNameEnabled = nil
	
	if not fFlagMoveInExperienceModeToEditProfile then
		var31 = var25.userProfileSettings ~= nil
		
		if var31 then
			isInExperienceNameEnabled = var25.userProfileSettings.isInExperienceNameEnabled
		end
	end
	local createElement = reactModule.createElement
	local t = {
		userThumbnail = var24,
		layoutOrder = p3.layoutOrder,
		userId = tonumber(profileId),
		openEditName = if var25.editName then var29 else nil
	}
	local primaryName = var25.names.primaryName or ""
	t.primaryName = if var18.profileUserNickname and var23 and var18.profileUserNickname ~= "" then var18.profileUserNickname .. " (" .. primaryName .. ")" else primaryName
	t.username = var25.names.username
	t.isPremium = var25.isPremium
	t.isVerified = var25.isVerified
	t.isRobloxAdmin = var25.isRobloxAdmin
	t.isEdited = var25.editName and var25.editName.isEdited
	t.shouldDisplayUserProfileSettings = if fFlagMoveInExperienceModeToEditProfile then nil else var31
	t.isInExperienceNameEnabled = if fFlagMoveInExperienceModeToEditProfile then nil else isInExperienceNameEnabled
	t.shouldDisplayCounts = var30
	t.platformName = if fFlagAddPlatformNameToProfileHeader then var26 else nil
	
	return createElement(userProfileHeaderModule, t)
end