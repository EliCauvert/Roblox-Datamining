local useTokens = require(script:FindFirstAncestor("ProfilePlatform").Parent.Foundation).Hooks.useTokens

return function(p0) --[[ line: 6 ]]
	-- upvalues: useTokens (ref)
	local var0 = useTokens()
	
	return if p0 == nil or p0.universeId == nil then 0 else var0.Size.Size_1000 + 2 * var0.Padding.Large
end