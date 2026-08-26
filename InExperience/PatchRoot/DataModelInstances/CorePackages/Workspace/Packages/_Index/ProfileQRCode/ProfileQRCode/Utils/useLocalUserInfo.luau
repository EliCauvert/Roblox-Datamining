local profileQRCode = script:FindFirstAncestor("ProfileQRCode")
local parent = profileQRCode.Parent
local getDeepValue = require(parent.LuaSocialLibrariesDeps).SocialLibraries.config({}).Dictionary.getDeepValue
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local constantsModule = require(profileQRCode.Common.Constants)
local userProfilesModule = require(parent.UserProfiles)
local fFlagProfileQrCodeDeprecateUserReduxModule = require(profileQRCode.Flags.FFlagProfileQrCodeDeprecateUserRedux)

return function(p1)
	-- upvalues: fFlagProfileQrCodeDeprecateUserReduxModule (ref), userProfilesModule (ref), useSelector (ref), getDeepValue (ref), constantsModule (ref)
	if not fFlagProfileQrCodeDeprecateUserReduxModule then
		return useSelector(function(p2)
			-- upvalues: getDeepValue (copy), constantsModule (copy), p1 (ref)
			return getDeepValue(p2, constantsModule.RODUX_KEY .. ".Users.byUserId." .. p0)
		end)
	end
	local var1 = userProfilesModule.Hooks.useUserProfilesFetch({
		userIds = { p1 },
		query = userProfilesModule.Queries.userProfilesDisplayNameAndUsernameByUserIds
	})
	
	return if var1.data then {
		displayName = userProfilesModule.Selectors.getDisplayNameFromId(var1.data, p1) or "",
		username = userProfilesModule.Selectors.getUsernameFromId(var1.data, p1) or ""
	} else { displayName = "", username = "" }
end