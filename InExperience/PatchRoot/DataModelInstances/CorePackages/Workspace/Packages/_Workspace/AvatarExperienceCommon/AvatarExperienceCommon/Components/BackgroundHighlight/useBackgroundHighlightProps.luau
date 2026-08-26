local _ = require(script.Parent.BackgroundHighlight)
local useTokens = require(script:FindFirstAncestor("AvatarExperienceCommon").Parent.Foundation).Hooks.useTokens

return function(p1)
	-- upvalues: useTokens (ref)
	return {
		ZIndex = p1.ZIndex or 0,
		highlightColor = useTokens().Color.Surface.Surface_100
	}
end