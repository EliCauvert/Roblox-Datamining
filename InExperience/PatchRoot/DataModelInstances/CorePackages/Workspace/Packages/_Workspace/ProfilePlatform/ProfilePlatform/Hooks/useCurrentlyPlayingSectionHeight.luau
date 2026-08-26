local useTokens = require(script:FindFirstAncestor("ProfilePlatform").Parent.Foundation).Hooks.useTokens

return function(p1)
	-- upvalues: useTokens (ref)
	local var1 = useTokens()
	
	return if p1 == nil or p1.universeId == nil then 0 else var1.Size.Size_1000 + 2 * var1.Padding.Large
end