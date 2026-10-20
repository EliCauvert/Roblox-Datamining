local _ = require(script.Parent.BackgroundHighlight)
local UseTokensFunction = require(script:FindFirstAncestor("AvatarExperienceCommon").Parent.Foundation).Hooks.useTokens

return function(p1)
	-- upvalues: UseTokensFunction (copy)
	return {
		ZIndex = p1.ZIndex or 0,
		highlightColor = UseTokensFunction().Color.Surface.Surface_100
	}
end