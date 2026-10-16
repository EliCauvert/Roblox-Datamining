local UseTokensFunction = require(script:FindFirstAncestor("AppShortcutBar").Parent.Foundation).Hooks.useTokens

return function() --[[ Line: 5 | Named "useAppShortcutBarHeight" ]]
	-- upvalues: UseTokensFunction (copy)
	return UseTokensFunction().Size.Size_1200
end