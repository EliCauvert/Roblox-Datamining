local ProfileQRCode = script:FindFirstAncestor("ProfileQRCode")
local Parent = ProfileQRCode.Parent
local GetDeepValueFunction = require(Parent.LuaSocialLibrariesDeps).SocialLibraries.config({}).Dictionary.getDeepValue
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local ConstantsModule = require(ProfileQRCode.Common.Constants)
local UserProfilesModule = require(Parent.UserProfiles)
local FFlagProfileQrCodeDeprecateUserReduxModule = require(ProfileQRCode.Flags.FFlagProfileQrCodeDeprecateUserRedux)

return function(p1)
	-- upvalues: FFlagProfileQrCodeDeprecateUserReduxModule (copy), UserProfilesModule (copy), UseSelectorFunction (copy), GetDeepValueFunction (copy), ConstantsModule (copy)
	if FFlagProfileQrCodeDeprecateUserReduxModule then
		local UseUserProfilesFetchResult = UserProfilesModule.Hooks.useUserProfilesFetch({
			userIds = { p1 },
			query = UserProfilesModule.Queries.userProfilesDisplayNameAndUsernameByUserIds
		})
		
		return if UseUserProfilesFetchResult.data then {
			displayName = UserProfilesModule.Selectors.getDisplayNameFromId(UseUserProfilesFetchResult.data, p1) or "",
			username = UserProfilesModule.Selectors.getUsernameFromId(UseUserProfilesFetchResult.data, p1) or ""
		} else { displayName = "", username = "" }
	else
		return UseSelectorFunction(function(p2)
			-- upvalues: GetDeepValueFunction (upval), ConstantsModule (upval), p1 (copy)
			return GetDeepValueFunction(p2, ConstantsModule.RODUX_KEY .. ".Users.byUserId." .. p1)
		end)
	end
end