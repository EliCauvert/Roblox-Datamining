local UseIsWideModeFunction = require(script:FindFirstAncestor("SocialTabsPage").Parent.SocialCommon).Hooks.useIsWideMode

return function(): number --[[ Line: 10 | Named "usePageSize" ]]
	-- upvalues: UseIsWideModeFunction (copy)
	return if UseIsWideModeFunction() then 50 else 25
end