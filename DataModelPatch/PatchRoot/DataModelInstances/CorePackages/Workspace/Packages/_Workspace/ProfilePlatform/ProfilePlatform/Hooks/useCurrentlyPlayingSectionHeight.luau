local UseTokensFunction = require(script:FindFirstAncestor("ProfilePlatform").Parent.Foundation).Hooks.useTokens

return function(p1)
	-- upvalues: UseTokensFunction (copy)
	local UseTokensResult = UseTokensFunction()
	
	return if p1 == nil or p1.universeId == nil then 0 else UseTokensResult.Size.Size_1000 + 2 * UseTokensResult.Padding.Large
end