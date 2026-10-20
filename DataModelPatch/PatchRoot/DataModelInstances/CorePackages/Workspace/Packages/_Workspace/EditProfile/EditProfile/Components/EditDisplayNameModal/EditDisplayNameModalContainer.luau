local EditProfile = script:FindFirstAncestor("EditProfile")
local EditDisplayNameModalModule = require(script.Parent.EditDisplayNameModal)
local Parent = EditProfile.Parent
local ReactModule = require(Parent.React)
local UserProfilesModule = require(Parent.UserProfiles)
local UseLocalUserIdFunction = require(Parent.RobloxAppHooks).useLocalUserId
local WriteNamesQueryFunction = UserProfilesModule.Mutations.writeNamesQuery
local SetCurrentToastMessageFunction = require(Parent.ToastRodux).Actions.SetCurrentToastMessage
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseScreenSizeFunction = require(Parent.RobloxAppHooks).useScreenSize
local GetDeepValueFunction = require(Parent.LuaSocialLibrariesDeps).SocialLibraries.config({}).Dictionary.getDeepValue
local UseEffectOnMountFunction = require(Parent.RoactUtils).Hooks.useEffectOnMount
local UsersNetworkingModule = require(EditProfile.Networking.UsersNetworking)
local Images = require(Parent.UIBlox).App.ImageSet.Images
local AnalyticsModule = require(EditProfile.Analytics)
local EventNames = AnalyticsModule.EventNames
local UseAnalyticsFunction = AnalyticsModule.useAnalytics
local UseDisplayNameTextModule = require(EditProfile.Hooks.useDisplayNameText)

return function(p1)
	-- upvalues: UseDispatchFunction (copy), UseScreenSizeFunction (copy), UseAnalyticsFunction (copy), UseEffectOnMountFunction (copy), EventNames (copy), UseDisplayNameTextModule (copy), UseLocalUserIdFunction (copy), UserProfilesModule (copy), UsersNetworkingModule (copy), WriteNamesQueryFunction (copy), GetDeepValueFunction (copy), SetCurrentToastMessageFunction (copy), Images (copy), ReactModule (copy), EditDisplayNameModalModule (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseScreenSizeResult = UseScreenSizeFunction()
	local SetDisplayNameAvailableParam = p1.navigation.getParam("setDisplayNameAvailable")
	local UseAnalyticsResult = UseAnalyticsFunction()
	UseEffectOnMountFunction(function()
		-- upvalues: UseAnalyticsResult (copy), EventNames (upval)
		UseAnalyticsResult.fireAnalyticsEvent(EventNames.DisplayNameModalLoaded)
	end)
	local UseDisplayNameTextModuleResult = UseDisplayNameTextModule()
	local UseLocalUserIdResult = UseLocalUserIdFunction()
	local DisplayNameParam = p1.navigation.getParam("displayName")
	local UserProfileFromId = nil
	local UseUserProfilesFetchResult = UserProfilesModule.Hooks.useUserProfilesFetch({
		userIds = { UseLocalUserIdResult },
		query = UserProfilesModule.Queries.userProfilesAllNamesByUserIds
	})
	
	if UseUserProfilesFetchResult.data then
		UserProfileFromId = UserProfilesModule.Selectors.getUserProfileFromId(UseUserProfilesFetchResult.data, UseLocalUserIdResult)
	end
	return ReactModule.createElement(EditDisplayNameModalModule, {
		screenSize = UseScreenSizeResult,
		title = UseDisplayNameTextModuleResult.displayNameEditMessage,
		description = UseDisplayNameTextModuleResult.displayNameCaption,
		initialText = DisplayNameParam,
		localUserId = UseLocalUserIdResult,
		cancelOnActivated = function()
			-- upvalues: p1 (copy)
			p1.navigation.goBack()
		end,
		saveOnActivated = function(DisplayName)
			-- upvalues: UseDispatchResult (copy), UsersNetworkingModule (upval), UseLocalUserIdResult (copy), WriteNamesQueryFunction (upval), UseUserProfilesFetchResult (copy), UserProfilesModule (upval), GetDeepValueFunction (upval), UserProfileFromId (ref), UseAnalyticsResult (copy), EventNames (upval), p1 (copy), SetCurrentToastMessageFunction (upval), UseDisplayNameTextModuleResult (copy), Images (upval), SetDisplayNameAvailableParam (copy)
			return UseDispatchResult(UsersNetworkingModule.SetDisplayName.API(UseLocalUserIdResult, DisplayName)):andThen(function(_)
				-- upvalues: WriteNamesQueryFunction (upval), UseUserProfilesFetchResult (upval), UserProfilesModule (upval), UseLocalUserIdResult (upval), GetDeepValueFunction (upval), UserProfileFromId (upval), DisplayName (copy), UseAnalyticsResult (upval), EventNames (upval), p1 (upval), UseDispatchResult (upval), SetCurrentToastMessageFunction (upval), UseDisplayNameTextModuleResult (upval), Images (upval), SetDisplayNameAvailableParam (upval)
				WriteNamesQueryFunction({
					client = UseUserProfilesFetchResult.client,
					query = UserProfilesModule.Queries.userProfilesAllNamesByUserIds,
					userId = UseLocalUserIdResult,
					names = {
						alias = GetDeepValueFunction(UserProfileFromId, "names.alias"),
						contactName = GetDeepValueFunction(UserProfileFromId, "names.contactName"),
						displayName = DisplayName,
						username = GetDeepValueFunction(UserProfileFromId, "names.username")
					}
				})
				UseAnalyticsResult.fireAnalyticsEvent(EventNames.DisplayNameSaved, { displayName = DisplayName })
				p1.navigation.goBack()
				UseDispatchResult(SetCurrentToastMessageFunction({
					isLocalized = true,
					toastMessage = UseDisplayNameTextModuleResult.displayNameUpdatedMessage,
					toastIcon = Images["icons/actions/accept"]
				}))
				SetDisplayNameAvailableParam(false)
			end)
		end,
		validateDisplayName = function(p2)
			-- upvalues: UseDispatchResult (copy), UsersNetworkingModule (upval), UseLocalUserIdResult (copy)
			return UseDispatchResult(UsersNetworkingModule.GetDisplayNameValidation.API(UseLocalUserIdResult, p2))
		end
	})
end