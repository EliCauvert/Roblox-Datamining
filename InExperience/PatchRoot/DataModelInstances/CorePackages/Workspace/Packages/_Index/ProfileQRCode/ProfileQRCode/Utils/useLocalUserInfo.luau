local profileQRCode = script:FindFirstAncestor("ProfileQRCode")
local parent = profileQRCode.Parent
local getDeepValue = require(parent.LuaSocialLibrariesDeps).SocialLibraries.config({}).Dictionary.getDeepValue
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local constantsModule = require(profileQRCode.Common.Constants)

return function(p0) --[[ line: 9 ]]
	-- upvalues: useSelector (ref), getDeepValue (ref), constantsModule (ref)
	return useSelector(function(p1) --[[ line: 10 ]]
		-- upvalues: getDeepValue (copy), constantsModule (copy), p0 (ref)
		return getDeepValue(p1, constantsModule.RODUX_KEY .. ".Users.byUserId." .. p0)
	end)
end