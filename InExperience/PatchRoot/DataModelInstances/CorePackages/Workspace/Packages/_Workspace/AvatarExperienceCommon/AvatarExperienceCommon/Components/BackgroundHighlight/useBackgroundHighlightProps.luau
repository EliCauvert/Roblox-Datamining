local _ = require(script.Parent.BackgroundHighlight)
local useTokens = require(script:FindFirstAncestor("AvatarExperienceCommon").Parent.Foundation).Hooks.useTokens

return function(p0) --[[ line: 16 ]]
	-- upvalues: useTokens (ref)
	return {
		ZIndex = p0.ZIndex or 0,
		highlightColor = useTokens().Color.Surface.Surface_100
	}
end