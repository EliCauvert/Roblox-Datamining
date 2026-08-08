local profileQRCode = script:FindFirstAncestor("ProfileQRCode")
local parent = profileQRCode.Parent
local getDeepValue = require(parent.LuaSocialLibrariesDeps).SocialLibraries.config({}).Dictionary.getDeepValue
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local constantsModule = require(profileQRCode.Common.Constants)
local userProfilesModule = require(parent.UserProfiles)
local fFlagProfileQrCodeDeprecateUserReduxModule = require(profileQRCode.Flags.FFlagProfileQrCodeDeprecateUserRedux)

return function(p0) --[[ line: 12 ]]
	-- upvalues: fFlagProfileQrCodeDeprecateUserReduxModule (ref), userProfilesModule (ref), useSelector (ref), getDeepValue (ref), constantsModule (ref)
	if not fFlagProfileQrCodeDeprecateUserReduxModule then
		return useSelector(function(p1) --[[ line: 31 ]]
			-- upvalues: getDeepValue (copy), constantsModule (copy), p0 (ref)
			return getDeepValue(p1, constantsModule.RODUX_KEY .. ".Users.byUserId." .. p0)
		end)
	end
	local var4 = userProfilesModule.Hooks.useUserProfilesFetch({
		userIds = { p0 },
		query = userProfilesModule.Queries.userProfilesDisplayNameAndUsernameByUserIds
	})
	
	return if var4.data then {
		displayName = userProfilesModule.Selectors.getDisplayNameFromId(var4.data, p0) or "",
		username = userProfilesModule.Selectors.getUsernameFromId(var4.data, p0) or ""
	} else { displayName = "", username = "" }
end