local useIsWideMode = require(script:FindFirstAncestor("SocialTabsPage").Parent.SocialCommon).Hooks.useIsWideMode

return function()
	-- upvalues: useIsWideMode (ref)
	return if useIsWideMode() then 50 else 25
end