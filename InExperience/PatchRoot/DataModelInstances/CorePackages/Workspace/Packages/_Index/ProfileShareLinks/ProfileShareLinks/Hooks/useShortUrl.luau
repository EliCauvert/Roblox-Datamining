local profileShareLinks = script:FindFirstAncestor("ProfileShareLinks")
local useSelector = require(profileShareLinks.Parent.RoactUtils).Hooks.RoactRodux.useSelector
local constantsModule = require(profileShareLinks.Common.Constants)
local getDeepValueModule = require(profileShareLinks.Common.getDeepValue)

return function() --[[ line: 9 ]]
	-- upvalues: useSelector (ref), getDeepValueModule (ref), constantsModule (ref)
	return useSelector(function(p0) --[[ line: 10 ]]
		-- upvalues: getDeepValueModule (copy), constantsModule (copy)
		return getDeepValueModule(p0, `{constantsModule.RODUX_KEY}.ProfileShareLinks.shortUrl`)
	end)
end