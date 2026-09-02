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

local _ = function(p1, p2, p3)
	local primaryName = p1.names.primaryName or ""
	
	return if p2.profileUserNickname and p3 and p2.profileUserNickname ~= "" then p2.profileUserNickname .. " (" .. primaryName .. ")" else primaryName
end

return function(p1)
	-- upvalues: useProfileWrapperContextModule (ref), useNavigation (ref), useDispatch (ref), reactModule (ref), useProfileAnalyticsContextModule (ref), fFlagFriendRequestNicknames (ref), useAppPolicy (ref), getRbxthumbWithTypeSizeAndOptions (ref), constants (ref), constantsModule (ref), useProfileJsonComponentModule (ref), enumsModule (ref), fFlagAddPlatformNameToProfileHeader (ref), useUserProfilesFetch (ref), userProfilesModule (ref), eventNamesModule (ref), enumsModule_1 (ref), socialStopwatchModule (ref), setAliasModule (ref), useEffectOnce (ref), networkingUsersModule (ref), fFlagMoveInExperienceModeToEditProfile (ref), userProfileHeaderModule (ref)
	local var1 = useProfileWrapperContextModule()
	local var2 = useNavigation()
	local var3 = useDispatch()
	local var4 = reactModule.useRef(false)
	local var5 = useProfileAnalyticsContextModule()
	local profileId = var1.profileId
	local var6 = if fFlagFriendRequestNicknames then useAppPolicy(function(p2)
		return p2.getFriendRequestNicknamesEnabled()
	end) else false
	local var7 = getRbxthumbWithTypeSizeAndOptions(profileId, constants.RbxthumbTypes.Avatar, constantsModule.AVATAR_THUMBNAIL_SIZE)
	local var8 = useProfileJsonComponentModule(enumsModule.Components.UserProfileHeader)
	local var9 = nil
	
	if fFlagAddPlatformNameToProfileHeader then
		local var10 = useUserProfilesFetch({
			userIds = { profileId },
			query = userProfilesModule.Queries.userProfilesDisplayUserPlatformNamesByUserIds
		})
		
		if var10.data then
			local platformNameFromId = userProfilesModule.Selectors.getPlatformNameFromId(var10.data, profileId)
			
			if platformNameFromId and platformNameFromId ~= "" then
				var9 = platformNameFromId
			end
		end
	end
	local var11 = reactModule.useCallback(function()
		-- upvalues: var8 (ref), enumsModule (copy), var5 (ref), eventNamesModule (copy), var4 (ref), var2 (ref), enumsModule_1 (copy), socialStopwatchModule (copy), profileId (ref), setAliasModule (copy)
		if not var8.editName then return end
		if var8.editName.field ~= enumsModule.NameTypes.DisplayName then
			socialStopwatchModule.Stopwatch.start(socialStopwatchModule.Events.CustomizeNameOpened)
			var5.fireAnalyticsEvent(eventNamesModule.SetAliasButton)
			var2.navigate(enumsModule.Screens.SetAliasModal, {
				profileUserId = profileId,
				origin = setAliasModule.Analytics.EntryPoints.ProfileCardName
			})
			
			return
		end
		var5.fireAnalyticsEvent(eventNamesModule.EditDisplayNameButton, { canSetDisplayName = var4.current })
		
		if var4.current then
			var2.navigate(enumsModule_1.Screens.EditProfileSubScreen, {
				screen = enumsModule_1.Screens.EditDisplayName,
				initialDisplayName = var8.names.primaryName
			})
			
			return
		end
		var2.navigate(enumsModule.Screens.EditDisplayNameErrorModal)
	end, { var2, var8.editName, var8.names })
	useEffectOnce(function()
		-- upvalues: var3 (ref), networkingUsersModule (copy), profileId (ref), var4 (ref)
		local _ = function()
			-- upvalues: var3 (copy), networkingUsersModule (copy), profileId (copy)
			return var3(networkingUsersModule.GetDisplayNameValidation.API(profileId, "testName"))
		end
		
		var3(networkingUsersModule.GetDisplayNameValidation.API(profileId, "testName")):andThen(function()
			-- upvalues: var4 (copy)
			var4.current = true
		end):catch(function()
			-- upvalues: var4 (copy)
			var4.current = false
		end)
	end, var8.editName and var8.editName.field == enumsModule.NameTypes.DisplayName)
	local var12 = var8.counts ~= nil
	local var13 = nil
	local isInExperienceNameEnabled = nil
	
	if not fFlagMoveInExperienceModeToEditProfile then
		var13 = var8.userProfileSettings ~= nil
		
		if var13 then
			isInExperienceNameEnabled = var8.userProfileSettings.isInExperienceNameEnabled
		end
	end
	local createElement = reactModule.createElement
	local t = {
		userThumbnail = var7,
		layoutOrder = p1.layoutOrder,
		userId = tonumber(profileId),
		openEditName = if var8.editName then var11 else nil
	}
	local primaryName = var8.names.primaryName or ""
	t.primaryName = if var1.profileUserNickname and var6 and var1.profileUserNickname ~= "" then var1.profileUserNickname .. " (" .. primaryName .. ")" else primaryName
	t.username = var8.names.username
	t.isPremium = var8.isPremium
	t.isVerified = var8.isVerified
	t.isRobloxAdmin = var8.isRobloxAdmin
	t.isEdited = var8.editName and var8.editName.isEdited
	t.shouldDisplayUserProfileSettings = if fFlagMoveInExperienceModeToEditProfile then nil else var13
	t.isInExperienceNameEnabled = if fFlagMoveInExperienceModeToEditProfile then nil else isInExperienceNameEnabled
	t.shouldDisplayCounts = var12
	t.platformName = if fFlagAddPlatformNameToProfileHeader then var9 else nil
	
	return createElement(userProfileHeaderModule, t)
end