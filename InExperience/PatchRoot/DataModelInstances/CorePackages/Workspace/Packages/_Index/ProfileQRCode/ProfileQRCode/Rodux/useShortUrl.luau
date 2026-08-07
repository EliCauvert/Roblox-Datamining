local profileQRCode = script:FindFirstAncestor("ProfileQRCode")
local parent = profileQRCode.Parent
local getDeepValue = require(parent.LuaSocialLibrariesDeps).SocialLibraries.config({}).Dictionary.getDeepValue
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local constantsModule = require(profileQRCode.Common.Constants)

return function() --[[ line: 9 ]]
	-- upvalues: useSelector (ref), getDeepValue (ref), constantsModule (ref)
	return useSelector(function(p0) --[[ line: 10 ]]
		-- upvalues: getDeepValue (copy), constantsModule (copy)
		return getDeepValue(p0, constantsModule.RODUX_KEY .. ".ShareUrl.shortUrl")
	end)
end