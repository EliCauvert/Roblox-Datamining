local profileShareLinks = script:FindFirstAncestor("ProfileShareLinks")
local useSelector = require(profileShareLinks.Parent.RoactUtils).Hooks.RoactRodux.useSelector
local constantsModule = require(profileShareLinks.Common.Constants)
local getDeepValueModule = require(profileShareLinks.Common.getDeepValue)

return function()
	-- upvalues: useSelector (ref), getDeepValueModule (ref), constantsModule (ref)
	return useSelector(function(p1)
		-- upvalues: getDeepValueModule (copy), constantsModule (copy)
		return getDeepValueModule(p1, `{constantsModule.RODUX_KEY}.ProfileShareLinks.shortUrl`)
	end)
end