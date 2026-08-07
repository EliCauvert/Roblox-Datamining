local useTokens = require(script:FindFirstAncestor("AppShortcutBar").Parent.Foundation).Hooks.useTokens

return function() --[[ line: 5 | named "useAppShortcutBarHeight" ]]
	-- upvalues: useTokens (ref)
	return useTokens().Size.Size_1200
end