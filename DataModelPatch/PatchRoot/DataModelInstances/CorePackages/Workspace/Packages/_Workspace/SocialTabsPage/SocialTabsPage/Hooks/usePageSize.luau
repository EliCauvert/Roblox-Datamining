local UseIsWideModeFunction = require(script:FindFirstAncestor("SocialTabsPage").Parent.SocialCommon).Hooks.useIsWideMode

return function(): number
	-- upvalues: UseIsWideModeFunction (copy)
	return if UseIsWideModeFunction() then 50 else 25
end