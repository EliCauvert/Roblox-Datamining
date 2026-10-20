local ProfileShareLinks = script:FindFirstAncestor("ProfileShareLinks")
local UseSelectorFunction = require(ProfileShareLinks.Parent.RoactUtils).Hooks.RoactRodux.useSelector
local ConstantsModule = require(ProfileShareLinks.Common.Constants)
local GetDeepValueModule = require(ProfileShareLinks.Common.getDeepValue)

return function()
	-- upvalues: UseSelectorFunction (copy), GetDeepValueModule (copy), ConstantsModule (copy)
	return UseSelectorFunction(function(p1)
		-- upvalues: GetDeepValueModule (upval), ConstantsModule (upval)
		return GetDeepValueModule(p1, `{ConstantsModule.RODUX_KEY}.ProfileShareLinks.shortUrl`)
	end)
end