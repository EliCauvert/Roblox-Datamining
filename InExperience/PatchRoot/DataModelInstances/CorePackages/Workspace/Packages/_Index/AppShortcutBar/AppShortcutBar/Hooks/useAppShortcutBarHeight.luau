local useTokens = require(script:FindFirstAncestor("AppShortcutBar").Parent.Foundation).Hooks.useTokens

return function()
	-- upvalues: useTokens (ref)
	return useTokens().Size.Size_1200
end