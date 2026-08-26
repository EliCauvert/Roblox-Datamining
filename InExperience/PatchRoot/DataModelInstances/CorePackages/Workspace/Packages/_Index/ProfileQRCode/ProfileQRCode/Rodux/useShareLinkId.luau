local profileQRCode = script:FindFirstAncestor("ProfileQRCode")
local parent = profileQRCode.Parent
local getDeepValue = require(parent.LuaSocialLibrariesDeps).SocialLibraries.config({}).Dictionary.getDeepValue
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local constantsModule = require(profileQRCode.Common.Constants)

return function()
	-- upvalues: useSelector (ref), getDeepValue (ref), constantsModule (ref)
	return useSelector(function(p1)
		-- upvalues: getDeepValue (copy), constantsModule (copy)
		return getDeepValue(p1, constantsModule.RODUX_KEY .. ".ShareUrl.linkId")
	end)
end