local ProfileQRCode = script:FindFirstAncestor("ProfileQRCode")
local Parent = ProfileQRCode.Parent
local GetDeepValueFunction = require(Parent.LuaSocialLibrariesDeps).SocialLibraries.config({}).Dictionary.getDeepValue
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local ConstantsModule = require(ProfileQRCode.Common.Constants)

return function()
	-- upvalues: UseSelectorFunction (copy), GetDeepValueFunction (copy), ConstantsModule (copy)
	return UseSelectorFunction(function(p1)
		-- upvalues: GetDeepValueFunction (upval), ConstantsModule (upval)
		return GetDeepValueFunction(p1, ConstantsModule.RODUX_KEY .. ".ShareUrl.shortUrl")
	end)
end