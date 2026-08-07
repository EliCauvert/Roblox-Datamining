local editProfile = script:FindFirstAncestor("EditProfile")
local editDisplayNameModalModule = require(script.Parent.EditDisplayNameModal)
local parent = editProfile.Parent
local reactModule = require(parent.React)
local userProfilesModule = require(parent.UserProfiles)
local useLocalUserId = require(parent.RobloxAppHooks).useLocalUserId
local writeNamesQuery = userProfilesModule.Mutations.writeNamesQuery
local UIBloxModule = require(parent.UIBlox)
local var5 = require(parent.LuaSocialLibrariesDeps).SocialLibraries.config({})
local setCurrentToastMessage = require(parent.ToastRodux).Actions.SetCurrentToastMessage
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local useScreenSize = require(parent.RobloxAppHooks).useScreenSize
local getDeepValue = var5.Dictionary.getDeepValue
local useEffectOnMount = require(parent.RoactUtils).Hooks.useEffectOnMount
local usersNetworkingModule = require(editProfile.Networking.UsersNetworking)
local images = UIBloxModule.App.ImageSet.Images
local analyticsModule = require(editProfile.Analytics)
local eventNames = analyticsModule.EventNames
local useAnalytics = analyticsModule.useAnalytics
local useDisplayNameTextModule = require(editProfile.Hooks.useDisplayNameText)

return function(p0) --[[ line: 37 | named "EditDisplayNameModalContainer" ]]
	-- upvalues: useDispatch (ref), useScreenSize (ref), useAnalytics (ref), useEffectOnMount (ref), eventNames (ref), useDisplayNameTextModule (ref), useLocalUserId (ref), userProfilesModule (ref), usersNetworkingModule (ref), writeNamesQuery (ref), getDeepValue (ref), setCurrentToastMessage (ref), images (ref), reactModule (ref), editDisplayNameModalModule (ref)
	local var9 = useDispatch()
	local var10 = useScreenSize()
	local setDisplayNameAvailable = p0.navigation.getParam("setDisplayNameAvailable")
	local var12 = useAnalytics()
	useEffectOnMount(function() --[[ line: 44 ]]
		-- upvalues: var12 (ref), eventNames (copy)
		var12.fireAnalyticsEvent(eventNames.DisplayNameModalLoaded)
	end)
	local var13 = useDisplayNameTextModule()
	local var14 = useLocalUserId()
	local displayName = p0.navigation.getParam("displayName")
	local userProfileFromId = nil
	local var17 = userProfilesModule.Hooks.useUserProfilesFetch({
		userIds = { var14 },
		query = userProfilesModule.Queries.userProfilesAllNamesByUserIds
	})
	
	if var17.data then
		userProfileFromId = userProfilesModule.Selectors.getUserProfileFromId(var17.data, var14)
	end
	return reactModule.createElement(editDisplayNameModalModule, {
		screenSize = var10,
		title = var13.displayNameEditMessage,
		description = var13.displayNameCaption,
		initialText = displayName,
		localUserId = var14,
		cancelOnActivated = function() --[[ line: 64 ]]
			-- upvalues: p0 (ref)
			p0.navigation.goBack()
		end,
		saveOnActivated = function(p1) --[[ line: 68 ]]
			-- upvalues: var9 (ref), usersNetworkingModule (copy), var14 (ref), writeNamesQuery (copy), var17 (ref), userProfilesModule (copy), getDeepValue (copy), userProfileFromId (write), var12 (ref), eventNames (copy), p0 (ref), setCurrentToastMessage (copy), var13 (ref), images (copy), setDisplayNameAvailable (ref)
			return var9(usersNetworkingModule.SetDisplayName.API(var14, p1)):andThen(function(_) --[[ line: 69 ]]
				-- upvalues: writeNamesQuery (copy), var17 (copy), userProfilesModule (copy), var14 (copy), getDeepValue (copy), userProfileFromId (copy), p1 (ref), var12 (copy), eventNames (copy), p0 (copy), var9 (copy), setCurrentToastMessage (copy), var13 (copy), images (copy), setDisplayNameAvailable (copy)
				writeNamesQuery({
					client = var17.client,
					query = userProfilesModule.Queries.userProfilesAllNamesByUserIds,
					userId = var14,
					names = {
						alias = getDeepValue(userProfileFromId, "names.alias"),
						contactName = getDeepValue(userProfileFromId, "names.contactName"),
						displayName = p1,
						username = getDeepValue(userProfileFromId, "names.username")
					}
				})
				var12.fireAnalyticsEvent(eventNames.DisplayNameSaved, { displayName = p1 })
				p0.navigation.goBack()
				var9(setCurrentToastMessage({
					isLocalized = true,
					toastMessage = var13.displayNameUpdatedMessage,
					toastIcon = images["icons/actions/accept"]
				}))
				setDisplayNameAvailable(false)
			end)
		end,
		validateDisplayName = function(p2) --[[ line: 97 ]]
			-- upvalues: var9 (ref), usersNetworkingModule (copy), var14 (ref)
			return var9(usersNetworkingModule.GetDisplayNameValidation.API(var14, p2))
		end
	})
end